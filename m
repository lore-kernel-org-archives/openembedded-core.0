Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7934060110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 07:49:25 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so7212263lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 23:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=kGl+q/Qr37Hatz9WP6Gg/VzdumTyy1FhoujMXMaNxVQ=;
	b=WZq03xpDfVuEUhx/gHYqV9PzMqy2nWLfm8+Lns7OSmpDFq6W+mLkG7hSqil9nbJtb0
	EqqTWS1R9aR3xr8QIMW+NlAz3BW1XbriIZcGHb/5JARdjm0q8VRuxci9tIhigheNCjQD
	XHFB7+sdR6D7OVPuV9y+mRXYecbacrU0HRYzKlYO5j51XXg1IgfZOcxQHz4hqSoDYbnT
	acIHm4Yj/dg90QPJD0HNzI6rOqjxDfZ4LjRQKBd7DTnsPpguujILA+dnNQLII5FZ926R
	rHeX3XVprHMMNX38Bd4+8TIXcX4gnSSjGQFCLx3PXHwTEfCZMC98dEjfGtuxoeUWEc7F
	hYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=kGl+q/Qr37Hatz9WP6Gg/VzdumTyy1FhoujMXMaNxVQ=;
	b=MgPpuW6R7FQXdxzEqeeAgW2CAJ/abmE3C6/nrvS1nRlmU9YcgMc2rrPgUBks+P51Jg
	N/KAlm+2Q8z5C7owEHWD3L81OjvJL9AWJsGkhH6m4NHFsvQlajL4sqZsth45W4Ha4qja
	de6zT0huVjYqRjLq6AI8hccRydcYu2wy1tQfuC8g6vhTP2xasBwpVo7tB4Q6bmMTouQb
	xGjiqzAr/EgUhFpLeG0pEK9+t8IkYgtztdjTU7nVKUbNAJtybhIbqxypNhYtYffR0c6E
	/le8yhec+Gc6wBPWhTR0kaVZVXQy/6mrIClVnU/3Sk+tQcjSNqkzAkVat+WZoWZGc8Qq
	czQw==
X-Gm-Message-State: ALoCoQlVUT3ujznfFxONNbt3JRvcPlUXyPd+uBntvTv5tgckJ7x6BBOd09LjrN7kLWz124TKLrzsXw9CRIBoA3SsOMIKKveHcA==
X-Received: by 10.25.39.19 with SMTP id n19mr706231lfn.156.1449560965173;
	Mon, 07 Dec 2015 23:49:25 -0800 (PST)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id l67sm331197lfl.26.2015.12.07.23.49.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Dec 2015 23:49:24 -0800 (PST)
Date: Tue, 8 Dec 2015 08:49:23 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151208074923.GB8707@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
	<1449539278-20070-4-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1449539278-20070-4-git-send-email-akuster808@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Tue, 08 Dec 2015 07:49:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Armin Kuster <akuster808@gmail.com> [151208 02:49]:

>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
>  1 file changed, 4 insertions(+)

I'm just a little curious about this serious, and a few others that I've
seen recently. They all add a number of CVE-patches, with one commit per
patch, and as the last commit, they all get added to SRC_URI in a single
patch.

What's the reason to do it like this? i

I'd personally prefer to have each CVE-path also add the patch to
SRC_URI, as that make cherry-picking more straightforward. And it also
ensures that if we have a need to bisect some issue, that'll work. At
the same time that will make the meta-data consistent, i.e. no dead
patches.

I'd personally even prefer that whole series squashed to one commit,
compared to this adding a lot of un-applied patches. 

Any comments on this?

Cheers,
Anders

> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index fd56841..3864e88 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -37,6 +37,10 @@ SRC_URI += "file://configure-targets.patch \
>              file://crypto_use_bigint_in_x86-64_perl.patch \
>              file://openssl-1.0.2a-x32-asm.patch \
>              file://ptest_makefile_deps.patch  \
> +            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
> +            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
> +            file://0001-Add-test-for-CVE-2015-3194.patch \
> +            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
>             "

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

