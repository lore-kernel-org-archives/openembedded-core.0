Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1Pzuwu-0005OM-OR
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 18:55:57 +0100
Received: by wwb17 with SMTP id 17so2193297wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:54:09 -0700 (PDT)
Received: by 10.216.18.194 with SMTP id l44mr395038wel.87.1300298048849;
	Wed, 16 Mar 2011 10:54:08 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id e13sm98459wbi.23.2011.03.16.10.54.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 10:54:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <bf5f59e00a2ee59636426fabe2d4ae935fe2c4a5.1300295087.git.dvhart@linux.intel.com>
Date: Wed, 16 Mar 2011 18:54:05 +0100
Message-Id: <13FB91B0-A9A3-41A8-BD13-7F9FB8B2F2CD@beagleboard.org>
References: <bf5f59e00a2ee59636426fabe2d4ae935fe2c4a5.1300295087.git.dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH V2] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Wed, 16 Mar 2011 17:55:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mrt 2011, om 18:04 heeft Darren Hart het volgende geschreven:

> NOT FOR INCLUSION
>=20
> Before we include something like this, it needs review from folks like =
Koen and
> Gary to confirm it works in their environment as well.
>=20
> The existing infrastructure uses an external build tree which =
references the
> kernel source in the work dir. If run with rm work, building external =
modules
> will fail.
>=20
> This patch places a configured source tree in sysroots. Striking a =
balance
> between minimal size and minimal maintenance is difficult. A fully =
configured
> tree is about 500MB after a clean. This version leans on the side of =
caution and
> removes only the obviously unecessary parts of the source tree to =
conserve
> space, resulting in about 170MB. The arch directories would be some =
additional
> pruning we could do. Given examples from the devel package from =
distributions, I
> suspect this size could be reduced to 75MB or so, but at the cost of a =
much more
> complex recipe which is likely to require a great deal more =
maintenance to keep
> current with kernel releases.
>=20
> Care is also taken to clean the hostprogs in scripts, and the modules =
are
> responsible for building them as needed. Although it is unclear to me =
if this is
> really necessary, especially considering that modules put these bits =
back as
> soon as they compile. If we are not generating an sstate package, I =
suspect we
> can ignore these.
>=20
> Please try this with your modules and let me know how it does. I tried =
to take
> non linux-yocto kernel recipes into account, but I have only tested =
with
> linux-yocto and the hello-mod recipe so far.
>=20
> V2: o Address 000 perm quilt files (don't copy .pc dir)
>    o Clear linux-yocto meta dir from sysroots
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>

This one works beautifully, so:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>=


