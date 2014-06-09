Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id E6C3165E6F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:56:32 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so2340794wes.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=frwIUhz/ELdkK/h3GtfE945xV863jZ596HzR+EWlFkI=;
	b=gJnciSVnZjWdMpFL81HCrVNlTsMZ3ceJN0Wcx/67sDiBM9pVHLsBhWylbN9eCse35L
	ulrEBllQtisu41o1lXRFwkVh513/1SOe2sk3nUzZSOWeP6+EvKaFhJqAf5gSofUFuPhV
	ITuiFux69N4xqUhDfMzpIvhuNYAn/sNkvGftmwdeURc/zQpP/0aEU2MVQrH9PuO16kyf
	hb3g6hDKQFbFRSCSlWhGvt4abO9keH269SaEMVAzuy7NVVEk288DtT3aocII5/vTM1tH
	boieljB5MV/6He0LnrfvtFZvqFxC/pucKpS8OXjQNuQORIy9mCte0XXOfS/nIYG3s2Km
	vaUw==
X-Received: by 10.15.49.8 with SMTP id i8mr173840eew.33.1402325793475;
	Mon, 09 Jun 2014 07:56:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s9sm45508212ees.33.2014.06.09.07.56.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 07:56:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Jun 2014 16:56:52 +0200
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140609145652.GB2433@jama>
References: <A612847CFE53224C91B23E3A5B48BAC7A7A21EFE0D@xmail3.se.axis.com>
	<A612847CFE53224C91B23E3A5B48BAC7A7A2BE80C7@xmail3.se.axis.com>
	<20140609135202.GA2433@jama> <5395C9AF.20907@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5395C9AF.20907@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Using users/groups from another recipe than the one creating them
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
X-List-Received-Date: Mon, 09 Jun 2014 14:56:40 -0000
X-Groupsio-MsgNum: 53960
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2014 at 09:50:23AM -0500, Mark Hatle wrote:
> On 6/9/14, 8:52 AM, Martin Jansa wrote:
> > On Mon, Jun 09, 2014 at 03:39:46PM +0200, Peter Kjellerstedt wrote:
> >>> -----Original Message-----
> >>> From: openembedded-core-bounces@lists.openembedded.org
> >>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> >>> Peter Kjellerstedt
> >>> Sent: den 23 maj 2014 12:38
> >>> To: OE Core (openembedded-core@lists.openembedded.org)
> >>> Subject: Re: [OE-core] Using users/groups from another recipe than the
> >>> one creating them
> >>>
> >>>> -----Original Message-----
> >>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >>>> Of Peter Kjellerstedt
> >>>> Sent: den 19 maj 2014 10:15
> >>>> To: OE Core (openembedded-core@lists.openembedded.org)
> >>>> Subject: [OE-core] Using users/groups from another recipe than the
> >>>> one creating them
> >>>>
> >>>> Which assumption is correct: "a recipe A that depends on another
> >>>> recipe B can use users/groups that B creates" or "all recipes must
> >>>> create the users/groups they require themselves"?
> >>>>
> >>>> The problem for us is that we have a lot of recipes that create
> >>>> users and groups, and subsequently a number of other related recipes
> >>>> that need to use those users and groups.
> >>>>
> >>>> If the first assumption is correct then the useradd.bbclass needs to
> >>>> be corrected so that it adds a dependency from do_install to
> >>>> base-passwd:do_populate_sysroot and
> >>>> base-passwd:do_populate_sysroot_setscene, because if either of those
> >>>> tasks execute they will overwrite /etc/passwd and /etc/group,
> >>>> effectively removing any users/groups that were created earlier...
> >>>>
> >>>> On the other hand, if it is the second assumption that is correct,
> >>>> then there should be QA tests in place to make sure all recipes
> >>>> create the users/groups they use.
> >>>>
> >>>> //Peter
> >>>
> >>> *ping*
> >>>
> >>> Doesn't anyone know how users and groups are supposed to work?
> >>>
> >>> //Peter
> >>
> >> *ping again*
> >>
> >> Well, this is somewhat discouraging. Three weeks and not a single
> >> response. Are we really the only ones that care about users and
> >> groups and how they are created? Doesn't anyone know which of my
> >> two assumptions above are correct?
> >>
> >> Personally I would prefer that all recipes create the users and
> >> groups they require themselves as this keeps them more self
> >> contained. I have no idea how to write a QA test to verify this,
> >> but I assume it should be possible...
> >
> > My experience from Dylan release is that only users/groups created in
> > base-passwd work reliably, with useradd.bbclass we were seeing random
> > files getting random user/group owners (comparing buildhistory report
> > files-in-image.txt from multiple builds which weren't using sstate).
> >
>=20
> Which package management type?

ipk

> The only issue I'm aware of is when the requires aren't in the correct or=
der, a=20
> package can fall back and try to use the host-system's passwd/group entri=
es=20
> instead of the sysroot version.  This can lead to cases that during the=
=20
> installation process the dynamic users/groups have not been generated due=
 to=20
> missing dependencies.

Those random files were also the files which are usually owned by
root:root, so it wasn't like incorrectly using users/groups from host
system. Maybe something in pseudo db got broken, but after finding the
work around with creating all required users from base-passwd I didn't
try to debug it more.

> For the RPM type, you get a message that says "user foo can not be found,=
 using=20
> root".  I'm not sure what deb/ipk do in these cases.  (RPM always handles=
 users=20
> and groups by name, never by gid/uid number.)
>=20
> The whole users and groups system has been working very well in my system=
s based=20
> on 'dora'.  I haven't experienced issues with dylan, but I also haven't u=
sed it=20
> as extensively.
>=20
> --Mark
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOVyzQACgkQN1Ujt2V2gByHCgCfSOjidbpu4nrlr28vX1NdSX8j
PQ4An10dbm1nWeR780lhsC1CnREDCwva
=9vi/
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
