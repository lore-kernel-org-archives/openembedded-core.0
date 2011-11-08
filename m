Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNsif-0007Fu-Cw
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:56:33 +0100
Received: from mail206-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.22; Tue, 8 Nov 2011 20:49:55 +0000
Received: from mail206-ch1 (localhost.localdomain [127.0.0.1])	by
	mail206-ch1-R.bigfish.com (Postfix) with ESMTP id 5CD3017602E9	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 20:50:09 +0000 (UTC)
X-SpamScore: -19
X-BigFish: VS-19(zz9371K936eK1432N98dK4015Lzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail206-ch1 (localhost.localdomain [127.0.0.1]) by mail206-ch1
	(MessageSwitch) id 1320785407216544_26329;
	Tue,  8 Nov 2011 20:50:07 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail206-ch1.bigfish.com (Postfix) with ESMTP id
	3002D1A38050	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 20:50:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 8 Nov 2011 20:50:15 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 8 Nov 2011 14:50:14 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] Introduce new SERIAL_CONSOLES to add
	multiple consoles for your MACHINE
Thread-Index: AQHMnaF36K23AM1ubkmAuCM3o0WGmpWjxJsAgAAUCwCAAACVgA==
Date: Tue, 8 Nov 2011 20:50:13 +0000
Message-ID: <CAEsOVNfyeYRkEhL1LD1GYBrxqdvNEkjbG5fWgwpTRH_UEyxedA@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
	<CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
	<CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
	<1320785264.3080.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1320785264.3080.1.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Tue, 08 Nov 2011 20:56:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <299F468EBED2924BA853CA67738D703A@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 2:47 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-11-08 at 19:36 +0000, McClintock Matthew-B29882 wrote:
>> On Mon, Nov 7, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> w=
rote:
>> > I don't get it. I think the first version was still OK. The first
>> > version is pasted below.
>> >
>> >> + =A0 =A0idx=3D0
>> >> + =A0 =A0tmp=3D"${SERIAL_CONSOLES}" <- If it's not defined this will =
catch it.
>> >> + =A0 =A0for i in $tmp
>> >> + =A0 =A0do
>> >> + =A0 =A0 j=3D`echo ${i} | sed s/\;/\ /g`
>> >> + =A0 =A0 =A0 =A0echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}=
" >> ${D}${sysconfdir}/inittab
>> >> + =A0 =A0 idx=3D`expr $idx + 1`
>> >> + =A0 =A0done
>> >
>> > See my inline comment above, but if SERIAL_CONSOLES is not defined
>> > tmp=3D"" and the for loop won't execute. Not sure if there is a more
>> > standard way to do this though.
>>
>> ping..
>
> Yeah, now I look at this again I think it is probably OK. =A0Bitbake won'=
t
> expand ${SERIAL_CONSOLES} if it's unset, but the shell will and I think
> you probably will get the right results. =A0Assuming you've actually
> tested that case and it does work, I think I'm happy with what you have
> above.

Thanks Phil, I wanted to make sure I was not missing something obvious ;).

Maintainers, please consider v1 of this patch.

Thanks,
Matthew=



