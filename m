Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6lel-0002Dz-ST
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:02:19 +0200
Received: by wgbdr1 with SMTP id dr1so556134wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nuD6Kl3JeJxhTtkcT1BoDDmeBYifGekNhGZW2+Sl00s=;
	b=RtUuijYm+ZizaMyUhUURdz80/W7Oniwm790XlgS5roXN8zfbHoQj0TRLQAF8UzSCRI
	sjKDv9OIC14cavQjuZWLDBDdSDOpZxjzjNTUu+nf03c1DAjSU1l6xbQN5NIlSIJ0lu91
	IcJcED+Ppg/HtuGlftz9yIuXOOqxHnCUbSmBHglI0eg+mipTU4aspCARdj8gyWp7g7Fj
	+MxP7b6VMLhyEL+bMxGaVv7fcJqE+7J2TyoDvej9t+UWI8eqIEKs58nEsbeGLBti/kjN
	FdL844xx30eAqoSbfVMWv64E5eCdKvH7MjKwa/Swc0Gs9ItBZR/XaX75J+igYaTHWAxa
	te9w==
Received: by 10.180.100.131 with SMTP id ey3mr4917434wib.15.1346259005583;
	Wed, 29 Aug 2012 09:50:05 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id eu4sm11043478wib.2.2012.08.29.09.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 09:50:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LatnKpmV5P53dsdO-J4_kMT_mqJu8SW5vX_b8KhbOJDXA@mail.gmail.com>
Date: Wed, 29 Aug 2012 18:50:04 +0200
Message-Id: <FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
	<1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
	<CAJTo0LatnKpmV5P53dsdO-J4_kMT_mqJu8SW5vX_b8KhbOJDXA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlsZKY3f0a9nXoj2wB5JNJbT93q8zWvIjoS8bUCiTrY5r4LaYlUhcZTGK3NdC+VLs6pV1oq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 17:02:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 17:23 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 29 August 2012 15:47, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Awesome! I've been campaigning for the symlink solution for a while =
now. Good thing that split-/usr nonsense is over now.
>=20
> Pointing out that the ln should be a cp for crazy split /usr systems
> would have been sufficient, Koen.

Ehm, I *really* want it to be a symlink, that way you easily check what =
the timezone is without needing to boot the device or compare md5sums. =
The last thing the TSC said on the split /usr was something along the =
lines of "would be nice, but only if it doesn't make things worse". A cp =
instead of ln would make things worse IMO.=


