Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DA87576F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:37:37 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so19558728wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=0T0tpsa325g3rQJEwyDZwKMq6zYy7pKCTEb/PmK3q8s=;
	b=LHH3j3Wc9zoWDemT4Lat+DKFUdv37pvlF6hA6WryMQ2qFRRRFZXzyyByxCvAcfN00o
	T5Xc3AHj9P2eEQ4fbMG0VpbtNLxAniklllenhjK/uRnDas3pEAriGUMsmlwl0Jwa5UfD
	7l/Y6wVH3cjgpDOjkmhuudxVz2l6kD+CKkNEcvuropuRbpBWRF7H2luoO4qQiVBsA3O+
	ifhuWou17jZfHyZdK37r3F8JUysaepxOoZdYWHRTreX2ElyR10KX1+mVK/O56dMQqNca
	eO2GYCZ6/Yo3OI9DLw8QqXvDk45rAtG+qja60pQfBGGo7pppqbtY5rdCUXp8G8cxIoNi
	gLIg==
X-Gm-Message-State: ALoCoQmHtLPPCcOe4KC9KAZ1GRim+EA5bA2CN2pdguy7ui9/ByqbCxVPaA4pbzJ33pRF6ZapMXrA
X-Received: by 10.180.210.234 with SMTP id mx10mr3374151wic.31.1445333857137; 
	Tue, 20 Oct 2015 02:37:37 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id r9sm2651583wjz.35.2015.10.20.02.37.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Oct 2015 02:37:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP71Wjx+xcW0qG62zxskUGY_BbWCS1Yk9OvJQx+fKooKKKyuvg@mail.gmail.com>
Date: Tue, 20 Oct 2015 11:37:35 +0200
Message-Id: <65454D5E-98C5-4BA7-828B-05BBD56FB3E5@dominion.thruhere.net>
References: <CAP71Wjx+xcW0qG62zxskUGY_BbWCS1Yk9OvJQx+fKooKKKyuvg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.3096.4)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to handle mesa customization in BSP layers
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
X-List-Received-Date: Tue, 20 Oct 2015 09:37:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 20 okt. 2015, om 11:32 heeft Nicolas Dechesne =
<nicolas.dechesne@linaro.org> het volgende geschreven:
>=20
> hi there,
>=20
> in the meta-qcom BSP layer, I need to customize mesa to enable
> Gallium/freedreno driver which is not enabled in OE-core by default. I
> have been using a bbappend , see [1] so far.
>=20
> However it was reported by Koen that his is causing issues, at least
> in Angstrom, though it's not specific to this distro.. See github
> comments on [2].
>=20
> The issue is that mesa is arch specific, not machine specific. So if
> you start mixing machines from the same arch, we are getting
> unexpected/wrong rebuilds.
>=20
> How am I supposed to handle that properly in a BSP layer? I don't
> think that enabling the freedreno driver should be a distro config, am
> i right?

I agree that making it a DISTRO thing is not the right answer, but it is =
exactly what I ended up doing: =
https://github.com/Angstrom-distribution/meta-angstrom/commit/549d58dd00cd=
0683d92b942e9574ef0d1e347e51

In this specific case I think we should enable freedreno for armv7/armv8 =
in OE-core, but the problem remains for other recipes like this.

regards,

Koen=

