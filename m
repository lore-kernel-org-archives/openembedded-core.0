Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.22950.1592240194905288134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LiSOPfm5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id y17so17837979wrn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=46t7m3+VMD4zKBdsNyyGB2iPBbo58G9qyMI3r7p8UQo=;
        b=LiSOPfm5E3Mnlctpkw2DhJa8fdwuSxQUaWaf7utF6QUrxyLH9osRWsreLuacDU86ak
         C1t789CmxFxOKPuBaz+JGdXwSLRZUHtPaOjeaoWhuGO8nbSm6BYT1ziFZnNWzSSjoQfB
         jlo3TIuh6NxAuN8iWG9wNZeX/aRN2EEWbYm0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=46t7m3+VMD4zKBdsNyyGB2iPBbo58G9qyMI3r7p8UQo=;
        b=hjByM5eBqgRhjtBvyi/v3DDrFRB266HO9cT63p3+PSeMfQONEzTweusnJW5ZXgmCam
         C7Dua1PatYaj3t/0i/8XIqqCbfBc626rHW5q4cnsuJAj8a8d8F0W5zunGp63tB/jqEUH
         /NK+h99CmoSr64PQULV9BQWQic1UXwIaqcOUke/0j058/Ly6Na2yLiXiiZf2rOMbAfkx
         ULAErE93cdrtaFy1uTUDjYqt86ctxzrmAItuaXKeTa2P5qgbdvJtxRmoF2qmDG+7h/F4
         aujHTci2Hw8OQ3eWArU4RQJasWyB6XoROmAYJErzgQitVZVKwo1ydQA6+h76Y2URHZkX
         iLfg==
X-Gm-Message-State: AOAM531rtouauqMul6rydHII86lmgmJHsaJfjPf6vBGkg3PhuND6bgzi
	XqM70GCKZQHZl+yMekgms6SNEw==
X-Google-Smtp-Source: ABdhPJxmMZq1zbhPtyp2g/qU+UD/AwUiwPHlKXEhNMZmReyLYEtQuI1Js8S2tLI65V3zggnxXG82pg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr31903333wrt.29.1592240193445;
        Mon, 15 Jun 2020 09:56:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g25sm198203wmh.18.2020.06.15.09.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:56:32 -0700 (PDT)
Message-ID: <80ddd1d5eece62f64b743fb25db62ef3501a9e5e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2020 17:56:31 +0100
In-Reply-To: <CANNYZj9Q_cWv4L1ssOFLVDm1TdY20ZSu2B2V0zjLpYnAAJTeVA@mail.gmail.com>
References: 
	<AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
	 <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
	 <1618C532747F3046.29686@lists.openembedded.org>
	 <CANNYZj9Q_cWv4L1ssOFLVDm1TdY20ZSu2B2V0zjLpYnAAJTeVA@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-15 at 18:54 +0200, Alexander Kanavin wrote:
> Come to think of it, maybe it's okay in this situation to actually
> remove OEHasPackage - the test will simply always run, and will still
> fail if the package is absent, but the failure would be less specific
> than a missing package.

Lighting up the autobuilder with failures will just mean people no
longer know which failures matter, so no, this isn't an option.

Cheers,

Richard

