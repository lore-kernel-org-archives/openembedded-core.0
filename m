Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SrEuJ-0007lM-TR
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 23:02:12 +0200
Received: from mail151-va3-R.bigfish.com (10.7.14.254) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 17 Jul 2012 20:50:51 +0000
Received: from mail151-va3 (localhost [127.0.0.1])	by
	mail151-va3-R.bigfish.com (Postfix) with ESMTP id 670FD3A022A;
	Tue, 17 Jul 2012 20:50:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail151-va3 (localhost.localdomain [127.0.0.1]) by mail151-va3
	(MessageSwitch) id 1342558249990836_408;
	Tue, 17 Jul 2012 20:50:49 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.252])	by
	mail151-va3.bigfish.com (Postfix) with ESMTP id ECFE9201BB;
	Tue, 17 Jul 2012 20:50:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 17 Jul 2012 20:50:45 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 17 Jul 2012 15:50:45 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Scott Garman
	<scott.a.garman@intel.com>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 01/43] augeas: Add libxml2
	dependency
Thread-Index: AQHNZF3VBpDKnBag20Gzfp5EVXwEDw==
Date: Tue, 17 Jul 2012 20:50:44 +0000
Message-ID: <CAEsOVNcQjab=W948TM+wLdAPMHgebpC8B1inKXej0vXye4cNRw@mail.gmail.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<eba75c041a60939d158a949742574cffc0e4a204.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <eba75c041a60939d158a949742574cffc0e4a204.1334940120.git.sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [CONSOLIDATED PULL 01/43] augeas: Add libxml2 dependency
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
X-List-Received-Date: Tue, 17 Jul 2012 21:02:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <12ABD75A7FEE554B8B3C72D2EB918E2A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

denzil needs this commit to get build order right. I've added it too:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dmattsm/denz=
il

-M

On Fri, Apr 20, 2012 at 11:44 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Martin Donnelly <martin.donnelly@ge.com>
>
> This patch fixes the following Augeas configure error.
>
> | checking for LIBXML... no
> | configure: error: Package requirements (libxml-2.0) were not met:
> |
> | No package 'libxml-2.0' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables LIBXML_CFLAGS
> | and LIBXML_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | ERROR: oe_runconf failed
>
> Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
> ---
>  meta/recipes-extended/augeas/augeas.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-exten=
ded/augeas/augeas.inc
> index 40be762..9fe864d 100644
> --- a/meta/recipes-extended/augeas/augeas.inc
> +++ b/meta/recipes-extended/augeas/augeas.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b1=
34d42ed5ee802b37ff"
>
>  SRC_URI =3D "http://augeas.net/download/${BP}.tar.gz"
>
> -DEPENDS =3D "readline"
> +DEPENDS =3D "readline libxml2"
>
>  inherit autotools
>
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



