Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDF597CBF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:41:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so16052734qtg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 10:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4zkWhFJb1dM6PsdKg61zFDvUAWKkmmopdto4u/025BM=;
	b=e0w/a+JJd4TMTRshtA6NkqZnID+G4J9dJEkOhFkrPa75TpxYukqcfXCJDkuKxOlfH2
	HoBMjhY7R50MsVZh+rrDpenDcv5xa9Nydp3wKBUylB33ENPb+sWtGjH6U9ZnVnZBedMk
	ySZvpCfxzlLu87GbpL9k0OYs1eyEQOlFH6vd+vTKGIoxiP9SiERF9Pha6kLMj8FJaUog
	UDnqY+YunrcEmkpnguirLIrEqGGmnfulkvjva6BqHY0UkxGp5IibyvfGbrICau18OQvw
	RAKf5qdgyKjeKWXs4Iu5nwOEOEb4zYgOmjJBVisHzy3YrhylY31UfAPzp+gA6j2ljAJ2
	yROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4zkWhFJb1dM6PsdKg61zFDvUAWKkmmopdto4u/025BM=;
	b=AcPWo985Z5f0+7Qfu/iXKPTCOjCg6IwjR75sr9U8ysyrHcMc96RChk5u5RDpAXvduT
	1ExRmBuzagGmM6yfZWWzHMtjHXO11nA+KFG31UCyIDGITkSlHsPYeQJov328d2vmvVh4
	4ZiNrYZziUoK8j0YSaI1B2l2Rg3LrtyufUJWrL2Fn4q/co6Me0ApGxUKKZNMswwzHav8
	ySIIQc2tVj/3uSB/vkAKrIn9EmCcgwv8E718tS0twvf1RCAtJnm/ZtnXIXEFstYSxKnX
	nB/Hw/dEnRXVymoRbrl23CZdmtq2zLqOckD2cqOoejNFxYDLcEKTZPSBpHmFeudbTdDu
	Oitg==
X-Gm-Message-State: AHQUAuYAYokg/wY7wUfjdQ5eCk6qYq3N9ybwwTMWCirUQUDwqjzSMsaE
	wl3yL57u5m8OwNFI5IciMdazTrbDSjavf6kCp/4=
X-Google-Smtp-Source: AHgI3IYhHSjDd/OoQBEhEgQMeSuicXpxEXC/Fxozxkzp+FFoLd3O+kq7zRyORNIuk0eN+hfEoNSnv3gvfusERNVFWDg=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr19623319qtn.253.1551206488581; 
	Tue, 26 Feb 2019 10:41:28 -0800 (PST)
MIME-Version: 1.0
References: <1551086317-17933-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1551086317-17933-1-git-send-email-chunrong.guo@nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:41:02 -0800
Message-ID: <CAMKF1sr0pg7bOtBP3TfBRuNDZrnf6Yihx-6ksZh46PEDpbK5Mw@mail.gmail.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix multilib file install conflicts
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
X-List-Received-Date: Tue, 26 Feb 2019 18:41:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 8:58 AM C.r. Guo <chunrong.guo@nxp.com> wrote:
>
> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> Leaving bits/wordsize.h out of being multilibbed introduced a problem in building the SDK for arm64:

I thought we were multilibbing bits/wordsize.h isnt that the case.

> Error: Transaction check error:
> file /usr/include/bits/procfs-id.h conflicts between attempted installs of lib64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon
> file /usr/include/bits/procfs.h conflicts between attempted installs of lib64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon
> file /usr/include/bits/shmlba.h conflicts between attempted installs of lib64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 329732f..822ffd6 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -144,6 +144,7 @@ do_install_armmultilib () {
>         oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
>         oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
>
> +        oe_multilib_header bits/procfs-id.h bits/procfs.h bits/shmlba.h
>         oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
>
>         oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys/user.h
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

