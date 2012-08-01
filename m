Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwbQy-0004ZY-1r
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 18:06:04 +0200
Received: by eekb57 with SMTP id b57so1644540eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aY1vRr0GwnAqmHxVSYZBFOSmO9NP98Es/rpPQuMTZLg=;
	b=i8tWSt5xPEEYBznPtV/ryF13TfFdk+mgmIJBdXRtjfpXbm2Y07ZfYWs5/N4NsbV8b6
	SYiqdD6HeE7iDKYjlkKUpRAPPI092S35ln3/e69EgHi32+ERpyo+oen9Purrvm9EE7vf
	M/p8u98XHrt0KwIllLSBz0SPPzLYJ8gcEaaNBWCUY/gj8jsxONLV/wWIVMZdhi6VEZcZ
	Rd+n7AaqXeu7IdvZZszJwXrN/lCW2p/i89RCRnwfhKdk9Hu84RQlq7IWZkTEPnzgfpAQ
	MTA6BhOx/DWqYtHfZzK2PT/WHWRTBsfmP8DQGXvtSqHi3CObfRuqLTUjyHqkqHdi7Z/p
	0IKA==
Received: by 10.14.218.134 with SMTP id k6mr9545952eep.14.1343836465691;
	Wed, 01 Aug 2012 08:54:25 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t6sm9939363eeo.17.2012.08.01.08.54.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:54:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZORyxNKPidzwAWaD0-2Y9ffX75gc3aH6zGKPxyz_rqzg@mail.gmail.com>
Date: Wed, 1 Aug 2012 17:54:48 +0200
Message-Id: <B982943D-DE7E-4C46-B2AE-564BDDDF68AA@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAGrt=7hVBjV+3de21AEHnC9ZuTBhAO6sdnt8krt=4kMxFuvFFA@mail.gmail.com>
	<88550BB7-DF17-4971-B7F3-EEA06C0C7A42@dominion.thruhere.net>
	<CAJTo0LZORyxNKPidzwAWaD0-2Y9ffX75gc3aH6zGKPxyz_rqzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkWdK3gqpK54O4gKgFitCdTAbGgZjiKYd9E7XD3hJWgWFxNJqqsQswc2fXYQTv2KyRhzjn8
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 16:06:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 aug. 2012, om 16:57 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 1 August 2012 15:54, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Apart from the fact that both aren't machine specific. Making them =
machine specific would be a regression.
>=20
> Theoretically, yes.  Practically, only one of the libegl.so (libgl,
> etc etc) actually works on a particular machine.

Yes, but a libegl.so works on a range of machines, not a single one.=20=


