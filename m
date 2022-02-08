Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8424C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 11:32:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9823.1644319969273078784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 03:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=G1xKB4pH;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1158032wml.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 03:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCy5tyCkvn2vUo8Z9QC87g20i3p/jP7p0PMGRqZLIuA=;
        b=G1xKB4pHvPf1CV7ZOK/9mKegbw85IfkUalyB/RC4PrjwYcYonF9PdPEP+rB1bP5l3B
         CYVPOLQ/RI4rVObYSja7SoSplgnOSIiRl9enDGtoAYhtjCW3h4yzRlIyq0/4160vm1lI
         sNBlvplqX1nHyE3GA+/tn9xVUJDgQZMUVmx5x9set+ufJk361x9/A4n2qbPrWK6TZtDN
         6oo6pjhoz3z/uNKW1gaeMIVqCuAaDHk8pZ9/IvAHz+Hixfor1Us6Af638UY6G4pFkokc
         sDpiycPch7UT3kwz5YBFJayS4OnOzIflmvemZOv7QULhri+6V9baJAcn0EpLvVNTEm2l
         3pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCy5tyCkvn2vUo8Z9QC87g20i3p/jP7p0PMGRqZLIuA=;
        b=7IE9XqAcoi0Em2MjpyrxYpV60JJFOvmFc/Nx7Q+NHh7udnZRP2ebp64OBATlpoBek2
         V2Nd/Iur+JD7Tm9gvT56lxJ/Z1mFkopz0lLcAAjsGUzePl8mNaw+AKr4eMxw7JQWQSJd
         TJwCEzLauPkHGcQ/+2KOkj44qYimJNIgeZB8P9M0mObjAod7W52pO+mFBG01W9PbtGtY
         1d+q5ursm/rP8WedjuyFXMsUQ9AI31s4UfMFHrMLm3HFussr+k6f9qpGSUVLxhbUSP6Q
         v5SuAfF3GxSygPyRryMm7d4S0CiuxZEEpEHn/cpRHXG1RPXNiT8b/+LYVxiBgMaMHeC7
         d2YA==
X-Gm-Message-State: AOAM5317gMt0/oN1P959subGYSPemW3375vTX9yN/Li4CawushTxPIPM
	SiBT1qYkzTLwW8tBj712WdROVIG/2dZwyGpwnl81UQ==
X-Google-Smtp-Source: 
 ABdhPJzU72gafuCPh5QYdTkyUABhXdyLLwoIJmOL/Wzq1B6mla3ZPD5WYOdEpU1Tt9/H/hNsgGfdK7sEGpO+GN6ZJjM=
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr745417wmq.184.1644319967478;
 Tue, 08 Feb 2022 03:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20220128014022.3144694-1-alejandro@enedino.org>
In-Reply-To: <20220128014022.3144694-1-alejandro@enedino.org>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Feb 2022 11:32:36 +0000
Message-ID: 
 <CAAnfSTseymNVH6KbfuL02kXSAcm_qPviimu8oW-2Sz36_DrijA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] newlib: Upgrade 4.1.0 -> 4.2.0
To: alejandro@enedino.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 11:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161497

This is causing license errors for me:

ERROR: newlib-4.2.0-r0 do_populate_lic: QA Issue: newlib: The
LIC_FILES_CHKSUM does not match for
file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749
newlib: The new md5 checksum is 8bb75595dbcc7d45e5c0d116d7bdf6ce
newlib: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
The newlib subdirectory is a collection of software from several sources.
Each file may have its own copyright/license that is embedded in the source
file.  Unless otherwise noted in the body of the source file(s), the
following copyright
notices will apply to the contents of the newlib subdirectory:
(1) Red Hat Incorporated
Copyright (c) 1994-2009  Red Hat, Inc. All rights reserved.
...
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
newlib: Check if the license information has changed in
/builds/engineering/yocto/meta-arm/work/build/tmp/work/cortexm33e-fpv5-spd16-poky-eabi/newlib/4.2.0-r0/newlib-4.2.0.20211231/COPYING.NEWLIB
to verify that the LICENSE value "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 &
BSD-2-Clause & tcl" remains valid [license-checksum]

Ross

On Fri, 28 Jan 2022 at 01:40, Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb}  |  0
>  meta/recipes-core/newlib/newlib.inc                  | 12 +++++++++---
>  .../newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb}      |  0
>  3 files changed, 9 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb} (100%)
>  rename meta/recipes-core/newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb} (100%)
>
> diff --git a/meta/recipes-core/newlib/libgloss_4.1.0.bb b/meta/recipes-core/newlib/libgloss_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/libgloss_4.1.0.bb
> rename to meta/recipes-core/newlib/libgloss_4.2.0.bb
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> index 23cd172008..5e488d0848 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -15,13 +15,19 @@ LIC_FILES_CHKSUM = " \
>                 file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
>                 "
>
> -SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154"
> +# Newlib maintainers sometimes publish the source
> +# from a specific snapshot, after an upgrade we can
> +# delete the following line and keep the empty default
> +NEWLIB_SNAPSHOT = ".20211231"
> +NEWLIB_SNAPSHOT ?= ""
> +SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAPSHOT}.tar.gz"
> +SRC_URI[sha256sum] = "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435"
> +
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
>
> -S = "${WORKDIR}/newlib-${PV}"
> +S = "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
>  B = "${WORKDIR}/build"
>
>  ## disable stdlib
> diff --git a/meta/recipes-core/newlib/newlib_4.1.0.bb b/meta/recipes-core/newlib/newlib_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/newlib_4.1.0.bb
> rename to meta/recipes-core/newlib/newlib_4.2.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161064): https://lists.openembedded.org/g/openembedded-core/message/161064
> Mute This Topic: https://lists.openembedded.org/mt/88736577/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

