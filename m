Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2PZF-0001BL-Hl
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 18:10:56 +0100
Received: from mail252-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE013.bigfish.com (10.7.40.63) with Microsoft SMTP Server id
	14.1.225.23; Mon, 4 Feb 2013 16:09:39 +0000
Received: from mail252-va3 (localhost [127.0.0.1])	by
	mail252-va3-R.bigfish.com (Postfix) with ESMTP id 63954124032A;
	Mon,  4 Feb 2013 16:09:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(z37d4lz98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail252-va3 (localhost.localdomain [127.0.0.1]) by mail252-va3
	(MessageSwitch) id 1359994177485893_18015;
	Mon,  4 Feb 2013 16:09:37 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.239])	by
	mail252-va3.bigfish.com (Postfix) with ESMTP id 6A7751DC00E2;
	Mon,  4 Feb 2013 16:09:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 4 Feb 2013 16:09:28 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Mon, 4 Feb 2013 16:09:27 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] [oe-core] oprofile: avoid processing files under .pc
Thread-Index: AQHOAGSscaLnUp7nh0iUmQ3ezjdzwZhlcUKAgAAoNgCABEmoAA==
Date: Mon, 4 Feb 2013 16:09:28 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A86C4CA@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1359713558-22689-1-git-send-email-b28495@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A868DE0@039-SN1MPN1-002.039d.mgd.msft.net>
	<CABcZANmJKuAt1OronH3DspEaCtRk=b=ZARdymk1NqadNG=WHwg@mail.gmail.com>
In-Reply-To: <CABcZANmJKuAt1OronH3DspEaCtRk=b=ZARdymk1NqadNG=WHwg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oprofile: avoid processing files under .pc
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
X-List-Received-Date: Mon, 04 Feb 2013 17:11:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <22A64A20CE1FB44ABCD3A04D6CB1C652@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 1, 2013 at 4:40 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> On Fri, Feb 1, 2013 at 1:16 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> On Fri, Feb 1, 2013 at 4:12 AM,  <b28495@freescale.com> wrote:
>> > From: Ting Liu <b28495@freescale.com>
>> >
>> > Fix the below issue:
>> > | DEBUG: Executing shell function do_configure
>> > | sed: can't read ./.pc/opstart.patch/doc/opstop.1.in: Permission deni=
ed
>> > | sed: can't read ./.pc/opstart.patch/doc/opstart.1.in: Permission
>> > denied
>> > | sed: can't read ./.pc/opstart.patch/utils/opstart.c: Permission deni=
ed
>> > | ERROR: Function failed: do_configure
>>
>> Permissions are messed up on these files, obviously:
>>
>> $ ls -alh .pc/opstart.patch/doc/
>> total 12K
>> drwxr-sr-x 2 jenkins jenkins 4.0K Jan 31 20:49 .
>> drwxr-sr-x 4 jenkins jenkins 4.0K Jan 31 20:49 ..
>> -rw-r--r-- 1 jenkins jenkins 2.5K Jan 31 20:49 Makefile.am
>> ---------- 1 jenkins jenkins    0 Jan 31 20:49 opstart.1.in
>> ---------- 1 jenkins jenkins    0 Jan 31 20:49 opstop.1.in
>>
>> But this was only occurring on one machine (our CentOS box). So, I've
>> actually isolated this down to the version of patch we were using
>> which is creating these new files with odd permissions.
>>
>> So, I'm not sure how to handle this - do we actually require a newer
>> version of patch? patch-native is assume provided and we can't just
>> remove that since we will get circular deps.
>>
>> Should we require the user upgrade patch on this old CentOS 5.x box? I
>> need to leave now so I'm leaving the problem here for now to see if
>> anyone else has a comment.
>
>
> This seems like a silly reason to require a newer patch version, when it'=
s
> trivial to fix the recipe to not enter .pc, IMO. Nothing should be modify=
ing
> files in there directly anyway.

Sounds good to me.

-M=



