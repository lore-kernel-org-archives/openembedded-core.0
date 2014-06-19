Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0ECC16FD24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:31:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5J2VbvG019855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jun 2014 19:31:37 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.48]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 18 Jun 2014 19:31:37 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] qt4-4.8.6: fix CVE-2014-0190
Thread-Index: AQHPitz8bpszRYVpXkGzaYhaukKWFpt3tw/A
Date: Thu, 19 Jun 2014 02:31:37 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA5D550@ALA-MBA.corp.ad.wrs.com>
References: <1403084491-1614-1-git-send-email-jackie.huang@windriver.com>
	<1403084491-1614-2-git-send-email-jackie.huang@windriver.com>
	<2587665.1JRAUNKIMA@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2587665.1JRAUNKIMA@peggleto-mobl5.ger.corp.intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.145]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] qt4-4.8.6: fix CVE-2014-0190
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
X-List-Received-Date: Thu, 19 Jun 2014 02:31:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Wednesday, June 18, 2014 6:06 PM
> To: Huang, Jie (Jackie)
> Cc: Zhu, Yanjun; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] qt4-4.8.6: fix CVE-2014-0190
>=20
> Hi Jackie,
>=20
> On Wednesday 18 June 2014 05:41:31 jackie.huang@windriver.com wrote:
> > From: yzhu1 <yanjun.zhu@windriver.com>
> >
> > The GIF decoder in QtGui in Qt before 5.3 allows remote attackers to
> > cause a denial of service (NULL pointer dereference) via invalid width
> > and height values in a GIF image.
> > Per: http://cwe.mitre.org/data/definitions/476.html
> >
> > CWE-476: NULL Pointer Dereference
> >
> > http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-0190
> > Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
> >  .../qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch    | 31
> > ++++++++++++++++++++++ 2 files changed, 32 insertions(+)
> >  create mode 100644
> > meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> >
> > diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> > b/meta/recipes-qt/qt4/qt4-4.8.6.inc index ae6692b..9db77c9 100644
> > --- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> > +++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
> > @@ -24,6 +24,7 @@ SRC_URI =3D
> > "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
> > file://0028-Don-t-crash-on-broken-GIF-images.patch \
> >             file://g++.conf \
> >             file://linux.conf \
> > +           file://qt4-4.8.6-fix-CVE-2014-0190.patch \
> >             "
> >
> >  SRC_URI[md5sum] =3D "2edbe4d6c2eff33ef91732602f3518eb"
> > diff --git
> > a/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> > b/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch new
> > file mode 100644 index 0000000..b8baea8
> > --- /dev/null
> > +++ b/meta/recipes-qt/qt4/qt4-4.8.6/qt4-4.8.6-fix-CVE-2014-0190.patch
> > @@ -0,0 +1,31 @@
> > +Upstream-status: Pending
> > +Don't crash on broken GIF images
> > +
> > +Broken GIF images could set invalid width and height values inside
> > +the image, leading to Qt creating a null QImage for it. In that case
> > +we need to abort decoding the image and return an error.
> > +
> > +Initial patch by Rich Moore.
> > +
> > +Task-number: QTBUG-38367
> > +Change-Id: Id82a4036f478bd6e49c402d6598f57e7e5bb5e1e
> > +Security-advisory: CVE-2014-0190
> > +Reviewed-by: Richard J. Moore <rich@kde.org>
> > +
> > +--- a/src/gui/image/qgifhandler.cpp
> > ++++ b/src/gui/image/qgifhandler.cpp
> > +@@ -359,6 +359,13 @@ int QGIFFormat::decode(QImage *image, co
> > +                     memset(bits, 0, image->byteCount());
> > +                 }
> > +
> > ++                // Check if the previous attempt to create the image
> > failed. If it ++                // did then the image is broken and we
> > should give up. ++                if (image->isNull()) {
> > ++                    state =3D Error;
> > ++                    return -1;
> > ++                }
> > ++
> > +                 disposePrevious(image);
> > +                 disposed =3D false;
> > +
>=20
> This upstream patch is already being applied within the recipe - see 0028=
-Don-t-crash-on-broken-GIF-
> images.patch.

Sorry I didn't notice it, thanks for pointing out and please ignore this.

Thanks,
Jackie

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

