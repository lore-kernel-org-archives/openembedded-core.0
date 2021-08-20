Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.2617.1629488403639670418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 12:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SiXmb38l;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id x5so8315772qtq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 12:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFafbSO6ok0WxD4RVmlhsxDTShY0W2d3kW5lGNbBqzQ=;
        b=SiXmb38lmt+zCm8Q9d6qyXmKAhaGYY+/mLD8x/3EoMDEkQDAxUMjaq/3XuOeilEFoq
         UdPQTXv+rYiQWVfjaooJJmw/EOsSo1jTazlD65e9lpGWhUPykJFFLqyk++l3doDvp0go
         H249PAp8iqwmC89BDf16ospM2PJfmtgNMELUJXlkaDFZpOHcHYYWBpyjtIETcHzyo/n2
         hOGw+1J/fcwelAh/BUkMAoFUAaKsVVDJjggqViazVa6FTt84kIK+H4sAwPPwdiHlkf/Y
         9L7fGZzncceOTGkTHa650pEY4wCuwc5VI0yV3OsnXLBeOJviZnO/3Dc2i7zxswIa323J
         lDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFafbSO6ok0WxD4RVmlhsxDTShY0W2d3kW5lGNbBqzQ=;
        b=aghiY1utmRzKdd2OxHrPzzKb13RDNzioCdymGLIKJhuWphgbMJ94ldgCGcNWDj17q1
         t9OMpRA5sYk4xYyv8C1pKt2goKIXwMaZSojS3Yqv0D55L4JK+B7g2oV0WXvh9NY+WKqH
         rNFGibev+pfQ9p88lxUUPqPyg3i2bmtdvN406K409I5Bt4re94r/xavXP42gyIeepwIp
         M7vTjWyAd1031JKuZjqTdyPIr7+oiTYFaizQ0xpLTMF0VNbXC71sfcxXwDyzp8gf/g1F
         W6u73eZJOmi52NwhQxbAtF4Ygcxz727/lXYR0XTLyOdfR2H2PiIDnnKMbpWACA6iufRU
         i5bw==
X-Gm-Message-State: AOAM531w2zSR7yHelwfhJzQmRjxMoLxCMSglhArYGYamqAdiQqf47ZmA
	orsTpcNbRQNC85n3pqy3sVAhTZ0XbR9EAzFVUHw=
X-Google-Smtp-Source: ABdhPJyFJA/VmuT7GiikPVv9M+Xn+3mC5BqsavAshErg0HuM865QOMypU6pwr2L/RTbcC+HE02HF4U/w/AvYyN1gIVU=
X-Received: by 2002:ac8:5b90:: with SMTP id a16mr16151296qta.82.1629488402735;
 Fri, 20 Aug 2021 12:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210820153947.8838-1-sakib.sajal@windriver.com> <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
In-Reply-To: <CANNYZj8NGWfV7ptdJADYZDnToo0En8nm8yO_YX_m-_VvZ_qOmw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Aug 2021 12:39:36 -0700
Message-ID: <CAMKF1spW-w1BDVuT5YQnXaryhWOV_pyGv19msMwDh=O9TvegHA@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] go: upgrade 1.16.5 -> 1.16.7
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 9:34 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Maybe we should go straight to 1.17?
>

Eventually yes, but for backport reasons lets fist move to latest on
1.16 release and then go to 1.17
so we can backport easily to releases.

> Alex
>
> On Fri, 20 Aug 2021 at 17:39, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>  meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc}     | 4 ++--
>>  ...{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} | 4 ++--
>>  ...o-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} | 0
>>  .../go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb}             | 0
>>  .../go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb}       | 0
>>  .../go/{go-native_1.16.5.bb => go-native_1.16.7.bb}           | 0
>>  .../go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb}         | 0
>>  meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb}       | 0
>>  8 files changed, 4 insertions(+), 4 deletions(-)
>>  rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc} (89%)
>>  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} (83%)
>>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.16.7.bb} (100%)
>>  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb} (100%)
>>  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb} (100%)
>>
>> diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.16.7.inc
>> similarity index 89%
>> rename from meta/recipes-devtools/go/go-1.16.5.inc
>> rename to meta/recipes-devtools/go/go-1.16.7.inc
>> index b693315917..ed2d94671b 100644
>> --- a/meta/recipes-devtools/go/go-1.16.5.inc
>> +++ b/meta/recipes-devtools/go/go-1.16.7.inc
>> @@ -1,7 +1,7 @@
>>  require go-common.inc
>>
>>  GO_BASEVERSION = "1.16"
>> -PV = "1.16.5"
>> +PV = "1.16.7"
>>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>>
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>> @@ -18,4 +18,4 @@ SRC_URI += "\
>>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>>      file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
>>  "
>> -SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
>> +SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
>> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>> similarity index 83%
>> rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>> index b3e2b6a60e..cb54c2868e 100644
>> --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
>> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.7.bb
>> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>>  PROVIDES = "go-native"
>>
>>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
>> -SRC_URI[go_linux_amd64.sha256sum] = "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
>> -SRC_URI[go_linux_arm64.sha256sum] = "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
>> +SRC_URI[go_linux_amd64.sha256sum] = "7fe7a73f55ba3e2285da36f8b085e5c0159e9564ef5f63ee0ed6b818ade8ef04"
>> +SRC_URI[go_linux_arm64.sha256sum] = "63d6b53ecbd2b05c1f0e9903c92042663f2f68afdbb67f4d0d12700156869bac"
>>
>>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
>> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.7.bb
>> diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb b/meta/recipes-devtools/go/go-cross_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-cross_1.16.7.bb
>> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-crosssdk_1.16.7.bb
>> diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb b/meta/recipes-devtools/go/go-native_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go-native_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-native_1.16.7.bb
>> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
>> rename to meta/recipes-devtools/go/go-runtime_1.16.7.bb
>> diff --git a/meta/recipes-devtools/go/go_1.16.5.bb b/meta/recipes-devtools/go/go_1.16.7.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/go/go_1.16.5.bb
>> rename to meta/recipes-devtools/go/go_1.16.7.bb
>> --
>> 2.32.0
>>
>>
>>
>>
>
> 
>
