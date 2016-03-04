Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5019C6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 12:49:42 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so4010865wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3FHGvO9e60uTkBgHVhzM9jFoqA0Jmoph+yztYNWytQI=;
	b=qEKZ7Kfmi82G56Jc8J0LqLI9m5Se6o5j4vV7W7ByEQxJX1y+COxZE+A4+I78EwPy33
	FZVPLmgy0LY6S8/aQCnymtT21Jk+vXuk41c8wa7bMzfkpFaDQmdKvCqjLeoaC7iKDepI
	pVt6aetRBThXDLqOT+nmyAWIWGnaL34RITAbXSVp7X7P0YoZ/v/oXpmeQQvb4dlPvkp6
	AF/F4AC63ZFxo8tZyG6gkznlX9C/uh10gUZ0x25fYz+4tXKPVYQ2PpKnZWSomE+Nq13+
	Z6Eak7HvUc8ioFH9/oOv2V5dOYUbTgYBlHhUZ0unfFkAUiuBuKQdphz1WY1yF+zAV0R1
	b79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3FHGvO9e60uTkBgHVhzM9jFoqA0Jmoph+yztYNWytQI=;
	b=UNsup+hMY6cdcB+c9Z0ZzJF55/b+YyCjdSmZc4QVwkzfRCZMQIsglc9zOfYDWuqLTm
	KE6tn8jZ31FTsMfonPz+16mcRbfUHfOisHyKftsmoIzM6oe3I0TSy76DZuzg+QlR+Kkn
	/MnNB3JIJw77UrnJ04L5EG39ZHeJsfZ3rp0AF5b6O8K9pRg6cQEmN6lN5tuzUBklh5Kw
	doRkfH8FqqHLb7/crWYWBTAkXjSfMO2LLQUo4DAFOrKhH5jjyrmVNGBq0u2ozVL/RIzj
	00fQoI8bxSmedzbcXdVb9rGcmMIZMj79I2OPE7UyVWUPNMcj1mGzYSYR/WR85HpK8LJJ
	CYGQ==
X-Gm-Message-State: AD7BkJJngOk0mC7IZSJkHg2xYj27fn2iXhepRpXte6BYf2+1YvZrZpqXdRT02t9vo4DBig==
X-Received: by 10.194.122.138 with SMTP id ls10mr8886127wjb.51.1457095783250; 
	Fri, 04 Mar 2016 04:49:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s206sm3146056wmf.23.2016.03.04.04.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 04:49:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2016 13:51:54 +0100
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Message-ID: <20160304125154.GA2557@jama>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAD3vsf6MiZ=JRHWzR0ZtQc1O23YyBPTv_rWRcYUm2TAFTSTuWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD3vsf6MiZ=JRHWzR0ZtQc1O23YyBPTv_rWRcYUm2TAFTSTuWQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Fri, 04 Mar 2016 12:49:43 -0000
X-Groupsio-MsgNum: 79117
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 08:57:04PM +0530, Jagadeesh Krishnanjanappa wrote:
> Ping.
> Any updates regarding this patch?

Ping.

AFAIK: This still wasn't applied in master nor jethro - I just got 250+
these warnings in small(ish) Jethro build.

$ grep "WARNING: QA Issue: .*/licenses/" consoleText.txt  | wc -l
257

> On Sat, Nov 28, 2015 at 1:39 PM, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
>=20
> > We get below host contamination warnings of license files for
> > each recipe, when we try to create a separate ${PN}-lic package (which
> > contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> > in local.conf.
> >
> > -- snip --
> > WARNING: QA Issue: libcgroup:
> > /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by
> > uid 5001, which is the same as the user running bitbake. This may be du=
e to
> > host contamination [host-user-contaminated]
> > WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is
> > owned by uid 5001, which is the same as the user running bitbake. This =
may
> > be due to host contamination [host-user-contaminated]
> > WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is
> > owned by uid 5001, which is the same as the user running bitbake. This =
may
> > be due to host contamination [host-user-contaminated]
> > -- CUT --
> >
> > Since the license files from source and OE-core, are populated in a nor=
mal
> > shell environment rather in pseudo environment (fakeroot); the ownershi=
p of
> > these files will be same as host user running bitbake. During the
> > do_package
> > task (which runs in pseudo environment (fakeroot)), os.link preserves t=
he
> > ownership of these license files as host user instead of root user.
> > This causes license files to have UID same as host user id and resultin=
g in
> > above warnings during do_package_qa task.
> >
> > Changing ownership of license files to root user (which has UID and GID=
 as
> > 0)
> > under pseudo environment will solve above warnings, and on exiting pseu=
do
> > environment the license files will continue to be owned by host user.
> > Perform
> > this manipulation within try/except statements, as tasks which are not
> > exected
> > under pseudo (such as do_populate_lic) result in OSError when trying to
> > change ownership of license files.
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  meta/classes/license.bbclass | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index c616a20..8fff156 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -185,6 +185,15 @@ def copy_license_files(lic_files_paths, destdir):
> >                  os.remove(dst)
> >              if os.access(src, os.W_OK) and (os.stat(src).st_dev =3D=3D
> > os.stat(destdir).st_dev):
> >                  os.link(src, dst)
> > +                try:
> > +                    os.chown(dst,0,0)
> > +                except OSError as err:
> > +                    if err.errno =3D=3D 1:
> > +                        # suppress "Operation not permitted" error, as
> > +                        # sometimes this function is not executed under
> > pseudo
> > +                        pass
> > +                    else:
> > +                        raise
> >              else:
> >                  shutil.copyfile(src, dst)
> >          except Exception as e:
> > --
> > 1.9.1
> >
> >

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbZhOkACgkQN1Ujt2V2gBzyLQCfTMpwiZExZPci+LjoTSU0+LbT
7UEAnifdxsIMoMErv3EcCaFNgxim5rg0
=VAgK
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
