Received: from mail-va3.bigfish.com ([216.32.180.10]
	helo=VA3EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNrZP-0003nl-SA
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:42:56 +0100
Received: from mail140-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Tue, 8 Nov 2011 19:36:18 +0000
Received: from mail140-va3 (localhost [127.0.0.1])	by
	mail140-va3-R.bigfish.com (Postfix) with ESMTP id 9C4E63000C5;
	Tue,  8 Nov 2011 19:35:02 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h63h)
X-Spam-TCS-SCL: 2:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail140-va3 (localhost.localdomain [127.0.0.1]) by mail140-va3
	(MessageSwitch) id 1320780896591121_1130;
	Tue,  8 Nov 2011 19:34:56 +0000 (UTC)
Received: from VA3EHSMHS002.bigfish.com (unknown [10.7.14.246])	by
	mail140-va3.bigfish.com (Postfix) with ESMTP id 6519A180054;
	Tue,  8 Nov 2011 19:34:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS002.bigfish.com
	(10.7.99.12) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 8 Nov 2011 19:36:02 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Tue, 8 Nov 2011 13:36:24 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "philb@gnu.org" <philb@gnu.org>
Thread-Topic: [OE-core] [PATCH v2] Introduce new SERIAL_CONSOLES to add
	multiple consoles for your MACHINE
Thread-Index: AQHMnaF36K23AM1ubkmAuCM3o0WGmpWjxJsA
Date: Tue, 8 Nov 2011 19:36:23 +0000
Message-ID: <CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
	<CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
In-Reply-To: <CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Tue, 08 Nov 2011 19:42:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2D5A5A6073544543AC2FA1DEAB68D3F6@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> I don't get it. I think the first version was still OK. The first
> version is pasted below.
>
>> + =A0 =A0idx=3D0
>> + =A0 =A0tmp=3D"${SERIAL_CONSOLES}" <- If it's not defined this will cat=
ch it.
>> + =A0 =A0for i in $tmp
>> + =A0 =A0do
>> + =A0 =A0 j=3D`echo ${i} | sed s/\;/\ /g`
>> + =A0 =A0 =A0 =A0echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >=
> ${D}${sysconfdir}/inittab
>> + =A0 =A0 idx=3D`expr $idx + 1`
>> + =A0 =A0done
>
> See my inline comment above, but if SERIAL_CONSOLES is not defined
> tmp=3D"" and the for loop won't execute. Not sure if there is a more
> standard way to do this though.

ping..

-M=



