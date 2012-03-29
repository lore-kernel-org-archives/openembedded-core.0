Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SD7Pq-0001Fd-8N
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 06:56:55 +0200
Received: from mail38-db3-R.bigfish.com (10.3.81.229) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 29 Mar 2012 04:47:51 +0000
Received: from mail38-db3 (localhost [127.0.0.1])	by mail38-db3-R.bigfish.com
	(Postfix) with ESMTP id 3DC28240407	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 04:47:51 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail38-db3 (localhost.localdomain [127.0.0.1]) by mail38-db3
	(MessageSwitch) id 1332996469499221_30189;
	Thu, 29 Mar 2012 04:47:49 +0000 (UTC)
Received: from DB3EHSMHS004.bigfish.com (unknown [10.3.81.234])	by
	mail38-db3.bigfish.com (Postfix) with ESMTP id 73A75600BB	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 04:47:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS004.bigfish.com
	(10.3.87.104) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 29 Mar 2012 04:47:49 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 28 Mar 2012 23:47:47 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] powerpc: define TUNE_PKGARCH for
	powerpc/powerpc-nf
Thread-Index: AQHNDWcWaFGUF6IwukC6rEwZIl9i0w==
Date: Thu, 29 Mar 2012 04:47:46 +0000
Message-ID: <CAEsOVNc9s=t77p4iN5DU6FP5=NVe4Lr+ZV=SG2BrZZ6-AtcKng@mail.gmail.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
	<CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
In-Reply-To: <CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Mar 2012 04:56:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <20105420E6C5D44E910585B75B54504D@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 5:16 PM, Chris Larson <clarson@kergoth.com> wrote:
>> If you can explain why the override isn't overriding the default
>> TUNE_PKGARCH (and it's intentional and not a bug), and we can consistent=
ly
>> modify all of the elements... I'm happy to accept the changes to all of =
the
>> tunings.
>
> See above. It's not an override. And plenty of files already specify
> TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
> do so for the defaults, personally.

If no one else has complained so far it makes me believe they are not
missing any TUNE_PKGARCH_tune-<tune> then.

-M=



