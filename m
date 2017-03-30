Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 08C6677C20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 10:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 675B62E0B1;
	Thu, 30 Mar 2017 12:53:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2lyS8P0ua8Sn; Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 4C5472E272;
	Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A9B51E0A0;
	Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FAF11E09D;
	Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 2419E2293;
	Thu, 30 Mar 2017 12:53:38 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 30 Mar 2017 12:53:38 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 30 Mar 2017 12:53:37 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 30 Mar 2017 12:53:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] update_gio_module_cache: Do not chown a
	non-existing file
Thread-Index: AQHSqTmHdf4iuZEiy02Cdt3bUFeZQqGtKDhg
Date: Thu, 30 Mar 2017 10:53:37 +0000
Message-ID: <29c2d438050341bda5c2f610aa7b3972@XBOX02.axis.com>
References: <20170329231606.22118-1-pkj@axis.com>
	<72959861-69b9-7ed0-7a89-891a4aa9ed26@linux.intel.com>
In-Reply-To: <72959861-69b9-7ed0-7a89-891a4aa9ed26@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Thu, 30 Mar 2017 10:53:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alexander Kanavin
> Sent: den 30 mars 2017 11:39
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] update_gio_module_cache: Do not chown a
> non-existing file
>=20
> On 03/30/2017 02:16 AM, Peter Kjellerstedt wrote:
> > Only change the ownership of ${libdir}/gio/modules/giomodule.cache if
> > it exists.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  scripts/postinst-intercepts/update_gio_module_cache | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
> b/scripts/postinst-intercepts/update_gio_module_cache
> > index 92092f2144..fc3f9d0d6c 100644
> > --- a/scripts/postinst-intercepts/update_gio_module_cache
> > +++ b/scripts/postinst-intercepts/update_gio_module_cache
> > @@ -3,7 +3,7 @@
> >  set -e
> >
> >  PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E
> LD_LIBRARY_PATH=3D$D${libdir}:$D${base_libdir} \
> > -        $D${libexecdir}/${binprefix}gio-querymodules
> $D${libdir}/gio/modules/
> > -
> > -chown root:root $D${libdir}/gio/modules/giomodule.cache
> > +	$D${libexecdir}/${binprefix}gio-querymodules
> $D${libdir}/gio/modules/
> >
> > +[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> > +	chown root:root $D${libdir}/gio/modules/giomodule.cache
> >
>=20
> Nope. The postinst-intercept scirpts are allowed to fail, and if they
> are, they are deferred to first boot. If giomodule.cache file does not
> exist, that means that qemu does not work for the target machine, which
> is not a bug, and is handled by detecting script failure and taking the
> same action at first boot time - which your change breaks.
>=20
> Alex

No, the script will still fail if running gio-querymodules fails since=20
`set -e` is in effect. But it will no longer fail if gio-querymodules=20
succeeds without producing a cache file, which is the case for us.

I do not know under what circumstances gio-querymodules will or will=20
not produce a cache file, but I have tried running it on our target=20
and it does not produce a cache file there either, so I assume the=20
build time job is doing the right thing in not creating a file.

//Peter


