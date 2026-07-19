Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4099FC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:43:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47.1784475827437762270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OQzINkYX;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f6609c657so709138f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784475825; x=1785080625; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lBNts4tug4PY5pgmcKI2fZoXcncV9T8gY/JDKVFAs7s=;
        b=OQzINkYXCzXM1fQs0F0hpe2bpNZnOkB7tteSeGexnSKHFdN6Trr0NiJhVHX/y329VM
         OdO6OwpsRbQqdELsECXjwivXog0eV1VaGI9EXm/CVqrKt2IZwUrVmdAAx6LVRl81wc2v
         nd70XQAUlw4PFrkDBNVkq/A1bG4efs5NNcxl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475825; x=1785080625;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBNts4tug4PY5pgmcKI2fZoXcncV9T8gY/JDKVFAs7s=;
        b=s2qlYnYEUXza5H6ZXdkI8mAQaLkuOliiZgUL4vbzWuQMLU5VjhI0wVFmUVommAK3GD
         C7cBhUo+yVn3HmoxNb9aYE2Nry7Yhd9gXbIGVzmkW2IkLfmCy8C9kUDNDMtc6AWmvDzJ
         ph1SOxz/SY9NMQu+GqLzgEh9eJNJrq3QRT2Xx6I/vzMIv6c37u/OM61ROc0I0EHE4au9
         fjOE24rexWqui8BW0eLR0DV073KZVkRUnNqYqiZh7RlQ+HOQUraz8u2hHJ5WwhmcvELf
         7MQCUG2w4tyPMXdxgAOcwRr67btGU+8BdaboV9bzwehfxGKXugVz2HAUXAHLwkY9uNUI
         XOSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW0RZMEfGStmWdO9owBISQLGoPo1PKerKpIEGQTdI84S2MJ3+ogWPs/4L9zKMwa3DEogBi8XI/iJfsMhtT+k/Ysw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDbfL4OLpzp7RpW5Cgi4Ple/jC3hsQ78P8rCvuj9kTzaxWE7Mi
	0mxYT0+DYmd68fdJ2OGwyAlTUoF8PqGg6pGLVJMlrxaTztnUd7jj18VFXhpdnenXpB3uOOiTuDJ
	IAZVx+vY=
X-Gm-Gg: AfdE7cnBQMEA00cFhq1Ycy77LGkR/uZ8FxmdTzDLlC0iz7UCHEQF3s6bgsj/r4Tmslr
	htOcrergFoqP89qr5IQByiPWEKCH4UAcof8dK5L2hJE3ta3BSXzJOjVyGHq7rEi2nJxfNFKW036
	WYno+37gzOO4YgOV3Y4WKvSNUv/Ym1oBUamFV8NJWzwLmhLg2mUK8R2nlNAFar8bGqCEUlWWWpO
	r8D5sZRpgZhBB7MYjcQJ6YEUTywqXxmxSLSyeOENqrfXeW9PW9jXvDZynaHan86N9O+UYNp8qw3
	TNajiqxsfPR3a5qoFmvNGWdrKC7oc5xqh6J+SLxxhm2OHuS3YvKaN0Nq+ZbDVVOGo1tklPrYUSw
	dfnei9bDe2bQ92r30RXKcpgTAc/WfBxhyXcmLRb0h17CPNZvglskLv1z0n8xES/9B/aZ5DHYfe4
	6IL5w2BGUhIy8VHLVqZ/ZZYAk6aziIsfcE08NVV3GHNeSmFURPA1N7vLqdx8Qvi8UjiDrDqBGpH
	mpxMQ==
X-Received: by 2002:adf:e19b:0:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47f6232c4e3mr11593908f8f.28.1784475825531;
        Sun, 19 Jul 2026 08:43:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee0086sm23683830f8f.30.2026.07.19.08.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:43:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:43:43 +0200
Message-Id: <DK2NVW4AQ1Y0.11XEAI0D0E6ZZ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: patch CVE-2026-50219
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <hsimeliere.opensource@witekio.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <tgaige.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260605083239.1892200-1-tgaige.opensource@witekio.com>
 <DJJ4C13UUF69.11ICUQHKB6WN3@smile.fr>
