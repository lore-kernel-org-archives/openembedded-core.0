Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C76C77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 09:17:18 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.12068.1683710232995390852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 02:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=awFgp8ZA;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso7828082e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683710231; x=1686302231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j02aIwDBrq/x+JwL9wvXHJt8+SSO6YWFRsoL3iav1NU=;
        b=awFgp8ZA43Bl2xEuY2vj3W5r7gdOcN66wF+S0VD+uYSzUSYjZsiBxVRf/0mkiu88PA
         BB34zQMRx7MmZnO4bhk9wNxxwmxfmVTGgXR8MP4EHEcnsJlvJAJe72PjnuZqI6hvGFNL
         TfDPgqZ68Ykl5+cWgx73vQx6Ze2i2lQCuMlMlXGwa1J7IOYGLfQll75EglOeIIhrHGnu
         Mwhx5+cms5Nb7SIJjVpbGI7BWokmoKl6YwxszeUp3fvRAVpMMAvcJJAlO1ClZhR/qRcu
         YrLuxElYnO9GqJFk97D/WE+HTJCRig/I+uti/BaFdZkSlxDrg0Czq9k13soGNIUH8yEa
         k5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683710231; x=1686302231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j02aIwDBrq/x+JwL9wvXHJt8+SSO6YWFRsoL3iav1NU=;
        b=TfndhUNquaiZ166XxNkRaxOFtYKSgFoYcI1O66RDyMqcjsc95Udl8uQ6MUY3G0XZbQ
         ybtbA+d2o2zOtqt6FTC4H4QNnhqvcMSomN74fvB/3FEOjRpsLdei6zvr7ZPSrp8xbT7Q
         DbGhrMvMTRJDMOU7/+yvmTE6Vejgz0INluF+NjzIYJ/REA0jzmkhp2nDHvUCxdxsG5v4
         +SGjhtJy6OuwnwEKzwdoL3PZZxOE3T1uBZMaG7DYTjAM05T6Jv7AwrFQI9ydvk33g5cY
         LugG3sGt+nLgrw7CJdbdDBcXur6EfQVMcXsgYqrjf/nSSmnf3gAptCwiGrJlO8QgB4B2
         Smsw==
X-Gm-Message-State: AC+VfDy315QffXWPKZBMtCGX0s9Ej3iS/k+FIMLGmySA2jgqG2hcZWkT
	yoX/RFKuy2s7xKuuI31RhiWEn3BEqvL+pChGOe4=
X-Google-Smtp-Source: ACHHUZ7/nkKIzsJfva4XPTzcENeDeF509FWjY0+D8z9JMjJbudDjRN3cTKlQ6Qjz52UVMu90ZKPF9DxEwYKT6M2ZDGE=
X-Received: by 2002:a05:6512:906:b0:4f0:6aa3:d860 with SMTP id
 e6-20020a056512090600b004f06aa3d860mr1457522lft.39.1683710230948; Wed, 10 May
 2023 02:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230509172344.1516743-1-alex@linutronix.de> <20230509172344.1516743-11-alex@linutronix.de>
 <b63586cd-f776-9e66-e617-4b1bdd62b270@gmail.com>
In-Reply-To: <b63586cd-f776-9e66-e617-4b1bdd62b270@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 May 2023 11:16:59 +0200
Message-ID: <CANNYZj8=p-ynYkWSCRMAHEB7NABGEppnWniit-37VaPyGxbn8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/27] meson: update 1.0.1 ->1.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181104

On Wed, 10 May 2023 at 02:55, Khem Raj <raj.khem@gmail.com> wrote:
> >   Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/10218]
>
> This is merged upstreamed with a slightly different fix see
> https://github.com/mesonbuild/meson/commit/24ea1d3f1968bff52ccaaf33fcdd59e810459aa9
>
> If we have this fix already in 1.1.0 which seems to be the case. then
> the full patch here can be dropped.

Thanks, I've queued a followup patch that does this. So that v2 or a
respin of the whole patchset can be avoided.

Alex

