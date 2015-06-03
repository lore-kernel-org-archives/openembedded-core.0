Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3586075803
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:21:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2015 02:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,546,1427785200"; d="scan'208";a="704503866"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.158])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 02:21:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2015 10:21:32 +0100
Message-ID: <204763218.4XLyK8UnXt@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <556DDB1B.508@gmail.com>
References: <20150312143521.GD2338@jama>
	<02e101d09cf9$458099b0$d081cd10$@lge.com> <556DDB1B.508@gmail.com>
MIME-Version: 1.0
Cc: =?utf-8?B?7J2066qF6rWs?= <myonggu.lee@lge.com>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Wed, 03 Jun 2015 09:21:34 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Armin,

Yes, Changhyeok and I took care of that last week.

Cheers,
Paul

On Tuesday 02 June 2015 09:34:35 akuster808 wrote:
> Changhyeok,
>=20
> On 06/01/2015 10:59 PM, Changhyeok Bae wrote:
> > Hi, I changed forked repo to https://github.com/meta-gir/meta-gir a=
nd
> > changed some components matched with dizzy.
> has the layer index been updated to point to this new repo?
>=20
> - armin
>=20
> > Please test again with latest version.
> >=20
> > Thanks
> > Changhyeok
> >=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf=
 Of
> > Joao Henrique Ferreira de Freitas Sent: Friday, May 29, 2015 11:17 =
PM
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] meta-gir issues and maintenance
> >=20
> >=20
> > Hi Changhyeok,
> >=20
> > Did you get this error when using meta-gir? In my case I am setting=
 my
> > recipe to inherit the g-ir class.>=20
> > | checking for python script directory... (cached)
> >=20
> > ${prefix}/lib/python2.7/site-packages
> >=20
> > | checking for python extension module directory... (cached)
> >=20
> > ${exec_prefix}/lib/python2.7/site-packages
> >=20
> > | checking for python module thread... yes checking whether to enab=
le
> > | threading in pygobject... yes
> >=20
> > /srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0=
.4-r0/p
> > ygobject-3.0.4/configure: line 15892: ./libtool: No such file or di=
rectory
> >=20
> > | checking for i586-poky-linux-pkg-config...
> >=20
> > /srv/yocto/build/fido/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
> >=20
> > | checking pkg-config is at least version 0.16... yes checking for =
GLIB
> > | - version >=3D 2.24.0... cross compiling; assumed OK...
> > | yes (version 2.42.1)
> > | checking for ffi... checking for FFI... yes checking for GIO... y=
es
> > | checking for GI... no
> > | configure: error: Package requirements (glib-2.0 >=3D 2.24.0
> > |=20
> > |     gobject-introspection-1.0 >=3D 1.29.0
> > |=20
> > | ) were not met:
> > |=20
> > | No package 'gobject-introspection-1.0' found
> > |=20
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if yo=
u
> > | installed software in a non-standard prefix.
> > |=20
> > | Alternatively, you may set the environment variables GI_CFLAGS an=
d
> > | GI_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> > | Configure failed. The contents of all config.log files follows to=
 aid
> >=20
> > debugging
> >=20
> > | ERROR: oe_runconf failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> >=20
> > /srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0=
.4-r0/t
> > emp/log.do_configure.13915) ERROR: Task 233
> > (/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-=
pygobje
> > ct/python-pygobject_3.0.4.bb, do_configure) failed with exit code '=
1'
> > WARNING: QA Issue: libgirepository: configure was passed unrecognis=
ed
> > options: --disable-schemas-install [unknown-configure-option]
> > WARNING: QA Issue: g-ir-tools-native: configure was passed unrecogn=
ised
> > options: --disable-schemas-install [unknown-configure-option]
> > NOTE: Tasks Summary: Attempted 2578 tasks of which 2524 didn't need=
 to be
> > rerun and 1 failed. Waiting for 0 running tasks to finish:
> >=20
> > Summary: 1 task failed:
> > /home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-p=
ygobjec
> > t/python-pygobject_3.0.4.bb, do_configure
> >=20
> >=20
> > I am working to build mypaint (http://mypaint.intilinux.com/) which=
 is
> > hugely based on GI. Now I get lost.
> >=20
> > Thanks.
> >=20
> > On 20/05/2015 21:06, Changhyeok Bae wrote:
> >> I forked meta-gir to https://github.com/locust2001/meta-gir and st=
art
> >> working from next week.
> >>=20
> >> -----Original Message-----
> >> From: Andreas M=FCller [mailto:schnitzeltony@googlemail.com]
> >> Sent: Monday, May 18, 2015 8:46 PM
> >> To: Burton, Ross
> >> Cc: Changhyeok Bae; OE-core
> >> Subject: Re: [OE-core] meta-gir issues and maintenance
> >>=20
> >> On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.c=
om>=20
wrote:
> >>> On 18 May 2015 at 09:00, Andreas M=FCller <schnitzeltony@googlema=
il.com>
> >>>=20
> >>> wrote:
> >>>> I would appreciate to have the gintrospection more central - thi=
s
> >>>> would give us a chance to get the gtk stuff out of stone age..
> >>>=20
> >>> Well, oe-core already has GTK+ 3, so we're "just" missing the bin=
dings
> >>> to Python and JavaScript.
> >>=20
> >> Sorry - I meant gnome not gtk.
> >>=20
> >>> Changhyeok, you're welcome to fork meta-gir to your own repositor=
y and
> >>> work on it independently.  If you can update it so that it works =
with
> >>> oe-core master then you're the new maintainer. :)
> >>=20
> >> Andreas
> >>=20
> >> This email has been protected by YAC (Yet Another Cleaner)
> >> http://www.yac.mx

--=20

Paul Eggleton
Intel Open Source Technology Centre

