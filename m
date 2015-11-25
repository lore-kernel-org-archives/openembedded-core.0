Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C076601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:41:17 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so255138819wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 04:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S49nmAi1Mlqx4cRoT46cts9SukyUbYY5Fc0ByotayUE=;
	b=NlU+FnT7sxEsXLAuIPWfArBbKdWprMo17hi0ZLBjlRDmD8ArLxjbRb3u6VB6a0XUKA
	YUnzTxQxbK+4TbtQ2ipWpk87BRYreaedWK/YTAOVqE13fc5ZVNC3vgEQ94JwZZ9/mZkj
	E+jJ9xW0xig7C/U56RyFNqqauckVjsj/J/Qdv5xzUVNVjmQ78KUSiuBkpkJCpZG9KhVI
	dbCQiZHBqevJD6oYyqAuES38uZPMCdIF1p+qSs002+gMV8Fn2W/3gr1K6pVD0yzG5N78
	OMPazScBA7mVK1cx/wCrBgnPVF3d3FhBJcDo+xTsIqaRouWC521hasXPCluV/ZgtrZtu
	NIgg==
X-Received: by 10.28.227.198 with SMTP id a189mr4208482wmh.74.1448455277876;
	Wed, 25 Nov 2015 04:41:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n7sm3332469wmf.21.2015.11.25.04.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 04:41:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2015 13:41:51 +0100
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Message-ID: <20151125124151.GO17303@jama>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Wed, 25 Nov 2015 12:41:18 -0000
X-Groupsio-MsgNum: 73936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CPn8Wy5ME997YUMW"
Content-Disposition: inline

--CPn8Wy5ME997YUMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 04:25:56PM +0530, Jagadeesh Krishnanjanappa wrote:
> Hi Robert,
>=20
> I understand. Though LICENSE_CREATE_PACKAGE is disabled by default in
> OE-core, if some users want to create ${PN}-lic package for each recipe
> via LICENSE_CREATE_PACKAGE =3D "1", then they are going to have host
> contamination  warnings for each recipe.
>=20
> The above commit indicated by Martin does create ${PN}-lic package when
> LICENSE_CREATE_PACKAGE =3D "1".
>=20
> Regards,
> Jagadeesh
>=20
> On Wed, Nov 25, 2015 at 4:04 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Wed, Nov 25, 2015 at 04:42:57PM +0800, Robert Yang wrote:
> > >
> > > Hi Jagadeesh,
> > >
> > > Thanks, usually, patch should go into master branch before go into st=
able
> > > branch such as jethro. IMHO, jethro branch may not take this fix even=
 if
> > > master merges it. The problem is that oe-core doesn't create package =
for
> > > ${PN}-lic atm, this patch is treated as part of the enhancement which=
 is
> > > used for working with creating ${PN}-lic.
> >
> > Why do you think it isn't able to create ${PN}-lic when configured to do
> > so?
> >
> > commit dc78ef91a2bf01efb8028c9afbe69e506e016265
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Thu Jan 17 12:49:44 2013 +0100
> >
> >     license.bbclass: package license texts to PN-lic when
> > LICENSE_CREATE_PACKAGE is enabled
> >
> > is already in dylan release.
> >
> > > // Robert
> > >
> > > On 11/25/2015 02:54 PM, Jagadeesh Krishnanjanappa wrote:
> > > > We get below host contamination warnings of license files for
> > > > each recipe, when we try to create a separate ${PN}-lic package (wh=
ich
> > > > contains license files), by setting LICENSE_CREATE_PACKAGE equal to=
 "1"
> > > > in local.conf.
> > > >
> > > > -- snip --
> > > > WARNING: QA Issue: libcgroup:
> > /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by
> > uid 5001, which is the same as the user running bitbake. This may be du=
e to
> > host contamination [host-user-contaminated]
> > > > WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c
> > is owned by uid 5001, which is the same as the user running bitbake. Th=
is
> > may be due to host contamination [host-user-contaminated]
> > > > WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING =
is
> > owned by uid 5001, which is the same as the user running bitbake. This =
may
> > be due to host contamination [host-user-contaminated]
> > > > -- CUT --
> > > >
> > > > Since the license files from source and OE-core, are populated in a
> > normal
> > > > shell environment rather in pseudo environment (fakeroot); the
> > ownership of
> > > > these files will be same as host user running bitbake. During the
> > do_package
> > > > task (which runs in pseudo environment (fakeroot)), os.link preserv=
es
> > the
> > > > ownership of these license files as host user instead of root user.
> > > > This causes license files to have UID same as host user id and
> > resulting in
> > > > above warnings during do_package_qa task.
> > > >
> > > > Changing ownership of license files to root user under fakeroot
> > environment
> > > > will solve above warnings, and on exiting fakeroot environment the
> > license
> > > > files will continue to be owned by host user.
> > > >
> > > > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.c=
om>
> > > > ---
> > > >   meta/classes/license.bbclass | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/classes/license.bbclass
> > b/meta/classes/license.bbclass
> > > > index c616a20..d400ac0 100644
> > > > --- a/meta/classes/license.bbclass
> > > > +++ b/meta/classes/license.bbclass
> > > > @@ -185,6 +185,7 @@ def copy_license_files(lic_files_paths, destdir=
):
> > > >                   os.remove(dst)
> > > >               if os.access(src, os.W_OK) and (os.stat(src).st_dev =
=3D=3D
> > os.stat(destdir).st_dev):
> > > >                   os.link(src, dst)
> > > > +                os.chown(dst,os.getuid(),os.getgid())

is os.getuid() and os.getgid() the correct value you want to use? I
would expect root:root.

> > > >               else:
> > > >                   shutil.copyfile(src, dst)
> > > >           except Exception as e:
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CPn8Wy5ME997YUMW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlZVrI4ACgkQN1Ujt2V2gByQCQCYk163Vo4IUcoCyfqzlye0P8sv
RwCfUI2Mjrp4zIklL7eOFgUmZliHoOw=
=GEDk
-----END PGP SIGNATURE-----

--CPn8Wy5ME997YUMW--
