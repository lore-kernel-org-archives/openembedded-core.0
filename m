Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Qe2xt-0005fu-Km for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:34:49 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p65AV5pu032422
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 12:31:06 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 5 Jul 2011 12:30:55 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 5 Jul 2011 12:30:56 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5198@GSX300A.mxchg.m.corp>
In-Reply-To: <1309861363.19115.7.camel@phil-desktop>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [Draft design][RFC] Running postinst at rootfs
	generation time
Thread-Index: Acw6/YOIXD12lCAGRGCFiQOQuF89lwAABc7g
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com><4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex><4E09E8B7.1070901@windriver.com><0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp><1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com><CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com><0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
	<1309861363.19115.7.camel@phil-desktop>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 05 Jul 2011 10:30:55.0752 (UTC)
	FILETIME=[9F69D880:01CC3AFE]
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 05 Jul 2011 10:34:49 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>Nowadays you can set IMAGE_FEATURES =3D "read-only-rootfs", which will
>result in a fatal error if any packages are still unconfigured after
>rootfs construction is finished.

This helps to identify the packages to be modified, but it may be better =
to enhance the packages to be "read-only save".=20
May be a official guide line may help here.=20

Regards
Wolfgang Hauser
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] Im Auftrag von =
Phil Blundell
Gesendet: Dienstag, 5. Juli 2011 12:23
An: Patches and discussions about the oe-core layer
Betreff: Re: [OE-core] [Draft design][RFC] Running postinst at rootfs =
generation time

On Tue, 2011-07-05 at 12:06 +0200, Hauser, Wolfgang (external) wrote:
> Especially we have to cover some adduser/addgroup issues, modify the =
volatile file handling for our needs, and for omap3 graphics the =
handling of the GLES version.
> A failed offline postinst causing a runtime configuration. So the =
image generation log has to be checked for such failing scripts.

Nowadays you can set IMAGE_FEATURES =3D "read-only-rootfs", which will
result in a fatal error if any packages are still unconfigured after
rootfs construction is finished.

p.



_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


