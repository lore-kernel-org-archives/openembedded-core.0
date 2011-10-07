Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RCD2Z-0002vr-G1
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 18:12:51 +0200
Received: from mail176-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE015.bigfish.com (10.43.70.65) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Oct 2011 16:07:14 +0000
Received: from mail176-ch1 (localhost.localdomain [127.0.0.1])	by
	mail176-ch1-R.bigfish.com (Postfix) with ESMTP id 1171DCC0344	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 16:07:14 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail176-ch1 (localhost.localdomain [127.0.0.1]) by mail176-ch1
	(MessageSwitch) id 1318003633989141_19840;
	Fri,  7 Oct 2011 16:07:13 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail176-ch1.bigfish.com (Postfix) with ESMTP id
	E82DD16D0053	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 16:07:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 7 Oct 2011 16:07:13 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Fri, 7 Oct 2011 11:07:12 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/6] Fix perl for powerpc64 build
Thread-Index: AQHMg5GU8cOir1liD0yhm0P6URX2wZVxXwaAgAAD5YA=
Date: Fri, 7 Oct 2011 16:07:11 +0000
Message-ID: <CAEsOVNeFud2ev-T+++AnV+A-kqM0v5ni2ADO7GzrSbodXFrXyw@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-2-git-send-email-msm@freescale.com>
	<1317815212.14671.142.camel@ted>
	<CAEsOVNdUTaVc1NR0hDH7PU1gVCXotJWEJquiz=EMQXQ231GmzA@mail.gmail.com>
	<1318002781.8533.16.camel@ted>
In-Reply-To: <1318002781.8533.16.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/6] Fix perl for powerpc64 build
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
X-List-Received-Date: Fri, 07 Oct 2011 16:12:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <47FBC6DDDB67604EB3B89D67A3223F31@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 7, 2011 at 10:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Do you still need this bit:
>
> =A0 =A0 =A0 =A0case "${TARGET_ARCH}" in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64 | powerpc | s390)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 x86_64 | powerpc | powerpc64 | s390)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i -e "s,\(need_va_cop=
y=3D\)'undef',\1'define',g" \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config.sh-=
${TARGET_ARCH}-${TARGET_OS}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;

Missing this does not seem to affect things negatively so far, I've
been build testing mostly though - will revisit this later if
something comes up.

-M=



