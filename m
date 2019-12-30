Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0475A7D70B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 01:16:37 +0000 (UTC)
IronPort-SDR: YYNO9Ln546SAHx6qM/OqEhVOb4Q0KA1tNkB0Fs8wPEKx97Kk2a/BJYiEbEVqbo7DDLlKtZ8zMZ
	NodVXN8egN8ZnFOygbP6X/qx76azxG9eGhA3TikppoGYkd4R1w4hepaLlMG50BV63IwM1Hkq0x
	7KBdTy9oqZ4Bw1U8gcyGMnzQImbhnCAuin8v2UOAx4Et0EOIf9J3ILNOY+U9CYsWddBoLCV5H1
	G6Qanvp0fhxx39ATRQo8Ko2SAxv/NQTs/w+qyhNb44sA4ypI3UkXGqcU301Jw/auVwMfhOxhgJ
	gjo=
X-IronPort-AV: E=Sophos;i="5.69,373,1571695200"; 
   d="scan'208";a="3961729"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] scripts: add pkgdataui
Thread-Index: AQHVr1KUVUawII5ZdUaxZUFJesR8/qfR/BPg
Date: Mon, 30 Dec 2019 01:16:37 +0000
Message-ID: <a5e91d5ad9674452b9c9d3309884e7d3@XBOX03.axis.com>
References: <20191210120817.8374-1-ross.burton@intel.com>
In-Reply-To: <20191210120817.8374-1-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: add pkgdataui
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
X-List-Received-Date: Mon, 30 Dec 2019 01:16:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 10 december 2019 13:08
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] scripts: add pkgdataui
>=20
> pkgdataui is a Python 3/GObject Introspection/GTK+ 3 tool to browse the p=
kgdata

Would it make sense to rename it to oe-pkgdata-browser (based on the title =
it=20
gives itself, and the existing oe-pkgadata-util tool)?

> database at your leisure.  By being graphical it is easier to explore and=
 can
> follow links between packages.
>=20
> This is very much a work in progress, so be gentle and patches are welcom=
e.

I get the following errors when I run it (though the GUI comes up and seems=
=20
to work):

libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  scripts/pkgdataui.glade | 335 ++++++++++++++++++++++++++++++++++++++++

Can the .glade file be put somewhere else than in the scripts directory?=20
Because as it is now, it shows up when using tab completion (with zsh).

>  scripts/pkgdataui.py    | 241 +++++++++++++++++++++++++++++
>  2 files changed, 576 insertions(+)
>  create mode 100644 scripts/pkgdataui.glade
>  create mode 100755 scripts/pkgdataui.py

//Peter


