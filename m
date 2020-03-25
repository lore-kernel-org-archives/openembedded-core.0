Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.8319.1585131053370422020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 03:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1dhlH/e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id t7so2115537wrw.12
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KMxRKe6Ks0S7I6yCzsq7ft9y89q0i1w319wmVReKcdE=;
        b=c1dhlH/eDYcLXjv0HocEK+EUCMMH2q9s9xK2oHvQea1M5k/E5hw7l1PQth9vYdyKeg
         uYBumNsniHpuZICnm1TExnBj0ny/smfRSKUXibefMEHQOV1iFk5ZkYFh1RvD+Px7+aRH
         rbFHiW7QmXDik2PHee7mvvg3n1jU434IR6+hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KMxRKe6Ks0S7I6yCzsq7ft9y89q0i1w319wmVReKcdE=;
        b=IFLi3Dww2ChFWfOOt5cvpeJxuS038kaRv/Y91mTVakNB4XBhhv4bTDo4wmOKTuXe3q
         hT4MOs1BE9Y1ePrKdkGbJgUJ4EH9QkKiOuh5LQsixFByjoTjVFMXUo5QIYMlIN/FH8jR
         NwFMQDowiL78qPcJv1OfkuPB3ZROQJ/izViQFBnfMLbTNC82KtPi7ozlU1MIVKkxdDkB
         c4iSMv2c6nRUjEXYZDxDHjyktVAskJpvd9OfJJ5nfjRWdsDoAw2NhVEUKyKbAyOh89Ut
         yOwZZCguKu2f3z8tkX1Wlu0ItQSDPInhGICuvUZ7aIEpSjWU4t3cjjkfD2RR7UV4wxHY
         Ciig==
X-Gm-Message-State: ANhLgQ3xDOYxqaFsrcAIbnLzDpwLP8vkGh0AyBr7vf8prkm4ReiDp8fH
	aAbwe+Mpt4X+EZCQJ4yYLZc5Eg==
X-Google-Smtp-Source: ADFU+vu6/k2t3dDkK/osJJmNSYEpwRlkF222vRPcNQHwbEnvUMnQEcYY+svYN7uYndqmWw42UVZkFw==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr2477233wrq.119.1585131051855;
        Wed, 25 Mar 2020 03:10:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v11sm14440118wrm.43.2020.03.25.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 03:10:50 -0700 (PDT)
Message-ID: <1d61fcc9546dee46769d7c15ddc75f86a596a5f0.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, Antoine Manache
 <a.manache@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2020 10:10:49 +0000
In-Reply-To: <VE1PR04MB662103E59BAAF095702FC0DEE2CE0@VE1PR04MB6621.eurprd04.prod.outlook.com>
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
	 <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
	 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
	 <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
	 <CAMu9SpKSFfexqz2sqsr6ZyPtdeSCu1XfLYSSznX1FtpG5=TK7g@mail.gmail.com>
	 <1745659de941c18de2c96c16b3f8c3fc5b457c7d.camel@linuxfoundation.org>
	 <VE1PR04MB662103E59BAAF095702FC0DEE2CE0@VE1PR04MB6621.eurprd04.prod.outlook.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-25 at 01:33 +0000, Tom Hochstein wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Tuesday, March 24, 2020 5:58 PM
> > To: Antoine Manache <a.manache@gmail.com>; Tom Hochstein <
> > tom.hochstein@nxp.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing
> > from SDK toolchain
> > 
> > I've therefore taken Tom's version with some tweaks to the commit
> > message.
> 
> Thanks. Can we get this on zeus? Do I need to cherry-pick and submit
> the patch?

Yes, please post it and then the stable maintainers can review it.

Cheers,

Richard

