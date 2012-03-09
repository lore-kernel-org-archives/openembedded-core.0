Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S63Pk-0004DB-Q2
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 18:15:37 +0100
Received: from mail53-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Mar 2012 17:06:56 +0000
Received: from mail53-tx2 (localhost [127.0.0.1])	by mail53-tx2-R.bigfish.com
	(Postfix) with ESMTP id 815C3E030C	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 17:06:56 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail53-tx2 (localhost.localdomain [127.0.0.1]) by mail53-tx2
	(MessageSwitch) id 1331312814744715_27255;
	Fri,  9 Mar 2012 17:06:54 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.247])	by
	mail53-tx2.bigfish.com (Postfix) with ESMTP id A74BB2E0045	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 17:06:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Mar 2012 17:06:51 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.5]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 9 Mar 2012 11:06:51 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH] bitbake.conf: use PACKAGE_ARCH
	instead of TARGET_ARCH in SDK_NAME
Thread-Index: AQHM/hI1XFEs7U/2yECkjNkVZwAwDZZijRQAgAAHlACAAAG4gA==
Date: Fri, 9 Mar 2012 17:06:50 +0000
Message-ID: <CAEsOVNfvxQuWAQCymP4xg4VLSXh4KPTSirLLtrzg_hHh=fuCfQ@mail.gmail.com>
References: <20120301094052.GB3831@jama.jama.net>
	<1331275706-6917-1-git-send-email-Martin.Jansa@gmail.com>
	<CAEsOVNd4kfQvzaDxku3KOSzMFfcFbUpakM1GvnfLiPxuVdvm5w@mail.gmail.com>
	<CAEsOVNfpw=FOvmUjvPKaEVp6TO6T-RvhUuC2DJ8sKSMBzK67RA@mail.gmail.com>
	<20120309170020.GH3813@jama.jama.net>
In-Reply-To: <20120309170020.GH3813@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] bitbake.conf: use PACKAGE_ARCH instead of TARGET_ARCH in SDK_NAME
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
X-List-Received-Date: Fri, 09 Mar 2012 17:15:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AABEFD3BF79BE040A1290F2C121132B0@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 9, 2012 at 11:00 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Mar 09, 2012 at 04:33:33PM +0000, McClintock Matthew-B29882 wrote=
:
>> On Fri, Mar 9, 2012 at 10:32 AM, Matthew McClintock <msm@freescale.com> =
wrote:
>> > On Fri, Mar 9, 2012 at 12:48 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> >> * also use weak assignment for SDK_NAME_PREFIX as suggested by khem
>> >> * PACKAGE_ARCH is not 100% right too, because such SDK image usually =
has few
>> >> =A0machine specific packages included (e.g. base-files, securetty, op=
kg configs)
>> >> =A0but those are not important for SDK users so it's better to have o=
ne SDK for
>> >> =A0whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would=
 work the
>> >> =A0same.
>> >> =A0You can see diff between crespo and om-gta04 SDK here:
>> >> =A0http://build.shr-project.org/shr-core-staging/031/sdk/oecore-i686-=
armv7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff
>> >>
>> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> ---
>> >> =A0meta/conf/bitbake.conf | =A0 =A04 ++--
>> >> =A01 files changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> >> index 87bb71c..91f8397 100644
>> >> --- a/meta/conf/bitbake.conf
>> >> +++ b/meta/conf/bitbake.conf
>> >> @@ -364,8 +364,8 @@ PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TA=
RGET_SYS}"
>> >> =A0# SDK variables,
>> >> =A0##################################################################
>> >>
>> >> -SDK_NAME_PREFIX =3D "oecore"
>> >> -SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
>> >> +SDK_NAME_PREFIX ?=3D "oecore"
>> >> +SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${PACKAGE_ARCH}"
>> >
>> > Why PACKAGE_ARCH over TUNE_ARCH?
>>
>> Or rather TUNE_PKGARCH?
>
> In
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/018543.=
html
> I've said:
>
> "And we should change TARGET_ARCH in SDK_NAME to PACKAGE_ARCH or TUNE_PKG=
ARCH"
>
> So why TUNE_ARCH/TUNE_PKGARCH over PACKAGE_ARCH?
>
> I don't see the advantage, but if there is some I'll update it in v2.

Well for powerpc (PACKAGE_ARCH) we have ppce500mc, ppce500v2, and
ppce5500 (TUNEPKG_ARCH) and for powerpc64 we have ppc64e5500. This is
what I would want my toolchain to convey - not sure what the best
generic solution is.

-M=



