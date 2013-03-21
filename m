Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIVV4-0008Nt-5q
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 03:45:16 +0100
Received: from mail179-tx2-R.bigfish.com (10.9.14.228) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 01:58:01 +0000
Received: from mail179-tx2 (localhost [127.0.0.1])	by
	mail179-tx2-R.bigfish.com (Postfix) with ESMTP id 8C8051401D1;
	Thu, 21 Mar 2013 01:58:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail179-tx2 (localhost.localdomain [127.0.0.1]) by mail179-tx2
	(MessageSwitch) id 136383107947518_1482;
	Thu, 21 Mar 2013 01:57:59 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.238])	by
	mail179-tx2.bigfish.com (Postfix) with ESMTP id F1FF3240047;
	Thu, 21 Mar 2013 01:57:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 01:57:58 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Thu, 21 Mar 2013 01:57:58 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Mark Hatle <mark.hatle@windriver.com>, Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [oe-core] rpm: split out run-postinsts
Thread-Index: AQHOJU5PDZEpb4W/AUmiLthUn7q5KJiu7Y6AgAABfwCAAHSSwA==
Date: Thu, 21 Mar 2013 01:57:57 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01483F65@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363772395-25682-1-git-send-email-zhenhua.luo@freescale.com>
	<514A0573.2060809@linux.intel.com> <514A06B4.1080302@windriver.com>
In-Reply-To: <514A06B4.1080302@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: rpm: split out run-postinsts
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
X-List-Received-Date: Thu, 21 Mar 2013 02:45:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Thursday, March 21, 2013 2:58 AM
>=20
> On 3/20/13 1:52 PM, Saul Wold wrote:
> > On 03/20/2013 02:39 AM, Zhenhua Luo wrote:
> >> Split out run-postinsts script into separated package, sometimes only
> >> the postinsts script is required to run all postinsts scripts in
> >> /etc/rpm-postinsts/ instead of the whole rpm package
> >>
> > So are you trying to build a system that uses RPM to install the
> > initial rootfs, but you don't want RPM actually installed?
>=20
> That seems reasonable to me.  I hadn't realized that it was rolled into
> the target RPM package like this.  In early implementations this script
> was installed directly by the rootfs_rpm.
[Luo Zhenhua-B19537] Yes, in my use case, I only need the postinits script =
instead of whole rpm package.=20

> >> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> >> ---
> >>    meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 ++++--
> >>    1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> >> b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> >> index 6286771..896e3a4 100644
> >> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> >> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> >> @@ -43,7 +43,7 @@ LICENSE =3D "LGPLv2.1"
> >>    LIC_FILES_CHKSUM =3D
> "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
> >>
> >>    DEPENDS =3D "libpcre attr acl popt ossp-uuid file bison-native"
> >> -PR =3D "r61"
> >> +PR =3D "r62"
> >>
> >>    # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It
> is needed
> >>    # in order to extract the distribution SRPM into a format we can
> extract...
> >> @@ -223,9 +223,11 @@ FILES_${PN} =3D  "${bindir}/rpm \
> >>    		${libdir}/rpm/bin/wget \
> >>    		/var/lib/rpm \
> >>    		/var/cache/rpm \
> >> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
> \
> >>    		"
> >>
> >> +FILES_${PN}-postinsts =3D
> "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
> >> +                "
> >> +
> >
> > This does not look right to me, you seem to be missing a PACKAGES
> > entry for the postinsts package. So this really won't do anything.
[Luo Zhenhua-B19537] I will submit v2 to add the entry.=20


Best Regards,

Zhenhua



