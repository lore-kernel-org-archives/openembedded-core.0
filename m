Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RzBXZ-0005a4-Uv
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 19:31:18 +0100
Received: from mail42-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Sun, 19 Feb 2012 18:22:58 +0000
Received: from mail42-ch1 (localhost [127.0.0.1])	by mail42-ch1-R.bigfish.com
	(Postfix) with ESMTP id A05FF20039A	for
	<openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2012 18:22:58 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail42-ch1 (localhost.localdomain [127.0.0.1]) by mail42-ch1
	(MessageSwitch) id 1329675775391749_11548;
	Sun, 19 Feb 2012 18:22:55 +0000 (UTC)
Received: from CH1EHSMHS020.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.227])	by mail42-ch1.bigfish.com (Postfix) with ESMTP id
	5C06F40048 for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2012 18:22:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS020.bigfish.com
	(10.43.70.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 19 Feb 2012 18:22:55 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sun, 19 Feb 2012 12:22:55 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] useradd: Add missing DEPEND on shadow
Thread-Index: AQHM7tg0PUQHDhYhBkusb6mkJ5e9XZZEt48AgAA2OoA=
Date: Sun, 19 Feb 2012 18:22:55 +0000
Message-ID: <CAEsOVNfV8JWJRuFM8w7gUhCLYJYn4TrQOU+rFkR0JjXJayO1FQ@mail.gmail.com>
References: <1320883434.10843.244.camel@ted>
	<CAEsOVNfS-UvJPCR527463OzKJLvVxK7GAnwr_==Lz7sjEOsYbA@mail.gmail.com>
	<1329664108.7006.15.camel@ted>
In-Reply-To: <1329664108.7006.15.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: useradd: Add missing DEPEND on shadow
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
X-List-Received-Date: Sun, 19 Feb 2012 18:31:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D5BC8641725E4B40AB8C38B72E259ECA@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2012 at 7:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2012-02-19 at 07:29 +0000, McClintock Matthew-B29882 wrote:
>> On Wed, Nov 9, 2011 at 4:03 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Without this rootfs generation fails as an RDEPENDS is added
>> > but the package might not have bneen built.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbcla=
ss
>> > index 8cd7f4f..7faf1a7 100644
>> > --- a/meta/classes/useradd.bbclass
>> > +++ b/meta/classes/useradd.bbclass
>> > @@ -2,7 +2,7 @@
>> > =A0# target sysroot, and shadow -native and -sysroot provide the utili=
ties
>> > =A0# and support files needed to add and modify user and group account=
s
>> > =A0DEPENDS_append =3D "${USERADDDEPENDS}"
>> > -USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot"
>> > +USERADDDEPENDS =3D " base-passwd shadow-native shadow-sysroot shadow"
>>
>> The shadow recipe is a 'PACKAGE_ARCH =3D "${MACHINE_ARCH}"' recipe. This
>> makes all recipes that inherit useradd depend on shadow which will
>> depend on the MACHINE being built for. Ideally, we just need a way to
>> ensure these packages are deployed - we don't want them to effect
>> signatures.
>>
>> Can you suggest a better fix here? Some
>> bb.exec_func("shadow:do_populate_sysroot") or something equivalent?
>
> This was already fixed:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D7c8899662be56=
23bedaa9a848fafebeafb348cf0
>
> and the new machine specific subpackage is excluded from sstate's
> signatures.

Ah missed this - thanks.

-M=



