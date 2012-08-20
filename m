Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1T3M5a-0007Qn-Tk
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 09:07:55 +0200
Received: from mail137-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Mon, 20 Aug 2012 06:10:41 +0000
Received: from mail137-tx2 (localhost [127.0.0.1])	by
	mail137-tx2-R.bigfish.com (Postfix) with ESMTP id 94A4C1E04F0	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 06:10:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zzbb2dI98dI9371I542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail137-tx2 (localhost.localdomain [127.0.0.1]) by mail137-tx2
	(MessageSwitch) id 1345443040237219_8359;
	Mon, 20 Aug 2012 06:10:40 +0000 (UTC)
Received: from TX2EHSMHS015.bigfish.com (unknown [10.9.14.251])	by
	mail137-tx2.bigfish.com (Postfix) with ESMTP id 35C2C2A003F	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 06:10:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS015.bigfish.com
	(10.9.99.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 20 Aug 2012 06:10:39 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.104]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Mon, 20 Aug 2012 01:10:39 -0500
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] linux-dtb: add multi-dtb build support
Thread-Index: AQHNU0z/E3qeJO2S1UyJVeqDpsrMOJcs94mAgAAAnACABcDLAIAv0O+w
Date: Mon, 20 Aug 2012 06:10:38 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0125F8E4@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<50049A4F.2040100@linux.intel.com>
	<CAEsOVNfS0YJvu=KtFPWiFq1nmkRJgE6ebYUzBS05e2MSLnumbA@mail.gmail.com>
	<CAEsOVNcQhAL43AXHMZOvUyU_T51JbSHvU9SCezBhBnT0WNo0KQ@mail.gmail.com>
In-Reply-To: <CAEsOVNcQhAL43AXHMZOvUyU_T51JbSHvU9SCezBhBnT0WNo0KQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.129]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Mon, 20 Aug 2012 07:07:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the late response.

I think this issue(2769) has been closed. Doesn't it make sense to generate=
 the dtb with the same name with corresponding dts?


Best Regards,

Zhenhua


> -----Original Message-----
> From: McClintock Matthew-B29882
> Sent: Friday, July 20, 2012 10:42 PM
> To: Patches and discussions about the oe-core layer; Luo Zhenhua-B19537
> Subject: Re: [OE-core] [oe-core] linux-dtb: add multi-dtb build support
>=20
> Zhenhua,
>=20
> Any update here?
>=20
> -M
>=20
> On Mon, Jul 16, 2012 at 5:50 PM, Matthew McClintock <msm@freescale.com> w=
rote:
> > Adding Zhenhua so he sees the email for sure ;)
> >
> > -M
> >
> > On Mon, Jul 16, 2012 at 5:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >> On 06/25/2012 08:53 PM, b19537@freescale.com wrote:
> >>>
> >>> From: Zhenhua Luo <b19537@freescale.com>
> >>>
> >>>      including following enhancement:
> >>>      * support multi-dtb build
> >>>      * skip dtb build and install when KERNEL_DEVICETREE is empty
> >>>      * print a warning message when specified dts file is not
> >>> available
> >>>
> >>> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> >>> ---
> >>>   meta/recipes-kernel/linux/linux-dtb.inc |   36
> >>> +++++++++++++++++++++++++------
> >>>   1 files changed, 29 insertions(+), 7 deletions(-)
> >>>
> >> This patch appears to rename the .dtb file different than it did
> >> before this change.  Is that correct?
> >>
> >> Seem to change it from:
> >>
> >> uImage-mpc8315e-rdb.dtb
> >>
> >> to
> >>
> >> uImage-mpc8315erdb.dtb
> >>
> >> While the .bin file is still: uImage-mpc8315e-rdb.bin
> >>
> >> Inquiring minds??  This was filed as bug 2769
> >>
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2769
> >>
> >> Thanks
> >> Sau!
> >>
> >>
> >>
> >>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> >>> b/meta/recipes-kernel/linux/linux-dtb.inc
> >>> index 9188cee..8aa1458 100644
> >>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> >>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> >>> @@ -15,13 +15,35 @@ python __anonymous () {
> >>>
> >>>   do_install_append() {
> >>>       if test -n "${KERNEL_DEVICETREE}"; then
> >>> -       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree
> >>> ${KERNEL_DEVICETREE}
> >>> -       install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERS=
ION}
> >>> -       install -d ${DEPLOYDIR}
> >>> -       install -m 0644 devicetree
> >>> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
> >>> -       cd ${DEPLOYDIR}
> >>> -       rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> >>> -       ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb
> >>> ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
> >>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> >>> +            if [ ! -f ${DTS_FILE} ]; then
> >>> +                echo "Warning: ${DTS_FILE} is not available!"
> >>> +                continue
> >>> +            fi
> >>> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> >>> + '{print
> >>> $1}'`
> >>> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> >>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> >>> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} |
> >>> + sed
> >>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> >>> +            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o
> >>> ${DTS_BASE_NAME} ${DTS_FILE}
> >>> +            install -m 0644 ${DTS_BASE_NAME}
> >>> ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
> >>> +        done
> >>>       fi
> >>>   }
> >>>
> >>> +do_deploy_append() {
> >>> +    if test -n "${KERNEL_DEVICETREE}"; then
> >>> +        for DTS_FILE in ${KERNEL_DEVICETREE}; do
> >>> +            if [ ! -f ${DTS_FILE} ]; then
> >>> +                echo "Warning: ${DTS_FILE} is not available!"
> >>> +                continue
> >>> +            fi
> >>> +            DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> >>> +'{print
> >>> $1}'`
> >>> +            DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
> >>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> >>> +            DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} |
> >>> + sed
> >>> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> >>> +            install -d ${DEPLOYDIR}
> >>> +            install -m 0644 ${B}/${DTS_BASE_NAME}
> >>> ${DEPLOYDIR}/${DTB_NAME}.dtb
> >>> +            cd ${DEPLOYDIR}
> >>> +            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
> >>> +            cd -
> >>> +        done
> >>> +    fi
> >>> +}
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



