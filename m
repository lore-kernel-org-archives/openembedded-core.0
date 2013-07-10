Return-Path: <nathan.rossi@xilinx.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0253.outbound.messaging.microsoft.com [213.199.154.253])
	by mail.openembedded.org (Postfix) with ESMTP id A60EC6A59F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:07:43 +0000 (UTC)
Received: from mail64-db9-R.bigfish.com (10.174.16.241) by
	DB9EHSOBE002.bigfish.com (10.174.14.65) with Microsoft SMTP Server id
	14.1.225.22; Wed, 10 Jul 2013 04:07:43 +0000
Received: from mail64-db9 (localhost [127.0.0.1])	by mail64-db9-R.bigfish.com
	(Postfix) with ESMTP id 9C062A8005C;
	Wed, 10 Jul 2013 04:07:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -3
X-BigFish: VPS-3(zz98dI9371I542I1432Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275dhz2fh95h668h839h944hd24hf0ah119dh1220h1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dh906i1155h192ch)
Received-SPF: pass (mail64-db9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail64-db9 (localhost.localdomain [127.0.0.1]) by mail64-db9
	(MessageSwitch) id 137342926117027_31975;
	Wed, 10 Jul 2013 04:07:41 +0000 (UTC)
Received: from DB9EHSMHS030.bigfish.com (unknown [10.174.16.235])	by
	mail64-db9.bigfish.com (Postfix) with ESMTP id E6376B00049;
	Wed, 10 Jul 2013 04:07:40 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by DB9EHSMHS030.bigfish.com
	(10.174.14.40) with Microsoft SMTP Server id 14.16.227.3;
	Wed, 10 Jul 2013 04:07:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <nathan.rossi@xilinx.com>)	id 1Uwlgp-0005Oo-Hw;
	Tue, 09 Jul 2013 21:07:39 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] scripts/runqemu: 'qemuzynq' and
	'qemumicroblaze'
Thread-Index: AQHOfLyTiJ5pQUCExUqzb1fQFANULZldO3Ag
Date: Wed, 10 Jul 2013 04:07:37 +0000
References: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
	<3588463.kQicxHoPbN@helios>
In-Reply-To: <3588463.kQicxHoPbN@helios>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.13]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <7b841934-81b8-4902-8c63-d9b350aaa2ef@DB9EHSMHS030.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Re: [PATCH 0/2] scripts/runqemu: 'qemuzynq' and 'qemumicroblaze'
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
X-List-Received-Date: Wed, 10 Jul 2013 04:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Wednesday, July 10, 2013 1:54 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Nathan Rossi; meta-xilinx@yoctoproject.org
> Subject: Re: [OE-core] [PATCH 0/2] scripts/runqemu: 'qemuzynq' and
> 'qemumicroblaze'
>
> Hi Nathan/all,
>
> On Thursday 04 July 2013 17:42:26 Nathan Rossi wrote:
> > The following patches add support to the runqemu scripts to allow for
> > the machines named 'qemuzynq' and 'qemumicroblaze' to be booted within
> > qemu. These target machines reside in the 'meta-xilinx' layer.
>
> I think we should look at changing runqemu so that it can be extended to
> support additional machines in the layers that add support for the
> machines
> themselves. I'm not entirely sure how we would implement this, but it
> should
> be possible assuming runqemu can know the path to all layers that are
> enabled
> (just query bitbake for BBLAYERS?) and there was some standard mechanism
> within the layer to add the machine-specific parts for the runqemu script=
.

Here are some ideas I had when I was initially looking at implementing the =
addition of the zynq and microblaze QEMU machines.

In the same way the Kernel, U-boot, etc have variables set in machine.conf'=
s it might be worth looking at defining certain options for QEMU. This coul=
d even allow users to runqemu for the machine they are building, which is n=
ot a qemu* machine (these variables could be retrieved via a similar mechan=
ism to bitbake -e?). This might be beneficial as opposed to allowing some s=
ort of cross-layer sub-script execution?

e.g.
# qemuarm
MACHINE_QEMU =3D "qemu-system-arm"
MACHINE_QEMU_MODEL =3D "versatilepb"


There is interest (for meta-xilinx) to support Device-Tree driven QEMU mode=
ls (of which the feature hasn't made it into upstream QEMU yet). This might=
 be interesting for those that want to test/simulate on systems that more c=
losely resemble their target device, which could also allow for QA on machi=
nes that are outside of the oe-core layer.

microblaze_generic_fdt : http://lists.nongnu.org/archive/html/qemu-devel/20=
12-09/msg02437.html
arm_generic_fdt (still in development) : https://github.com/Xilinx/qemu/blo=
b/xilinx-master/hw/arm/arm_generic_fdt.c

Regards,
Nathan

>
> Since this is unlikely to happen immediately I've acked these patches
> going
> in, but I think we'll need to look at doing this some time soon.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.



