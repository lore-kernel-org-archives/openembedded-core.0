Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBBBEC8730
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 14:09:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13918.1694095783452259352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 07:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gND7mV+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-307d20548adso1001787f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694095782; x=1694700582; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jLLRTpYBeBTsQ7gh3ljbVh3028b/aqAPG8pb7DPVsZk=;
        b=gND7mV+Wk3JSYVUohC7vUt9XdNEM9NeKMMnSN2xMYhCg7/yE2xXrofcco/dGxuuQF4
         Zsq0hJSJeaqmbJRlWbn2jbuL5HO0G6zZjKCjckDvjqGDNddxJqOG6OcU0pTf+TS5Ft3U
         6i4M3u5lqt6Pc56rVhDq7Hj/xF0xJjQx4avEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694095782; x=1694700582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLLRTpYBeBTsQ7gh3ljbVh3028b/aqAPG8pb7DPVsZk=;
        b=j+8S+yavHSfQxCIu5MmLAg/ZMGJJt02zIYPz8QQmnvejGWDcIeX5nrQ6Qqke4HujhZ
         BLBAY9cb2oKBbBZXQxePyWegxdSqGKN24kinoj6viqVvvIQgyqX182MKfTLRG+FUMvZu
         RwjXnM8fZYA86QCqiS3Hj3/6o+SU71WFHmv39i/34iZ81/8Cer1X0+HoFGiq1Kl6q0g/
         JFZvbEuAp9zPlvlL/b3pVdGA8+DVWg/AkYEXl31Jw3b39JiX6g1R6KG33+IAhTIByCW4
         S4P4HYph5E2ydKA0U0DI4KlHVEiXwaR5riabiuBATgouItwnkJrK1qaK8OXpa/gKnOfW
         exFA==
X-Gm-Message-State: AOJu0Yx0/yBHmCx4z5YUMQBAFpXI0lswkpd6k4P4oanaUb5mLF9ZCS1E
	jaenx5nXqrZEVV3eqcyqLm5SAi60j9O/RM7L6Fw=
X-Google-Smtp-Source: AGHT+IE3EdUzJwql4vx8j7e5NAkUJhnfbUFXY44KREXCNVWYsypcSPEws4aLVogiUDOIJOU3Sr6vkQ==
X-Received: by 2002:a5d:50c9:0:b0:31a:d450:c513 with SMTP id f9-20020a5d50c9000000b0031ad450c513mr5433889wrt.26.1694095781792;
        Thu, 07 Sep 2023 07:09:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id e4-20020adfe7c4000000b0031c6581d55esm23518020wrn.91.2023.09.07.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:09:41 -0700 (PDT)
Message-ID: <981a68a739148490c64eed116b9594a6f5994f6e.camel@linuxfoundation.org>
Subject: Re: [oe-core][master][mickledore][PATCH 1/1] vim: upgrade 9.0.1592
 -> 9.0.1664
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: archana.polampalli@windriver.com, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Date: Thu, 07 Sep 2023 15:09:40 +0100
In-Reply-To: <MW4PR11MB58227E52A9722B86C4CDB6D484EEA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <177C6ACE09C6DF4F.3047@lists.openembedded.org>
	 <MW4PR11MB58227E52A9722B86C4CDB6D484EEA@MW4PR11MB5822.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 14:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187385

On Thu, 2023-09-07 at 09:23 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
>=20
> Reminder,
>=20

FWIW the reason this patch was delayed is that doesn't apply properly
with fuzz warnings on master. I've forced it to apply in this case.

Cheers,

Richard

