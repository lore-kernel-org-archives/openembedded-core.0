Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE806012A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 10:34:20 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so250111075wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 02:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BNQpX7Ky//OVFe9NalFf50qjtVl3NDcIHpUl6jiyK4E=;
	b=yA57GfSlvNVREJy5aMQEVx60plMPkYBs3qnPv8UFcW7SUXQ0lX3SXlakzK/5YuO4L1
	UKhl+iGFLCkrSlRhIxMqMRM8IybGRoNtX6geKyeNyY056Q+KWBk9cueOPY0WrawmEnmO
	s5gxAqVuFIOBz5Ah6wtGi4brycoH5Gyuk9ZE+PSWIH8MkX09cplfsGqChKIvoQBYRwWT
	Ypt2RbziIzU6dUmv5WH4AzyujoTrZ7jDUdWAQs25PUCZZJrLscmdT1czQQmA4/DXa+1x
	gh4UiZjPlAPgLdBKzhznUwVywdQX97/5INcR2FGhXSevFOP9vnlCh8UeVXqcorsVlSMX
	JSFQ==
X-Received: by 10.194.77.174 with SMTP id t14mr47345949wjw.23.1448447660399;
	Wed, 25 Nov 2015 02:34:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z17sm22570494wjq.1.2015.11.25.02.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 02:34:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2015 11:34:53 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20151125103453.GM17303@jama>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com>
MIME-Version: 1.0
In-Reply-To: <56557491.4010809@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 25 Nov 2015 10:34:22 -0000
X-Groupsio-MsgNum: 73934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o41d8xLWOaLD8vYh"
Content-Disposition: inline

--o41d8xLWOaLD8vYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 04:42:57PM +0800, Robert Yang wrote:
>=20
> Hi Jagadeesh,
>=20
> Thanks, usually, patch should go into master branch before go into stable
> branch such as jethro. IMHO, jethro branch may not take this fix even if
> master merges it. The problem is that oe-core doesn't create package for
> ${PN}-lic atm, this patch is treated as part of the enhancement which is
> used for working with creating ${PN}-lic.

Why do you think it isn't able to create ${PN}-lic when configured to do
so?

commit dc78ef91a2bf01efb8028c9afbe69e506e016265
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Thu Jan 17 12:49:44 2013 +0100

    license.bbclass: package license texts to PN-lic when
LICENSE_CREATE_PACKAGE is enabled

is already in dylan release.

> // Robert
>=20
> On 11/25/2015 02:54 PM, Jagadeesh Krishnanjanappa wrote:
> > We get below host contamination warnings of license files for
> > each recipe, when we try to create a separate ${PN}-lic package (which
> > contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> > in local.conf.
> >
> > -- snip --
> > WARNING: QA Issue: libcgroup: /libcgroup-lic/usr/share/licenses/libcgro=
up/generic_LGPLv2.1 is owned by uid 5001, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
> > WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is=
 owned by uid 5001, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
> > WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is o=
wned by uid 5001, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]
> > -- CUT --
> >
> > Since the license files from source and OE-core, are populated in a nor=
mal
> > shell environment rather in pseudo environment (fakeroot); the ownershi=
p of
> > these files will be same as host user running bitbake. During the do_pa=
ckage
> > task (which runs in pseudo environment (fakeroot)), os.link preserves t=
he
> > ownership of these license files as host user instead of root user.
> > This causes license files to have UID same as host user id and resultin=
g in
> > above warnings during do_package_qa task.
> >
> > Changing ownership of license files to root user under fakeroot environ=
ment
> > will solve above warnings, and on exiting fakeroot environment the lice=
nse
> > files will continue to be owned by host user.
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >   meta/classes/license.bbclass | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index c616a20..d400ac0 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -185,6 +185,7 @@ def copy_license_files(lic_files_paths, destdir):
> >                   os.remove(dst)
> >               if os.access(src, os.W_OK) and (os.stat(src).st_dev =3D=
=3D os.stat(destdir).st_dev):
> >                   os.link(src, dst)
> > +                os.chown(dst,os.getuid(),os.getgid())
> >               else:
> >                   shutil.copyfile(src, dst)
> >           except Exception as e:
> >
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o41d8xLWOaLD8vYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZVjs0ACgkQN1Ujt2V2gByAngCglciNvsweJnYAuN8S3S4suoGQ
pH4An3cbJmMMCqFHWFXAwTYLlHoxelvt
=csQK
-----END PGP SIGNATURE-----

--o41d8xLWOaLD8vYh--
