Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82681C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 06:26:50 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.14547.1752820005292812571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 23:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PemmzW/A;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aec46b50f33so319183766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752820003; x=1753424803; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0ILM4XCS3l4FWVDGdlw/V2+GLR3/S5jI0P5r9vJVdc=;
        b=PemmzW/AMwLXE+JvHB1qT3TAFRkA2CmUQWrxEWCwm/ty2vAk+3D5jhoSumvsApeaXw
         K6KXjlSHo+B/jwohn4UOesFAQRlZx2LjOZlnDYKulNP8kzzcDKuPSn0t7SPV0+WuNVWx
         3jUkja6v4epDFdrUXFHWnbdO023Vfugv7r4WzQv/T6wTmxGdTwgGrqqq3rXH5+EGuLVk
         IuXpTnVNhrKf9Ej1bLghM9040ogLZP39TASVuzHW0MPFPgzPa45q37vDsgrbwxd4Lube
         2a2mv4BzYxy83StNB3xKTuPRtzLmhcw72hqjX2EOeMfxxl8xUHEgwYJdrfpBIXksDoxw
         2CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752820003; x=1753424803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ILM4XCS3l4FWVDGdlw/V2+GLR3/S5jI0P5r9vJVdc=;
        b=GgZlasnZm/ZYXFUdsmM0efYyYiZ9YL5723Lh5nfOFTlNbaGfLQQawpqlyp0ypWfX3A
         sAEBt7u5dMxS1EULRi9uijJUsumiYJdlhT/eTjdTiPbfZZEbj4wICCWwLnn7jMlvaNYa
         mEvIRs9f7jn01URpvjhptitoye0x2Y5A4dSdLtBz8TfRmJeJ/3ffSejLpMLzyo/h890R
         j3lz6V63ejHkPbUzfFGYVZAVa53Qi7x4kjw0yO3yuT0+2fwBJEc9i4xbf6uWONZnIiH+
         gtCq80bVwSZvxPsTjoKbdiEfKkkvMSwX47Ao9/nYWF6JNWBEO/gu+yULcNCpKsdpMgmX
         3RXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrCHg6d5jlci0Kde9SMftpXAlHODOomgP9hqZbYW2VckBa/hbkLlqaSXCTEx+X7FjE+nHM7yGey/SCXOCIKjbCgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCoqpeh3pwdnlZYdgS1kdYDzZLsjCVGYMQB8HIMaa0lsA5UERU
	inraF4dM40t6twwV9XEw+LV9hXl8u/E4C0CwAQMqxjbJ+G71WKHKug2R
X-Gm-Gg: ASbGncuwhBgEb95Pf8N35Rqc0p+TfmD8hkcJrUxIMtVRDkoWsQ7zY+iSnYHdeP9xdwq
	2VVKNGj+h2LZ8xwH5PdO1zNiCxT12A6wUYaMJU3MI1C0/bxKPN9OMSbhzR3c+k37KgX1YK7qKSc
	pavx5rd7i88UpN2WZHvzsRXHAm8O+ZxJ1b1PQfGmucYqgwRfGWDlZDptMLNWZKHMoT1dh+Fmo6K
	1/jJz14L1FOPKbU6JdXcE2fd5DELTvZI+gUIy70Q6p1vzoRSL+pqZtbPkzfRTChN+QG8ZY8ghTm
	VXlOklMCSjOzoRhC1EydmQb0iw+6MbeBCMxiauIxolgIlFkXGA0ogiCzhfbeUT9pGKUlIoBmqIU
	cqoF++BiOlkV2Mt1kIV28OHBc/zw8FQ==
X-Google-Smtp-Source: AGHT+IElkFB8bAYo6mzmJAeNeFa3omQCP9Tg/GEGOCo3h1HCHFHMZGSR03JSg3zyfKozpWvR5LZ2/A==
X-Received: by 2002:a17:906:4715:b0:ae0:be38:64bf with SMTP id a640c23a62f3a-ae9ce189d4dmr759502466b.58.1752820003042;
        Thu, 17 Jul 2025 23:26:43 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad3838sm60591566b.141.2025.07.17.23.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:26:42 -0700 (PDT)
