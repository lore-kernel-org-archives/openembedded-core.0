Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S31HD-0003T8-Mm
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 09:22:15 +0100
Received: by wibhq12 with SMTP id hq12so169109wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 00:13:46 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.95.34 as permitted sender)
	client-ip=10.180.95.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.95.34 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.95.34])
	by 10.180.95.34 with SMTP id dh2mr8010737wib.15.1330589626274 (num_hops
	= 1); Thu, 01 Mar 2012 00:13:46 -0800 (PST)
Received: by 10.180.95.34 with SMTP id dh2mr6405184wib.15.1330589626098;
	Thu, 01 Mar 2012 00:13:46 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm25243667wiy.7.2012.03.01.00.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:13:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3d96c591f182971ec0fb0aff9b8d18af80febe40.1330586641.git.sgw@linux.intel.com>
Date: Thu, 1 Mar 2012 09:13:39 +0100
Message-Id: <F93E6383-4A2F-4BF2-BE86-95F2985B7E03@dominion.thruhere.net>
References: <cover.1330586641.git.sgw@linux.intel.com>
	<3d96c591f182971ec0fb0aff9b8d18af80febe40.1330586641.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmqiZlVVCkTXmKxzYSNnJ3xhwoYciZUSmA2EfIbPHcZwsgA7fkwxP2DqWKYlU4FIn27wXtJ
Subject: Re: [PATCH 5/7] pixman: updat to 0.24.4
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
X-List-Received-Date: Thu, 01 Mar 2012 08:22:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 08:26 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../{pixman_0.24.2.bb =3D> pixman_0.24.4.bb}         |    7 +++----
> 1 files changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-graphics/xorg-lib/{pixman_0.24.2.bb =3D> =
pixman_0.24.4.bb} (82%)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb =
b/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
> similarity index 82%
> rename from meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
> rename to meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
> index c710b42..4c90ea3 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
> @@ -15,10 +15,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D14096c769ae0cbb5fcb94ec468be11b3 \
> DEPENDS +=3D "zlib libpng"
>=20
> PE =3D "1"
> -PR =3D "r1"
> +PR =3D "r0"

Setting it to the default is bogus, no?

regards,

Koen=


