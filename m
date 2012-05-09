Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SSGv6-0003e5-97
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:07:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 16:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141134352"
Received: from orsmsx605.amr.corp.intel.com ([10.22.226.10])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:57:53 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx605.amr.corp.intel.com (10.22.226.10) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 9 May 2012 16:57:53 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.157]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.73]) with mapi id
	14.01.0355.002; Wed, 9 May 2012 16:57:53 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] eglibc: fix build with poky-tiny distro
Thread-Index: AQHNLin8BLbRQHrNLU+AnCA9PXK+RpbCkhwA//+QXwA=
Date: Wed, 9 May 2012 23:57:52 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030E7F05@ORSMSX106.amr.corp.intel.com>
References: <cover.1336598125.git.nitin.a.kamble@intel.com>
	<43db6eddb847eef615f636bddf9be966fefe1a94.1336598125.git.nitin.a.kamble@intel.com>
	<4FAAFF78.1040500@linux.intel.com>
In-Reply-To: <4FAAFF78.1040500@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] eglibc: fix build with poky-tiny distro
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 10 May 2012 00:07:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@linux.intel.com]
> Sent: Wednesday, May 09, 2012 4:36 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 1/1] eglibc: fix build with poky-tiny
> distro
>=20
> Hi Nitin,
>=20
> On 05/09/2012 02:20 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > This fixes bug [YOCTO #2443]
>=20
> Awesome!
>=20
> Please include something about what the problem is and how the
> backported patch addresses it. The bugzilla reference is required, but
> it isn't sufficient. People need to be able to understand the problem
> and the approach of the solution from the commit log.
>=20
Ok, adding more information in the commit log on the contrib branch.

> Tested building an image for qemu with DISTRO=3D"poky-tiny" I assume?
>=20

Yes. Tested with poky-tiny for qemux86

Nitin

> Thanks,
>=20
> Darren
>=20
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../eglibc_fix_findidx_parameters.patch            |   38
> ++++++++++++++++++++
> >  meta/recipes-core/eglibc/eglibc_2.15.bb            |    3 +-
> >  2 files changed, 40 insertions(+), 1 deletions(-)  create mode
> 100644
> > meta/recipes-core/eglibc/eglibc-
> 2.15/eglibc_fix_findidx_parameters.pat
> > ch
> >
> > diff --git
> > a/meta/recipes-core/eglibc/eglibc-
> 2.15/eglibc_fix_findidx_parameters.p
> > atch
> > b/meta/recipes-core/eglibc/eglibc-
> 2.15/eglibc_fix_findidx_parameters.p
> > atch
> > new file mode 100644
> > index 0000000..bbf4605
> > --- /dev/null
> > +++ b/meta/recipes-core/eglibc/eglibc-
> 2.15/eglibc_fix_findidx_paramete
> > +++ rs.patch
> > @@ -0,0 +1,38 @@
> > +Upstream-Status: backport
> > +
> > +Imported patch from:
> > +http://www.eglibc.org/archives/patches/msg01124.html
> > +
> > +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> > +2012/05/09
> > +
> > +Index: libc/posix/xregex.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- libc.orig/posix/xregex.c
> > ++++ libc/posix/xregex.c
> > +@@ -2943,7 +2943,7 @@ PREFIX(regex_compile) (const char *ARG_P
> > + 				  _NL_CURRENT (LC_COLLATE,
> > + 					       _NL_COLLATE_INDIRECTWC);
> > +
> > +-				idx =3D findidx ((const wint_t**)&cp);
> > ++				idx =3D findidx ((const wint_t**)&cp, -1);
> > + 				if (idx =3D=3D 0 || cp < (wint_t*) str + c1)
> > + 				  /* This is no valid character.  */
> > + 				  FREE_STACK_RETURN (REG_ECOLLATE); @@ -3392,7
> +3392,7 @@
> > +PREFIX(regex_compile) (const char *ARG_P
> > + 			    indirect =3D (const int32_t *)
> > + 			      _NL_CURRENT (LC_COLLATE,
> _NL_COLLATE_INDIRECTMB);
> > +
> > +-			    idx =3D findidx (&cp);
> > ++			    idx =3D findidx (&cp, -1);
> > + 			    if (idx =3D=3D 0 || cp < str + c1)
> > + 			      /* This is no valid character.  */
> > + 			      FREE_STACK_RETURN (REG_ECOLLATE); @@ -6363,7
> +6363,7 @@
> > +byte_re_match_2_internal (struct re_patt
> > + 		      }
> > + 		    str_buf[i] =3D TRANSLATE(*(d+i));
> > + 		    str_buf[i+1] =3D '\0'; /* sentinel */
> > +-		    idx2 =3D findidx ((const wint_t**)&cp);
> > ++		    idx2 =3D findidx ((const wint_t**)&cp, -1);
> > + 		  }
> > +
> > + 		/* Update d, however d will be incremented at
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb
> > b/meta/recipes-core/eglibc/eglibc_2.15.bb
> > index e61816d..6b6b55c 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> > @@ -3,7 +3,7 @@ require eglibc.inc
> >  SRCREV =3D "17386"
> >
> >  DEPENDS +=3D "gperf-native"
> > -PR =3D "r8"
> > +PR =3D "r9"
> >  PR_append =3D "+svnr${SRCPV}"
> >
> >  EGLIBC_BRANCH=3D"eglibc-2_15"
> > @@ -24,6 +24,7 @@ SRC_URI =3D
> "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH};proto=3Dhtt=
p
> >             file://GLRO_dl_debug_mask.patch \
> >             file://initgroups_keys.patch \
> >             file://add-prefix-to-var.patch \
> > +           file://eglibc_fix_findidx_parameters.patch \
> >            "
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSES;md5=3D98a1128c4b58120182cbea3b1752d8b9 \
> >        file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833 \
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


