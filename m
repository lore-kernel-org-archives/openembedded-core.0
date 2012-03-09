Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S62tX-0003M0-AN
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:42:19 +0100
Received: from mail154-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Mar 2012 16:33:39 +0000
Received: from mail154-ch1 (localhost [127.0.0.1])	by
	mail154-ch1-R.bigfish.com (Postfix) with ESMTP id EAE711605C2	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 16:33:38 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail154-ch1 (localhost.localdomain [127.0.0.1]) by mail154-ch1
	(MessageSwitch) id 1331310816928901_10818;
	Fri,  9 Mar 2012 16:33:36 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.228])	by mail154-ch1.bigfish.com (Postfix) with ESMTP id
	DF10D220049	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 16:33:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Mar 2012 16:33:34 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.5]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 9 Mar 2012 10:33:33 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH] bitbake.conf: use PACKAGE_ARCH
	instead of TARGET_ARCH in SDK_NAME
Thread-Index: AQHM/hI1XFEs7U/2yECkjNkVZwAwDZZijRQA
Date: Fri, 9 Mar 2012 16:33:33 +0000
Message-ID: <CAEsOVNfpw=FOvmUjvPKaEVp6TO6T-RvhUuC2DJ8sKSMBzK67RA@mail.gmail.com>
References: <20120301094052.GB3831@jama.jama.net>
	<1331275706-6917-1-git-send-email-Martin.Jansa@gmail.com>
	<CAEsOVNd4kfQvzaDxku3KOSzMFfcFbUpakM1GvnfLiPxuVdvm5w@mail.gmail.com>
In-Reply-To: <CAEsOVNd4kfQvzaDxku3KOSzMFfcFbUpakM1GvnfLiPxuVdvm5w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Fri, 09 Mar 2012 16:42:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B392031137AF79448B30A167A67FB453@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 9, 2012 at 10:32 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Fri, Mar 9, 2012 at 12:48 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> * also use weak assignment for SDK_NAME_PREFIX as suggested by khem
>> * PACKAGE_ARCH is not 100% right too, because such SDK image usually has=
 few
>> =A0machine specific packages included (e.g. base-files, securetty, opkg =
configs)
>> =A0but those are not important for SDK users so it's better to have one =
SDK for
>> =A0whole e.g. armv7a-vfp-neon then 6 SDK for each machine which would wo=
rk the
>> =A0same.
>> =A0You can see diff between crespo and om-gta04 SDK here:
>> =A0http://build.shr-project.org/shr-core-staging/031/sdk/oecore-i686-arm=
v7a-vfp-neon-toolchain-efl-crespo-om-gta04.diff
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> =A0meta/conf/bitbake.conf | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 87bb71c..91f8397 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -364,8 +364,8 @@ PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TARGE=
T_SYS}"
>> =A0# SDK variables,
>> =A0##################################################################
>>
>> -SDK_NAME_PREFIX =3D "oecore"
>> -SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
>> +SDK_NAME_PREFIX ?=3D "oecore"
>> +SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${PACKAGE_ARCH}"
>
> Why PACKAGE_ARCH over TUNE_ARCH?

Or rather TUNE_PKGARCH?

-M=



