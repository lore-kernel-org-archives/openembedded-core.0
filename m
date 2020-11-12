Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web08.3607.1605185784307743263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 04:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QYe/VRkk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id d142so5170230wmd.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 04:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KMNsai7kR9GbdkA8q50tz7d8G6KBLWh8Ow5ST+43i8U=;
        b=QYe/VRkkJqnfAA9QM23yuoJ0IoQ4nEVvmsIoBs0rI1lar3NsskHUa2P5gCYUfsLVg4
         pzz31W2bGQPkqEleyitpEKc3oeSuMhiQVkO+s3sqlzoJKdlvfyZAuAbPqVUAOtUPEeu3
         W6Uf2C7pUDCmi2qB0URn4Frapq4QaVpSfnlrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KMNsai7kR9GbdkA8q50tz7d8G6KBLWh8Ow5ST+43i8U=;
        b=AQ7NDIalTLQKX8n8a1kS8Ke1ZqdvuR7KPeBULPllDPR5eWitHWVCUPLRXXQHHWpaE/
         aO6aOjWyunTp5AsBp9So8naQT1LuuDe2b0k7uSbJAk3yi58KlNFGis8bnbvuVlRF/ODM
         L4O+qv1OPodDPiVprsVRCyTqX0gt9KMuhHvAQgQu2rNBxH1ACd+goZw3PQO3Mj9Av1a+
         JlEvgPpxIBdWSFTfwdHUZgcGMowPjUPA9SSDRMSA7c8yxjNeYaSmq0FJbOTNdW3zReAs
         pp0nOoe2PICSxeW9lcRGIJdoHDUJphAWS019xTK4Ku3dvVZh5Q7z1vbTy784n/4Kk9z4
         LjHg==
X-Gm-Message-State: AOAM533rNt9IA5pJS4a91Ge8RhCVZJQhtZvGQkwKJyNScNjeDZtxfdjD
	HG2Ub8WQ5vnwBVhz9hmd9+Q4sA==
X-Google-Smtp-Source: ABdhPJyyXdlNNDJTzRBNDnNbEyOipds+9Hguu/fd5pby9O46afP6Iu1QgCW04++PjAlWrgiPvBT1LQ==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr9287220wmc.36.1605185782708;
        Thu, 12 Nov 2020 04:56:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:48cb:75e4:3f48:ba3e])
        by smtp.gmail.com with ESMTPSA id v16sm6672913wml.33.2020.11.12.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 04:56:21 -0800 (PST)
Message-ID: <dc807a64da8af13163c15acaf346d5f1298fc3fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: selinux hook handling to enumerate nexthop
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Purushottam choudhary <purushottam.choudhary@kpit.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	 <Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>
Date: Thu, 12 Nov 2020 12:56:18 +0000
In-Reply-To: <PNZPR01MB4224736DEB01CC746747D6D390E70@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
References: 
	<1604486040-26986-1-git-send-email-purushottam.choudhary@kpit.com>
	 <PNZPR01MB4224736DEB01CC746747D6D390E70@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-12 at 09:33 +0000, Purushottam choudhary wrote:
> Hi Openembedded/Khem,
> 
> Is there any update on this patch?
> 
> Could you please let me know?

Its merged in master?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ec37a2be661bbaa494455a5417db148495920039

Cheers,

Richard

