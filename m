Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CA5D2E9D8
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 10:53:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.56613.1731322384642775595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 02:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmvmkRIP;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539eb97f26aso4185432e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731322383; x=1731927183; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eePGl0oyHUZYuvzY7zgtJacym/weVnDKGqeenQZcnoM=;
        b=YmvmkRIPeJHEln/HY+JJbXm1D7VhF2jjRus4RYYodZkAneTnRLhR2GuK/ovhvIPtua
         i0vC0DBO9EIO07++zFPl8TIwkxhov7u2V6G/SOujuBRKXMN6dDNDb6Em6Ng50Q8GaGLi
         fKL2l85eDbraqScWBVZZTpRGqeRjqV1YPKOCywIVqwHX5DgFe5ezQgJVQcqqLdSwtKgs
         ZjFswii4SzNqCmYbUPmJ2iXkrE4+dh8yQtiaBu9B/CEB6+LrydVCOadi1Sb139jPw1TJ
         7CGgfiZ0jAT0pAWJOPbxYitRmyXEKixBwQQktJD9L75MegEqWUwdKv1wqGWfyGNRfqO6
         RDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322383; x=1731927183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eePGl0oyHUZYuvzY7zgtJacym/weVnDKGqeenQZcnoM=;
        b=UeKqovZbflvFXuzx0SnwEj4fljUOMWbTmvex9nzzOExz3+1kmQQ7TWWtbEjPFDi0ua
         jBEGtkrGn9RnOsrLehUqEpmUhtxua0r0gvs3Gp5lW39rvEcZ9SbzpE8l148LEZXZ1W23
         Y0Z6HfEZvCC5EBoofRx4nEQW0fddQZ65Ehca9V7B+CNhmOuzYI0/OeF6b08xhYZy9v69
         cTKommaZtW9ciaZmLhSWWTLoxDAgFK8BEJXgnQAmlPP++d329FEI7Vf2BiVWkxGOfjek
         N4wDjxhCV/2W5VYcnIJslujRxxoXI/L4WvfoMaefawgIbkp+Yl78KeIGPHuF1h3pgmOP
         1S7Q==
X-Gm-Message-State: AOJu0YxyeoKU6oizp13CCFs23KS7qqY68wg2jF25KOHbrJmynFZpyO+y
	Iqpmj/CN3hQ9YmFBi5Gwk84WP+NHtdcxHkAWGcAtLqbjj3v5kHtLJWTXsxMb+eInsdkPlaCZ6V9
	OAo4JOKDODsgMh1cwM4MRrWAuJV0=
X-Google-Smtp-Source: AGHT+IEtaMMmfByajp41R2pNoNcF1lwLO82pLOR/PJYMlDW9ooyGTgshuVh5h3h9rN+S9VSr104L19Qx8r5HKEtp7hM=
X-Received: by 2002:a05:651c:1550:b0:2fc:d1f8:fd20 with SMTP id
 38308e7fff4ca-2ff2030b8a8mr58480611fa.39.1731322382072; Mon, 11 Nov 2024
 02:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20241111083541.291594-1-olani@axis.com>
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Nov 2024 11:52:49 +0100
Message-ID: <CANNYZj_nrAwcCxAv-uRAAt651g902eoS1HQJ0OTccsicZjpbbA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/5] Remove automake patch that changes path
 to test-driver
To: olani@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206945

Thanks, this seems reasonable.

Alex

On Mon, 11 Nov 2024 at 09:35, Ola x Nilsson via lists.openembedded.org
<olani=axis.com@lists.openembedded.org> wrote:
>
> From: Ola x Nilsson <olani@axis.com>
>
> Fixes [YOCTO #15635]
>
> The automake patch
> "Set relative to top_builddir path in Makefile to access"
> sets the default path of `test-driver` to
> `$(top_builddir)/$(config_aux_dir)` instead of the normal
> `$(top_srcdir)/$(config_aux_dir)`.
>
> This breaks `check test` for Automake projects in generated images.
>
> To reproduce, use core-image-kernel-dev with git added.
>
> git clone https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
> (cd libabc && ./autogen.sh)
> mkdir build
> cd build
> ../libabc/configure CFLAGS='-g -O0' --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib
> make check
>
> /bin/sh: ./build-aux/test-driver: No such file or directory
>
> Removing the patch makes the checks complete successfully.
>
> Some ptests depend on this patch to find test-driver.  They need to be
> addressed individually.  In all cases I've found so far this is just
> another sed substitution and should work even before removing the
> patch.
>
> I have not verified the ptests in meta-openembedded yet, but I'm
> working on it.
>
> Ola x Nilsson (5):
>   attr: Fix the ptest path to test-driver
>   sed: Fix the ptest path to test-driver
>   parted: Fix the ptest path to test-driver
>   strace: Fix the ptest path to test-driver
>   automake: Remove patch that changes path to test-driver
>
>  ...top_builddir-path-in-Makefile-to-acc.patch | 50 -------------------
>  .../automake/automake_1.17.bb                 |  1 -
>  meta/recipes-devtools/strace/strace_6.11.bb   |  4 +-
>  meta/recipes-extended/parted/parted_3.6.bb    | 16 +++---
>  meta/recipes-extended/sed/sed_4.9.bb          |  1 +
>  meta/recipes-support/attr/attr.inc            | 11 ++--
>  6 files changed, 20 insertions(+), 63 deletions(-)
>  delete mode 100644 meta/recipes-devtools/automake/automake/0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch
>
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206937): https://lists.openembedded.org/g/openembedded-core/message/206937
> Mute This Topic: https://lists.openembedded.org/mt/109511699/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

