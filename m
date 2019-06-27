Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5F57E7E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 19:47:32 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id h28so2426990vsl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uA3exoXpIKL6j8rVCflf5EVmAuLfhRzDgrK1NVmHTzw=;
	b=N6TL4NLb8ksbLo1pNXk9YME/jJtyg8XLwisAx02ZGmdjxzMwMKVw+8X3wdr1vquSb9
	zpZZpE/bJADHMKX4l4281JG/xF9/52vCLHSCSMlowrgHQlsexepFqG07tagXsnFRW2wb
	rQ3K184UZFJr8Hy+ujy7Tvrq3egkDlU/AuWyKXO8NtXaBMviG8/4EnNjbWQq3pHKLsyl
	Z+6vrde23TKjTbeZxL2b4eugxD7mzTcgt4YpLGUQ0+gZgD2IFYWJQ14am/b68nteTvDV
	neJ+C0ACbzRBuk/F6Ct0f5YFLEsc2ylbDG0J+h9Ulzvt7yjtrCdO5a7Lfh6nf8JRf/Qh
	syzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uA3exoXpIKL6j8rVCflf5EVmAuLfhRzDgrK1NVmHTzw=;
	b=jmbkNPcVIa7SCGhT+Q7xrI16yd+zXmX7Y/7Rfx8R29rL5mGV4R4ACjpZi/qSnSsL1/
	qqJ2pf5/YKlzbvmMZO6hUwU2JAwQlgqj++b9UFOublwqXocHKZ4N2aCLoJdeMI54qY3H
	x00rPDXB0Vi6a+LD50H/F6k/j4OuCswU6/5CNDKAgYgbI8F5IbWT9oDtycTsMULXH4Ki
	GoObpn3Wky/mX55NA1swUFPZ2+N7l382KQd6XkL2bPHif6O9fphlo4cJe2J+fY0iRzDy
	xq2OhTc4MoowLV+KR3HWOrQz9Ri+bPEXjAy8E8kM39WDpou14SMRJUVBA3ZWy7vXm7In
	LYTA==
X-Gm-Message-State: APjAAAW1qfpx9cJGiENt5GG94cmVSZ/UHiAbPujzAoKEuW/kaEV1jmw+
	MnTJvgUsXi/VGZ26rGhCGY8Eat1cDYnt69Y1vms=
X-Google-Smtp-Source: APXvYqzdAWKsVvIjNYDd62ICJdnW69XNjjlPQAL+N2XU4KTzxwuhaa3VM6Oj1dSfYXdGZDmDiaYWr/iqzp4q4Lq5xHo=
X-Received: by 2002:a67:e284:: with SMTP id g4mr3640964vsf.137.1561664853680; 
	Thu, 27 Jun 2019 12:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
In-Reply-To: <20190627135440.15815-1-JPEWhacker@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 27 Jun 2019 12:47:22 -0700
Message-ID: <CAJ86T=Xp0L=12A1P-Mt2YLN_uyjmpUtPd-5a9JQ7Lfrw_sCSoA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 19:47:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 27, 2019 at 6:54 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> gettext is required to generate the glibc locales in do_compile. If not
> present, glibc will skip the generation which isn't reproducible.

I guess you mean not deterministic rather than not reproducible?

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> index 073d1533e37..c400ee10b0f 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
> -DEPENDS += "gperf-native bison-native make-native"
> +DEPENDS += "gperf-native bison-native make-native gettext-native"
>
>  PV = "2.29"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

