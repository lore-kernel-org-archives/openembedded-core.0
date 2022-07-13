Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE74CC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:56:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.2548.1657745768578501006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VhVdUE7a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id l68so7218566wml.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=VYW/F1dxmyJSmC6HfhPrLL24o+pkSby4YBK8dywHLs8=;
        b=VhVdUE7aa5usxbtEyp50id/4dCEv5jqWBEapjBnv31iwjbkqTw8XuO+tTdFusDW8j3
         42k66WHGpxNDAZ+hNrOU97q2/Jz43OA5vT+oSlutunq8CJqpa+QiQl7arQzSp1QUSL3v
         UbfSV2kHAWy5+lpCjQdEcvIuGGNqne9Dtf9+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=VYW/F1dxmyJSmC6HfhPrLL24o+pkSby4YBK8dywHLs8=;
        b=3LCExxz8rEue5Rg6nAxQnXK0VRtSg9SjjVtZZgvfAflff+YZGo4aI9/EJnjTmI+/ku
         3EzrxMypVre6sx7RZkUlGGDVhWsT0Sh5QJkW1Vb5Fx3qKOoP/R1QJPuyEBnEZ83L4H8i
         DbWvIv3gu5+vBZWbfbCDcweu5tjJ7uPT5v0vLDivutQtXXbeOBkFj6DYfR+gIyqfdR6W
         4thDeGkYJjbzHl/faMCod31S3pjzGAS3DQQmfAnVbONxU4zNzzCjCX47pi5erHbEVVtR
         vVGnNRf9lO/IWmE/D55oxDZOt8ZPaftfskehKEm4mblorEN1yLHtrW5eksK8L6MFcsG3
         HH+A==
X-Gm-Message-State: AJIora/SFc0A1AzR8eJJw8AqskU0weYgtfQmFM18kkwYGVHP2R9xVb64
	y1lv3RYTaKPZiT8Pb1owkjKK4w==
X-Google-Smtp-Source: 
 AGRyM1sC7VjAmh5vw93b95cENXJCBmzUv08OzYCP4nxtQngj76I4kcjFF56G5x3BTR2g3QrxCsDK/g==
X-Received: by 2002:a05:600c:4e92:b0:3a0:4f34:8fd6 with SMTP id
 f18-20020a05600c4e9200b003a04f348fd6mr11326679wmq.63.1657745766884;
        Wed, 13 Jul 2022 13:56:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 14-20020a05600c020e00b003a2ead2c884sm3027775wmi.13.2022.07.13.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:56:05 -0700 (PDT)
Message-ID: 
 <8b71c3fc9e6706e0066ba891b6586e29587a5d01.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2022 21:55:59 +0100
In-Reply-To: 
 <CAMw=ZnS0_cfc9Pwm4utpM=10c2X_uChyTpHw1A-C3zb2F_xdOQ@mail.gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <20220713154139.101744-1-luca.boccassi@gmail.com>
	 <20220713154139.101744-2-luca.boccassi@gmail.com>
	 <fb71b30dec53dc6d2a84416ceeb4056455c1f110.camel@linuxfoundation.org>
	 <CAMw=ZnS0_cfc9Pwm4utpM=10c2X_uChyTpHw1A-C3zb2F_xdOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 20:56:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167989

There was one issue so far:

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/4303/ste=
ps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/882/step=
s/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/882

and probably more of that one occurring, the build is still in
progress.

The build does have other patches under test in it and those also have
issues but I'm pretty sure the ones above are usrmerge related.

Cheers,

Richard

