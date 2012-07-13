Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Sph1r-0005sH-JV
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 16:39:35 +0200
Received: from mail116-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jul 2012 14:28:20 +0000
Received: from mail116-db3 (localhost [127.0.0.1])	by
	mail116-db3-R.bigfish.com (Postfix) with ESMTP id 5CBDE4043A;
	Fri, 13 Jul 2012 14:28:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I1443I1432I14e3Mzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail116-db3 (localhost.localdomain [127.0.0.1]) by mail116-db3
	(MessageSwitch) id 1342189699536769_19320;
	Fri, 13 Jul 2012 14:28:19 +0000 (UTC)
Received: from DB3EHSMHS009.bigfish.com (unknown [10.3.81.252])	by
	mail116-db3.bigfish.com (Postfix) with ESMTP id 8140F40004A;
	Fri, 13 Jul 2012 14:28:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS009.bigfish.com
	(10.3.87.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jul 2012 14:28:17 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 13 Jul 2012 09:28:16 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Bincy K Philip <bincy_k_philip@yahoo.co.in>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Error in rpm bitbake
Thread-Index: AQHNYQO9ZmW3yY65BUipm5vODNsTsg==
Date: Fri, 13 Jul 2012 14:28:15 +0000
Message-ID: <CAEsOVNdaBGNy2rDbqfA8ym+S7uMd3DA9FRAGunX0-MLRpuzcqg@mail.gmail.com>
References: <1342182619.93150.YahooMailNeo@web192606.mail.sg3.yahoo.com>
In-Reply-To: <1342182619.93150.YahooMailNeo@web192606.mail.sg3.yahoo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Error in rpm bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 13 Jul 2012 14:39:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7016EC8275AFAC41BCD60FDB0EEE64FD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Philip
<bincy_k_philip@yahoo.co.in> wrote:
> Dear all,
>
> I have started to work with open embedded only 3 months back.
>
> I got attached error log while trying for " bitbake rpm". This rpm failur=
e
> causes my bitbake core-image-minimal to fail.
>
>
> I have gone through some Google posts and understood dbconver.c causes th=
is
> error & need to exclude this file from compiling.I am not aware of how to=
 do
> that.Can anyone answer this?
>
> Also I have seen that there is one dbconvert.patch work in progress. But
> couldn't find out this file in open embedded git repository.
>
> Please help me to sort out this issue.This is really blocking me.
>
> Thanks in advance...

Bincy,

I submitted a patch for this a few days ago. Waiting for it to be
applied or for feedback:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/m=
aster&id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae

-M

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



