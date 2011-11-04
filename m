Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RMGRd-0006uj-P5
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 10:52:17 +0100
Received: by bkbzv3 with SMTP id zv3so1873423bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oQXZJWgG+swlBZrukZUFCsqXc9rDh9dV79wft1HRP8s=;
	b=QJLTAjUnUavJaTlEK1q1A4+V9SajHMDFMm4gh2JduN8zjpgoSm8l03PU0MGxbKt4aS
	N4278xktLXHtOdWmOH2xh27Goh0VtXC0Al6ttJx8ggRjhbri83aXRnF0PazVGhnqWuvu
	mhiCjcmb12oJ+PjMuNtnDvPFkknetAC/va7ew=
Received: by 10.204.143.74 with SMTP id t10mr552610bku.45.1320399962616;
	Fri, 04 Nov 2011 02:46:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k13sm6191696fah.0.2011.11.04.02.46.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 02:46:01 -0700 (PDT)
Date: Fri, 4 Nov 2011 10:45:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111104094559.GS9949@jama.jama.net>
References: <CAE1-YAFQW1LXHfND8on-KBp-4fid32EAh5N12DD_hdmhc_54Qw@mail.gmail.com>
	<CAE1-YAGuD3+ccvJ0kFgEFuJCpew_T0VX85YH3sMuNYdyu729CA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE1-YAGuD3+ccvJ0kFgEFuJCpew_T0VX85YH3sMuNYdyu729CA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Error building any image
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
X-List-Received-Date: Fri, 04 Nov 2011 09:52:17 -0000
X-Groupsio-MsgNum: 11895
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lx/R+CYDdR/AN/7"
Content-Disposition: inline

--0lx/R+CYDdR/AN/7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 10:23:44AM +0100, Peter Lohmer wrote:
> Hi all,
> after last oecore update building fails with the following error message:
>=20
> peter@p-lohmer-linux:~/oe-core$ bitbake -k xfce-nm-image
> Loading cache: 100%
> |########################################################################=
##################################|
> ETA:=A0 00:00:00
> Loaded 1826 entries from dependency cache.
> Parsing recipes: 100%
> |########################################################################=
################################|
> Time: 00:00:00
> Parsing of 1418 .bb files complete (1414 cached, 4 parsed). 1825
> targets, 72 skipped, 0 masked, 0 errors.
> ERROR: No recipes available for:
> =A0 /home/peter/oe-core/sources/meta-smartphone/meta-openmoko/recipes-mul=
timedia/mplayer/mplayer2_git.bbappend
> ERROR: Command execution failed: Exited with 1
>=20
> I believe it's caused by meta-smartphone, does anyone face the same probl=
em ?

Hi,

yes it is, I'm sorry about that.

yes it is, I've updated README to be more clear about dependencies
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D543e=
9ccc533677f25146f5ab59fbb019907e3548
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dbc70=
51e466f3d48b70ed62df8fffef23a9329bf0

and for now you can revert
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D38d8=
1585f57c3df86771dc39f7408291798601a4
or apply
http://patches.openembedded.org/patch/14259/

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0lx/R+CYDdR/AN/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ztFcACgkQN1Ujt2V2gBwKuQCfXBVW98VuVinzpYiSkjSPPCnj
ExAAnjxT5FCSjMwzzR7gjHrf4gF2U9oP
=gtyq
-----END PGP SIGNATURE-----

--0lx/R+CYDdR/AN/7--
