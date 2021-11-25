Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14562C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:47:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.15034.1637862467052200479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KUnycyJZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id v19so5038329plo.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=CXwIr+tfDFO2+Jxlobn2Ek0nNZeXUv8x+UFvyTp/KbI=;
        b=KUnycyJZFbkoUjt0ONe2gW4lcAF+R1jJbYrkCoPWHEVKv6RCgGvlyVyCQIA4Hb1DMk
         wGwVci4zROFZQZJtOBRY0UTjboDHq9XTBFS6VV0Lx9o8BrpQ0sIOFU3EKioGWWWMOBTC
         DHIM3V0Uhmp0aE/CD4HDekGshFeGqdb2C2teK95N4Xo4LnZacGwvrcmF1DdwC7Wv1XIK
         3DX4b7dXO5P5+/fRIcwjwWivrZHT8KZGb65FQbmq7CZETFHVcOtJEEAPGCdgTJGI0sU/
         YRQXd6kJz3LG7y50yMbP08ke80lfLqdvKHydWbqto703n+UclI/ZUuTsxa0zvK4LYIBc
         u6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CXwIr+tfDFO2+Jxlobn2Ek0nNZeXUv8x+UFvyTp/KbI=;
        b=vACs83CKPk7dQe2T2O/jA2+XnfHngmspOC6o0pE1F+yVSTx5tqoCFd6U2bub4gj+mq
         /kTubWHJQeN3NbikXHja6xuTcKTGzTDzoqGmtYAKzPmwLnQECBsafymiJCmy3ols19RC
         /2anPKEfT9Q6i37jMVo/gJhUIHEWSOj0fFje/EFE8Wx/WH6CGsusZ4ySayuLVFAvfFu4
         4FcWc9m1mnzad2cxeier/NhRk7bkqI7ew1JS69xrIFpG7m/T26TsPCc+HZSCtBdhnc7r
         IOy8zoNQoNE3NGPLyqi3qnzKHVlLGEObqqpr02mNjlajWOEqCQorp96JKAHbK6QN13+Q
         5gZw==
X-Gm-Message-State: AOAM531alXa5PJ1e4DL7GfUVshgRLAmJYJK4kNreQQreyznncCUpzv4N
	PZgcdcYGWH7ThrWU/f2qGg0=
X-Google-Smtp-Source: 
 ABdhPJwcdefe4ZFZygKf92b0x/GpPUmJeu48UhxJ2oxRagJgJxvlxAv3hWPsBGn3YGIjXuguQXEr8A==
X-Received: by 2002:a17:902:c20d:b0:142:1009:585d with SMTP id
 13-20020a170902c20d00b001421009585dmr31982750pll.83.1637862466498;
        Thu, 25 Nov 2021 09:47:46 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c?
 ([2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c])
        by smtp.gmail.com with ESMTPSA id
 i76sm2853583pgd.69.2021.11.25.09.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:47:46 -0800 (PST)
Message-ID: <5fa3b9fc-c494-c36e-eec0-7a59a4f5ee26@gmail.com>
Date: Thu, 25 Nov 2021 09:47:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 2/3] gcc: Drop no longer needed patch
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
 <20211125152234.129463-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211125152234.129463-2-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158790



On 11/25/21 7:22 AM, Richard Purdie wrote:
> This patch was mentioned upstream a long time ago:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47256
> 
> Changes from gcc 10 onward mean it is no longer needed as mentioned in the
> above bug report. Drop the patch.
> 

this looks ok.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
>   .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    | 35 -------------------
>   2 files changed, 36 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index baced2a4007..b4e4300c66b 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -34,7 +34,6 @@ SRC_URI = "\
>              file://0002-gcc-poison-system-directories.patch \
>              file://0004-64-bit-multilib-hack.patch \
>              file://0005-optional-libstdc.patch \
> -           file://0006-COLLECT_GCC_OPTIONS.patch \
>              file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
>              file://0009-cpp-honor-sysroot.patch \
>              file://0010-MIPS64-Default-to-N64-ABI.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
> deleted file mode 100644
> index 265ca0e2187..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 127716a32a11ca2a6b3aac068054bfc69c4dcfd8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:16:28 +0400
> -Subject: [PATCH] COLLECT_GCC_OPTIONS
> -
> -This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> -invoke collect2.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/gcc.c | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index be7630ffd8c..1bc45285384 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -5383,6 +5383,15 @@ set_collect_gcc_options (void)
> - 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
> -
> -   first_time = TRUE;
> -+#ifdef HAVE_LD_SYSROOT
> -+  if (target_system_root_changed && target_system_root)
> -+    {
> -+      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
> -+      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
> -+      obstack_grow (&collect_obstack, "'", 1);
> -+      first_time = FALSE;
> -+    }
> -+#endif
> -   for (i = 0; (int) i < n_switches; i++)
> -     {
> -       const char *const *args;
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158781): https://lists.openembedded.org/g/openembedded-core/message/158781
> Mute This Topic: https://lists.openembedded.org/mt/87304168/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

