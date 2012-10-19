Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TPHSN-0003TH-P7
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 20:38:04 +0200
Received: from mail117-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE012.bigfish.com (10.7.40.62) with Microsoft SMTP Server id
	14.1.225.23; Fri, 19 Oct 2012 18:24:42 +0000
Received: from mail117-va3 (localhost [127.0.0.1])	by
	mail117-va3-R.bigfish.com (Postfix) with ESMTP id D6FB940136;
	Fri, 19 Oct 2012 18:24:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 9
X-BigFish: VS9(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275ch17326ah8275bh8275dh11f642sz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail117-va3 (localhost.localdomain [127.0.0.1]) by mail117-va3
	(MessageSwitch) id 1350671079374475_31576;
	Fri, 19 Oct 2012 18:24:39 +0000 (UTC)
Received: from VA3EHSMHS024.bigfish.com (unknown [10.7.14.245])	by
	mail117-va3.bigfish.com (Postfix) with ESMTP id 56AEB60047;
	Fri, 19 Oct 2012 18:24:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS024.bigfish.com
	(10.7.99.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 19 Oct 2012 18:24:38 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.88]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Fri, 19 Oct 2012 18:24:37 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Mike Crowe <mac@mcrowe.com>
Thread-Topic: [OE-core] Using SSTATE_MIRRORS with sstate subdirectories
Thread-Index: AQHNrib/O7WmwQFMUk2RQIhBQDLu6Q==
Date: Fri, 19 Oct 2012 18:24:37 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A70D7ED@039-SN1MPN1-002.039d.mgd.msft.net>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<20121019165738.GC14620@mcrowe.com>
In-Reply-To: <20121019165738.GC14620@mcrowe.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Chris Larson <clarson@kergoth.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 18:38:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <771B3474BF8ECA4DBEADA62283BD74B0@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 11:57 AM, Mike Crowe <mac@mcrowe.com> wrote:
> On Fri, Oct 19, 2012 at 08:46:23AM -0700, Chris Larson wrote:
>> On Fri, Oct 19, 2012 at 8:38 AM, Mike Crowe <mac@mcrowe.com> wrote:
>> > I'm having trouble using SSTATE_MIRRORS as suggested at
>> > https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :
>> >
>> > SSTATE_MIRRORS ?=3D "file://.* file:///private/sstate-cache/"
>>
>> SSTATE_MIRRORS ?=3D "file://.* file:///private/sstate-cache/PATH"
>
> Thanks for your reply.
>
> Although that works for the simple case, if I try and do something
> more adventurous like:
>
> SSTATE_MIRRORS =3D "\
> file://Debian-testing/.* file:///private/sstate-cache/Debian-6.0.6/PATH \=
n \
> file://.* file:///private/sstate-cache/PATH \n \
> "
>
> Then I get paths like:
>
> DEBUG: For url file://Debian-testing/8c/sstate-tar-replacement-native-x86=
_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroo=
t.tgz returning file:///private/sstate-cache/Debian-6.0.6/Debian-testing/8c=
/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064=
ace38e0aa1acf2f618_populate-sysroot.tgz
>
> so I really would like to be able to say:
>
> "file://Debian-testing/(.*) file:///private/sstate-cache/Debian-6.0.6/\1"

Something like this might be what you are looking for:

SSTATE_MIRRORS =3D "file://.*/(.*)/(.*)
http://linux.freescale.net/yocto/sstate-cache/CentOS-5.8/\1/\2 \n"

This maps all native sstate-cache to my CentOS-5 box.

-M=



