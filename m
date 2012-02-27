Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S28ct-0006UJ-DL
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 23:00:59 +0100
Received: from mail90-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 21:52:29 +0000
Received: from mail90-tx2 (localhost [127.0.0.1])	by mail90-tx2-R.bigfish.com
	(Postfix) with ESMTP id 397641E023F;
	Mon, 27 Feb 2012 21:52:29 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail90-tx2 (localhost.localdomain [127.0.0.1]) by mail90-tx2
	(MessageSwitch) id 1330379547507929_2581;
	Mon, 27 Feb 2012 21:52:27 +0000 (UTC)
Received: from TX2EHSMHS043.bigfish.com (unknown [10.9.14.253])	by
	mail90-tx2.bigfish.com (Postfix) with ESMTP id 791CD2C004B;
	Mon, 27 Feb 2012 21:52:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS043.bigfish.com
	(10.9.99.143) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 21:52:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Mon, 27 Feb 2012 15:52:24 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] arch-powerpc.inc: use default value of
	TUNE_PKGARCH
Thread-Index: AQHM9ZitFM6YWEDQ5Eyj6FPOiid9ypZRrXiA
Date: Mon, 27 Feb 2012 21:52:24 +0000
Message-ID: <CAEsOVNesVgqxo-yG3rj=22OoYD6OKiNZqeXxg2APZcu8qav4+Q@mail.gmail.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
	<1330371531-28803-3-git-send-email-msm@freescale.com>
	<CAEsOVNeSWS_X8UjbzofCOEdssxz8mVBtwEa+nwLzfrEXJW3MmQ@mail.gmail.com>
In-Reply-To: <CAEsOVNeSWS_X8UjbzofCOEdssxz8mVBtwEa+nwLzfrEXJW3MmQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/4] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Mon, 27 Feb 2012 22:00:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8742CCD56CA71C41B451E6D7DD9908A2@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 3:41 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Mon, Feb 27, 2012 at 1:38 PM, Matthew McClintock <msm@freescale.com> w=
rote:
>> We can use the default value for TUNE_PKGARCH, and now we just
>> append "-nf" if no float is the build target
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =A0 =A03 +--
>> =A01 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/c=
onf/machine/include/powerpc/arch-powerpc.inc
>> index c9b2829..350f9a9 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -20,8 +20,7 @@ ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU',=
 True) in ['ppc-efd', 'ppc-e
>>
>> =A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" ,=
 "", "-nf", d)}"
>
> This bit above needs to change too.. we need to reverse the logic:
>
> -PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" ,
> "", "-nf", d)}"
> +PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft" ,
> "-nf", "", d)}"
>
> So for parts with an SPE which define ppc-efd and ppc-efs we don't get
> the '-nf' appended (the part this patch adds just below)

Or perhaps after finding some python/bitbake foo:

PPCPKGSFX_FPU =3D "${@['', '-nf', '',
'-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['fpu-hard',
'fpu-soft', 'ppc-efs', 'ppc-efd']]}"

-M=



