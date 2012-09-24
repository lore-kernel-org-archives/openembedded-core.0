Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGF7f-0008Bo-5U
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:19:19 +0200
Received: from mail32-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE001.bigfish.com (10.243.66.64) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 20:06:29 +0000
Received: from mail32-co1 (localhost [127.0.0.1])	by mail32-co1-R.bigfish.com
	(Postfix) with ESMTP id E8B219C00F4;
	Mon, 24 Sep 2012 20:06:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ahbe9i1155h)
Received: from mail32-co1 (localhost.localdomain [127.0.0.1]) by mail32-co1
	(MessageSwitch) id 1348517187925337_23566;
	Mon, 24 Sep 2012 20:06:27 +0000 (UTC)
Received: from CO1EHSMHS027.bigfish.com (unknown [10.243.78.249])	by
	mail32-co1.bigfish.com (Postfix) with ESMTP id D5C1F780046;
	Mon, 24 Sep 2012 20:06:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS027.bigfish.com
	(10.243.66.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 20:06:26 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 15:06:25 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] libx11.inc: disable warnings that don't
	work on certain compilers
Thread-Index: AQHNmo9Neh5HA2KHJUaVw2FGObezaJeZ6uwA
Date: Mon, 24 Sep 2012 20:06:24 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A2D4F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<20120924200050.GF3295@jama.jama.net>
In-Reply-To: <20120924200050.GF3295@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Mon, 24 Sep 2012 20:19:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1C3453B91AB3F74CB436461A363C8C04@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 3:00 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Sep 24, 2012 at 02:55:45PM -0500, Matthew McClintock wrote:
>> Fixes these sorts of issues present on older gcc (CentOS 5.x in this cas=
e)
>>
>> | cc1: error: unrecognized command line option "-Werror=3Dimplicit"
>> | cc1: error: unrecognized command line option "-Werror=3Dnonnull"
>> | cc1: error: unrecognized command line option "-Werror=3Dinit-self"
>> | cc1: error: unrecognized command line option "-Werror=3Dmain"
>> | cc1: error: unrecognized command line option "-Werror=3Dmissing-braces=
"
>> | cc1: error: unrecognized command line option "-Werror=3Dsequence-point=
"
>> | cc1: error: unrecognized command line option "-Werror=3Dreturn-type"
>> | cc1: error: unrecognized command line option "-Werror=3Dtrigraphs"
>> | cc1: error: unrecognized command line option "-Werror=3Darray-bounds"
>> | cc1: error: unrecognized command line option "-Werror=3Dwrite-strings"
>> | cc1: error: unrecognized command line option "-Werror=3Daddress"
>> | cc1: error: unrecognized command line option "-Werror=3Dint-to-pointer=
-cast"
>> | cc1: error: unrecognized command line option "-Werror=3Dpointer-to-int=
-cast"
>
> Shouldn't it be applied only for -native? version?

That's reasonable. But, suppressing warnings to compile logs also did
not seem to matter much since we don't go line by line on warnings in
compile logs (does anyone?). I'll go with the consensus though.

-M

>
> Cheers,
>
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-graphics/xorg-lib/libx11.inc |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-gr=
aphics/xorg-lib/libx11.inc
>> index 3ecd9e5..0e99442 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
>> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
>> @@ -11,7 +11,7 @@ inherit siteinfo
>>  FILESPATH =3D "${FILE_DIRNAME}/libx11"
>>
>>  PE =3D "1"
>> -INC_PR =3D "r8"
>> +INC_PR =3D "r9"
>>
>>  PROVIDES =3D "virtual/libx11"
>>
>> @@ -23,6 +23,7 @@ DEPENDS +=3D "xproto xextproto xtrans libxcb kbproto i=
nputproto"
>>  DEPENDS +=3D "xproto-native"
>>
>>  EXTRA_OECONF +=3D "--with-keysymdefdir=3D${STAGING_INCDIR}/X11/"
>> +EXTRA_OEMAKE =3D '-e CWARNFLAGS=3D""'
>>
>>  # Let people with incredibly archaic requirements enable Xcms and BigFo=
nt, but
>>  # disable them by default.
>> --
>> 1.7.9.7
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



