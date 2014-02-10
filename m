Return-Path: <nathan.rossi@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe005.messaging.microsoft.com [213.199.154.208])
	by mail.openembedded.org (Postfix) with ESMTP id 547006E713;
	Mon, 10 Feb 2014 05:32:41 +0000 (UTC)
Received: from mail107-am1-R.bigfish.com (10.3.201.232) by
	AM1EHSOBE011.bigfish.com (10.3.207.133) with Microsoft SMTP Server id
	14.1.225.22; Mon, 10 Feb 2014 05:32:41 +0000
Received: from mail107-am1 (localhost [127.0.0.1])	by
	mail107-am1-R.bigfish.com (Postfix) with ESMTP id 0CC25E0A98;
	Mon, 10 Feb 2014 05:32:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -3
X-BigFish: VPS-3(zz9371I542I1432I14ffIzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h17326ah8275dh1de097h186068hz2fh95h109h839h944hc61hd24hf0ah119dh1220h1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h2438h2461h2487h24d7h2516h2545h906i1155h)
Received-SPF: pass (mail107-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail107-am1 (localhost.localdomain [127.0.0.1]) by mail107-am1
	(MessageSwitch) id 1392010358488178_7458;
	Mon, 10 Feb 2014 05:32:38 +0000 (UTC)
Received: from AM1EHSMHS015.bigfish.com (unknown [10.3.201.249])	by
	mail107-am1.bigfish.com (Postfix) with ESMTP id F20CB20243;
	Mon, 10 Feb 2014 05:32:23 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS015.bigfish.com
	(10.3.207.153) with Microsoft SMTP Server id 14.16.227.3;
	Mon, 10 Feb 2014 05:32:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1WCjTh-000875-Cs; Sun, 09 Feb 2014 21:32:21 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [RFT] eglibc 2.19
Thread-Index: AQHPJOg8Y6qTLTUskESFpp3Wo78cvZqt67YQ
Date: Mon, 10 Feb 2014 05:32:19 +0000
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
In-Reply-To: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.59]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <31681ec9-08a2-426e-b3d2-72f6c0d22073@AM1EHSMHS015.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
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
X-List-Received-Date: Mon, 10 Feb 2014 05:32:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Sunday, February 09, 2014 2:08 AM
> To: Patches and discussions about the oe-core layer; openembeded-devel;
> yocto@yoctoproject.org
> Subject: [OE-core] [RFT] eglibc 2.19
> =

> Hi all
> =

> I have staged a branch with eglibc 2.19 upgraded recipes here
> =

> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglib=
c-
> 2.19
> =

> These are not final recipes there may be tweaks needed like adjusting
> SRC_URI
> later on.
> =

> please help testing it out in your environments and machines
> I would be happy to help out with issues we find

Hi Khem,

I have given it a test with the machines on the meta-xilinx layer, specific=
ally ARM Cortex A9 and MicroBlaze architectures. And there appears to be no=
 issues.

Also I couldn't access your eglibc source tarball because of pesky corporat=
e web filters, so I used a direct svn export of the upstream repo at the re=
vision 25243, I assume there should be no differences?

On a side note, I haven't seen any mention of what is next regarding oe-cor=
e and eglibc. Since the eglibc project has closed its development (http://w=
ww.eglibc.org/archives/patches/msg01327.html), and that 2.19 is the final v=
ersion. Are there any plans to switch oe-core to using glibc for the future=
? Just curious is all.

Regards,
Nathan

> =

> Thank you
> =

> -Khem
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



