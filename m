Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUFvJ-0006ga-S9
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 12:23:41 +0200
Received: by wye20 with SMTP id 20so252546wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2011 03:20:23 -0700 (PDT)
Received: by 10.216.229.229 with SMTP id h79mr2789718weq.74.1307528423502;
	Wed, 08 Jun 2011 03:20:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a1sm186082wek.46.2011.06.08.03.20.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 03:20:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 8 Jun 2011 12:20:19 +0200
Message-Id: <15E9EFF9-235F-45CF-A2AC-BFE047710335@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: bitbake -s broken?
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
X-List-Received-Date: Wed, 08 Jun 2011 10:23:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Apart from -b being broken as I reported earlier -s seems to be broken =
as well now:

=
koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-gnome=
$ MACHINE=3Dbeagleboard bitbake -s  | head -n10
Loading cache...done.
Loaded 1622 entries from dependency cache.
WARNING: No bb files matched BBFILE_PATTERN_htc-layer =
'^/OE/tentacle/sources/meta-smartphone/meta-htc/'
Package Name                                   Latest Version         =
Preferred Version
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                                   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

<bb.cache.CoreRecipeInfo object at 0x3c96750>                   :171-r3  =
                       =20
<bb.cache.CoreRecipeInfo object at 0x3c96710>                 :2.8.0-r1  =
                       =20
<bb.cache.CoreRecipeInfo object at 0x3c96750>             :1.0.0c-r13.0  =
                       =20
<bb.cache.CoreRecipeInfo object at 0x3c96710>                1:1.0.4-r2=20=


    =20
regards,

Koen=


