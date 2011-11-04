Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RMGeF-0007e1-Ng
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 11:05:19 +0100
Received: by eyd9 with SMTP id 9so1832716eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4DQAHIEq68y3HaojpIQvdZkTveJNBtKdwo0kzc74590=;
	b=fnigN9qrfbwWzBjathWEf3hE0seXB3NLqNuw1x9bnzyr7k47W1p+wsAU2FJvl4aR6E
	OX1CpKzoY24TZ0aT0ArC4d/1T5QC9GHcT3Gop8hJMSDnOvRopYM5EjolAC1guZr65UDV
	c3oZOpHT/H0mwmg0NS/UacGKt8btslHQH9Luo=
Received: by 10.14.17.222 with SMTP id j70mr1289350eej.241.1320400747109;
	Fri, 04 Nov 2011 02:59:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a49sm23714989eea.2.2011.11.04.02.59.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 02:59:06 -0700 (PDT)
Date: Fri, 4 Nov 2011 10:59:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111104095904.GT9949@jama.jama.net>
References: <CAE1-YAFQW1LXHfND8on-KBp-4fid32EAh5N12DD_hdmhc_54Qw@mail.gmail.com>
	<CAE1-YAGuD3+ccvJ0kFgEFuJCpew_T0VX85YH3sMuNYdyu729CA@mail.gmail.com>
	<20111104094559.GS9949@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111104094559.GS9949@jama.jama.net>
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
X-List-Received-Date: Fri, 04 Nov 2011 10:05:19 -0000
X-Groupsio-MsgNum: 11896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="skzcsJvRJWOW8YcK"
Content-Disposition: inline

--skzcsJvRJWOW8YcK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 10:45:59AM +0100, Martin Jansa wrote:
> On Fri, Nov 04, 2011 at 10:23:44AM +0100, Peter Lohmer wrote:
> > Hi all,
> > after last oecore update building fails with the following error messag=
e:
> >=20
> > peter@p-lohmer-linux:~/oe-core$ bitbake -k xfce-nm-image
> > Loading cache: 100%
> > |######################################################################=
####################################|
> > ETA:=A0 00:00:00
> > Loaded 1826 entries from dependency cache.
> > Parsing recipes: 100%
> > |######################################################################=
##################################|
> > Time: 00:00:00
> > Parsing of 1418 .bb files complete (1414 cached, 4 parsed). 1825
> > targets, 72 skipped, 0 masked, 0 errors.
> > ERROR: No recipes available for:
> > =A0 /home/peter/oe-core/sources/meta-smartphone/meta-openmoko/recipes-m=
ultimedia/mplayer/mplayer2_git.bbappend
> > ERROR: Command execution failed: Exited with 1
> >=20
> > I believe it's caused by meta-smartphone, does anyone face the same pro=
blem ?
>=20
> Hi,
>=20
> yes it is, I'm sorry about that.
>=20
> yes it is, I've updated README to be more clear about dependencies
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D54=
3e9ccc533677f25146f5ab59fbb019907e3548
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dbc=
7051e466f3d48b70ed62df8fffef23a9329bf0
>=20
> and for now you can revert
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D38=
d81585f57c3df86771dc39f7408291798601a4
> or apply
> http://patches.openembedded.org/patch/14259/

I've also pushed without_shr branch to meta-smartphone which is master
without this 3 patches and I'll merge master branch to it sometimes when
I'll feel that currently we don't need anything critical from
oe-core-contrib/shr or meta-oe-contrib/shr

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--skzcsJvRJWOW8YcK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6zt2gACgkQN1Ujt2V2gBy+XACeOPZgfX3NmjlkhadE8Ll5jUxG
jmUAn1YjIHbqnvEyfyAMACmBRjZ+4NCr
=NdaN
-----END PGP SIGNATURE-----

--skzcsJvRJWOW8YcK--
