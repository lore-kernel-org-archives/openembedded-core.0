Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THdQJ-0004ED-5c
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 18:28:20 +0200
Received: from mail251-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 16:15:25 +0000
Received: from mail251-ch1 (localhost [127.0.0.1])	by
	mail251-ch1-R.bigfish.com (Postfix) with ESMTP id 29F2D148010B;
	Fri, 28 Sep 2012 16:15:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail251-ch1 (localhost.localdomain [127.0.0.1]) by mail251-ch1
	(MessageSwitch) id 1348848924318403_8334;
	Fri, 28 Sep 2012 16:15:24 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.228])	by mail251-ch1.bigfish.com (Postfix) with ESMTP id
	413F06C0044;	Fri, 28 Sep 2012 16:15:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 16:15:22 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Fri, 28 Sep 2012 11:15:21 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v2 09/10] binutils.inc: add vardep on
	multiarch DISTRO_FEATURE
Thread-Index: AQHNnWSLYLFiAWcnnU+C0BdbtW3kUA==
Date: Fri, 28 Sep 2012 16:15:21 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B7113@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-9-git-send-email-msm@freescale.com>
	<1348828323.15753.44.camel@ted>
	<CAEsOVNedwk-YhQLgJXf7Jffm7DDR0A49fg-T0imC90x-EJS98A@mail.gmail.com>
In-Reply-To: <CAEsOVNedwk-YhQLgJXf7Jffm7DDR0A49fg-T0imC90x-EJS98A@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Sep 2012 16:28:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E29A2828BA980D4D99E97F197B6C37C4@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 10:06 AM, Matthew McClintock <msm@freescale.com> wr=
ote:
> On Fri, Sep 28, 2012 at 5:32 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2012-09-27 at 20:33 -0500, Matthew McClintock wrote:
>>> binutils will build differently if this feature is enabled, so
>>> make the do_configure step depend on it
>>>
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>> Not sure if we should try to fix via configure options
>>>
>>> v2: update commit message a bit
>>>
>>>  meta/recipes-devtools/binutils/binutils.inc |    2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes=
-devtools/binutils/binutils.inc
>>> index ee748a4..ff64882 100644
>>> --- a/meta/recipes-devtools/binutils/binutils.inc
>>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>>> @@ -80,6 +80,8 @@ export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BUILD_C=
C}"
>>>  export CPP_FOR_BUILD =3D "${BUILD_CPP}"
>>>  export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
>>>
>>> +MULTIARCH :=3D "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "=
yes", "no", d)}"
>>> +do_configure[vardeps] +=3D "MULTIARCH"
>>>  do_configure () {
>>>       (cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
>>>       oe_runconf
>>
>> This doesn't make sense. oe_runconf should depend on EXTRA_OECONF and
>> that should depend on DISTRO_FEATURES so the dependency should already
>> exist?
>
> OK, maybe... let me just explain what I did to see an issue.
>
> Let's say I did a build without MULTIARCH and everything went fine.
> Then I went back and added mutliarch. binutils would not rebuild with
> the new features and things would break. With this patch, after added
> multiarch binutils would rebuild and the the build work OK.
>
> As you say though, if this was an actual dep it should have rebuilt
> already? Has anything changed in this area very recently?

Looking closer it seems like EXTRA_OECONF does not do this quite right
when resolving base_contains parameters:

List of dependencies for variable EXTRA_OECONF is
set(['gettext_oeconf', 'STAGING_DIR_TARGET', 'base_contains',
'TARGET_PREFIX'])

-M=



