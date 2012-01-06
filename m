Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rizby-0004E3-1T
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 03:32:54 +0100
Received: from mail189-tx2-R.bigfish.com (10.9.14.254) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 02:25:30 +0000
Received: from mail189-tx2 (localhost [127.0.0.1])	by
	mail189-tx2-R.bigfish.com (Postfix) with ESMTP id F2856C048C	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 02:25:29 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371I936eK542M1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail189-tx2 (localhost.localdomain [127.0.0.1]) by mail189-tx2
	(MessageSwitch) id 1325816729838314_10583;
	Fri,  6 Jan 2012 02:25:29 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.250])	by
	mail189-tx2.bigfish.com (Postfix) with ESMTP id C7D3738003F	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 02:25:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jan 2012 02:25:29 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 5 Jan 2012 20:25:29 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/28] Build Fixes and Updates
Thread-Index: AQHMy/emMOkEEO02qkiICTAdeQrEwZX+nEpQ
Date: Fri, 6 Jan 2012 02:25:28 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010C8E0B@039-SN2MPN1-023.039d.mgd.msft.net>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
	<CAEsOVNcVXE+hTNMBzHnVS_x9zs_Gp+_VKaop90n8h=-_Y_RJPQ@mail.gmail.com>
	<1325801780.20759.77.camel@ted>
In-Reply-To: <1325801780.20759.77.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Fri, 06 Jan 2012 02:32:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> Sent: Friday, January 06, 2012 6:16 AM
> To: McClintock Matthew-B29882; Patches and discussions about the oe-core =
layer
> Subject: Re: [OE-core] [CONSOLIDATED PULL 00/28] Build Fixes and Updates
>=20
> On Thu, 2012-01-05 at 15:57 +0000, McClintock Matthew-B29882 wrote:
> > On Thu, Jan 5, 2012 at 5:30 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >> Zhenhua Luo (1):
> > >>   linux-dtb: add multi-dtb build support and keep dtb in deploy cach=
e
> > >>     package
> > >
> > > This looks like it should be done in do_deploy and doesn't fix the
> > > real problem just adding some races in.
> >
> > Can you add a bit more info here? Should we be building all the device
> > trees in do_deploy? What races are added?
>=20
> I guess what I'm asking is why this isn't happening in kernel_do_deploy (=
with an
> append) and installing the files into ${DEPLOYDIR}? It seems to be append=
ing to
> do_install instead and this confuses the purposes of the different tasks.
>=20
> If the files were placed into ${DEPLOYDIR} as part of do_deploy, things w=
ould be
> much more consistent.
[Luo Zhenhua-B19537] I think you point is to merge do_install_append and do=
_deploy_append to do_deploy_append, right?


Best Regards,

Zhenhua




