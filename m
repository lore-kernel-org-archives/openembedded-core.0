Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AC5F46D8F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 17:26:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2013 09:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="436715015"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 17 Nov 2013 09:26:50 -0800
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Sun, 17 Nov 2013 17:26:49 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.136]) with mapi id
	14.03.0123.003; Sun, 17 Nov 2013 17:26:49 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] telepathy-idle: upgrade to 0.2.0
Thread-Index: AQHO4j0xfv6gmglugEyqtAzsB3duAJomzNIAgALi8hA=
Date: Sun, 17 Nov 2013 17:26:48 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CBECD6@IRSMSX105.ger.corp.intel.com>
References: <cover.1384545568.git.cristian.iorga@intel.com>
	<837a7c0e891212fce3ce837e3ab50b04235a5dc3.1384545568.git.cristian.iorga@intel.com>
	<5286905A.4070205@linux.intel.com>
In-Reply-To: <5286905A.4070205@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] telepathy-idle: upgrade to 0.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Nov 2013 17:26:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

You are right. It's a mistake from my part.
/Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Friday, November 15, 2013 11:22 PM
To: Iorga, Cristian; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] telepathy-idle: upgrade to 0.2.0

On 11/15/2013 12:01 PM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../fix-svc-gtk-doc.h-target.patch                                    |=
 0
>   .../telepathy/{telepathy-idle_0.1.16.bb =3D> telepathy-idle_0.2.0.bb}  =
 | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.16 =3D> =
telepathy-idle-0.2.0}/fix-svc-gtk-doc.h-target.patch (100%)
>   rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.16.bb=20
> =3D> telepathy-idle_0.2.0.bb} (82%)
>
I noticed that there is a version specific patch directory, any reason to n=
ot rename it to ${PN} instead of keeping the version'ed patch?

Sau!

> diff --git=20
> a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gt
> k-doc.h-target.patch=20
> b/meta/recipes-connectivity/telepathy/telepathy-idle-0.2.0/fix-svc-gtk
> -doc.h-target.patch
> similarity index 100%
> rename from=20
> meta/recipes-connectivity/telepathy/telepathy-idle-0.1.16/fix-svc-gtk-
> doc.h-target.patch rename to=20
> meta/recipes-connectivity/telepathy/telepathy-idle-0.2.0/fix-svc-gtk-d
> oc.h-target.patch diff --git=20
> a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb=20
> b/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
> similarity index 82%
> rename from=20
> meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
> rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
> index 279e8f1..ca09f6d 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.16.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>
>   SRC_URI =3D "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${=
PV}.tar.gz \
>              file://fix-svc-gtk-doc.h-target.patch"
> -SRC_URI[md5sum] =3D "afabda908a798aac3a427f4564af113a"
> -SRC_URI[sha256sum] =3D "739614e2d526d82bdd2fd94026ca70a46670563556ff1553=
7a2a08bf17172875"
> +SRC_URI[md5sum] =3D "92a2de5198284cbd3c430b0d1a971a86"
> +SRC_URI[sha256sum] =3D "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2e=
af6d0717d76f2fab"
>
>   inherit autotools pkgconfig pythonnative
>
>

