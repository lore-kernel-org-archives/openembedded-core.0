Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sz3Fp-0003Z9-J9
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 12:12:41 +0200
Received: by eekb57 with SMTP id b57so128295eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 03:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GUicUnBIoPElLU0ZpweDPEMX12MDLZfNOk+EsdBJv98=;
	b=KIP4MSfHk+Abi30vEBVp69cQRYBPLpMlsz06+ogmHV9hOYEiR5q29Wh2tfL7tKx+zs
	F/zyVo1MyAq9dZj51rF2sTjoXIh7JqrMfByOjAFYVuWM9yE+E4OLnP5rYTKn/LKVVsET
	+cVs35FiThTcye2LET68txq5zHZqVROHc9Nd6Yzec6pRwzDTUew0V7EcbqRWnOo59cSC
	2JQpDIccSP5r1R//+9IXa+oOulLxPd+f9zNKYPpdqVLvIsnVVJAG+1gcwM4hlIULHhzc
	yYy45zhmKt/h7K4j6hb9kQJpc+BWZuG3UNKmmObFcMbRG/GP7W2SJulvjOk3zwz8X+ID
	iTJw==
Received: by 10.14.203.69 with SMTP id e45mr11782113eeo.23.1344420054678;
	Wed, 08 Aug 2012 03:00:54 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c1d2:be79:5506:395e?
	([2001:610:612:0:c1d2:be79:5506:395e])
	by mx.google.com with ESMTPS id e7sm27127304eep.2.2012.08.08.03.00.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 03:00:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
Date: Wed, 8 Aug 2012 12:01:15 +0200
Message-Id: <5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmQdzM5/bxwVaPOIu522qk5OMQHVK2hiZgb4EJ8VS2oJoTKAweSPWoz+UQumoOxh1rEE5b+
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 10:12:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi,
>=20
> As everyone who's used it can attest, Web (the optional browser in
> Sato) is pretty rough.  Part of my plans about replacing Sato with a
> leaner environment involves replacing it with Midori, and if there
> isn't any disagreements I'll work on a submission to merge Midori into
> Sato now for everyone who expects the Sato web browser to be useful.
>=20
> This will involve pulling a few projects from meta-oe to oe-core:
> ca-certificates, python-docutils and vala specifically (although its
> possible that we can drop the vala dependency).

Adding more stuff to oe-core is a bad idea. You should take this =
opportunity to split all the sato stuff into its own layer.=


