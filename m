Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THcNC-0001wz-Cr
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:21:02 +0200
Received: from mail31-co1-R.bigfish.com (10.243.78.246) by
	CO1EHSOBE008.bigfish.com (10.243.66.71) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 15:08:08 +0000
Received: from mail31-co1 (localhost [127.0.0.1])	by mail31-co1-R.bigfish.com
	(Postfix) with ESMTP id 32D2BD00247;
	Fri, 28 Sep 2012 15:08:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail31-co1 (localhost.localdomain [127.0.0.1]) by mail31-co1
	(MessageSwitch) id 1348844839541386_19608;
	Fri, 28 Sep 2012 15:07:19 +0000 (UTC)
Received: from CO1EHSMHS020.bigfish.com (unknown [10.243.78.228])	by
	mail31-co1.bigfish.com (Postfix) with ESMTP id 4A38EC80285;
	Fri, 28 Sep 2012 15:07:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS020.bigfish.com
	(10.243.66.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 15:07:04 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Fri, 28 Sep 2012 10:07:03 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v2 09/10] binutils.inc: add vardep on
	multiarch DISTRO_FEATURE
Thread-Index: AQHNnWSLYLFiAWcnnU+C0BdbtW3kUJef2vGA
Date: Fri, 28 Sep 2012 15:07:03 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B6E83@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-9-git-send-email-msm@freescale.com>
	<1348828323.15753.44.camel@ted>
In-Reply-To: <1348828323.15753.44.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 09/10] binutils.inc: add vardep on multiarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 28 Sep 2012 15:21:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FA19A58907B6AE4E83EC984A4036C153@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 5:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-09-27 at 20:33 -0500, Matthew McClintock wrote:
>> binutils will build differently if this feature is enabled, so
>> make the do_configure step depend on it
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> Not sure if we should try to fix via configure options
>>
>> v2: update commit message a bit
>>
>>  meta/recipes-devtools/binutils/binutils.inc |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-=
devtools/binutils/binutils.inc
>> index ee748a4..ff64882 100644
>> --- a/meta/recipes-devtools/binutils/binutils.inc
>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>> @@ -80,6 +80,8 @@ export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BUILD_CC=
}"
>>  export CPP_FOR_BUILD =3D "${BUILD_CPP}"
>>  export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
>>
>> +MULTIARCH :=3D "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "y=
es", "no", d)}"
>> +do_configure[vardeps] +=3D "MULTIARCH"
>>  do_configure () {
>>       (cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
>>       oe_runconf
>
> This doesn't make sense. oe_runconf should depend on EXTRA_OECONF and
> that should depend on DISTRO_FEATURES so the dependency should already
> exist?

OK, maybe... let me just explain what I did to see an issue.

Let's say I did a build without MULTIARCH and everything went fine.
Then I went back and added mutliarch. binutils would not rebuild with
the new features and things would break. With this patch, after added
multiarch binutils would rebuild and the the build work OK.

As you say though, if this was an actual dep it should have rebuilt
already? Has anything changed in this area very recently?

-M=



