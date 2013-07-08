Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id BFD7E6A5A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 17:27:06 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so3151046eak.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u426jPe0gqr0nMI2FYr38yVF5ws1CN7tnNpbtfvlZ6Y=;
	b=XEZiMVSmzzHzEG9M75+V8Zr4zlqb5zfC5sKhTOubN2mezmYLmnKiFTboINWdhErkMJ
	KczKilgKG9tw68mYLKVyETa0nTcB+tgu37WWSpOo8bmiDPScKB6ZQ3uRp4G7XdnUnsK6
	Ki44i1Mu9k5tQ9W3c2m1HhmXxr4y7h6HA3MVNAFeeJQ1cOB9/cgHjLbEa0VCy/jNFBcB
	tbBfdnleSThWYVslGDbxzYk1H672s8VKWU+fVPQRp6+F0h1kW3nwq24J0dyAHD9V+vmi
	VUACf9VR6hO7C0YhQG5t0h/JRRZNK7Y8+YAWowaoWymsnTQqqCTcmQkWWBn8axRoy0dn
	l3og==
X-Received: by 10.15.21.199 with SMTP id d47mr25943053eeu.36.1373304427448;
	Mon, 08 Jul 2013 10:27:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm43864889eew.1.2013.07.08.10.27.06 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 10:27:06 -0700 (PDT)
Date: Mon, 8 Jul 2013 19:27:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130708172715.GO3288@jama>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<20130705083905.GD3259@jama> <51DAF3BC.60107@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51DAF3BC.60107@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Mon, 08 Jul 2013 17:27:07 -0000
X-Groupsio-MsgNum: 41618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MdEjg5WkSuUg8x46"
Content-Disposition: inline

--MdEjg5WkSuUg8x46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2013 at 12:15:40PM -0500, Mark Hatle wrote:
> On 7/5/13 3:39 AM, Martin Jansa wrote:
> > On Fri, Jul 05, 2013 at 02:07:28PM +0800, Qi.Chen@windriver.com wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> We may want to add a user or group which does not logically belong to
> >> any specific package. For example, we may want to add a user with the
> >> name 'tester' to our image. Besides, we may want to delete or modify
> >> user/group in our image.
> >>
> >> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
> >> to these tasks. The configuration format is detailed in the local.conf.
> >> sample.extended file.
> >>
> >> This patch also adds a function, set_user_group, which happens at
> >> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
> >> in the USER_GROUP_SETTINGS variable.
> >
> > Why not use extra package just with user?
> >
> > See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"
>=20
> The issue is that the users don't want extra (empty) packages to just add=
=20
> standard users/groups.  What they want is a post image-generation=20
> "configuration" mechanism.
>=20
> Adding users/groups is one of the basic items that they want/need.  This =
really=20
> has to be considered to be an administrative activity vs a distribution=
=20
> activity.  (I.e. difference between creating a package and performing som=
e kind=20
> of post-image action.)
>=20
> The other issue with a package based approach is it then mandates changes=
 occur=20
> by having to rebuild/reinstall packages.  This is onerous in my experienc=
e, for=20
> something basic like this.  It's really outside of the package manager's =
control.

We can have all users in one package
base-users (like we have base-files)

It can allow someone to just define DEFAULT_USERS =3D "a b c" in
local.conf and let base-users recipe to create all 3 automatically.

Post image-generation mechanism doesn't allow to add new required users
in "upgrade" or installing packages from binary feed with all required
users accounts.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MdEjg5WkSuUg8x46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHa9nMACgkQN1Ujt2V2gBy79gCfe29z+e2PbGyjaJQHhy85YfRT
3UYAn0TwpXXgXIVDs7TAH3LYr8xtt6Am
=fPTH
-----END PGP SIGNATURE-----

--MdEjg5WkSuUg8x46--
