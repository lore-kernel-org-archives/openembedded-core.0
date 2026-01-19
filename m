Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA37ED489BD
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:54:40 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34544.1768827272385806360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Glep/etp;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a35a00502so43221296d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 04:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827271; x=1769432071; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rNXSQx+jWtg6PCznwOB4v/DjC+SV7oWBghAkqnEiI/A=;
        b=Glep/etpDR2wjVUe76W6mWJ0mjB1mPhZ/y0TS6s10tVKBAZDZ8GbFIlTQK8yt2Pree
         Lxj3YFSzZ1JUox3I9eKi2JKJCbIOrVh6MwFCFX2zIvIh2cJVeQsd7SJFRjR7dJ4EO7iP
         Q7OgJuWNXl/Bj6ii1Vlng/gOWvFIjb20adpBvyxCcnzAC4RvfQJ2xXl5VMNVJVdyIIax
         5vCB5+MtdplNI7ZEP0k/Oy6KGSfrS/hTD74kIMk6DT/+8vQ2xtmrMQY4IqKqmA8SdQNB
         hYldK0UHtrCf3koes+Am8dlrv/RRWdDxed3NAP6tCuWfNvLL7my1Cvn4/c2iRP/w6HWw
         8VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827271; x=1769432071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNXSQx+jWtg6PCznwOB4v/DjC+SV7oWBghAkqnEiI/A=;
        b=OUyOzf03Zts6QL9M0RgvUMrEV6iQH4csLSTsnw0Oain3QSF2frXY3PZS1UdCfTzl2v
         vyCGhT8Oo/V/UKKy2D8DMhdsRR1D/SS2H0GkxIOa141qW2DrpUiJzY4aNrgF67Q2CDBH
         4L4yCsa3t9uDgI1vKptq1/Eu7/puP0JPk0vtxD3ktMLjtVunBeYNRlxOkLba04039M1K
         q7OBfhxFAKEXYQBHhd5b1G/jq54XKWMSDzG2OhOI8K4IxVKWapsS+DSibl/6xYS8E5eY
         w+cbAo9OsZareDGHz4j6Yi7NXVw5weBFsCsv8U5Up2awEy0uICO1r+I+/1iY3PleEck0
         QkLg==
X-Gm-Message-State: AOJu0YxhIFmwdq3rpGE2TRCfiTOX+fKGQ8XVl0VS4y1NLZ2B9hMQbIQA
	85Ph56SW8etz1gyuFk0misLTxkXKQAKbVIGdiculWxja0PdYAzJ269zPLYiitihvcOvx41EixTR
	mb8+bb96oxIjZV4dRUQW5UDWhpUlgSDfCUg==
X-Gm-Gg: AZuq6aLc5l+No7YgLKRs0dMCqVr/xWlNXvgKGlr3Vr8PG1aJf5vT2Rc2UkLWe2LaBVf
	vUVAoeCtRLki3mMXwE3OnE/KbwKNl/nSwxTIqxsZlq6PLuV46a6uzfFkoae5RyrMz23Nv7p+E51
	LncCGalhRt31aVMlZa5J3Oo8xj2bH/g45zz2NntDERI2lSmoMUZM+s6qrjQWd3kKf+dKetUtODo
	oMYoVgYDDcb195fS4lFf0HvZS69RLhex4ACT3921OkDociwzfR12tphGFeFqkjB4VfkCNExuZP5
	zbDKoGdWVjx4s/Z8zS6zLEL1U7e0Ea/ySiFTOvrn
X-Received: by 2002:a05:6214:80c6:10b0:894:5d03:374f with SMTP id
 6a1803df08f44-8945d0337b8mr1769826d6.44.1768827271390; Mon, 19 Jan 2026
 04:54:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768802844.git.liezhi.yang@windriver.com> <c75310f8f8162bcca3c24dcaf9230cbbdec3f399.1768802844.git.liezhi.yang@windriver.com>
In-Reply-To: <c75310f8f8162bcca3c24dcaf9230cbbdec3f399.1768802844.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Jan 2026 13:54:20 +0100
X-Gm-Features: AZwV_QgHJUTShTeeGQqjS7qWoTv_S2EcH_2I92i9-1UFd-0MIMIWkLxarU2DXU0
Message-ID: <CANNYZj_pDx1bwBx4wphrnesESKUBJT3atpk5CWcgTQ_HwN0vgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rpm: 4.20.1 -> 6.0.1
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 12:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229615

On Mon, 19 Jan 2026 at 07:09, <liezhi.yang@windriver.com> wrote:
>   - 0001-macros.in-Set-_rpmformat-to-4.patch
>     Fixed:
>     error: External dependency generator is incompatible with v6 packages

This one is creating technical debt. I can imagine support for v4
packages will be dropped at some not-too-distant point. We've had this
deprecation warning for a long time, but it looks like the matter is
becoming more pressing now. Can you look into it?

>   - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
>     Fixed:
>     GPG check FAILED
>
> * Add scdoc-native to DEPENDS to fix do_configure error for both native and
>   target:
>   Could not find SCDOC using the following names: scdoc

Is this a hard dependency? Is there a cmake switch to turn it off?

>   Note, both target and native need scdoc-native.
>
> * Add bash to RDEPENDS:${PN} to fix:
>   ERROR: rpm-1_6.0.1-r0 do_package_qa: QA Issue: /usr/lib/rpm/rpm-setup-autosign
>   contained in package rpm requires /bin/bash, but no providers found in
>   RDEPENDS:rpm? [file-rdeps]

All things that depend on bash are specifically placed into
${PN}-build, so that the main package will not pull in gplv3 licensed
items. I can imagine this will fail in no-gpl3 tests too.

> -EXTRA_OECMAKE:append:class-native = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var"
> +EXTRA_OECMAKE:append:class-native = " -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DLIBELF_FOUND=False"

Addition of LIBELF_FOUND=False is not explained. Also I think it can
be easily provided?

Otherwise, looks good, thanks for working on it!

Alex

