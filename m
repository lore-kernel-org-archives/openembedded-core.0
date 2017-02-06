Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7116FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 19:51:55 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 96so8326020uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 11:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xp8yI+wI6LAgLTlc9VKCJXqQyZnBBPtYS83eqH8jHFk=;
	b=BK7bb4ACOuT6LJs/XZa6/HSZG4vfKf5Zu4cp76gRCThMSL2DORP07jB2vxdU8vi5ed
	YsPOWKrf1Jy/fn5b/oBWPpEmeA0QYm/cC8aLpSDo1DuA3zevkN496ijVTyTwyhiNyDQW
	2xcrgpIPy4xFV2tgqYyO0rGpFB9Mlzrp826hh8yo8XoZR2Bk+pkKRPFbpwXkYg6jNKAD
	KRz1EzKBSKz8zpOqXWaX0dcVXZb1qAUqqk543VHM6inlqqh2RS5lTe4xdR+r/vAk0gEP
	H/j9C3p0W4q/E0VKNXlXCjScwNzx0Q/PStJZ6WYiv5Juv+8q9NQFo+xM4Fw8641xVtuO
	DfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xp8yI+wI6LAgLTlc9VKCJXqQyZnBBPtYS83eqH8jHFk=;
	b=H7wA3wg0C4NkUZGW4B4RSwH9pVGGSVUxMZpORW1NL9vkFRnlkfmeqAXlTAVNbdxGp8
	0GAsuibjXH0NHBzKpzB2TloN5WfjbrDEZP9YccVVnGAA7eUszegR0Q5JGXUK3/62lHhZ
	iRa7IXwMRjufVlETMkLTezQkuByiSaEIWsczYWy1Ksjf57gu1WWTddZJzz5VY3Fnaie8
	Zhem6r/6z/W71x5A08tNqFFchryiYB4ELhABXUlxcD5+af6Ix13fN5xBINiaVV38diSF
	474orT0cWuUDFc+aRj6DrYUjw4AP95wPL1mTMVxcH3/UAzBXOAphTn0Ze9V75DjB7s5x
	SPlQ==
X-Gm-Message-State: AMke39l9xeN/9t0+/A3M9QgWdrUaEKYdMkXCrbqFdGm1dJg75KYhDz7SZp8sM8cNpr8NI7xnJKOkT02vnwMS0Q==
X-Received: by 10.176.83.218 with SMTP id l26mr4781283uaa.69.1486410716351;
	Mon, 06 Feb 2017 11:51:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 6 Feb 2017 11:51:25 -0800 (PST)
In-Reply-To: <1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2017 11:51:25 -0800
Message-ID: <CAMKF1sp=hgPK-SJZK1es8HsJa2_kygRLeRyci28Jupt2B27Reg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] perl-native: Remove .packinfo file
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
X-List-Received-Date: Mon, 06 Feb 2017 19:51:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 6, 2017 at 7:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This is large and needs fixups to relocate it in each case. We can drop it, save
> the work and the ~150MB disk space its various copies take up. Its not needed
> for anything that I can see.

I agree, I think we should even consider removing them from target and
nativesdk perl.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/perl/perl-native_5.24.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> index af2ad7b..4216257 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
> @@ -106,6 +106,10 @@ do_install () {
>         for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
>                 sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
>         done
> +
> +       # The packlist is large with hardcoded paths meaning it needs relocating
> +       # so just remove it.
> +       rm ${D}${libdir}/perl/${PV}/.packlist
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "perl_sysroot_create_wrapper"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

