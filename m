Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SDHsW-00045h-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 18:07:12 +0200
Received: from mail26-am1-R.bigfish.com (10.3.201.239) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Mar 2012 15:58:08 +0000
Received: from mail26-am1 (localhost [127.0.0.1])	by mail26-am1-R.bigfish.com
	(Postfix) with ESMTP id 358BD26098D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 15:58:08 +0000 (UTC)
X-SpamScore: -13
X-BigFish: VS-13(zzbb2dI9371I1b0bM1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail26-am1 (localhost.localdomain [127.0.0.1]) by mail26-am1
	(MessageSwitch) id 1333036687635_11131;
	Thu, 29 Mar 2012 15:58:07 +0000 (UTC)
Received: from AM1EHSMHS017.bigfish.com (unknown [10.3.201.237])	by
	mail26-am1.bigfish.com (Postfix) with ESMTP id E8433200067	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 15:58:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS017.bigfish.com
	(10.3.207.155) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Mar 2012 15:58:06 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 29 Mar 2012 10:58:04 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] powerpc: define TUNE_PKGARCH for
	powerpc/powerpc-nf
Thread-Index: AQHNDWcWaFGUF6IwukC6rEwZIl9i0w==
Date: Thu, 29 Mar 2012 15:58:04 +0000
Message-ID: <CAEsOVNcbLXA-16E+sFhTExa0oZ62bGEXeNmzzjBOvmLaUPAoYg@mail.gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
	<CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
	<CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
	<4F7481FE.3020505@windriver.com>
In-Reply-To: <4F7481FE.3020505@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Thu, 29 Mar 2012 16:07:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <336112D35C572842B3156E46E383BB29@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 10:38 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> On 3/28/12 11:54 PM, Chris Larson wrote:
>>
>> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> =A0wrote:
>>>
>>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson<clarson@kergoth.com>
>>> =A0wrote:
>>>>>
>>>>> If you can explain why the override isn't overriding the default
>>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can
>>>>> consistently
>>>>> modify all of the elements... I'm happy to accept the changes to all =
of
>>>>> the
>>>>> tunings.
>>>>
>>>>
>>>> See above. It's not an override. And plenty of files already specify
>>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>>> do so for the defaults, personally.
>>>
>>>
>>> If no one else has complained so far it makes me believe they are not
>>> missing any TUNE_PKGARCH_tune-<tune> =A0then.
>>
>>
>> I don't understand the point you're attempting to make here.
>
>
> Just an FYI -- I've not forgotten about this.. I'm going to look into wha=
t
> is currently implemented and figure out how to get it to be consistent..
> things have definitely changed since the initial implementation, and thin=
gs
> are no longer consistent.
>
> Hopefully I'll have an update later today.

Just for some background:

I added the TUNEPKG_ARCH =3D TUNE_PKGARCH_tune-$DEFAULTTUNE bit because
it seemed to make sense and it was missing from this list:

meta/conf/bitbake.conf:TUNE_FEATURES ??=3D "${TUNE_FEATURES_tune-${DEFAULTT=
UNE}}"
meta/conf/bitbake.conf:PACKAGE_EXTRA_ARCHS ??=3D
"${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"

Also it seemed silly (at the time admittedly) to set TUNE_PKGARCH
based off a value in TUNE_FEATURES and using bb functions to do this
when the way I went with was simply setting a value. I did miss that
the default case no longer works properly unless you have a
TUNE_PKGARCH_tune-{powerpc,powerpc-nf,powerpc64} =3D
{powerpc,powerpc-nf,powerpc64} set in the default arch files.

Anyways, I'm not stuck on one particular method at the time I was
trying to get ppce5500 multilib working properly.

-M=



