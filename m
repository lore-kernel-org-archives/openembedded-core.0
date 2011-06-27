Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qb8wV-0005FO-IS
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 12:21:23 +0200
Received: by wyg30 with SMTP id 30so1143172wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 03:17:43 -0700 (PDT)
Received: by 10.216.184.137 with SMTP id s9mr673796wem.96.1309169863151;
	Mon, 27 Jun 2011 03:17:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm2676816weq.16.2011.06.27.03.17.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 03:17:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
Date: Mon, 27 Jun 2011 12:17:40 +0200
Message-Id: <E1CE6B81-087C-421B-8B2D-3FB66713E99C@dominion.thruhere.net>
References: <cover.1308973924.git.edwin.zhai@intel.com>
	<a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/2] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Mon, 27 Jun 2011 10:21:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jun 2011, om 05:54 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> +SRC_URI =3D =
"${GNOME_MIRROR}/glib-networking/2.28/glib-networking-${PV}.tar.bz2"

No 'name' parameter

> +SRC_URI[archive.md5sum] =3D "c10e51571d03c10111a37bcd21fbf777"
> +SRC_URI[archive.sha256sum] =3D =
"98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"

'archive' as name paramater, leading to:

WARNING: Missing SRC_URI checksum for =
/OE/tentacle/sources/downloads/glib-networking-2.28.7.tar.bz2, consider =
adding to the recipe:
SRC_URI[md5sum] =3D "c10e51571d03c10111a37bcd21fbf777"
SRC_URI[sha256sum] =3D =
"98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"



