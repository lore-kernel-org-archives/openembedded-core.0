Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGHNk-0002a8-95
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 00:44:04 +0200
Received: from mail120-am1-R.bigfish.com (10.3.201.241) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 22:31:15 +0000
Received: from mail120-am1 (localhost [127.0.0.1])	by
	mail120-am1-R.bigfish.com (Postfix) with ESMTP id A0FAD1E009B;
	Mon, 24 Sep 2012 22:31:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1432I11fbIzz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail120-am1 (localhost.localdomain [127.0.0.1]) by mail120-am1
	(MessageSwitch) id 1348525874400200_30552;
	Mon, 24 Sep 2012 22:31:14 +0000 (UTC)
Received: from AM1EHSMHS005.bigfish.com (unknown [10.3.201.236])	by
	mail120-am1.bigfish.com (Postfix) with ESMTP id 5DCDD1C004B;
	Mon, 24 Sep 2012 22:31:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS005.bigfish.com
	(10.3.207.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 22:31:14 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 17:31:11 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [PATCH 1/2] libx11.inc: disable warnings that don't
	work on certain compilers
Thread-Index: AQHNmo9Neh5HA2KHJUaVw2FGObezaJeaT9kA///DiAA=
Date: Mon, 24 Sep 2012 22:31:11 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A3928@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<20120924200050.GF3295@jama.jama.net>
	<CAEsOVNfNgM0b508hovOLYTFe=4o7XDD8meZ37t3UM+sVY4WM8w@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A31A1@039-SN1MPN1-001.039d.mgd.msft.net>
	<CABcZAN=GniLZ83Bjx_mstm2KiC4yk307=YLSxUQ+DJjpPHZrtQ@mail.gmail.com>
In-Reply-To: <CABcZAN=GniLZ83Bjx_mstm2KiC4yk307=YLSxUQ+DJjpPHZrtQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 22:44:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8BADBF645D15BC4689EED15DFFF54D04@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 4:07 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Sep 24, 2012 at 1:43 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Mon, Sep 24, 2012 at 3:06 PM, Matthew McClintock <msm@freescale.com> =
wrote:
>>> On Mon, Sep 24, 2012 at 3:00 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>> On Mon, Sep 24, 2012 at 02:55:45PM -0500, Matthew McClintock wrote:
>>>>> Fixes these sorts of issues present on older gcc (CentOS 5.x in this =
case)
>>>>>
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dimplicit"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dnonnull"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dinit-self"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dmain"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dmissing-bra=
ces"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dsequence-po=
int"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dreturn-type=
"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dtrigraphs"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Darray-bound=
s"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dwrite-strin=
gs"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Daddress"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dint-to-poin=
ter-cast"
>>>>> | cc1: error: unrecognized command line option "-Werror=3Dpointer-to-=
int-cast"
>>>>
>>>> Shouldn't it be applied only for -native? version?
>>>
>>> That's reasonable. But, suppressing warnings to compile logs also did
>>> not seem to matter much since we don't go line by line on warnings in
>>> compile logs (does anyone?). I'll go with the consensus though.
>>
>> Actually, this makes sense now because I'm seeing issues with
>> non-nativesdk packages with the '-e' I've added... thought I build
>> tested that... ;(
>
> Why is -e being added? It's almost always better to add the vars you
> need explicitly, imo. I wish we could change the default EXTRA_OEMAKE
> to drop it, personally. It can cause odd unintended consequences.

I think this was a holdover from trying to fix the issue fixed by
patch 2/2. I don't think it belogs - I was working on this Friday and
forgot everything today ;)

-M

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



