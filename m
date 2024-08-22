Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F451C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 10:05:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9961.1724321093802738199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 03:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NHBZyfym;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371c5187198so305863f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724321092; x=1724925892; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbAFA/lBxtHYYwd2BUr9J3jdsdEGTXjN8Z2qY19HEJU=;
        b=NHBZyfymbnOb0KgPz3OguNddiljh149kmMxlZgko7kZVDQz37xYm1E3T10uQdYS7d2
         KqqZ7a/9CJLgp3Jm7dtNNSS6D7keyO/RptY9HmUNngVik9EE9E+m/21NCgwvWDih/wEF
         Aa26RXwIEdwx05JDtoh7x5q37q7yRfU4PlNCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724321092; x=1724925892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EbAFA/lBxtHYYwd2BUr9J3jdsdEGTXjN8Z2qY19HEJU=;
        b=Z7w0nyo+AsrNcK28wiPRC7HZFT+0w+vInCL0Cgz4E0Auw4syLnsLu+EkVyiZWRsycx
         trbspDBSBkkIp/HhXc/dsldcMVrCrCDjfbk1FF8UwYaAAIOTLtjWTYhvOTcd+8Wp8hja
         q49TtmNrqtUorY6ZoRTCYqlgseYniO5F0b8d3qZuN86bUUkVoSkqiPVnxsBJ51Qh5ao1
         jxJCnh5i1hrKQ3BQBcPY7YTU7xBib9LY/Css0TzVCbn9EDd0ykJDkFmGTmrxty4lgU9K
         nUM+a7P40sEquW1mW2LXJl1mHUKNFS1SF8T9qvhd7AgLENTOD+ELxD9ALuzDT4hmW0IL
         bQcg==
X-Forwarded-Encrypted: i=1; AJvYcCVrFskiF6tR0PNe7su9P30S4Zqy1ql6YK0Ng/65y1/QmViBMDkdaYgS1ByY5mtahyX/lZ++yGH+HUP6yY40909Qdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YweSFIGqYleyi3Iux1vHHyl+jxmeWUrqXn4w7RJG6U0qMZU3b5E
	JXHRxykC6MnuRGeTLI1o4ugUf20ocwBvV8iIs6gnpC+ZwrMEaVwcHU3vro4xQAk=
X-Google-Smtp-Source: AGHT+IEGE05gvtdyUtB8Btx9iKl/llKhp7OtWV60PELFO/xM1llhVmYti9QWZ4zdOnWbGRFEA+73JQ==
X-Received: by 2002:a05:6000:b09:b0:371:937a:326c with SMTP id ffacd0b85a97d-372fd73184amr2689627f8f.57.1724321091845;
        Thu, 22 Aug 2024 03:04:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a? ([2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51860e8sm18596025e9.48.2024.08.22.03.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 03:04:51 -0700 (PDT)
Message-ID: <868116d27c0df4b2fde4895639d1b684dbdb7b03.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] piglit: upgrade 22eaf6a91c -> c11c9374c1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2024 11:04:50 +0100
In-Reply-To: <3e53c001-7c60-427d-be5a-ae01bdc4a7ba@baylibre.com>
References: <17EDD5FCB55B6698.29323@lists.openembedded.org>
	 <3e53c001-7c60-427d-be5a-ae01bdc4a7ba@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 10:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203648

On Wed, 2024-08-21 at 15:46 -0400, Trevor Gamblin via
lists.openembedded.org wrote:
>=20
> On 2024-08-21 3:45 p.m., Trevor Gamblin via lists.openembedded.org
> wrote:
> > Commit 766669895d fixes builds with numpy 2.x.
> >=20
> > Patch '0001-utils-Include-libgen.h-on-musl-linux-systems.patch'
> > dropped
> > because it is now upstream in commit 9c941dfc36.
> >=20
> > Add wayland and wayland-protocols to DEPENDS to avoid errors during
> > build.
> >=20
> > Adjust the x11 PACKAGECONFIG flags so that piglit builds without
> > x11
> > available.
>=20
> FYI, I've tried the reproducible tests on piglit with and without=20
> TCLIBC=3Dmusl, and also with and without the numpy 2.0.1 upgrade, and I
> can't reproduce them. Hopefully this works on the AB now.

Unfortunately it didn't :(.

reproducible:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5220
world docs build:
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6306
world build:
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6306
musl:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9404/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9416/step=
s/11/logs/stdio
no-x11:
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9390/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9390/step=
s/15/logs/stdio

It is hard to see which are warnings and which are errors in the logs.
I did wonder if the issue was python version specific. Are there any
related commits upstream looking to fix anything like this?

Cheers,

Richard






