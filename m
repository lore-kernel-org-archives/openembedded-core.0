Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S6FwK-0007JA-5O
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 07:38:04 +0100
Received: by wibhj13 with SMTP id hj13so1160530wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 22:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=CKuzo5qVIwr1cOikNjvh/zK98apQ+0p6iArsT31YVxo=;
	b=Z520OnRN+KlmGCDM/FnCD7PzdLyETdKOaSk9PoaPQnEPratFPSmiwQgw0MLM2a3/9V
	IpUDX8H4KFhIMhqKTkxNr+jkMKQNDCZxD5pmvfz7t7cAkIGe6jECFSY+4Lt8wKfbB3xz
	rLZGh2kRqbOsZUlfvqaXay3q5LL1hcSMJNY5s5lEFN2Y2XJCHR6VzTv7e+vafmZUym7n
	U+9JzWeLh+v11s9Yh+jiohqLIdIPTKQPvofHXW+y3KL9A8mcDCOYqcjyQCMRnd8d/du0
	VzRx0mbjNFpy2zUspbJCAHaFKcS5b6std30rXQ879/r34d1R5/RQ1JEauKWlv1FBqddl
	UJhA==
Received: by 10.180.95.197 with SMTP id dm5mr10888293wib.20.1331360964014;
	Fri, 09 Mar 2012 22:29:24 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ep17sm11440163wid.2.2012.03.09.22.29.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 22:29:23 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
Date: Sat, 10 Mar 2012 07:29:20 +0100
Message-Id: <04FC93EF-7089-4EAD-8C1D-14824C8CBB02@dominion.thruhere.net>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkasty4LuJXk7LSpDXLCtHA+kGrsdMGbHIDloLo2FRxMtKIfJ+WVUfJB+TIhKMkM78FaN00
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Sat, 10 Mar 2012 06:38:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mrt. 2012, om 22:39 heeft Tom Rini het volgende geschreven:

> Hey all,
>=20
> Over in meta-ti I kicked off a discussion
> =
(https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> about if we should be using '?=3D' or '+=3D' with IMAGE_FSTYPES in the
> machine conf files.  This has been discussed a little bit before
> =
(http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=
=3D2061).
> The problem is we have the following and I believe ultimately
> conflicting use cases:
> - The machine needs to say 'I need or support the following formats'
> - The distro needs to say 'I always want format X'
> - The user needs to say 'I know best, give me only format X'
> - The user needs to say 'I know best, give me what you support + X'
>=20
> We achieve this today, but not very nicely.  For the last one you need
> to start playing order of operations games and that's just not nice.
> My suggestion is that we need to change what the machine.conf sets to
> another variable (SOMETHING_IMAGE_FSTYPES), and a default
> IMAGE_FSTYPES becomes ?=3D ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
> users can then work more easily with their use cases.  Comments?

EXTRA_IMAGE_FSTYPES!

regards,

Koen=


