Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6RKa-0000jp-A7
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:15:36 +0200
Received: by fxi1 with SMTP id 1so1933155fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:10:17 -0700 (PDT)
Received: by 10.223.59.136 with SMTP id l8mr1449750fah.54.1316628617633;
	Wed, 21 Sep 2011 11:10:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y8sm4953412faj.10.2011.09.21.11.10.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:10:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAHod+GdxhL_SpWX8jSD-5AONre335aHT_aE3wLU5SErzTuc+zg@mail.gmail.com>
Date: Wed, 21 Sep 2011 20:10:10 +0200
Message-Id: <82ECBEC7-074D-4F04-B53B-79D11E576951@dominion.thruhere.net>
References: <CAHod+GdxhL_SpWX8jSD-5AONre335aHT_aE3wLU5SErzTuc+zg@mail.gmail.com>
To: =?utf-8?Q?Marko_Kati=C4=87?= <dromede@gmail.com>
X-Mailer: Apple Mail (2.1244.3)
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH] bluez4: replace deprecated configure switch
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
X-List-Received-Date: Wed, 21 Sep 2011 18:15:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 18:36 heeft Marko Kati=C4=87 het volgende =
geschreven:

> "--enable-configfiles" is deprecated upstream. Here is the original =
reason & patch:
>=20
> http://www.spinics.net/lists/linux-bluetooth/msg14266.html
>=20
> Replace "--enable-configfiles" with "--enable-datafiles" in the bluez4 =
recipe.
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb =
b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> index 994cec7..062b8f2 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> @@ -39,7 +39,7 @@ EXTRA_OECONF =3D "\
>    --enable-dund \
>    --disable-cups \
>    --enable-test \
> -  --enable-configfiles \
> +  --enable-datafiles \

This needs to go to the oe-core list and is missing a PR bump=


