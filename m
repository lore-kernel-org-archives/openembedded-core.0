Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.25060.1619988048777422232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 13:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MF7m/XRk;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t4so968964plc.6
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YknqFshd1zVrz3G446oeeJQHw0NAnDQfQfrCsxlpxKs=;
        b=MF7m/XRkyiexNK12p3vDW1VZxnxvxYK8PNObnAH2UW9oebAk5iB+lTWJHsvtxCn2AF
         dcgqPTtBs3+7GwbETc6HFM/ESHcArzPQVs9C4RqWIsDq87FY4vxw8gL5+n9E50SBUMZ5
         K2bTdrsOLsFaPUmAgfTsOIHNMHdWe+Z9IX9dJzRHLKt2FXw/I8rDOHtJ77w00DA+gvy9
         ye5hvCkJ5qlQQBtmrG/FJDCifQYc+81Q/BWMK3ZgCR8qLnTyrvhuQmKk8q/+sO0xK38e
         H1e/vgImFXCXk6yCYWt4jQSoN+1cEnXZNqVldfswtjUdTwhrUtsfEmGtVKwWC4dLTnVt
         gGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YknqFshd1zVrz3G446oeeJQHw0NAnDQfQfrCsxlpxKs=;
        b=F3jJfsIfi2HOb5iAXaeLj1NcQmz0wjOFS+PPa0Xjgi6v80PBK6LivjgLRz/L6RJNRj
         dyHSVXdZb6Q725ON86vRx8lVem22zUxS1WbjvHxdmU4RD+JP5vf0viaK4eAvP9ZvQJyr
         QGqpEgzVTtqa9E7U+9v75MjKtfTw6sJzMYV0dUxmQnFQnZbjGoDA/rNX8SETaKCjeqRm
         jvMcRBeliWpxB5tnAqqepOOj5Okzpm2SJB2z62qWt/MXkOCI9EKd6RXsF9i3Le9mupBs
         jCvR3KB2rMwKgFUjHoX63g0u77h8xK/RZ7vif6h70GSAVYEm7XCPSmEVGHwUgNDa/XtU
         P2/Q==
X-Gm-Message-State: AOAM532ftu0jMzg0Ol8Yd9tR1A8ngafH8z0DjxKs1TPTAx33QvZ1IKJ/
	5pa3tE2XjbyyIIczytq28oiBhnn2CPZ3Aw==
X-Google-Smtp-Source: ABdhPJxH2p0t1xGlmAxVc39MbQHBW08k5R7sYl22tsXF1tCb+2nRDBLcnIq6C2rZksiWtx4RmZGG7Q==
X-Received: by 2002:a17:90a:b116:: with SMTP id z22mr2255000pjq.70.1619988047912;
        Sun, 02 May 2021 13:40:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::474f? ([2601:646:9200:a0f0::474f])
        by smtp.gmail.com with ESMTPSA id y14sm6145785pjr.51.2021.05.02.13.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 13:40:47 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/3] gstreamer1.0: rename pacthes
To: Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
 <20210502175441.368688-2-quaresma.jose@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4409d6ac-7f54-364b-efde-eb7569c5e067@gmail.com>
Date: Sun, 2 May 2021 13:40:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502175441.368688-2-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

there is typo in subject.

On 5/2/21 10:54 AM, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>   ...ests-seek-Don-t-use-too-strict-timeout-for-validati.patch} | 0
>   ....patch => 0004-meson-Add-option-for-installed-tests.patch} | 0
>   meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb      | 4 ++--
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch => 0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch} (100%)
>   rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0003-meson-Add-option-for-installed-tests.patch => 0004-meson-Add-option-for-installed-tests.patch} (100%)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
> similarity index 100%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
> similarity index 100%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> index 8562070968..b275a3430b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> @@ -18,8 +18,8 @@ S = "${WORKDIR}/gstreamer-${PV}"
>   SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>              file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>              file://0002-Remove-unused-valgrind-detection.patch \
> -           file://0003-meson-Add-option-for-installed-tests.patch \
> -           file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
> +           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
> +           file://0004-meson-Add-option-for-installed-tests.patch \
>              "
>   SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
>   
> 
> 
> 
> 
> 
