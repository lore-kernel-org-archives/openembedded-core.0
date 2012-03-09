Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S63Oq-0004AW-EA
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 18:14:40 +0100
Received: from mail194-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Mar 2012 16:50:55 +0000
Received: from mail194-tx2 (localhost [127.0.0.1])	by
	mail194-tx2-R.bigfish.com (Postfix) with ESMTP id C38054205C7	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 16:50:55 +0000 (UTC)
X-SpamScore: -8
X-BigFish: VS-8(zzbb2dI9371I936eK1432N98dK853kzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail194-tx2 (localhost.localdomain [127.0.0.1]) by mail194-tx2
	(MessageSwitch) id 1331311854495868_13436;
	Fri,  9 Mar 2012 16:50:54 +0000 (UTC)
Received: from TX2EHSMHS042.bigfish.com (unknown [10.9.14.247])	by
	mail194-tx2.bigfish.com (Postfix) with ESMTP id 75FD7E0047	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2012 16:50:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS042.bigfish.com
	(10.9.99.142) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Mar 2012 16:50:53 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.5]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Fri, 9 Mar 2012 10:50:52 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] arch-powerpc.inc: use default value of
	TUNE_PKGARCH
Thread-Index: AQHM/hTJy3wW4rR/tEOF38qiR4jeAA==
Date: Fri, 9 Mar 2012 16:50:51 +0000
Message-ID: <CAEsOVNd098RzZBbxPUtZWJrgw2BBekrZrYeKfV+g_haYu-gxUw@mail.gmail.com>
References: <1331076055-15262-1-git-send-email-msm@freescale.com>
	<1331237734.3006.33.camel@ted> <4F5A33AD.4060800@windriver.com>
In-Reply-To: <4F5A33AD.4060800@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Fri, 09 Mar 2012 17:14:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <21E0707988C33E4BA00318F81EB5D204@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 9, 2012 at 10:45 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/8/12 2:15 PM, Richard Purdie wrote:
>>
>> On Tue, 2012-03-06 at 17:20 -0600, Matthew McClintock wrote:
>>>
>>> We can use the default value for TUNE_PKGARCH, and now we just
>>> append "-nf" if TARGET_FPU is fpu-soft
>>>
>>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>>> ---
>>> =A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =A0 =A06 ++----
>>> =A01 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> index c9b2829..abd72ed 100644
>>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>>> @@ -18,10 +18,8 @@ TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES=
",
>>> "fpu-soft", "soft", "", d)}
>>>
>>> =A0ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in
>>> ['ppc-efd', 'ppc-efs']]}"
>>>
>>> -PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , =
"",
>>> "-nf", d)}"
>>> -
>>> -PPCPKGARCH =3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
>>> -TUNE_PKGARCH ?=3D "${PPCPKGARCH}"
>>> +PPCPKGSFX_FPU =3D "${@['', '-nf'][bb.data.getVar('TARGET_FPU',d,1) in
>>> ['fpu-soft']]}"
>>> +TUNE_PKGARCH_append =3D "${PPCPKGSFX_FPU}"
>>
>>
>> Can we please do d.getVar(xxx, True) and not bb.data and ,1 :)
>
>
> This was originally done with a check for fpu-hard and not fpu-soft to
> ensure that fpu-soft became the default value when one or the other wasn'=
t
> set.
>
> I don't know if it really matters which is used, but that is why it was d=
one
> that way.

That logic was not quite working for us - since we don't set fpu-hard,
but rather ppc-efd and ppc-efs... so I had to invert this...

-M=



