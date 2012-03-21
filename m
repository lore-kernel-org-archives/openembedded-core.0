Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAS3r-0000iD-VI
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:23:11 +0100
Received: by wibhj13 with SMTP id hj13so1767185wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=lWzVwYtfkR7p0V5BOuFLewI+jFKS35vQjotonfPiYYQ=;
	b=DjJ1ivUJudJTcdMzdvOY66PWl5fXJHgCPGLgRE0KRLuoIstuOv+X4GlDmkCv3Vs9U+
	3AsgK+rkKAN9gYszjfxsSznM8zus+43Fy8AD5Rx5MAZQxtIjmHBpitfhHLkH7PNQMOaw
	W/zvPvoNj95bK+0pSFwslcPwpjuTdfsCefsvd45sbX9tHKwCckL8evPALLMHImRiBzql
	ICIFEPIB4PFKpssKIiaMROSAAIOSurAtYklg4urpCMkBlRDfLAA4GpniMmOI4ylBzAmz
	rUCAb8gy5+vmBIP5EKNqaK+wP5hh7hBksKiHie/zYyJf1ABcFSSMhMUZZCv9II7tSHBj
	wZnQ==
Received: by 10.216.132.226 with SMTP id o76mr2991329wei.93.1332360857932;
	Wed, 21 Mar 2012 13:14:17 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 9sm11577515wid.2.2012.03.21.13.14.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 13:14:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F6A2F2F.2090607@linux.intel.com>
Date: Wed, 21 Mar 2012 21:14:18 +0100
Message-Id: <FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkJclTZeNJv88+6zaTZr/Pz1VzZOqvXVJ/b1OtyoswLLpnCPNMTgP2P/fRUI/IFwO071uzG
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 20:23:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:

> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>> * This move will allow the testing of meta-kde for users without =
meta-openembedded.
>>=20
> So what other layers are using giflib?
>=20
> Your suggesting that we need to have it in oe-core so people don't =
need to add the meta-openembedded layer when using meta-kde?
>=20
> I am just trying to get more data before making a decision.

Let's put everything in oe-core!=


