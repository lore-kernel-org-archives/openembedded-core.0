Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SD7j8-0003Wb-9V
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 07:16:50 +0200
Received: from mail181-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Mar 2012 05:07:46 +0000
Received: from mail181-tx2 (localhost [127.0.0.1])	by
	mail181-tx2-R.bigfish.com (Postfix) with ESMTP id B28C146061F	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:07:46 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail181-tx2 (localhost.localdomain [127.0.0.1]) by mail181-tx2
	(MessageSwitch) id 1332997665119363_24496;
	Thu, 29 Mar 2012 05:07:45 +0000 (UTC)
Received: from TX2EHSMHS034.bigfish.com (unknown [10.9.14.243])	by
	mail181-tx2.bigfish.com (Postfix) with ESMTP id 18BED1C0067	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 05:07:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS034.bigfish.com
	(10.9.99.134) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Mar 2012 05:07:44 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Thu, 29 Mar 2012 00:07:43 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] powerpc: define TUNE_PKGARCH for
	powerpc/powerpc-nf
Thread-Index: AQHNDWcWaFGUF6IwukC6rEwZIl9i05aBCSUAgAADgoA=
Date: Thu, 29 Mar 2012 05:07:43 +0000
Message-ID: <CAEsOVNdgtsx5=77z_WPf3K-_vR9yH5WwxBqtorXwE-wxK59Phw@mail.gmail.com>
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
In-Reply-To: <CABcZANnyVxQsJ6ntV=DTeOtPb3R=d8=JSbny8+iOAT8XV99+UQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Thu, 29 Mar 2012 05:16:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D6FDF666C7382240801F861CB8524CC7@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 11:54 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Mar 28, 2012 at 9:47 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>> On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson <clarson@kergoth.com> wrot=
e:
>>>> If you can explain why the override isn't overriding the default
>>>> TUNE_PKGARCH (and it's intentional and not a bug), and we can consiste=
ntly
>>>> modify all of the elements... I'm happy to accept the changes to all o=
f the
>>>> tunings.
>>>
>>> See above. It's not an override. And plenty of files already specify
>>> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
>>> do so for the defaults, personally.
>>
>> If no one else has complained so far it makes me believe they are not
>> missing any TUNE_PKGARCH_tune-<tune> then.
>
> I don't understand the point you're attempting to make here.

Nevermind.

Anyways, powerpc64 needs these too...

-M=



