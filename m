Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96182C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:38:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.6443.1692866329285537571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=peG327+7;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so8397019a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 01:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692866327; x=1693471127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58PwmxlD7tz1sByd3NIf3LoUllj4aPKv0MEGkP6Ap7c=;
        b=peG327+7wXoQG455OqKGmrrl81jOLxPLeORK899ZMV4LySHlK/ElOX+NmOc2fBKyUk
         rSBRuivZoDGmwdmivGoz30uaNx9uQApM9WhJOLTaMIteDaEFIfVcCpiruXt8BcadrXqT
         QMBhbCBdVHiMCl99DvgMGpPtizNVO2h83t3SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866327; x=1693471127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58PwmxlD7tz1sByd3NIf3LoUllj4aPKv0MEGkP6Ap7c=;
        b=bna20oUMANtGtlcIjPLHQJ/uXZBhztngG+l1JgASza9vxVyUKxF/6xmipx09U6khkJ
         knxZpV3XqiMUn9AFg/Qd5YHabbnEPKeUyggbJEOmWvt+oVqc/sC3RwAl74hzGYBuKSWt
         aaoD7qttTJBmMSG6buXTchAJCZAJE5NWLstzGkfeYmE5BrLfjPXmjxJuLY1iA9iXb0EJ
         grk3KDCrgJTVkLG8oEfbtNJBgG/BxBDmbE972lo0Vg+T/jde39d6h9HIzKyq0qFKOAYu
         dNiMrn1T+Ol0tFO3MTZt5liRKZfFgdJP86O4LFZ3CXyZCYDRed7mghsb8NUE9BQzz3/u
         rBBg==
X-Gm-Message-State: AOJu0YwF/Fa1xUD3/H6GsiLOf6mtcOmnK4JYdvyYAdpoy6yRgU8O3CSu
	EXOMpC+O2Ir5AjJ6xXLPHUeEmA==
X-Google-Smtp-Source: AGHT+IFPtJCLJYRO1y+LShx+PnZ+x/4i6E8ftXK1939jVO0RjDJIbmrbPJN4ik/tISbxacXXTFAHRQ==
X-Received: by 2002:a05:6402:343:b0:523:3f45:5678 with SMTP id r3-20020a056402034300b005233f455678mr11822504edw.31.1692866327058;
        Thu, 24 Aug 2023 01:38:47 -0700 (PDT)
Received: from [192.168.5.249] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id i21-20020a05640200d500b00525503fac84sm10340365edu.25.2023.08.24.01.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:38:46 -0700 (PDT)
Message-ID: <098c6e92-55b4-7930-0e98-712bb6141fd8@konsulko.com>
Date: Thu, 24 Aug 2023 11:38:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com>
 <CANNYZj-et3+B=2C5TfxFjMBTck=JCGDh36giY0hcD5nN7TSdPQ@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CANNYZj-et3+B=2C5TfxFjMBTck=JCGDh36giY0hcD5nN7TSdPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 08:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186645

Hi Alex,

On 23.08.23 г. 19:46 ч., Alexander Kanavin wrote:
> Both this, and aml recipe should go to meta-oe, unless there is a use
> case for having them in oe-core.
Without these 2 recipes Weston 12 fails to build if PACKAGECONFIG 
includes vnc:

Missing or unbuildable dependency chain was: ['weston', 'neatvnc']

In this case neatvnc and aml are dependencies of weston and in my 
opinion they should be in the same layer. However, if you insist I can 
submit the patches to meta-oe.

Best regards,
Leon
>
> Alex
>
> On Wed, 23 Aug 2023 at 18:24, Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Add a new recipe for neatvnc v0.6.0, a liberally licensed VNC
>> server library with a clean interface. It is required for building
>> Weston with VNC backend.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   meta/conf/distro/include/maintainers.inc     |  1 +
>>   meta/recipes-graphics/neatvnc/neatvnc_git.bb | 40 ++++++++++++++++++++
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta/recipes-graphics/neatvnc/neatvnc_git.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 11b47ffe84..f659e24a66 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -895,3 +895,4 @@ RECIPE_MAINTAINER:pn-zip = "Denys Dmytriyenko <denis@denix.org>"
>>   RECIPE_MAINTAINER:pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
>>   RECIPE_MAINTAINER:pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>   RECIPE_MAINTAINER:pn-aml = "Leon Anavi <leon.anavi@konsulko.com>"
>> +RECIPE_MAINTAINER:pn-neatvnc = "Leon Anavi <leon.anavi@konsulko.com>"
>> diff --git a/meta/recipes-graphics/neatvnc/neatvnc_git.bb b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
>> new file mode 100644
>> index 0000000000..dc4678f082
>> --- /dev/null
>> +++ b/meta/recipes-graphics/neatvnc/neatvnc_git.bb
>> @@ -0,0 +1,40 @@
>> +SUMMARY = "A liberally licensed VNC server library"
>> +DESCRIPTION = "This is a liberally licensed VNC server library that's intended to be fast and neat."
>> +HOMEPAGE = "https://github.com/any1/neatvnc"
>> +LICENSE = "ISC"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
>> +
>> +SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
>> +
>> +SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
>> +
>> +PV = "0.6.0+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "libdrm pixman aml zlib"
>> +
>> +PACKAGECONFIG ??= "tls"
>> +PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
>> +PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
>> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
>> +PACKAGECONFIG[benchmarks] = "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
>> +
>> +PACKAGE_BEFORE_PN += "${PN}-examples"
>> +ALLOW_EMPTY:${PN}-examples = "1"
>> +FILES:${PN}-examples = "${bindir}"
>> +
>> +NEATVNC_EXAMPLES = "draw png-server"
>> +
>> +inherit meson pkgconfig
>> +
>> +do_install:append () {
>> +       if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
>> +               install -d ${D}${bindir}
>> +               for bin in ${NEATVNC_EXAMPLES}; do
>> +                       install -m 0755 ${B}/examples/$bin ${D}${bindir}
>> +               done
>> +       fi
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186621): https://lists.openembedded.org/g/openembedded-core/message/186621
>> Mute This Topic: https://lists.openembedded.org/mt/100918320/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
-- 
Leon Anavi
Software Engineer
konsulko.com


