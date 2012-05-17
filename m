Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUvXY-0004Nd-KG
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:54:28 +0200
Received: by wibhm14 with SMTP id hm14so1363803wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rJah58fxQDjgnX9Hxqwr4erYrcE2yLfCkzUVjeSt5OU=;
	b=TNguxT2BxX7Ckq/EP79PWflZ/WZKxxw9plEmHCM5qBsGo/ZrW5BrYK4vTHE9GZLK3c
	F7JGB95c2FEOSGb5ZYHve/qF9kg7fOOyjLY27tjjMaLkS17ZYv/Yq+fKlvBfYnGahzcc
	lgwwvlvItIGkRjUzGCyJjJH6oOv6JzxX4gk+Gd+ZZi2VAl2eqhqrSINmsMloGNUFOGKv
	DwM4qfELj7tfmcoj+l1jK76tNeZ1WE8YtyubdOV16IGMsremsxC2isflvHTbQx8qDnAe
	VNK2WfrD4RHBwF4Zl40cdKLuSmNaaIqsg6w5bggJ3gOnvJdxtIQuejKeJKm7q/dn3UXC
	g8bA==
Received: by 10.180.104.231 with SMTP id gh7mr15563594wib.10.1337240666523;
	Thu, 17 May 2012 00:44:26 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm55282644wib.4.2012.05.17.00.44.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:44:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sq+aa+kEJ62g2CE_FQKLd-8_wVTks4CB5tQn43-4y8ZZw@mail.gmail.com>
Date: Thu, 17 May 2012 09:44:20 +0200
Message-Id: <CC134498-24AC-40B5-BDF8-1097E74A7FE9@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
	<CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
	<CAMKF1sq+aa+kEJ62g2CE_FQKLd-8_wVTks4CB5tQn43-4y8ZZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl5dGrp0JIXkVQAhLnML39K01mGEJQHPVKuahgf2zmTF5MpQ/3f4zaQerUfcra/SlZMZRBD
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 07:54:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2012, om 23:46 heeft Khem Raj het volgende geschreven:

> On Wed, May 16, 2012 at 2:42 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Ok; well said but how do you qualify it?
>>=20
>> evtest is very nice to have around when debugging stuff and suit very
>> well for a bring-up image for BSPs and like, It seems like a good
>> addition for me and that's why I have said to Daiane to send it to
>> oe-core. It is a debug and test utility and as it is generic and non
>> architecture or board dependant, oe-core seemed the right place for
>> it.
>=20
> that kind of explanations will make its case to get into OE-Core =
however I share
> Koen's sentiments too where we should try to keep OE-Core thin. So if =
we discuss
> the inclusion case thoroughly we will be able to make good decisions
> on what should
> go in into OE-Core.
> I would be interested to know what others who use this utility think

Let's make a deal: new recipes will only be accepted into oe-core after =
sato has been removed from the oe-core layer.=


