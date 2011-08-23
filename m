Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1QvfRz-0004M5-HF
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:06:49 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Tue, 23 Aug 2011 09:00:10 +0800
Received: from [192.168.0.102] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Tue, 23 Aug 2011
	09:00:08 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 09:01:31 +0800
In-Reply-To: <4E52C33A.6030807@mlbassoc.com>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
	<1313999777.7620.13.camel@localhost.localdomain>
	<4E52399C.9020608@mlbassoc.com> <4E52BB9A.2060603@linux.intel.com>
	<4E52C234.6080400@mlbassoc.com> <4E52C33A.6030807@mlbassoc.com>
X-Mailer: Evolution 3.0.2 
Message-ID: <1314061291.1341.0.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: new feature? (for "DL_DIR")
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
X-List-Received-Date: Tue, 23 Aug 2011 01:06:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

THANKS! I will try it!


On Tue, 2011-08-23 at 04:59 +0800, Gary Thomas wrote:
> On 2011-08-22 14:55, Gary Thomas wrote:
> > On 2011-08-22 14:27, Saul Wold wrote:
> >> On 08/22/2011 04:12 AM, Gary Thomas wrote:
> >>> On 2011-08-22 01:56, Ni Qingliang wrote:
> >>>> Do we can assign all package be downloaded from the same path?
> >>>>
> >>>> I want setup one internal server to store the files in upstreamsourc=
es,
> >>>> and all developer's PC use it but not the original package address.
> >>>>
> >>>
> >>> Just add these lines to your .conf (I put them in my ${DISTRO}.conf):
> >>> # Provide pre-staged sources
> >>> SOURCE_MIRROR_URL ?=3D "file:///opt/amltd/poky/sources/"
> >>> INHERIT +=3D "own-mirrors"
> >>>
> >>> Simply point SOURCE_MIRROR_URL at your file cache.
> >>>
> >> You could also use PREMIRRORS in the developer's local.conf, point
> >> PREMIRRORS for packages to your internal server (could be ftp, http or=
 file when mounted via NFS).
> >
> > But then you end up typing all the patterns for the various file types,=
 etc.
> >
> > own-mirrors does all that for you by creating a PREMIRRORS variable bas=
ed
> > on the single SOURCE_MIRROR_URL
>=20
> Also, to be used as a complete cache, SOURCE_MIRROR_URL should point
> to the same cache directory as DL_DIR does.  So I really should have
> said
>     # Provide pre-staged sources
>     DL_DIR =3D "/opt/amltd/poky/sources"
>     SOURCE_MIRROR_URL =3D "file://${DL_DIR}/"
>     INHERIT +=3D "own-mirrors"
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Yi Qingliang
=E5=80=AA=E5=BA=86=E4=BA=AE

Insigma




