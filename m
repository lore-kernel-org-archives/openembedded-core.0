Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042ADC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 15:48:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.23.1753372124563816170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 08:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqDtxrnq;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561607166aso8256305e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372123; x=1753976923; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmsKycI8KrNALfSDj3J0RJZ+pd32jOKgsAFUHWVAbQ4=;
        b=eqDtxrnqQb7iSRSBzqA42+VyyVeVBCnIWt7XSfpdQPIKEBqMFXhBTyyybz+jNT0P8w
         g2Cava7h2tycfM8lOCW3Pdut/qqBfRwCvvlSQjg40ZXD43CpmtAKsiIk0qwPBYqISAsn
         MLOItyKP4sSmdJURvkYNtXEy5Yc8OxYZ3HGzdRBG/J6TmHcaK5jnoeqD/0hnDx7t3yxT
         gnxUQxAKv40a6bGna9Br4ev/ES8S2FS0WBrlV39ATTtJtcyRlEYx5aA4Y21BRySqJ3vN
         PWN3fEBLOmSJHdJ3w90ae8tXN12aO3aoU1wMn+hPAdlOYWYioyqOTPJNJYYrajSiMsqX
         Jytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372123; x=1753976923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmsKycI8KrNALfSDj3J0RJZ+pd32jOKgsAFUHWVAbQ4=;
        b=pEHzNb8icxG3LDYO2cVOhj069jYl4+tatgRc+l3HU/eLg5oYR0zM5jEYemuQUSoD1m
         5uT7jU003YIt98Z8JokS0DOfRYVMGZoMyn43jsPVk5Bf6+1YUnl5LGHZ5W0Nsy/glTvK
         hENEj3ICr1wJjyYXRwXpdQEXao+gGi42ELiEYP+BCTUNDi3o8IMJW7fCY0GHTPHNEYqq
         gmKVD1sDa2LkttxtUgHj7ulooAaWbLtMfh3WaJzas+rnNapRekdnhrJ0Wy9AkkeX0rKT
         k7+t3UzEcjyyjevJc5r8SqVMGyZBT14NQozZ713iU310N2Opj4+eHi1n/rYtYgMW4nFP
         8dZA==
X-Forwarded-Encrypted: i=1; AJvYcCXq/KUmMps2oG7PZdkbXu3GjG9G+Kzedgguy70dtA5gAuA9gMQhVwWCzHGZdGXTHNg0orr3ldjL9oel7c0FCzEg2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzuG+LyJOt6gWe7TBYAEM99/JZ7pbL3X6GRx8n4jcmXX4je/kUo
	XXWA1bvYO+878ZdHu5dzAmgcQxI0khCzKHHLP3VElE0aZaYIFsxaU+2EuGMrrA==
X-Gm-Gg: ASbGncuzGs7o/VW9fMNTC/Yn/Cqbqi/FPTzaCxIvIsV4/jYyecQkJ9miZirRN8zxgI1
	b6OpFXsjBd+alsvF18TeXw7uxZtJQotRAEYd8LhcmVLLBHFnf6Mrz8ekQyAngl/fslw1tr8Va9K
	EuciEAzGtk9gyl98MO0lRUzUH5Qlbu5kZBMonyEgY9ZZ0gYNWvs6ShAHw6brXKco2Q+vNOmUmKP
	ifYzA07iCnZrc95gaJHh9FN80LJCg/v6YQJsgHfIZ0FoVpDiM6nu/iIFAh7LSQupFIf9HanTE2R
	a+auuiOcDQ9QWLF/pUjtpnVte30ZauuWsSLeTo+Zb1t5+BNgx7+3MK+dFqeDuWi1tyVz3NBCsoQ
	0L06mZ8fvl8jpOo2uStLXOvZpLOX2pQ==
X-Google-Smtp-Source: AGHT+IENupPB4I/NXCxwUOaYBsFXMDTZTKm5q073sQf3CP77Aigd3q0gvrOVc81DNu+xhGkw98vxzQ==
X-Received: by 2002:a5d:64c5:0:b0:3b2:ef53:5818 with SMTP id ffacd0b85a97d-3b768c98f53mr6701742f8f.5.1753372122317;
        Thu, 24 Jul 2025 08:48:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d07asm2575469f8f.19.2025.07.24.08.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 08:48:41 -0700 (PDT)
Message-ID: <d35e00a9-107d-4435-9edc-253ebc6f3d0d@gmail.com>
Date: Thu, 24 Jul 2025 17:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Fix CVE-2025-7545
To: deepesh.varatharajan@windriver.com,
 openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250724103153.532074-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250724103153.532074-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 15:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220838

On 7/24/25 12:31, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> objcopy: Don't extend the output section size
> Since the output section contents are copied from the input, don't
> extend the output section size beyond the input section size.
>
> Backport a patch from upstream to fix CVE-2025-7545
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.42.inc                |  1 +
>  .../binutils/0023-CVE-2025-7545.patch         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
> index 9471e6accd..c2685948f7 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -53,5 +53,6 @@ SRC_URI = "\
>       file://CVE-2025-1179.patch \
>       file://0022-CVE-2025-5245.patch \
>       file://0022-CVE-2025-5244.patch \
> +     file://0023-CVE-2025-7545.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
> new file mode 100644
> index 0000000000..de132f74fc
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
> @@ -0,0 +1,39 @@
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sat, 21 Jun 2025 06:36:56 +0800
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

It's a very small thing, but it caused me quite some head scratching
while reviewing this. When I visit this link, it leads me to a
completely different commit, which I didn't really understand.
After a few minutes of intense staring, I noticed the problem (good link
over the bad one): 

https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944
https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944

A "=" is missing from the patch's link. (But otherwise the patch itself
looks OK)

> +CVE: CVE-2025-7545
> +
> +Since the output section contents are copied from the input, don't
> +extend the output section size beyond the input section size.
> +
> +	PR binutils/33049
> +	* objcopy.c (copy_section): Don't extend the output section
> +	size beyond the input section size.
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/binutils/objcopy.c b/binutils/objcopy.c
> +index a85d2620..18cd1bfd 100644
> +--- a/binutils/objcopy.c
> ++++ b/binutils/objcopy.c
> +@@ -4547,6 +4547,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
> + 	  char *to = (char *) memhunk;
> + 	  char *end = (char *) memhunk + size;
> + 	  int i;
> ++	  bfd_size_type memhunk_size = size;
> + 
> + 	  /* If the section address is not exactly divisible by the interleave,
> + 	     then we must bias the from address.  If the copy_byte is less than
> +@@ -4566,6 +4567,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
> + 	      }
> + 
> + 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
> ++
> ++         /* Don't extend the output section size.  */
> ++         if (size > memhunk_size)
> ++           size = memhunk_size;
> ++	  
> + 	  osection->lma /= interleave;
> + 	  if (copy_byte < extra)
> + 	    osection->lma++;
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220833): https://lists.openembedded.org/g/openembedded-core/message/220833
> Mute This Topic: https://lists.openembedded.org/mt/114318691/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


