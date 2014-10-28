Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B220065CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 01:36:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9S1a7rL025624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Oct 2014 18:36:08 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.16]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Mon, 27 Oct 2014 18:36:07 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH] which-2.18: Make sure ChangeLog exists for
	automake
Thread-Index: AQHP8cvH934aq9MkGU2K3pmAPIMNoJxEuvHA
Date: Tue, 28 Oct 2014 01:36:06 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD53AB0C@ALA-MBA.corp.ad.wrs.com>
References: <1414403082-28396-1-git-send-email-jackie.huang@windriver.com>
	<20141027095248.GC2430@jama>
In-Reply-To: <20141027095248.GC2430@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] which-2.18: Make sure ChangeLog exists for automake
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
X-List-Received-Date: Tue, 28 Oct 2014 01:36:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Monday, October 27, 2014 5:53 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] which-2.18: Make sure ChangeLog exists for=
 automake
>=20
> On Mon, Oct 27, 2014 at 05:44:42AM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Fixed:
> > Makefile.am: error: required file './ChangeLog' not found
>=20
> Isn't it better to pass foreign to automake?

Yes, it's better, I will change it, thanks!

Thanks,
Jackie

>=20
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta/recipes-extended/which/which_2.18.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-
> extended/which/which_2.18.bb
> > index 5fa5d9e..49e9248 100644
> > --- a/meta/recipes-extended/which/which_2.18.bb
> > +++ b/meta/recipes-extended/which/which_2.18.bb
> > @@ -25,6 +25,9 @@ do_configure_prepend() {
> >  	OLD=3D"@ACLOCAL_CWFLAGS@"
> >  	NEW=3D"-I ${STAGING_DIR_NATIVE}/${datadir}/cwautomacros/m4"
> >  	sed -i "s#${OLD}#${NEW}#g" `grep -rl ${OLD} ${S}`
> > +
> > +	# Make sure ChangeLog exists for automake
> > +	touch ${S}/ChangeLog
> >  }
> >
> >  ALTERNATIVE_${PN} =3D "which"
> > --
> > 2.0.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