In-Reply-To: <DJJ4C13UUF69.11ICUQHKB6WN3@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241294

On Fri Jun 26, 2026 at 6:23 PM CEST, Yoann Congal wrote:
> On Fri Jun 5, 2026 at 10:32 AM CEST, Theo Gaige via lists.openembedded.or=
g wrote:
>> From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
>>
>> Backport patches from [1]
>>
>> [1] https://github.com/libexpat/libexpat/pull/1246
>
> This patch is enormous for a CVE fix! It deserves more justification
> than this. For example, you could detail what patch is preparation, what
> patch is the proper fix...

Hello,

Gentle ping for the above

Regards,

>> Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
>> ---
>>  .../expat/expat/CVE-2026-50219-01.patch       |  59 +++++++
>>  .../expat/expat/CVE-2026-50219-02.patch       |  82 ++++++++++
>>  .../expat/expat/CVE-2026-50219-03.patch       |  90 +++++++++++
>>  .../expat/expat/CVE-2026-50219-04.patch       |  32 ++++
>>  .../expat/expat/CVE-2026-50219-05.patch       |  46 ++++++
>>  .../expat/expat/CVE-2026-50219-06.patch       | 152 ++++++++++++++++++
>>  .../expat/expat/CVE-2026-50219-07.patch       |  30 ++++
>>  .../expat/expat/CVE-2026-50219-08.patch       |  42 +++++
>>  .../expat/expat/CVE-2026-50219-09.patch       |  42 +++++
>>  .../expat/expat/CVE-2026-50219-10.patch       |  33 ++++
>>  .../expat/expat/CVE-2026-50219-11.patch       |  30 ++++
>>  .../expat/expat/CVE-2026-50219-12.patch       |  40 +++++
>>  .../expat/expat/CVE-2026-50219-13.patch       |  47 ++++++
>>  .../expat/expat/CVE-2026-50219-14.patch       |  72 +++++++++
>>  .../expat/expat/CVE-2026-50219-15.patch       |  80 +++++++++
>>  .../expat/expat/CVE-2026-50219-16.patch       |  44 +++++
>>  .../expat/expat/CVE-2026-50219-17.patch       |  62 +++++++
>>  .../expat/expat/CVE-2026-50219-18.patch       |  30 ++++
>>  .../expat/expat/CVE-2026-50219-19.patch       |  85 ++++++++++
>>  .../expat/expat/CVE-2026-50219-20.patch       |  60 +++++++
>>  .../expat/expat/CVE-2026-50219-21.patch       |  44 +++++
>>  .../expat/expat/CVE-2026-50219-22.patch       |  46 ++++++
>>  .../expat/expat/CVE-2026-50219-23.patch       |  34 ++++
>>  .../expat/expat/CVE-2026-50219-24.patch       |  31 ++++
>>  .../expat/expat/CVE-2026-50219-25.patch       |  33 ++++
>>  .../expat/expat/CVE-2026-50219-26.patch       |  31 ++++
>>  .../expat/expat/CVE-2026-50219-27.patch       |  29 ++++
>>  .../expat/expat/CVE-2026-50219-28.patch       |  29 ++++
>>  .../expat/expat/CVE-2026-50219-29.patch       |  29 ++++
>>  .../expat/expat/CVE-2026-50219-30.patch       |  29 ++++
>>  .../expat/expat/CVE-2026-50219-31.patch       |  29 ++++
>>  .../expat/expat/CVE-2026-50219-32.patch       |  97 +++++++++++
>>  .../expat/expat/CVE-2026-50219-33.patch       |  39 +++++
>>  .../expat/expat/CVE-2026-50219-34.patch       |  39 +++++
>>  meta/recipes-core/expat/expat_2.6.4.bb        |  34 ++++
>>  35 files changed, 1731 insertions(+)
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-33.patc=
h
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-34.patc=
h

--=20
Yoann Congal
Smile ECS


