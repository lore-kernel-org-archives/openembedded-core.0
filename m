Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0586C494
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 14:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 839F41847A;
	Tue, 20 Nov 2018 15:29:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uz0midR9I4-N; Tue, 20 Nov 2018 15:29:27 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3DE85184A4;
	Tue, 20 Nov 2018 15:29:26 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20DC41E080;
	Tue, 20 Nov 2018 15:29:26 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 145BC1E07B;
	Tue, 20 Nov 2018 15:29:26 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 20 Nov 2018 15:29:26 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 07A14174D;
	Tue, 20 Nov 2018 15:29:26 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 20 Nov 2018 15:29:25 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 20 Nov 2018 15:29:25 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Tom Rini
	<trini@konsulko.com>
Thread-Topic: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
Thread-Index: AQHUf+9awZmDuYYKrUq4KBX/e5/F5KVW/JmAgABpToCAAAPSgIABTjxw
Date: Tue, 20 Nov 2018 14:29:25 +0000
Message-ID: <153f5864c09a48adb8c976d8671f3c46@XBOX04.axis.com>
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
	<CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
In-Reply-To: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Marek Vasut <marex@denx.de>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 20 Nov 2018 14:29:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Otavio Salvador
> Sent: den 19 november 2018 20:22
> To: Tom Rini <trini@konsulko.com>
> Cc: Marek Vasut <marex@denx.de>; linux-snps-arc@lists.infradead.org;
> Alexey Brodkin <alexey.brodkin@synopsys.com>; Otavio Salvador
> <otavio@ossystems.com.br>; Patches and discussions about the oe-core
> layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v3] u-boot: Add mkenvimage tool
>=20
> On Mon, Nov 19, 2018 at 5:08 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Nov 19, 2018 at 01:51:41PM +0100, Marek Vasut wrote:
> > > On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > > > This utility is used for creation of images containing
> > > > usable in run-time U-Boot environment.
> > > >
> > > > As of today this utility is added per-board like here [1]
> > > > for Intel Edison board.
> > > >
> > > > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-
> edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-
> tools_2014.04.bb
> > > >
> > > > Given there're quite some U-Boot tools that we may want to add
> later
> > > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-
> tools"
> > > > still for compatibility we provide "u-boot-mkimage" with help
> > > > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > > >
> > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > > > Cc: Martin Jansa <martin.jansa@gmail.com>
> > > > Cc: Ross Burton <ross.burton@intel.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> > >
> > > Do we want to generate one package per tool or not ?
> >
> > I think so, yes.  Not all places will want all tools.
>=20
> And a bonus to add a u-boot-tools-meta which rdepends on all. You can
> copy code to do that from gstreamer-plugins packages.

Actually, why mess with an unnecessary meta package. Just use the=20
empty ${PN} package for that. That works for the GStreamer packages=20
as well these days (since commit 8e1009a3), even though they do it=20
by depending on the meta packages for backwards compatibility.

//Peter

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750



