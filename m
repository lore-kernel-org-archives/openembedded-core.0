Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pvdi2-0008HU-SL
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 23:42:55 +0100
Received: by wyb38 with SMTP id 38so2514467wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 14:41:25 -0800 (PST)
Received: by 10.216.143.74 with SMTP id k52mr964622wej.0.1299278484663;
	Fri, 04 Mar 2011 14:41:24 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n78sm1437514weq.3.2011.03.04.14.41.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 14:41:23 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299276952-24941-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2011 23:41:23 +0100
Message-Id: <A78CAF16-DD5D-4D87-803C-313D07290422@dominion.thruhere.net>
References: <1299276952-24941-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] distutils-base: Only RDEPEND python-core on target packages
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
X-List-Received-Date: Fri, 04 Mar 2011 22:42:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt 2011, om 23:15 heeft Martin Jansa het volgende geschreven:

> * fixes ie setuptools, without this patch it RDEPENDs on =
python-core-native, which is not RPROVIDED by anything
> * imported from OE 8377b8ec57f35b9e5b81a74c77f68fd6e02949c8
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/classes/distutils-base.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/distutils-base.bbclass =
b/meta/classes/distutils-base.bbclass
> index 2e151de..e84b0fc 100644
> --- a/meta/classes/distutils-base.bbclass
> +++ b/meta/classes/distutils-base.bbclass
> @@ -1,5 +1,5 @@
> DEPENDS  +=3D "${@["python-native python", =
""][(bb.data.getVar('PACKAGES', d, 1) =3D=3D '')]}"
> -RDEPENDS +=3D "python-core"
> +RDEPENDS_${PN} +=3D "${@['', 'python-core']['${PN}' =3D=3D =
'${BPN}']}"

Minor nit: the two check seem to do the same, should we make them the =
same?=20

For this patch:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

regards,

Koen=


