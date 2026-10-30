Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16909.1793381075460955156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YyFC2Twk;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso7097645e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793381073; x=1793985873; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMKRhZE3V0mDLQ5RVGWMvqDYuv2OTIMg+Bm1g4OjqGk=;
        b=YyFC2TwkorCniSFobG8b1B6YXXyqACwOirIKZULvMtyYQkCDI5zRj2UsGkkFgeHiUJ
         ilSrfzdf6KWQTgjB0HSeqi9e/Z1V8TgVtYY0BdSEsf1YjiiDIopnxFccu+oS4lkmixgi
         +vTHyoqoQ88azVEI1BMLAn4XGF/bOAH+BDI7EnlsFR7cQhRF+u+YZGsgl9Y5PJkL1yIU
         z4JkQPQD8GXMKp/guluJnWXdWWj8kOqZX25acrZbxQZcV2J+3Ng/LKJvYaD034NjEmCR
         QSs6u66hXsjKxB2K666Q5/QZkeN7phCfqZ4q6Bj3sSyIBpyeM3r3JebfHsqyUqJQXGuI
         YT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381073; x=1793985873;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMKRhZE3V0mDLQ5RVGWMvqDYuv2OTIMg+Bm1g4OjqGk=;
        b=N1DnRKdG8clBtddiuizvRjVdyME97YUM4m53DfZQpzjRuBUMEs4OvkSoV6z4tVaRVf
         k+ZwuF/phPDy01kvgvOVB9guPRZi27D2Np12lBErb9MJKd/2FPps/xsEwNpAt2jYJ8UQ
         rm2DL/8GwMTO8wwRAhi6a0C/Z4NVtvV+VJBDCIADsMtN7pnUwVo8J7DyfyvaPQ22qixL
         LH4l+wHVpNHFnNjRA0TWgYn5fW0cm0Lhestl6VijYiQs8qPnCLixSB6mr9fXLmDGGoOW
         OH7+59MSXFrHzgsNAswwX0e2HpinEM8Vvii3SXfZAAbjf6QXuefzp0FJhs8A2xU8UDlH
         bosQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0N3r1t854B4yrDbXWYOBFzXl8XxrjV2kPB0VF9smcG+zaEWnuspQONVzs7G1n3sOd5N2pM15gK+3pkgq30X/mgg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIwfbI+mEfT8xDPJ5twczC55Gx5Nv8yMjgIOvZvT843IEN4/iVD
	Fhfn+3J8rVtP/tWKVmHTnuC1lXY6yPtoU1pLVBw5ALlj/umlOGUcdeOI2pqvZOYUx2tlP7FwIgA
	t0Gwqo10=
X-Gm-Gg: AYBFou3EsZgTDodbOJTTG+Parr2D4Ysr8L1Jvq2+EfJU7+PWena7+ZHs+t0RZrXDKxD
	nyVlt0XNR3HKV6yCh8SZG/r2Tzv10cT0LyPQktr45SkMcCBz5DSqCGdgSyR0rRbH8hA9FeYg59/
	bBmooayYKY51I7Pg7KEZRnTQtfHL0Sq5Qg5yqm64DWrBLLKENw5r+AqpEBj0b5CUlxdSJpdKBC+
	F2ruNuFF8yUz2iA/vqvHGn2BqNUWeP2p1Xjqpi2SCro3m7+zSDfYWrZYwK2LzQ+qmV1REcDr4IQ
	He/3AmKb9RHedxxDDzEtUWd4jZ/6YEhOcaAXUrHmzJHROKy77oPFEmZsNDFxsK3hA6cSZnky9qQ
	X2qR2oef4GyIDiHO+rhOSwRJUHooU9GYpyJlxvQki+kGHlfSJXP5BKQgF7FxowFN+HFrJTVszOa
	2gh6Vq8yRXB2T1XJ8XkpwXQ8P5fP/CKJaGpiLuB/hXMEdLMyoUXhgiGmKSDqONMtB6Egj11AhYq
	WHjaZrSY61LiTLzfwSuXd3h8wkzYBrE7YDHgn8goZE8snwHJE79MH2+9/CNmFuaVjCjtYVHZLZ8
	dqxY8/BoTSUSM3Gqz3ObQim0dODu5q5b/dhtYgC+p72Ico52kRdaVQ5bRabSHY0HUARDlEshTrC
	D7gtr7qdAyNiExS/c
X-Received: by 2002:a05:600c:1987:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4ac16fa2edbmr68628805e9.9.1793381073549;
        Fri, 30 Oct 2026 10:24:33 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm33145415e9.0.2026.10.30.10.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:24:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 18:24:32 +0100
Message-Id: <DMICJ76D745R.1ZHQEOOC73ERV@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv5] vim: Fix for CVE-2026-73076
X-Mailer: aerc 0.20.0
References: <20261029082548.641629-1-hprajapati@mvista.com>
In-Reply-To: <20261029082548.641629-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249057

On Thu Oct 29, 2026 at 9:25 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd=
0d452
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-73076.patch            | 155 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 156 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73076.patch
> new file mode 100644
> index 0000000000..5ed023a747
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
> @@ -0,0 +1,155 @@
> +From c74d28b907af0b1f1621f881f098374124bcd53d Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Fri, 24 Jul 2026 17:43:51 +0200
> +Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
> + .VimballRecord file
> +
> +Problem:  [security]: vimball: code execution via .VimballRecord file
> +          (tdjackey)
> +Solution: Forbid arbitrary commands, fix broken directory deletion code,
> +          refactor code
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Backport Changes:
> +
> +The .VimballRecord rejection is placed after the fenc/filecnt extraction
> +because the earlier strange-filename check block present in upstream 9.2=
 does
> +not exist in the 9.1.1683 vim sources.
> +Omitted src/testdir/test_plugin_vimball.vim because the current vim sour=
ce
> +archive does not include it.
> +
> +CVE: CVE-2026-73076
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c=
6f96a26324f6b2c8c11415fd0d452]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + runtime/autoload/vimball.vim | 62 +++++++++++++++++++++---------------
> + 1 file changed, 37 insertions(+), 25 deletions(-)
> +
> +diff --git a/runtime/autoload/vimball.vim b/runtime/autoload/vimball.vim
> +index 6456984411..803d19a83b 100644
> +--- a/runtime/autoload/vimball.vim
> ++++ b/runtime/autoload/vimball.vim
> +@@ -660,11 +672,11 @@ fun! s:RecordInFile(home)
> +    setlocal ma
> +    $
> +    if exists("s:recordfile") && exists("s:recorddir")
> +-   	let cmd=3D cmd.s:recordfile."|".s:recorddir
> ++	 let cmd=3D cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
> +    elseif exists("s:recorddir")
> +-   	let cmd=3D cmd.s:recorddir
> ++	 let cmd=3D cmd.join(s:recorddir, '|')
> +    elseif exists("s:recordfile")
> +-   	let cmd=3D cmd.s:recordfile
> ++	 let cmd=3D cmd.join(s:recordfile, '|')
    ^ Indentation is still weird here: it's neither upstreams (4
spaces), nor old indentation (4 spaces+1 tab) but 1 tab + 1 space.

Can you keep the old indentation please?

I think this is the last fix.

Thanks!
--=20
Yoann Congal
Smile ECS

