Return-Path: <anatol.oe@belski.net>
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id DA0057D414
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 21:50:32 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 8CA8817A2FE2; Sat, 29 Jun 2019 23:50:32 +0200 (CEST)
Received: from deanbelski76 (i577B7152.versanet.de [87.123.113.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 28F8317A030C; 
	Sat, 29 Jun 2019 23:50:30 +0200 (CEST)
From: <anatol.oe@belski.net>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <20190629192754.101979-1-anatol.oe@belski.net>
	<CAJTo0Lb1o8HVmrYAXAuh3Vkfzjm5rco5A5V-ECQT-j+FycLpMg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1o8HVmrYAXAuh3Vkfzjm5rco5A5V-ECQT-j+FycLpMg@mail.gmail.com>
Date: Sat, 29 Jun 2019 23:50:27 +0200
Message-ID: <836a01d52ec4$ab7cfae0$0276f0a0$@belski.net>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJE4EBNnjFwqoKChBjQ/hqrUU57dwK/mpm8pb3Ey9A=
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=anbelski@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-29T21:50:27.0223957Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8bc46a67-b237-4fa6-bb84-dcf0f004349b;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Sat, 29 Jun 2019 21:50:33 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us

Hi,


> -----Original Message-----
> From: Burton, Ross <ross.burton@intel.com>
> Sent: Saturday, June 29, 2019 9:30 PM
> To: anatol.oe@belski.net
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [thud][PATCH v2] bzip2: Fix CVE-2019-12900
>=20
> For master, lets upgrade to 1.0.7 instead.
>=20
Thanks for checking. Probably makes sense, yep. Whereby it's released =
just two days ago, after all the years :) Probably have time to expect =
some newer version.

In general, should I have posted this patch against master? As seems =
I've targeted thud only, according to the policies below

https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Or it's going to be merged up, if accepted?

Thanks

Anatol

> Ross
>=20
> On Sat, 29 Jun 2019 at 20:28, <anatol.oe@belski.net> wrote:
> >
> > From: Anatol Belski <anatol.belski@microsoft.com>
> >
> > Affects bzip2 <=3D 1.0.6
> >
> > Signed-off-by: Anatol Belski <anatol.belski@microsoft.com>
> > ---
> >  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 37
> +++++++++++++++++++
> >  meta/recipes-extended/bzip2/bzip2_1.0.6.bb    |  3 +-
> >  2 files changed, 39 insertions(+), 1 deletion(-)  create mode =
100644
> > meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> >
> > diff --git
> > a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > new file mode 100644
> > index 0000000000..8313fdcfcc
> > --- /dev/null
> > +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> > @@ -0,0 +1,37 @@
> > +bzip2: Fix CVE-2019-12900
> > +Upstream-Status: Accepted
> >
> +[https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d5
> > +1ef9824db71a8ffee5962cdbc]
> > +CVE: CVE-2019-12900
> > +Signed-off-by: Albert Astals Cid <aacid@kde.org>
> > +
> > +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17
> 00:00:00
> > +2001
> > +From: Albert Astals Cid <aacid@kde.org>
> > +Date: Tue, 28 May 2019 19:35:18 +0200
> > +Subject: [PATCH] Make sure nSelectors is not out of range
> > +
> > +nSelectors is used in a loop from 0 to nSelectors to access
> > +selectorMtf which is
> > +       UChar    selectorMtf[BZ_MAX_SELECTORS];
> > +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an =
invalid
> > +memory access
> > +
> > +Fixes out of bounds access discovered while fuzzying karchive
> > +---
> > + decompress.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/decompress.c b/decompress.c index ab6a624..f3db91d
> > +100644
> > +--- a/decompress.c
> > ++++ b/decompress.c
> > +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> > +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> > +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> > +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> > +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> > ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS)
> > ++ RETURN(BZ_DATA_ERROR);
> > +       for (i =3D 0; i < nSelectors; i++) {
> > +          j =3D 0;
> > +          while (True) {
> > +--
> > +2.21.0
> > +
> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > index 025f45c472..6791020d05 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> > @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://sourceware.org/bzip2/"
> >  SECTION =3D "console/utils"
> >  LICENSE =3D "bzip2"
> >  LIC_FILES_CHKSUM =3D
> =
"file://LICENSE;beginline=3D4;endline=3D37;md5=3D39406315f540c69bd05b1531=
da
> edd2ae"
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >  SRC_URI =3D =
"http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz
> \
> >             =
file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
> > \ @@ -14,6 +14,7 @@ SRC_URI =3D
> "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
> >             file://Makefile.am;subdir=3D${BP} \
> >             file://run-ptest \
> >             file://CVE-2016-3189.patch \
> > +           file://CVE-2019-12900.patch \
> >             "
> >
> >  SRC_URI[md5sum] =3D "00b516f4704d4a7cb50a1d97e6e8e15b"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


