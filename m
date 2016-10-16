Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAEC71957
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 23:04:16 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so7066978vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N4c0N7Rc2zwLMNthE9NH5Y16w674f1FUQZqNiUJzx2g=;
	b=d1KmlCGsunNCN22YB6r8JD4wwpmaAsyi/lc6bsO0y/CXTr1SO4SoAOywhMMzgHeXdo
	CwyUP8/WjGOTIqNLPyTaHEqs6jGCvEAnM+eWakGDCovL9l6I4eLjemT7GZEGvecMFIIT
	/FWOGJ6wzjNnBpq7/73Bi4UweNxsltfojac7raCbFEEYZr7ICnaS4J2X/QaF7S2UU6LN
	iB0uWzc1dXJwmC5cortAJnun6SiVFsXLbr9s7gagFba9CDsfoCHHP92pKQTwrOqOPBCv
	lBT6rsbX6cUIkYfqdwhWdmquiGuFHc3xMs2dvJOCUv/aEd/rFZ8bqEl6HHe3oSmDTZYC
	yFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N4c0N7Rc2zwLMNthE9NH5Y16w674f1FUQZqNiUJzx2g=;
	b=N4/y8YxNNLAZU6vpkmmTpN6cPj2KPnllfqGAtEixMxtJcdWwDvGL0wJX+A0wtoUBHz
	8ItIJIUawCGKQ4qqtHPAwrObSH2HG5m9dTPF+/AD1fJ9Y6KyxnfzmUBTET2bcX2Ue6mP
	SjOHenqB5Iz5QabL4fOFvTKhwyOiyfSKDAykZucTCXK7BB1tGaeW9bJX1Q24TkGZTqkj
	gZqfKi3MyLeURdBovLv8OLMZTeq/aIiUohibWERFxlqSVzAfvNdNr1uBDU3A5Jninds9
	KGA2R69NoEKEZ4NANOBMWCdjBVfgGEqTPYIU7z6GEluF0P68PtZeDHvjNzacg0adAyBX
	wrLg==
X-Gm-Message-State: AA6/9RknCfeaIiDI1Bw4h4Lf4ROVEM6YpNTr6gDLvJAIqjq9q7uhYgtpTltcCmAmK5alrwFOUp6LLDGQTGCkIg==
X-Received: by 10.31.244.14 with SMTP id s14mr15404140vkh.31.1476659057998;
	Sun, 16 Oct 2016 16:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 16 Oct 2016 16:03:47 -0700 (PDT)
In-Reply-To: <e7f6b2d54c90833a8c6782a95283b8849438b3a9.1476004977.git.Qi.Chen@windriver.com>
References: <cover.1476004977.git.Qi.Chen@windriver.com>
	<e7f6b2d54c90833a8c6782a95283b8849438b3a9.1476004977.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2016 16:03:47 -0700
Message-ID: <CAMKF1spvigWQZ_NRzMgB--0h0cfqTOWGU2Tdo=c5Tn5hXsfumA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid boot failures for mips64
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
X-List-Received-Date: Sun, 16 Oct 2016 23:04:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 9, 2016 at 2:23 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> If we start a systemd based qemumips64 target with 'pam' enabled in
> DISTRO_FEATURES, we could not login in successfully. After you provide
> username and password to the login prompt, the login prompt just comes up
> again. Besides, there are other boot failures.
>
> Append '-O0' flag for mips64 target as a workaround to this problem.
>
> [YOCTO #10250]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index f800f42..db588e7 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -23,3 +23,4 @@ PV = "230+git${SRCPV}"
>  S = "${WORKDIR}/git"
>
>  LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
> +CFLAGS_append_mips64 = " -O0"

can you instead explore a bit more e.g. disabling lto etc.
CFLAGS_append_mips64 = " -fno-lto"

and also consider little endian

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

