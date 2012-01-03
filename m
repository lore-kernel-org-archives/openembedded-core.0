Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Ri7E9-0004h6-CD
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 17:28:42 +0100
Received: from mail1-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Tue, 3 Jan 2012 16:21:20 +0000
Received: from mail1-ch1 (localhost [127.0.0.1])	by mail1-ch1-R.bigfish.com
	(Postfix) with ESMTP id 14D354C02EC	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 16:21:20 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I3b49K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail1-ch1 (localhost.localdomain [127.0.0.1]) by mail1-ch1
	(MessageSwitch) id 1325607677974280_5223;
	Tue,  3 Jan 2012 16:21:17 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail1-ch1.bigfish.com (Postfix) with ESMTP id
	DFFE8280048 for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 16:21:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 3 Jan 2012 16:21:17 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 10:21:16 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libxml2: add shared library version info to
	libxml shared libraries
Thread-Index: AQHMyjO3mZh1rlZoh0i2AKZGEAsoTg==
Date: Tue, 3 Jan 2012 16:21:16 +0000
Message-ID: <CAEsOVNcUdhic5Wt=r9XEb1SRmWw7+8Tn+4pWyB4Xdj4Mmv7+Lg@mail.gmail.com>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
	<20120102232228.GA3958@jama.jama.net>
	<20120102232521.GB3958@jama.jama.net>
In-Reply-To: <20120102232521.GB3958@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Tue, 03 Jan 2012 16:28:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <31A24D4DF6407645BA77F24BD1B5EBD3@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 2, 2012 at 5:25 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Jan 03, 2012 at 12:22:28AM +0100, Martin Jansa wrote:
>> On Mon, Jan 02, 2012 at 04:05:16PM -0600, Matthew McClintock wrote:
>> > This fixes an issue with RPM where it checks version imformation for
>> > binaries linked against libxml and fails because it's missing info
>> >
>> > | error: Failed dependencies:
>> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.6.0) is needed by =
fmc-0.9.7+2-r2.1.ppce500mc
>> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.4.30) is needed by=
 fmc-0.9.7+2-r2.1.ppce500mc
>> > | ERROR: Function 'do_rootfs' failed (see
>> >
>> > Note: fmc is just an example recipe/name
>>
>> Weird that I haven't noticed this in oe-core before, but probably
>> because in oe-core it was always without version. But it looks the same
>> as this
>> http://git.openembedded.org/openembedded/commit/?id=3D50ed401cdaaefb1f5a=
c33de2838af259a52b1c3a
>> so

You won't see this when building against oe-core stuff from source.
This issue is seen when we bring in a prebuilt binary and link against
libxml2 in the system.

>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> but also double check if all recipes depending on it needs PR bump too,
> I've expected that it's needed only for transition from versioned to not
> versioned symbols, but according to:
> http://git.openembedded.org/openembedded/commit/?id=3D4373bc4d0cde98dfa18=
8d9a06266afa06f970bfe
> http://git.openembedded.org/openembedded/commit/?id=3D7e673ab79c7d76ffc2b=
733fb32d0b41514eb0db0
> it was needed also other way around

Because of the reason above, I don't think we need to bump PR's for
all these recipes. People just should not normally be seeing this
issue. If they are well, then they won't be able to make an RPM based
rfs (maybe others)

Let me know if that seems reasonable...

-M=



