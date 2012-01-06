Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rj4b3-0003eb-7k
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 08:52:18 +0100
Received: from mail30-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 07:29:44 +0000
Received: from mail30-va3 (localhost [127.0.0.1])	by mail30-va3-R.bigfish.com
	(Postfix) with ESMTP id D5C60660089;
	Fri,  6 Jan 2012 07:29:44 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(zzbb2dI9371I542M1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h944hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail30-va3 (localhost.localdomain [127.0.0.1]) by mail30-va3
	(MessageSwitch) id 1325834983171449_8074;
	Fri,  6 Jan 2012 07:29:43 +0000 (UTC)
Received: from VA3EHSMHS010.bigfish.com (unknown [10.7.14.235])	by
	mail30-va3.bigfish.com (Postfix) with ESMTP id 27490140053;
	Fri,  6 Jan 2012 07:29:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS010.bigfish.com
	(10.7.99.20) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 6 Jan 2012 07:29:42 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 6 Jan 2012 01:29:41 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH oe-core v4] linux-dtb: add multi-dtb build
	support and keep dtb in deploy cache package
Thread-Index: AQHMzDdwz7mIAz01tEKUo06diIblb5X/T5EA//+glRA=
Date: Fri, 6 Jan 2012 07:29:41 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010C9020@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325829439-848-1-git-send-email-b19537@freescale.com>
	<4F069D74.9080509@linux.intel.com>
In-Reply-To: <4F069D74.9080509@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH oe-core v4] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Fri, 06 Jan 2012 07:52:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

"=3D" is needless, I will fix the error. Seems it doesn't impact the result=
. :)


Best Regards,

Zhenhua


> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, January 06, 2012 3:06 PM
> To: Patches and discussions about the oe-core layer
> Cc: Luo Zhenhua-B19537
> Subject: Re: [OE-core] [PATCH oe-core v4] linux-dtb: add multi-dtb build =
support
> and keep dtb in deploy cache package
>=20
> On 01/05/2012 09:57 PM, b19537@freescale.com wrote:
> > From: Zhenhua Luo<b19537@freescale.com>
> >
> > Signed-off-by: Zhenhua Luo<b19537@freescale.com>
> > ---
> >   meta/recipes-kernel/linux/linux-dtb.inc |   30 +++++++++++++++++++++-=
-------
> -
> >   1 files changed, 21 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-
> kernel/linux/linux-dtb.inc
> > index 7ec7584..5439810 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -13,15 +13,27 @@ python __anonymous () {
> >   	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> >   }
> >
> > -do_install_append() {
> > +kernel_do_deploy_append() {
> >       if test -n "${KERNEL_DEVICETREE}"; then
> > -	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${KERNEL_DEVICETREE}
> > -	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
> > -	install -d ${DEPLOY_DIR_IMAGE}
> > -	install -m 0644 devicetree
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> > -	cd ${DEPLOY_DIR_IMAGE}
> > -	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> > -	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> > +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> > +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print=
 $1}'`
> > +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | se=
d
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> ${DTS_FILE}
> > +            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE=
_NAME}-
> ${KERNEL_VERSION}
> > +            install -d ${DEPLOY_DIR_IMAGE}
> > +            install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${DTB_NAME}=
.dtb
> > +            rm -f devicetree
> > +            cd ${DEPLOY_DIR_IMAGE}
> > +            rm -f ${DTB_SYMLINK_NAME}.dtb
> > +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> > +            cd -
> > +
> > +            install -d ${DEPLOYDIR}
> > +            install -m 0644 ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> > +            cd ${DEPLOYDIR}
> > +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME=3D}.dtb
> Should there be an '=3D' at the end of this?
>=20
> Sau!
>=20
> > +            cd -
> > +        done
> >       fi
> >   }
> > -




