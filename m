Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6A0C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 18:38:32 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.204.1708022305239297089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 10:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/UrYDZQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d094bc2244so15841361fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708022303; x=1708627103; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxeVZoRY5K2qPYPCYGdHs65Q5o+CsfN3cBvNKXTfhCc=;
        b=D/UrYDZQB0mFseYkru6LZCqTyMIRiPPCVbhaeV1rUw+GfEOCiDLs3lsnqcabhzLJxk
         8O7d3WtMc85GsnQtHjHyOky2nvZMsNzKyEkMyysyIa/sdHpA0GV9v5tbnW9aMIjtljim
         rf2HkiZ3qblM1Kx1cidDTf+pSsohavLLVjJiw7AQQnliFiLwyL8tHblv2zZO6T2+jvuA
         b3Q71f7DPpk6shbeT7l6f0kIExYy11kpHe2nWq3GDVVQJOtldye6eZyRx+Vnc4f5SnFj
         RYf/OHx5yJDCIBF28ay4lGOs4qjxAIe7H90AES+ophSEWRzoh30cJsHUY5O3T8xI/JBJ
         rtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708022303; x=1708627103;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxeVZoRY5K2qPYPCYGdHs65Q5o+CsfN3cBvNKXTfhCc=;
        b=mLnw3ONJNXro+e+5qXscGR8oCQeyy4TorkxrqIHkxv61prlzzXVsNIUl7xMAcAOl1U
         FwCeU1bfy/Vz5BOrRlmMGO1vl8qevAPLQrcAvlmfn7HZ+AFumqcLedtfza9HDzrKb+Ss
         vBBNax9V0oGknl1NhlpMna/z3uCvk7tUQfYVgoUZ0zC0s+6F7jBrNScMVoJXLEFBtmgQ
         CqglUXQ9Nj149fNVJSebhM59jt6C3tHYtS46bhHU27hoV0lemKXK6fXW4hJoSrEa/eNW
         wNs32FaXhLMLAao+Ni0eMPFagQiNfOJmOtuBIws6FEMeyOLtxZz5yP0WLScHaAf0dAY3
         bxmw==
X-Gm-Message-State: AOJu0Yw4eUd+j60jYktIoDi2bSyEDu6kNbPthOxsrT4rcnnvOI2wJqMG
	rCzuboSMhGBterdX8a/gLElFf8x8gSmK6oCtBIgJsb6pxgKBlJN4
X-Google-Smtp-Source: AGHT+IFd7uiiijwIphFWCabCd1DNItSaNWjN4YrtV1VUaAutAp7acHRdtY3S2DcxK5Ao00RV1INrkA==
X-Received: by 2002:a2e:8893:0:b0:2cd:1366:4aa9 with SMTP id k19-20020a2e8893000000b002cd13664aa9mr2041454lji.25.1708022303077;
        Thu, 15 Feb 2024 10:38:23 -0800 (PST)
Received: from [10.139.10.81] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id j4-20020a05600c1c0400b004120537210esm3786893wms.46.2024.02.15.10.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 10:38:22 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------EWVLuu3lNGI0pnZoMukELd37"
Message-ID: <95bef1e4-94aa-489f-8e6a-ec1df318778d@gmail.com>
Date: Thu, 15 Feb 2024 19:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] overlayfs-etc: add option to skip creation of mount
 dirs
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <ed5d6a8c842319c81026bb4aab7e2a9de3c13189.1707762606.git.baruch@tkos.co.il>
 <8f1c6048-235b-4786-811c-50e79c806da4@gmail.com> <8734tv34vo.fsf@tarshish>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <8734tv34vo.fsf@tarshish>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195690

This is a multi-part message in MIME format.
--------------EWVLuu3lNGI0pnZoMukELd37
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Baruch,
That's a good question.

Bruce, if we need a new kernel feature (squashfs), the only way would be 
first to contribute it to https://git.yoctoproject.org/yocto-kernel-cache/ ?
Or there's another way to enable a specific kernel configuration in a 
selftest?

Slava

On 14.02.2024 07:54, Baruch Siach wrote:
> Makes sense.
>
> I added mkdirhier of OVERLAYFS_ETC_MOUNT_POINT for the case of
> OVERLAYFS_ETC_CREATE_MOUNT_DIRS == 0. Let me know if there is a better
> solution for read-only filesystems.
>
> The trouble with testing is that I could not find any existing feature
> in yocto-kernel-cache that enables either CONFIG_SQUASHFS or
> CONFIG_EROFS_FS. Is there another way to enable kernel features for the
> test?
>
> Thanks,
> baruch
>

--------------EWVLuu3lNGI0pnZoMukELd37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Baruch,<br>
      That's a good question.<br>
      <br>
      Bruce, if we need a new kernel feature (squashfs), the only way
      would be first to contribute it to
      <a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/yocto-kernel-cache/">https://git.yoctoproject.org/yocto-kernel-cache/</a> ?<br>
      Or there's another way to enable a specific kernel configuration
      in a selftest?<br>
      <br>
      Slava<br>
      <br>
      On 14.02.2024 07:54, Baruch Siach wrote:<span
      style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite" cite="mid:8734tv34vo.fsf@tarshish">
      <pre class="moz-quote-pre" wrap="">Makes sense.

I added mkdirhier of OVERLAYFS_ETC_MOUNT_POINT for the case of
OVERLAYFS_ETC_CREATE_MOUNT_DIRS == 0. Let me know if there is a better
solution for read-only filesystems.

The trouble with testing is that I could not find any existing feature
in yocto-kernel-cache that enables either CONFIG_SQUASHFS or
CONFIG_EROFS_FS. Is there another way to enable kernel features for the
test?

Thanks,
baruch

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EWVLuu3lNGI0pnZoMukELd37--

