Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C444CC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 22:36:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.141.1698964592010509116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 15:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLVIIP3Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40790b0a224so11369265e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698964590; x=1699569390; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PT7DJgsSi9InYDr2fSxpuu+I6plXujYKQ6BZT2tHHnE=;
        b=iLVIIP3ZCVAIoQcN7j8zLsa4rsx/b1nuNxuNwWp9zJvHaV+yg2J85I7DyHPQKvX3PV
         ETzeupUwsKIOgeUcS81Pn6w7sCXQFf8IJUTdnW6iSDRfPsyuSAdfdumEpdIdkIWgMyOa
         RkvaXft0/rjjWuuSXycthwndnW3NZMtkJRPE/pSPUeWvWZMdKnv7yXkLzGetKBRXx4it
         ezLS+UOFt/rRp+pzNPHLx8RJRu++PtXbf/SmQ8txpPohV3+33ixdW+t6rED6So1j7Y5q
         mPGdYl5tPybmSYbN8CTmmoUcvLpqHryZa59eYLr5g2MdV6Z6WWGZjNvIX02/ypju7A1p
         iWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698964590; x=1699569390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PT7DJgsSi9InYDr2fSxpuu+I6plXujYKQ6BZT2tHHnE=;
        b=UObVDDtiw3ui67T4Gy1VzWRzmQNUOMAjXdgunikYAn6EkuKGH5olLKmczxT61RkpZI
         623zZDqKfqSdz8PzCFXjwhpIBwqye2IpIdozbIlmc2UqgH2UEFdeDBzKEuD1emfEqY9Q
         ftAIOSCJrgX99jmim0IaJyjz0mXrMW8UNM9Vi0kf8+2m8ZJydhvCSzoWgyupyGiNHeZm
         s2kq0bqurOjd1KOiLeKLNU6U/L6YE1yAlDz3tfeakNAOlRILNdbap26ZSuy7yJKDzm/d
         KKIFST+Q/zz6Je+HcvBbd8yCBphQF/jaYSoQqOthWwrrmrQbruZh+OgDfkJSzLKGVurp
         b/VQ==
X-Gm-Message-State: AOJu0YwXQnQG4LLderSIjvWR2gr+cncs1m+7TJcnd4J/WuNWpWIyvABE
	4Xca+23xc7XT3yihwMyJagGpbA9ZqZ3ecA==
X-Google-Smtp-Source: AGHT+IG0D2NP5eysStwKxBgA89rIiULduPb0yNfAbSgTyEDG04dyc6x4ws9Z5Wqa485T9th1rifGUg==
X-Received: by 2002:aa7:c2cb:0:b0:53d:fe98:fd48 with SMTP id m11-20020aa7c2cb000000b0053dfe98fd48mr15836104edp.3.1698964570115;
        Thu, 02 Nov 2023 15:36:10 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id s3-20020a50d483000000b00537963f692esm249407edi.0.2023.11.02.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 15:36:09 -0700 (PDT)
Message-ID: <eb0b766c1d36ddd2509c4ef3528d1948f4013fe9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 8/8] docs: cover devtool ide
From: adrian.freihofer@gmail.com
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 02 Nov 2023 23:36:09 +0100
In-Reply-To: <17f16ad5-286c-4f10-905d-af30ff1d3a7e@theobroma-systems.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-9-adrian.freihofer@siemens.com>
	 <17f16ad5-286c-4f10-905d-af30ff1d3a7e@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 22:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190103

Hi Michael, hi Quentin

Sent a new version to the docs mailing list:
https://lists.yoctoproject.org/g/docs/message/4578

I hope this will address all your findings and I also hope that the v8
of the devtool ide will be accepted soon.

Adrian

