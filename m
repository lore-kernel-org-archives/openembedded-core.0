Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AED54719E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:45:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 01:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,413,1491289200"; d="scan'208";a="974233476"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga003.jf.intel.com with ESMTP; 29 May 2017 01:45:23 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.82]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.21]) with mapi id
	14.03.0319.002; Mon, 29 May 2017 16:45:22 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: "John, Maxin" <maxin.john@intel.com>
Thread-Topic: [OE-core] [pyro] [PATCH] cryptodev-linux: update SRC_URI
Thread-Index: AQHS1e60mk+Ef/mBb0qX+8+BXhUtEaIKbkGAgACVXYA=
Date: Mon, 29 May 2017 08:45:21 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F045497@PGSMSX103.gar.corp.intel.com>
References: <1495782421-159586-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<20170529074935.GA36860@mbabyjoh-desk.ger.corp.intel.com>
In-Reply-To: <20170529074935.GA36860@mbabyjoh-desk.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro] [PATCH] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Mon, 29 May 2017 08:45:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Maxin,


> -----Original Message-----
> From: John, Maxin
> Sent: Monday, May 29, 2017 3:50 PM
> To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> Cc: OpenEmbedded Core Mailing List <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [pyro] [PATCH] cryptodev-linux: update SRC_URI
>=20
> Hi Rebecca,
>=20
> On Fri, May 26, 2017 at 03:07:01PM +0800, Chang Rebecca Swee Fun wrote:
> > Gna! project announced that the download site from gna.org HTTP server
> > will soon be closing down. We have verified that the site is no longer
> > accessible without network proxy cache. We need to update SRC_URI to
> > point to new alternative (nwl.cc HTTP server) in order to avoid
> > fetcher issues in future.
> >
> > [YOCTO #11575]
> >
> > Signed-off-by: Chang Rebecca Swee Fun
> > <rebecca.swee.fun.chang@intel.com>
> > ---
> >  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc
> > b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > index 24b3227..4ae0a2b 100644
> > --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> > +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://cryptodev-linux.org/"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >
> > -SRC_URI =3D
> > "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz
> > \
> > +SRC_URI =3D
> > +"http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
>=20
> Any particular reason for choosing nwl.cc over github ?
> (https://github.com/cryptodev-linux/cryptodev-linux).

I got the alternative link from http://cryptodev-linux.org/download.html
as suggested by cryptodev-linux.

Regards,
Rebecca

