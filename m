Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ5eH-0002HM-Fh
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:26:05 +0200
Received: by wyb34 with SMTP id 34so34426wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 11:22:32 -0700 (PDT)
Received: by 10.227.198.199 with SMTP id ep7mr3875562wbb.40.1308680550897;
	Tue, 21 Jun 2011 11:22:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm4209624wbh.4.2011.06.21.11.22.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 11:22:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
Date: Tue, 21 Jun 2011 20:22:28 +0200
Message-Id: <A5CA482F-DAA6-407C-ADA1-CEA2A5D91D57@dominion.thruhere.net>
References: <cover.1308680000.git.anders@chargestorm.se>
	<8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC PATCH 2/5] module-init-tools-cross: add provides for depmod-3
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
X-List-Received-Date: Tue, 21 Jun 2011 18:26:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 20:18 heeft Anders Darander het volgende geschreven:

> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> .../module-init-tools-cross_3.12.bb                |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git =
a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb =
b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
> index 08bf1a9..9b6ab95 100644
> --- =
a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
> +++ =
b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
> @@ -1,7 +1,7 @@
> require module-init-tools.inc
> PR =3D "r1"
> inherit cross
> -PROVIDES +=3D "virtual/${TARGET_PREFIX}depmod =
virtual/${TARGET_PREFIX}depmod-2.6"
> +PROVIDES +=3D "virtual/${TARGET_PREFIX}depmod =
virtual/${TARGET_PREFIX}depmod-2.6 virtual/${TARGET_PREFIX}depmod-3"

Don't you need at least 3.13 (or better 3.16) for proper 3.0 support? =
This one was added after 3.12:

=
http://git.kernel.org/?p=3Dutils/kernel/module-init-tools/module-init-tool=
s.git;a=3Dcommitdiff;h=3D3328d178247017affd90b7897393699f2f45227d

regards,

Koen=


