Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAB162134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 01:17:45 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c190so6090252qke.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=30Nuy+JpfuOAtENl234ss7dL1z4u8Agq2TJYQ2GMejw=;
	b=BRaLnDHiZV9LrEx3eHUyjwvwJQhJT1jU+mRYit8AyXyfIr406lwcsaVjk9Ooxj5NmP
	r+fjs9fJbQa8Cq9eWgRScbtRcDr3QXkZEzkzBlWYnWrRMpnjUKiTf4nw65cdkjGgeuTV
	wgDOaxk3fp4iXVeHs7VIl5VsivgaZnGJt2o0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=30Nuy+JpfuOAtENl234ss7dL1z4u8Agq2TJYQ2GMejw=;
	b=UqR4sYLCOiM+OPmZ72k2ttaxdWWA8FEZtd9tigZbwPPhCDX/vQ/2oVwGfR8SwQkYWZ
	Lvjy1YkHaK9PyaqPY9kstrAMtKGvxY4OqYT7mPjKpZsRthc7vIGCVpvWjCXHjbt8C7fD
	EvE37ZIPAPMOIQ8jSgF18MkA2YitjYs53UX6url+vqzCOa/F1+PlOSQzdX3DIEV8/XOt
	sKNPY+FwrwbTQPTdfzedYEW+XKp53PDP6GfBrkvExbBVc1gk+gK8hApJ/jFwEswUkZQo
	Y/8lmU3H9SJ9gkmlVP6XpqKugg6VWVV2OmaAdTyExAv1foIz79mKSX7vsRp+TeRTQVnm
	g8UQ==
X-Gm-Message-State: APjAAAVXo1t7wfcuIgPn9AgvEyks9xSnR4lXn3jhGKlGk5W/VoiVBCPk
	QX3xOSuiVYxsLkOjQ6Cd/0GSOg==
X-Google-Smtp-Source: APXvYqz1Rv+9dyj+ihXv052JuUqPSitBWmbKzNacK+Yqi/kMD4FUq4zj5R7NAHJ0Rt7qND76v9ocTQ==
X-Received: by 2002:ae9:ee1a:: with SMTP id i26mr5246601qkg.13.1556068666029; 
	Tue, 23 Apr 2019 18:17:46 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id 9sm5926364qkn.38.2019.04.23.18.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 18:17:44 -0700 (PDT)
Date: Tue, 23 Apr 2019 21:17:42 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190424011742.GE30419@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
	<e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Wed, 24 Apr 2019 01:17:45 -0000
X-Groupsio-MsgNum: 123647
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline

--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 11:22:14PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> > On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > > This brings us to the current version of vim.
> > > >=20
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > tiny_8.1.1198.bb} | 0
> > > >  meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > > > vim_8.1.1198.bb}           | 2 +-
> > > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > > > tiny_8.1.1198.bb} (100%)
> > > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D> vim_8.1.1198=
=2Ebb}
> > > > (98%)
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> >=20
> > Does the current version even work in this case?  Digging down into
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/s=
teps/7/logs/step1b
> > there's a certain level of "how does that even work today then?" that
> > springs to mind.
> >=20
> > I need a few more details to know how to reproduce this locally as I
> > don't see whatever must be in site.conf/etc to turn regular poky into
> > no-x11.  The errors are also around iconv stuff so maybe nls is also
> > removed here?  Thanks!
>=20
> perhaps simpler, qemux86-world also failed:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515
>=20
> with:
>=20
> | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i586-
> poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Cannot
> convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
> iconv() does not support this conversion.
> | make[2]: *** [gvim.desktop] Error 1
>=20
> So perhaps there is host contamination and this works one some build
> machine setups but not more minimal ones?
>=20
> The build configuration hasn't changed, just the new version upgrade
> and the other patch. I suppose its possible it depends which of our
> workers its built upon but that seems unlikely for two world failures
> (no-x11 is also a world failure).

Current poky master-next + my patches (and bitbake -k'ing around
gobject-introspection-native failing to configure over passing
-Ddocs=3Dfalse) and vim builds on a FC29 "Cloud" image + documented
additional packages off of
https://www.openembedded.org/wiki/Getting_started

--=20
Tom

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcv7k1AAoJEIf59jXTHXZSIt0P/iq/eqBq6u1EO4829BQmfCjL
AaBNhtNxjNQ4xxqAlqvJ0YsNIjHX5Gt32tSCeruVUA0Jr6K3m4xejtCZCVdzYgBd
GC8zLl5S7g9QHvY+rsAlcJTVQbM6IVrpWUeRqdbQm+9/EmG4FiQGfS6cHkR2cmpt
oPkUdCayx3b1hhWDl6pwSWnlPkD7QaCabbiefDBWtIioco4cighdu8CNryx/A01Q
GEVOrnla3xzIevj6ymw6na6lBXsaSgo11qJl93TOMrL8L/fyFwtxBfgNsYc4pqwi
qN37JnopfmMYHIuhAOeJUxBaLL2qoXKVicZDgoz4JLQO606wiTE9YWNYwHQPxiNM
JpV2aVCA2/7DnIv2WcjT5sreVk2WD+PSQQOwIyrbDHbcUZrzGOWEyXY0ySNUY112
bfxlqXYi6Jz6WyVoT9cYY6F/MqHIyMIFFsv8EdRqk/iq6umzJVgE8Tf6raByNk66
jlOoOEJQLVglV95KnVv24YtlxGAFnfG+qMUPK1/TYyZhZCC1+Aq6uXvwg0ub9F8s
iUVEsIC96AhbXoHOvN2SUKYkdaPP2VSuYfKMazuAT4XreyB7+PcGHgCNbc1orHhK
gSfBiV8aJtsDc4re0KbtfyaB7w8wGam1wduSr9aXa9BUs1/ze74GnyVVRG+/ueDq
pK47VkrUnCmvzTVx7zL7
=tA1b
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
