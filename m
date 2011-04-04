Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q6k2M-0003MY-G5
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 15:41:46 +0200
Received: by wye20 with SMTP id 20so5036251wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2011 06:39:41 -0700 (PDT)
Received: by 10.227.197.199 with SMTP id el7mr4013180wbb.32.1301924381605;
	Mon, 04 Apr 2011 06:39:41 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	o23sm2929229wbc.10.2011.04.04.06.39.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 06:39:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1301923706.git.josh@linux.intel.com>
Date: Mon, 4 Apr 2011 15:39:40 +0200
Message-Id: <52BC8856-1494-4AC6-B04F-0A9DC5A8AB2B@dominion.thruhere.net>
References: <cover.1301923706.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1] Clutter-1.6 fix
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
X-List-Received-Date: Mon, 04 Apr 2011 13:41:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 apr 2011, om 15:31 heeft Joshua Lock het volgende geschreven:

> From: Joshua Lock <josh@linux.intel.com>
>=20
> I found a couple of issues with the Clutter 1.6 recipes I submitted =
recently
> which I've addressed in the attached patch.
>=20
> As an aside I've noticed that we have a COMPATIBLE_MACHINE line in
> clutter.inc, I think we're going to need to find a more suitable =
mechanism
> for specifying compatible machines for this recipe set going forwards.
>=20
> Any ideas? Perhaps some MACHINE_FEATURE which must exist for Clutter =
(and
> other GL dependent recipes) to build?

What we did in OE .dev was:

1) introduce SOC_FAMILY to group, well, SOC families (e.g. OMAP3)
2) Extend base.bbclass to allow COMPATIBLE_MACHINE =3D $SOC_FAMILY.
3) Add COMPATIBLE_MACHINE =3D omap3 to the GLES recipes
4) DEPENDS_omap3 =3D libgles-omap3 in clutter.inc

So for machines in the omap3 class it will build libgles-omap3 and not =
for others. So the compatibility is defined at the GL level instead of =
the clutter level.

regards,

Koen=