Message-ID: <dd934c53-654c-4a5f-ad30-48bff9320fb5@gmail.com>
Date: Fri, 18 Jul 2025 08:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
To: madmarri@cisco.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
References: <20250214135554.1137043-1-madmarri@cisco.com>
 <SJ0PR11MB5677445C35FFE9413CA754DACD50A@SJ0PR11MB5677.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <SJ0PR11MB5677445C35FFE9413CA754DACD50A@SJ0PR11MB5677.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 06:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220577

On 7/18/25 06:32, Madhu Marri via lists.openembedded.org wrote:
> Hi Team,
>
> Could you please help in review this patch. 

I suspect back then this was rejected accidentally, but looking at it,
this CVE-fix seems to be missing from the master branch also (where it
should go first before Scarthgap).
Do you know why it wasn't accepted by upstream qemu?

>
> Best Regards
> Madhu 
> ------------------------------------------------------------------------
> *From:* Madhu Marri <madmarri@cisco.com>
> *Sent:* Friday, February 14, 2025 7:25 PM
> *To:* openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> *Cc:* xe-linux-external(mailer list) <xe-linux-external@cisco.com>;
> Madhu Marri -X (madmarri - E INFOCHIPS PRIVATE LIMITED at Cisco)
> <madmarri@cisco.com>
> *Subject:* [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
>  
> Upstream Repository: https://gitlab.com/qemu-project/qemu.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-8354
> Type: Security Fix
> CVE: CVE-2024-8354
> Score: 5.5
>
> Signed-off-by: Madhu Marri <madmarri@cisco.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2024-8354.patch             | 42 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index 4dc6c104c7..b967b45b6b 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -40,6 +40,7 @@ SRC_URI =
> "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            
> file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
> <file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch> \
>             file://qemu-guest-agent.init <file://qemu-guest-agent.init> \
>             file://qemu-guest-agent.udev <file://qemu-guest-agent.udev> \
> +          file://CVE-2024-8354.patch <file://CVE-2024-8354.patch> \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
> new file mode 100644
> index 0000000000..6595803341
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
> @@ -0,0 +1,42 @@
> +From f84399128601942228f3decfa4304d86c3fc1a10 Mon Sep 17 00:00:00 2001
> +From: Madhu Marri <madmarri@cisco.com>
> +Date: Thu, 13 Feb 2025 12:19:44 +0000
> +Subject: [PATCH] usb: Check USB_TOKEN_SETUP in usb_ep_get(CVE-2024-8354)
> +
> +USB_TOKEN_SETUP packet not being handled in usb_ep_get function.
> +This causes the program to hit the assertion that checks for only
> +USB_TOKEN_IN or USB_TOKEN_OUT, leading to the failure and core
> +dump when the USB_TOKEN_SETUP packet is processed.
> +
> +Added a check for USB_TOKEN_SETUP to avoid triggering an assertion
> +failure and crash.
> +
> +CVE: CVE-2024-8354
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2548
> +
> +Upstream-Status: Submitted [qemu-devel@nongnu.org]
> +Signed-off-by: Madhu Marri <madmarri@cisco.com>
> +---
> + hw/usb/core.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/hw/usb/core.c b/hw/usb/core.c
> +index 975f76250a..df2aec5aca 100644
> +--- a/hw/usb/core.c
> ++++ b/hw/usb/core.c
> +@@ -741,6 +741,12 @@ struct USBEndpoint *usb_ep_get(USBDevice *dev,
> int pid, int ep)
> +     if (ep == 0) {
> +         return &dev->ep_ctl;
> +     }
> ++
> ++    if (pid == USB_TOKEN_SETUP) {
> ++        /* Do not handle setup packets here */
> ++        return &dev->ep_ctl;
> ++    }
> ++
> +     assert(pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT);
> +     assert(ep > 0 && ep <= USB_MAX_ENDPOINTS);
> +     eps = (pid == USB_TOKEN_IN) ? dev->ep_in : dev->ep_out;
> +--
> +2.44.1
> +
> -- 
> 2.44.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220570): https://lists.openembedded.org/g/openembedded-core/message/220570
> Mute This Topic: https://lists.openembedded.org/mt/111180230/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


