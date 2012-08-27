Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T65Yy-0007B7-5s
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 22:05:32 +0200
Received: from mail55-db3-R.bigfish.com (10.3.81.235) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Aug 2012 19:23:11 +0000
Received: from mail55-db3 (localhost [127.0.0.1])	by mail55-db3-R.bigfish.com
	(Postfix) with ESMTP id A19B53C00F8;
	Mon, 27 Aug 2012 19:23:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(zz98dI9371I936eI148cI1432I179dNzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail55-db3 (localhost.localdomain [127.0.0.1]) by mail55-db3
	(MessageSwitch) id 1346095388455158_27506;
	Mon, 27 Aug 2012 19:23:08 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.227])	by
	mail55-db3.bigfish.com (Postfix) with ESMTP id 63C1E8004A;
	Mon, 27 Aug 2012 19:23:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Aug 2012 19:23:07 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Mon, 27 Aug 2012 14:23:04 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] distutils/steuptools: Fix files layout and
	unbreak builds
Thread-Index: AQHNgjnTtVaeUjBwbUKK0mk83LuX75dp10OAgASKwwA=
Date: Mon, 27 Aug 2012 19:23:04 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A624A06@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
	<1345845661.14369.88.camel@ted>
In-Reply-To: <1345845661.14369.88.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
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
X-List-Received-Date: Mon, 27 Aug 2012 20:05:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CCD26B0F62ED584A9D214B4594544882@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 5:01 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-24 at 20:48 +0000, McClintock Matthew-B29882 wrote:
>> On Fri, Aug 24, 2012 at 11:15 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > The last two distutils changes progressively broke the builds. Firstly=
 they
>> > moved things from the site_packages directory to being higher up the t=
ree
>> > which introduced package QA warnings as a side effect. Secondly, it in=
teracts
>> > badly with setuptools which passes in --root=3D${D} itself.
>> >
>> > This patch restores the original directory layout, hence fixing the QA
>> > warnings and also passes extra options to setuptools to deal with the
>> > --root option it passes.
>>
>> Hmm, I think you don't need certain bits anymore
>>
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>> > diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.b=
bclass
>> > index 52a1aa8..c73b24f 100644
>> > --- a/meta/classes/distutils.bbclass
>> > +++ b/meta/classes/distutils.bbclass
>> > @@ -38,7 +38,7 @@ distutils_do_install() {
>> >          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>> >          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
>> >          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> > -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py instal=
l --install-lib=3D${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || =
\
>> > +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py instal=
l --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS}=
 || \
>>
>> This change should be handled by the bit below? So you could
>>
>> s/--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}//
>>
>> ?
>
> Not everything uses setuptools, there are things using just disutils.
> I'm open to further cleanup of this but we need to consider both
> cases...

Ah right, I incorrectly assumed both of these always applied.

Thanks for looking at this.

-M

>
> Cheers,
>
> Richard
>
>> >          bbfatal "python setup.py install execution failed."
>> >
>> >          for i in `find ${D} -name "*.py"` ; do \
>> > diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools=
.bbclass
>> > index ced9509..ba9cf13 100644
>> > --- a/meta/classes/setuptools.bbclass
>> > +++ b/meta/classes/setuptools.bbclass
>> > @@ -5,4 +5,5 @@ DEPENDS +=3D "python-setuptools-native"
>> >  DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
>> >      --single-version-externally-managed \
>> >      --prefix=3D${prefix} \
>> > +    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
>> >      --install-data=3D${datadir}"
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



