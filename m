Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDA4C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:34:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.81598.1749544436641344093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 01:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lLdWDb+j;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so12389731a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544435; x=1750149235; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3U+KdHlWmCdFgfqzv2TttOu3QI7YtzfDlW7mHQ0W7+U=;
        b=lLdWDb+jkz/i+V51A/Glwmv0c7sAtV2r1VsePxOvSk35Am8n74DYizNBhnnwOb0wuU
         OohMu6agc4eWe4bBjlVhyRad8fCEYw+V7Q8SvrbxQBgCJaKKNnE0+EcXNR35ngtpG/Aa
         9uVirQfWMl7fd2qfkLn5pMoLXZl64red+dOBeOq2uLTB2qH7lSrBrM5hD/ZX+Jxfjph+
         Hrb7UTw3ROKHIXfWU1m1EB3ZBuKhuUtZkHvLaWIQktOmcrldvqqkE8LWoi8Az9oFnVWv
         zVnvfTSBniQO5oWss6BAF+xScg2nCUt0AtncJIZRBIwWcWJ8usIjivTuUXDYzVKALI4W
         o4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544435; x=1750149235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3U+KdHlWmCdFgfqzv2TttOu3QI7YtzfDlW7mHQ0W7+U=;
        b=JneLTvqd/REX7yuz7tXA0bMrHQr13QWcE3HKaJutojjYNDS3mE1DnKdWNYtudHbp+L
         tLHhx7+2z6IFR8MZ8nzBXPY14Nurzx0hsi29AUMC7GK7XHtAO0odd33G4kTFAwntK/3E
         Sm+Se8Yp1t9WbRj/tAiV+73fDIRT6ZNl1oCnm/vN21phKxy4YsZCSgwvesaYUziUcAYO
         k7mQqrIvcil4KdJfgaBUr13e8dQUFK+htt5HrGew/blNwtbg4FN9jWvmyeBXAHkzFVM9
         bwaUAMBS1B6/ZPmSIZuX8SiN8sU9/7aHuH3IRDY8sMZ6rxn5kJF3IykfIJns1t9zDtzH
         sDLw==
X-Gm-Message-State: AOJu0YwfJ96cht8a/vax72Me7z7tux16XbzvteX84i/X3gYYzfYRbDTB
	KmA+PDrKR49u/1VnnACcHhUvxpfyfDTtOhOl+sbU7YQMBVBiOl0zP84Z+U2IIojF
X-Gm-Gg: ASbGncsy+ZlHPFnHoizw/r0bDRzoFgcr1MhFqQNvy1jgz1S6jOPdj4QqZ2zY2zFb5Tz
	7SmaMbxedq7O2M1mGBSdbbTuBWZTgrF8e1niakJ61q6HTcUXlkrbXDwPVEi2VA+LEZDqZ8fjTaD
	ZJ9BUsc83GAO/PWyg3mfnHgMpM8vBjw6CGkBWw9mU5AcvuMoqmeHawhEN1JJCfzw/ElYeB3KfYi
	PNhKh+MgGV+NhfNlxubonHuB8zNF2XBrrrC4GoNuekLfweqooZzCE5huIVNXkJ9vLTJBPkgmSD6
	C6TSrCaI1awg4aezddFrADLbw1CsZb6tMqZvkYYDwdDOGgGvycVGCIJErdzhcNEj6YDXIQ==
X-Google-Smtp-Source: AGHT+IEwSbVfugbYtASgcOFJCxJ67O3Fr/PHyycRGxebUDG2JE3C5KVQbkly4/mEGMylGyPQSdsjGw==
X-Received: by 2002:a17:907:d9e:b0:ad5:5114:f538 with SMTP id a640c23a62f3a-ade77183cb8mr210228666b.13.1749544434769;
        Tue, 10 Jun 2025 01:33:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3b40dd41sm542137566b.163.2025.06.10.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:33:54 -0700 (PDT)
Message-ID: <a45fe3d1-d8cb-4dd0-bbb4-ef5de8d4ab3e@gmail.com>
Date: Tue, 10 Jun 2025 10:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] seatd: fix packaging error with systemd
 DISTRO_FEATURES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250606161630.4027025-1-skandigraun@gmail.com>
 <CANNYZj9WWDqrpsmRkAM00=tcmeB1WuRDWsAmshbUvGq+z_xKSg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj9WWDqrpsmRkAM00=tcmeB1WuRDWsAmshbUvGq+z_xKSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218322

On 6/10/25 10:03, Alexander Kanavin wrote:
> On Fri, 6 Jun 2025 at 18:16, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> The systemd unit file for this recipe is only installed in case
>> the target system's init system is not sysvinit (the recipe assumes
>> that in this case it is systemd). It is achieved by inspecting the
>> VIRTUAL-RUNTIME_init_manager variable.
>>
>> However the systemd class was inherited unconditionally. This caused
>> a failure in do_package task, in case systemd is present in the
>> DISTRO_FEATURES but the system's init manager is sysvinit: in this case
>> the systemd unit file is not installed, however systemd.bbclass is
>> still trying to register is as a startup service. At this point
>> it failed:
>>
>> ERROR: seatd-0.9.1-r0 do_package: Didn't find service unit 'seatd.service', specified in SYSTEMD_SERVICE:seatd.
>>
>> To avoid this, inherit systemd bbclass only in case the init system is
>> specified as systemd.
>> +inherit meson pkgconfig update-rc.d useradd ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd',  d)}
> Conditional inherits are best avoided. There are plenty of recipes
> that inherit systemd unconditionally, and they do not require similar
> fixes. Perhaps we should install the service file unconditionally?
>
> Alex

Thanks for the feedback - I don't have particularly strong feelings for
this patch. Will send v2 soon.

