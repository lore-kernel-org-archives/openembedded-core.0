Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S6PJp-0004JU-FX
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 17:38:58 +0100
Received: from mail41-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Sat, 10 Mar 2012 16:30:15 +0000
Received: from mail41-ch1 (localhost [127.0.0.1])	by mail41-ch1-R.bigfish.com
	(Postfix) with ESMTP id A041D603FE;
	Sat, 10 Mar 2012 16:30:15 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail41-ch1 (localhost.localdomain [127.0.0.1]) by mail41-ch1
	(MessageSwitch) id 1331397014342457_18279;
	Sat, 10 Mar 2012 16:30:14 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.238])	by mail41-ch1.bigfish.com (Postfix) with ESMTP id
	4F6204201D6;	Sat, 10 Mar 2012 16:30:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS021.bigfish.com
	(10.43.70.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 10 Mar 2012 16:30:14 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.5]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Sat, 10 Mar 2012 10:30:13 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] arch-powerpc.inc: use default value of
	TUNE_PKGARCH
Thread-Index: AQHM/tsRy3wW4rR/tEOF38qiR4jeAA==
Date: Sat, 10 Mar 2012 16:30:12 +0000
Message-ID: <CAEsOVNeqTC1-A3r4EeLyV_YqByPwkOxZtCQ79GbQDskNm64Ecg@mail.gmail.com>
References: <1331076055-15262-1-git-send-email-msm@freescale.com>
	<1331142081.25887.42.camel@ted>
In-Reply-To: <1331142081.25887.42.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [PATCH] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Sat, 10 Mar 2012 16:38:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <965A65DC322A2F4B86311FF0BA641A96@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 7, 2012 at 11:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-03-06 at 17:20 -0600, Matthew McClintock wrote:
>> We can use the default value for TUNE_PKGARCH, and now we just
>> append "-nf" if TARGET_FPU is fpu-soft
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =A0 =A06 ++----
>> =A01 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/c=
onf/machine/include/powerpc/arch-powerpc.inc
>> index c9b2829..abd72ed 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -18,10 +18,8 @@ TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES"=
, "fpu-soft", "soft", "", d)}
>>
>> =A0ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc=
-efd', 'ppc-efs']]}"
>>
>> -PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "=
", "-nf", d)}"
>> -
>> -PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>> +PPCPKGSFX_FPU =3D "${@['', '-nf'][bb.data.getVar('TARGET_FPU',d,1) in [=
'fpu-soft']]}"
>
> bb.data is deprecated and we should translate:
>
> bb.data.getVar('TARGET_FPU',d,1) -> d.getVar('TARGET_FPU', True)

I already sent a new patch here:

http://patches.openembedded.org/patch/22931/

-M=



