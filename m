Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A06F7CA55
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:50:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so10251624wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PCfqFT0aHQW+Ib/qiY4mo4ZOEtFXNY+1I2zaEmgTM3Y=;
	b=JESvl+lKbxMYcRnPcGtkY2jcgmN1XloBnJ22THKmdtqW5uwQDXfYZLOzveAV1vl//c
	4ox+yhC29i1OsQvyowwLRr3H2jH/W/NwD5ZGxkykh8gT6MYBA/8ook9OJy7tNriO3GeM
	xbmzGzrmAnsFiwu27Cx3BGB/Xl7ATxGx7i7V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PCfqFT0aHQW+Ib/qiY4mo4ZOEtFXNY+1I2zaEmgTM3Y=;
	b=bkq1+Yb0v7QK1/MMebPanRfkYERVEEgEEU2x3VRyff9YoX3uO35bVV5kqqg6/QuxuA
	BK03Vobn2+AoXse4GHNk/G3mABOQgWjLbWE/989YsLoGrurwdyXGOl8cpQOc0w1PCzS+
	shXQBS5LYqYrXVA70TFmirg/tS6nhDE0Aoa6T9bSUeQzzKF0FXp/i1eXkw8G6RNMTnZm
	v3+VCu9W4Lu8VObc8T+eiYRZwReI67NoCCwsmFQVyZEChbwGEee0JVGyy8+FJ/MZyJoM
	TIIBId7j6sNEjx1ukIwbTP8mmz6m54KMv3jeb+oifGAiGqS6eScPVS5x17n5B9G2n7B0
	+CvA==
X-Gm-Message-State: AHQUAuZlfYuVFYzyAfT6IwQpccj2PVDb+IaAON4Br1t32cAYiEiaT9lk
	SXD4vh88Pn2EIJzOdFIouq3Xrg==
X-Google-Smtp-Source: AHgI3Ia6FdDA65hET5+P6CFabEn86dvvMZY4ZS7oDocW72cqCn5SDi3lHgv/4erxvIRIUst/FN/sqQ==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr12371988wrs.209.1551106215901; 
	Mon, 25 Feb 2019 06:50:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t3sm10126825wmc.20.2019.02.25.06.50.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 25 Feb 2019 06:50:14 -0800 (PST)
Message-ID: <2fc2b224301582b31e6494a4b2d3df7e4f83d585.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel =?ISO-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Date: Mon, 25 Feb 2019 14:50:13 +0000
In-Reply-To: <CAEUSe7_En46Ji=GjU3EmRBvocfiZz5YQO9XcOeK9+9Hf+9SCug@mail.gmail.com>
References: <20190221182103.13174-1-daniel.diaz@linaro.org>
	<57b7d2afe13b3038edf9c34f9106f7ea7fcf88f2.camel@linuxfoundation.org>
	<CAEUSe7_En46Ji=GjU3EmRBvocfiZz5YQO9XcOeK9+9Hf+9SCug@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Bump to 20190115
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2019 14:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-02-25 at 08:00 -0600, Daniel Díaz wrote:
> Hello!
> On Sat, 23 Feb 2019 at 10:07, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I think there was already a previous version of this upgrade which
> > also
> > didn't work:
> > 
> > http://errors.yoctoproject.org/Errors/Latest/?filter=480efd388db578106a8a2129c0382b7e56a1ee36&type=commit&limit=150
> > From the -Wformat-security -Werror=format-security security flags.
> 
> I thought the problems were with MUSL and Glibc 2.29 (for which I
> built). Let me look at these problems, then.

Yes, thanks for looking at those.

For now I tweaked the recipe to disable the string security flags for
ltp as I wanted to get the upgrade in. As soon as we get a patchset
which builds, we can remove that workaround. I'm hoping we can get
something upstream for this too...

Cheers,

Richard


