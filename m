Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TbULK-0000zB-7b
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:49:14 +0100
Received: from mail616.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id C9C71DC5487
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 11:23:43 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Nov 2012 12:16:08 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Nov 2012 12:16:06 +0200
Date: Thu, 22 Nov 2012 11:15:52 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Saul Wold <sgw@linux.intel.com>
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20121122111552.77470adb@eb-e6520>
In-Reply-To: <1353334373-16509-1-git-send-email-eric@eukrea.com>
References: <1353334373-16509-1-git-send-email-eric@eukrea.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 18115166552153238978
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrudekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphhrohhfuhhsihhonhdrmhhosghinecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrudekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphhrohhfuhhsihhonhdrmhhosghinecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod: fix git repo URL
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
X-List-Received-Date: Thu, 22 Nov 2012 10:49:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Saul,

is it possible to include this patch in danny as it fix a fetching
error ?
In master that's commit 156e0fca979585f72323041f8d8aeafcbd43dfc3

Thanks
Eric

Le Mon, 19 Nov 2012 15:12:53 +0100,
Eric B=E9nard <eric@eukrea.com> a =E9crit :

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta/recipes-kernel/kmod/kmod.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod=
/kmod.inc
> index e4b4a98..3cd963f 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe \
>                     "
>  inherit autotools gtk-doc
> =20
> -SRC_URI =3D "git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=3Dm=
aster \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
>             file://depmod-search.conf \
>             file://0001-man-disable-man-page-generation-because-we-don-t-=
hav.patch \
>            "



