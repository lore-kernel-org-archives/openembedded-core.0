Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 714197C0B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 20:18:10 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so22635592qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 12:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ahgqbv1s8KWgDcCiNknMUh3U0QlJPtUVIQ/YDI33Exc=;
	b=UoJ3YI/VehJnzoIK89VWfxnIp+BmapPhe4sd2wDCGrJ0ugIKli8pqOVD+Lv2Z+c9Dn
	NNjxAeo1XYjTdEs5sRytFsufU+xT5405/34OEtptl2+QMpaLaDXuWSU87ieltUJh4E5k
	6nzosnhMoFooLexB94ILa320ECvQXoD4FliNB+pZuHXdVvv6LXWoiH+bAiJDpTIVHKnh
	aB9ziaDDHtU6tkjRSGoV1mPH0LyxU+y20VDQ8OQgRLk5rsHkY+ItPjw/XwRre7/yETTX
	eK3/nll15R9gcK3KW1Wk34XUZ2Rh7uN3RbWjimq6adgyMOUxdClByRmSCXEzQJeTYPif
	rMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ahgqbv1s8KWgDcCiNknMUh3U0QlJPtUVIQ/YDI33Exc=;
	b=GolNh2PtUaAnZfnblqCvi+oxo/cBdUd1bqdqJOJCD/X58f0vjVoYlkUT2QKXA9iGfN
	1B1bSEIg49SQfYcPGy6CHiI7Kg3jilDyTq5tnLXSVvCUJl42KwIw5wXJyqXRQ1eEGJCU
	BVNbW+z4NnwX8OncCg490ZiRK0J6bPvykCkKg34TVSKv0bWJa7Z058iDgEXMj+JEgHl0
	egofnrLgxxgX4IXNKmW4XXH9aA3MXE9vxwOL1z2Q91WJLeduSJXLs3jePzOUErEsmOpK
	/5M0t04p0xr+otQTVsI1BI0Do8HGYVJrUbYpPK4L3TQMZmvkUqeortLTKijEhj/DVkcV
	K5sA==
X-Gm-Message-State: AJcUukc+FKWo6kgBxtRnj2E9t1bwmyQiUMZPCBxLF5y+dwB3DoR4nnX3
	UoacBL8QgcxzYrrv3Z9M74PW7E23Qi6bs5J6bn4=
X-Google-Smtp-Source: ALg8bN63hxpUpdrDVxXLQ4RPTZARFdXLtkDtgbfJyctdNuNSsZnGKQ++RSHYWVRb7/XazQEMspXNEjJeRNYGikQAcFE=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr18719462qtk.253.1547324290952;
	Sat, 12 Jan 2019 12:18:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
	<a5bbd32ecd957f036a9b1e47cc4e3c813d206111.1547316462.git.bruce.ashfield@windriver.com>
	<CAMKF1sokO=RakSBuZy-o4cMBB5EYzDrEJ+R7ZtfzyddNaxqKQw@mail.gmail.com>
	<230139f6-ad04-7033-5da8-3617b8a7a6a9@windriver.com>
In-Reply-To: <230139f6-ad04-7033-5da8-3617b8a7a6a9@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 12:17:45 -0800
Message-ID: <CAMKF1srt-KM61LaOmvorNY8SvQ98dAB36-HmMz0b3Zym1gMudA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/4.19: introduce qemuriscv64 and qemuarma15 BSP definitions
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
X-List-Received-Date: Sat, 12 Jan 2019 20:18:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 10:45 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> On 2019-01-12 1:34 p.m., Khem Raj wrote:
> > On Sat, Jan 12, 2019 at 10:14 AM Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> >>
> >> Incorporating the BSP definitions for two new qemu targets.
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  4 ++--
> >>   meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  6 +++---
> >>   meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 18 +++++++++---------
> >>   3 files changed, 14 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> index cdcdff2e1746..f823683526ee 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> @@ -11,8 +11,8 @@ python () {
> >>           raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >>   }
> >>
> >> -SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
> >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> >> +SRCREV_machine ?= "78404e3a73613f8e07c276e55112989f897cdd04"
> >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> >>
> >>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> index 89c4b9f14d4c..0a79f442a075 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> >> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> >>   KMETA = "kernel-meta"
> >>   KCONF_BSP_AUDIT_LEVEL = "2"
> >>
> >> -SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
> >> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> >> +SRCREV_machine_qemuarm ?= "2594d14d76ae2c49ad43b626662fe53da807ddca"
> >> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> >>
> >>   PV = "${LINUX_VERSION}+git${SRCPV}"
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> index bf4fec71d86c..f410cc8cdb31 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
> >>   KBRANCH_qemux86-64 ?= "v4.19/standard/base"
> >>   KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
> >>
> >> -SRCREV_machine_qemuarm ?= "ec8e55a97ad8a88107c5af069ece1b7f203f4ac4"
> >> -SRCREV_machine_qemuarm64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_machine_qemumips ?= "3b5fba0207a870c1de76c5dd80d8d3c0e42aa1cf"
> >> -SRCREV_machine_qemuppc ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
> >> -SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
> >> -SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
> >> +SRCREV_machine_qemuarm ?= "8b378ac8aca51207085c8df616a6fe56af19f0b4"
> >> +SRCREV_machine_qemuarm64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_machine_qemumips ?= "58f59c2213a657515a158379db153ad618986235"
> >> +SRCREV_machine_qemuppc ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_machine_qemux86 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_machine_qemux86-64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_machine_qemumips64 ?= "6f56a58c214379efe8949da6921b1c00c2af353a"
> >> +SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
> >> +SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
> >
> > Dont we need qemuriscv64 locks here too ?
>
> Not until the machine is in oe-core and there's something I can test.
> Right now, it is just the meta-data.

fair enough. I guess that falls on either Alistrair or myself :)

