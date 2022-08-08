Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B48EC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:07:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.1083.1659978438747765183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H3mf2Nut;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id z187so8596797pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=AlNJQ1fMG2GA2oIattpV44RgpUhlkc+4lJBgXhaXkng=;
        b=H3mf2NutV/CTwkoCcGJXEBv4VOrO8hwH4tJWjgv2e5lZCmB6XWICc/CYG+V2d3MlYn
         54cUC9QZ3DvjXEHaPTpZ3rdPXLbFbfQEBy5yT7GUORna9sVsGYt/a3bmUWmpHCjzH1qv
         BskeoPHuKny+duBmC8/BGsSUVRxPhl9QN1aVg7ZnjKNgrHN0/dF5dpxbtdGNmy3vfPRb
         e6Mbkt25I58zD+rmNeGOtKByS/grY6iKSBug5e2aHCoP0jk05vx+CNV+El6syezyybM2
         SgX7By7g/f+jUAUKwN9Oje8LQ5lObtyKLY5tylylTp/I+D8fmJuL7CqPKB+w7YgmpBUP
         mHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=AlNJQ1fMG2GA2oIattpV44RgpUhlkc+4lJBgXhaXkng=;
        b=hDoFcz5KAYUXSFWIM4xaDp+s7jzwCq08jvD6G+/nUmEvoOOZMLQ9SwnSmpyl4NYPbQ
         UH32Pix+ph2AnUykG2tJZHp2T8tIu+9rx1tEx5/re3qOlCc2WWa63xCqEnjFlew1YBuH
         bstr18s4gq4OAB88cK8z4bFDFT3ACqsub2gWLOG4Tsr9U0R0lMQAELjsAAS9E2CLmv/s
         7go3ZJKBFw2si9cPJeTd9dlIDe7w0biA8zIVDgizP60ohQMSgwNe2ey1NUijKW1f53ZV
         MC99mBmv/jgzZETE46kTzaJ4zdt0ZGtVH7z8/0AyVAPpJg73zy78Xe/xEJpgFe+BP7cs
         XvYQ==
X-Gm-Message-State: ACgBeo1vEmD+bMHi3DyfIxg4hWR6yTIN4ypzuCHJ9qrcK7QaLPIsa/OT
	dIO/EB4uM4tzhT8VHV4R2e4=
X-Google-Smtp-Source: 
 AA6agR6l9jQ2nX1hD8fdyo2YMpJToUx1emBLgDa0CyCV5gLTNWTgtLDkf+K2sQup9xa4tySdmsJO2Q==
X-Received: by 2002:a05:6a00:1aca:b0:52f:55f8:c3ec with SMTP id
 f10-20020a056a001aca00b0052f55f8c3ecmr5264938pfv.25.1659978438039;
        Mon, 08 Aug 2022 10:07:18 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a17090a7c0a00b001f4d711e165sm10923557pjf.11.2022.08.08.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 10:07:17 -0700 (PDT)
Message-ID: <328c024f-cf34-d63b-3b39-275ce75c7cec@gmail.com>
Date: Mon, 8 Aug 2022 10:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 08/44] patchelf: update 0.14.5 -> 0.15.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-8-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-8-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:07:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169101



On 8/7/22 11:42 PM, Alexander Kanavin wrote:
> Drop handle-read-only-files.patch: read only files should
> be handled by making them writeable explicitly. See
> the upstream discussion:
> https://github.com/NixOS/patchelf/pull/89

I agree with this. However, we have been carrying this for a while and 
there is a usecase which is addressed, maybe that is no longer a problem 
any more but needs to be checked

see 
https://git.openembedded.org/openembedded-core/commit/?id=18efcbcb896239c64fedd009ce57f3f0c668cbc0

       * Add patch handle-read-only-files.patch to fix error when 
building eSKD, the following error appears on task do_testsdkext


> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../patchelf/handle-read-only-files.patch     | 65 -------------------
>   ...{patchelf_0.14.5.bb => patchelf_0.15.0.bb} |  6 +-
>   2 files changed, 2 insertions(+), 69 deletions(-)
>   delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
>   rename meta/recipes-devtools/patchelf/{patchelf_0.14.5.bb => patchelf_0.15.0.bb} (79%)
> 
> diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
> deleted file mode 100644
> index b755a263a4..0000000000
> --- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 682fb48c137b687477008b68863c2a0b73ed47d1 Mon Sep 17 00:00:00 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Fri, 9 Sep 2016 16:00:42 -0300
> -Subject: [PATCH] handle read-only files
> -
> -Patch from:
> -https://github.com/darealshinji/patchelf/commit/40e66392bc4b96e9b4eda496827d26348a503509
> -
> -Upstream-Status: Denied [https://github.com/NixOS/patchelf/pull/89]
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> -
> ----
> - src/patchelf.cc | 16 +++++++++++++++-
> - 1 file changed, 15 insertions(+), 1 deletion(-)
> -
> -Index: git/src/patchelf.cc
> -===================================================================
> ---- git.orig/src/patchelf.cc
> -+++ git/src/patchelf.cc
> -@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShd
> -
> - static void writeFile(const std::string & fileName, const FileContents & contents)
> - {
> -+    struct stat st;
> -+    int fd;
> -+
> -     debug("writing %s\n", fileName.c_str());
> -
> --    int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
> -+    if (stat(fileName.c_str(), &st) != 0)
> -+        error("stat");
> -+
> -+    if (chmod(fileName.c_str(), 0600) != 0)
> -+        error("chmod");
> -+
> -+    fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
> -+
> -     if (fd == -1)
> -         error("open");
> -
> -@@ -551,8 +561,6 @@ static void writeFile(const std::string
> -         bytesWritten += portion;
> -     }
> -
> --    if (close(fd) >= 0)
> --        return;
> -     /*
> -      * Just ignore EINTR; a retry loop is the wrong thing to do.
> -      *
> -@@ -561,9 +569,11 @@ static void writeFile(const std::string
> -      * http://utcc.utoronto.ca/~cks/space/blog/unix/CloseEINTR
> -      * https://sites.google.com/site/michaelsafyan/software-engineering/checkforeintrwheninvokingclosethinkagain
> -      */
> --    if (errno == EINTR)
> --        return;
> --    error("close");
> -+    if ((close(fd) < 0) && errno != EINTR)
> -+        error("close");
> -+
> -+    if (chmod(fileName.c_str(), st.st_mode) != 0)
> -+        error("chmod");
> - }
> -
> -
> diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
> similarity index 79%
> rename from meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
> rename to meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
> index 0fa2c00f1d..26abde2ed5 100644
> --- a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
> +++ b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
> @@ -4,10 +4,8 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
>   
>   LICENSE = "GPL-3.0-only"
>   
> -SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
> -           file://handle-read-only-files.patch \
> -           "
> -SRCREV = "a35054504293f9ff64539850d1ed0bfd2f5399f2"
> +SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
> +SRCREV = "49008002562355b0e35075cbc1c42c645ff04e28"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169032): https://lists.openembedded.org/g/openembedded-core/message/169032
> Mute This Topic: https://lists.openembedded.org/mt/92887003/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

