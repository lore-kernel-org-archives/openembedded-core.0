Return-Path: <B28495@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe004.messaging.microsoft.com [207.46.163.27])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5746A9E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:02:53 +0000 (UTC)
Received: from mail45-co9-R.bigfish.com (10.236.132.252) by
	CO9EHSOBE021.bigfish.com (10.236.130.84) with Microsoft SMTP Server id
	14.1.225.22; Tue, 9 Jul 2013 08:02:53 +0000
Received: from mail45-co9 (localhost [127.0.0.1])	by mail45-co9-R.bigfish.com
	(Postfix) with ESMTP id 69446600114	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:02:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371I542I1432Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail45-co9 (localhost.localdomain [127.0.0.1]) by mail45-co9
	(MessageSwitch) id 137335697266003_5751; Tue,  9 Jul 2013 08:02:52 +0000
	(UTC)
Received: from CO9EHSMHS032.bigfish.com (unknown [10.236.132.242])	by
	mail45-co9.bigfish.com (Postfix) with ESMTP id F32372C005F	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:02:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS032.bigfish.com
	(10.236.130.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 9 Jul 2013 08:02:51 +0000
Received: from 039-SN2MPN1-011.039d.mgd.msft.net ([169.254.1.99]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.03.0136.001; Tue, 9 Jul 2013 08:05:01 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] common-licenses: Adding netperf
Thread-Index: AQHOfHjXSLa15FPg/kSDw2wYLyOJTplb+6Ig
Date: Tue, 9 Jul 2013 08:01:58 +0000
Message-ID: <AF604684617F454390621992F367F1690BA97FAF@039-SN2MPN1-011.039d.mgd.msft.net>
References: <1373356003-20356-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1373356003-20356-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.99]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] common-licenses: Adding netperf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jul 2013 08:02:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Netperf is restricted license. I don't think oe-core will accept it.

We add below line in fsl-setup-poky:
echo "# whiteliste restricted license" >> conf/local.conf
echo "LICENSE_FLAGS_WHITELIST =3D \"non-commercial_netperf\"" >> conf/local=
.conf

-Ting

> -----Original Message-----
> From: Guo Chunrong-B40290
> Sent: Tuesday, July 09, 2013 3:47 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo
> Chunrong-B40290
> Subject: [OE-core][PATCH] common-licenses: Adding netperf
>=20
>        *netperf requires it's own specific license when
>        add meta-openembedded layer
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/files/common-licenses/netperf |   43
> ++++++++++++++++++++++++++++++++++++
>  1 files changed, 43 insertions(+), 0 deletions(-)  create mode 100644
> meta/files/common-licenses/netperf
>=20
> diff --git a/meta/files/common-licenses/netperf b/meta/files/common-
> licenses/netperf
> new file mode 100644
> index 0000000..3f3ceb2
> --- /dev/null
> +++ b/meta/files/common-licenses/netperf
> @@ -0,0 +1,43 @@
> +
> +
> +              Copyright (C) 1993 Hewlett-Packard Company
> +                         ALL RIGHTS RESERVED.
> +
> +  The enclosed software and documentation includes copyrighted works
> + of Hewlett-Packard Co. For as long as you comply with the following
> + limitations, you are hereby authorized to (i) use, reproduce, and
> + modify the software and documentation, and to (ii) distribute the
> + software and documentation, including modifications, for
> + non-commercial purposes only.
> +
> +  1.  The enclosed software and documentation is made available at no
> +      charge in order to advance the general development of
> +      high-performance networking products.
> +
> +  2.  You may not delete any copyright notices contained in the
> +      software or documentation. All hard copies, and copies in
> +      source code or object code form, of the software or
> +      documentation (including modifications) must contain at least
> +      one of the copyright notices.
> +
> +  3.  The enclosed software and documentation has not been subjected
> +      to testing and quality control and is not a Hewlett-Packard Co.
> +      product. At a future time, Hewlett-Packard Co. may or may not
> +      offer a version of the software and documentation as a product.
> +
> +  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> +      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> +      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> +      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> +      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> +      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> +      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> +      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> +      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> +
> +  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
> +      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> +      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> +      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
> +
> +
> --
> 1.7.5.4



