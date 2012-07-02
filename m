Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SljXP-0003oq-H0
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 18:31:47 +0200
Received: from mail115-va3-R.bigfish.com (10.7.14.253) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Mon, 2 Jul 2012 15:18:27 +0000
Received: from mail115-va3 (localhost [127.0.0.1])	by
	mail115-va3-R.bigfish.com (Postfix) with ESMTP id 06111E030B	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 15:18:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ahbe9i)
Received: from mail115-va3 (localhost.localdomain [127.0.0.1]) by mail115-va3
	(MessageSwitch) id 1341242304804691_21062;
	Mon,  2 Jul 2012 15:18:24 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.246])	by
	mail115-va3.bigfish.com (Postfix) with ESMTP id AC97532004B	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 15:18:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 2 Jul 2012 15:18:21 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Mon, 2 Jul 2012 10:20:17 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6 v2] Enable the ability to create an image
	matching SDK
Thread-Index: AQHNWGYv5DOyUIM0eUaHkkyGciFUxg==
Date: Mon, 2 Jul 2012 15:20:17 +0000
Message-ID: <CAEsOVNdKPAY8yOdGUXo18Scn8qMrgckrfe_jJ7ojMxVSg0raBw@mail.gmail.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341032578.git.mark.hatle@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 0/6 v2] Enable the ability to create an image matching SDK
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
X-List-Received-Date: Mon, 02 Jul 2012 16:31:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8B10C764A784BE4597506F019DAF70B8@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Mark,

By 'match the image' you mean the libraries in the toolchain tarball
will contain matching versions that are on the root file system?

-M

On Sat, Jun 30, 2012 at 12:18 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> Only difference is patch 1/6, I accidently sent and older broken version =
of the
> patch. =A0This is the correct version.
>
> ---
>
> After this series of patches, it is possible to generate an SDK that
> matches the image. =A0The SDK and all related code is only activated if a=
n image
> recipe is built using the "populate_sdk" task, such as:
>
> bitbake core-image-sato -c populate_sdk
>
> Existing SDK images, such as meta-toolchain or meta-toolchain-gmae contin=
ue to
> work without modifications.
>
> The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4=
ac:
>
> =A0 mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)
>
> are available in the git repository at:
> =A0 git://git.pokylinux.org/poky-contrib mhatle/sdk
> =A0 http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/sdk
>
> Mark Hatle (6):
> =A0 Fix manual log file paths
> =A0 populate_sdk.bbclass: Split into two parts
> =A0 populate_sdk: Allow for attempt only packages in the SDK
> =A0 populate_sdk_base.bbclass: Change to using task specific depends
> =A0 populate_sdk: enable basic multilib support
> =A0 image.bbclass: Add support to build the SDK in parallel with the
> =A0 =A0 image
>
> =A0meta/classes/image.bbclass =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A07 ++-
> =A0meta/classes/package_deb.bbclass =A0 =A0 =A0 | =A0 =A04 +-
> =A0meta/classes/package_ipk.bbclass =A0 =A0 =A0 | =A0 =A02 +-
> =A0meta/classes/package_rpm.bbclass =A0 =A0 =A0 | =A0 10 +-
> =A0meta/classes/populate_sdk.bbclass =A0 =A0 =A0| =A0 91 +---------------=
------
> =A0meta/classes/populate_sdk_base.bbclass | =A0128 ++++++++++++++++++++++=
++++++++++
> =A0meta/classes/populate_sdk_deb.bbclass =A0| =A0 =A06 +-
> =A0meta/classes/populate_sdk_ipk.bbclass =A0| =A0 =A05 +-
> =A0meta/classes/populate_sdk_rpm.bbclass =A0| =A0 =A04 +-
> =A0meta/classes/rootfs_deb.bbclass =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0meta/classes/rootfs_ipk.bbclass =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0meta/classes/toolchain-scripts.bbclass | =A0 16 +++--
> =A012 files changed, 170 insertions(+), 107 deletions(-)
> =A0create mode 100644 meta/classes/populate_sdk_base.bbclass
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



