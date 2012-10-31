Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TTe4J-0005fs-Bx
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 20:35:15 +0100
Received: from mail140-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 31 Oct 2012 19:21:37 +0000
Received: from mail140-tx2 (localhost [127.0.0.1])	by
	mail140-tx2-R.bigfish.com (Postfix) with ESMTP id AFC4F201D3;
	Wed, 31 Oct 2012 19:21:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1521I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i1155h)
Received: from mail140-tx2 (localhost.localdomain [127.0.0.1]) by mail140-tx2
	(MessageSwitch) id 1351711295383503_28549;
	Wed, 31 Oct 2012 19:21:35 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.245])	by
	mail140-tx2.bigfish.com (Postfix) with ESMTP id 55FE080060;
	Wed, 31 Oct 2012 19:21:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 31 Oct 2012 19:21:33 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.121]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Wed, 31 Oct 2012 19:21:33 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNts9wc2/Ph/iHv0quNrquEzw2EpfTp9SAgAAkUoA=
Date: Wed, 31 Oct 2012 19:21:32 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A73BE8F@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<CADkTA4MzmofTtk7qvhU_2fsfKgmGRPmxf-zUzcj4FkzBDAP_rQ@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A73724E@039-SN1MPN1-002.039d.mgd.msft.net>
	<CADkTA4NBu0-M-N8VOQM470MgZszo5Bv+DXwmMazrqKKAxjVBSA@mail.gmail.com>
In-Reply-To: <CADkTA4NBu0-M-N8VOQM470MgZszo5Bv+DXwmMazrqKKAxjVBSA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phillips Kim-R1AAHA <R1AAHA@freescale.com>,
	Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Wed, 31 Oct 2012 19:35:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <418ED2E288C9594FA18F3553508E88A6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2012 at 12:11 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Tue, Oct 30, 2012 at 2:50 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> On Thu, Oct 18, 2012 at 8:33 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > On Thu, Oct 18, 2012 at 5:57 AM, Yashpal Dutta
>> > <yashpal.dutta@freescale.com> wrote:
>> >> This is a /dev/crypto device driver, equivalent to those in OpenBSD o=
r
>> >> FreeBSD.
>> >> The main idea is to access of existing ciphers in kernel space from
>> >> userspace,
>> >> thus enabling re-use of a hardware implementation of a cipher.
>> >
>> > I always use OCF for an overlapping set of functionality. To make this
>> > external
>> > module gracefully deal with a situation such as this, maybe a check fo=
r
>> > OCF
>> > in the kernel config ?
>> >
>> > The same thing could be said about having a kernel with this
>> > functionality
>> > already integrated (I have several of those as well).
>> >
>> > That's a more general question about what's the best way to gracefully
>> > deal
>> > with out of tree modules detecting that they are being built against a
>> > kernel
>> > that already has the functionality merged. The easy answer is that
>> > it's something
>> > the distro maintainer needs to know, and manage, and maybe that's the
>> > final answer. But I'm more wondering about this with respect to
>> > inter-operability
>> > of layers, if something in a layer depends/rdepends on this module, it
>> > will be
>> > pulled in, and won't that limit the mix/match/stacking of the various
>> > layers ?
>> >
>> > I added Richard for comment on the above.
>> >
>> > But that of course raises the question, why should this be in oe-core
>> > versus
>> > something like OCF ? This is definitely simpler, but OCF has it's use
>> > cases and
>> > advantages as well, that are an overlapping set of functionality.
>> >
>> > I don't have all the answers, just plenty of questions :)
>>
>> I'm not overly familiar with OCF. Does this just RCONFLICT with ocf-linu=
x?
>
>
> I missed this yesterday, sorry about that. gmail just left this in the
> thread and
> not in my inbox .. but anyway.
>
> I only see parts ocf in oe-core, but maybe I'm just not understanding wha=
t
> the
> recipe is doing (are you seeing more) ? i.e. ocf-linux is buried under th=
e
> open-ssl recipe, and really looks to be just providing headers.
>
> I'm doing some builds now to learn more .. which I just did .. and from w=
hat
> I
> can see, it is just the headers, which isn't all that useful without the
> kernel
> underpinning.

ocf-linux recipe does infact appear to be just headers. As far as what
it's used for I'm not even sure. I'll ask the crypto guys to chime in
here.

> OCF does definitely accelerate openssl when properly used in both the ker=
nel
> and
> userspace, but I'm not seeing the full offload kernel framework anywhere.

Can't comment what others do, it would be ideal if we got all users
talking here though.

> I wonder if anyone actually uses it :)

Good question, it was added by Saul so maybe he can chime in here.

> But yes AFAIC, if you had a full OCF, you need these to conflict, since
> they'll both
> try and enable/provide cryptodev.

Yashpal,

You should to add

RCONFLICTS_${PN} =3D "ocf-linux"

and/or maybe

RCONFLICTS_${PN}-dev =3D "ocf-linux-dev"

to your v2 of the patch.

-M=



