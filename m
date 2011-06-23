Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QZcoi-00005s-TW
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 07:51:15 +0200
Received: by fxm19 with SMTP id 19so1223151fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=waISDek1m7Udih/Xjjz2O6zPsVhfbn+xgzwjsBik1rE=;
	b=MuIv4kuZuWAJb5CAEKbNqR6Yrmx+e1yspIJN6+hdC08KoR9HaDkp5Ab1JQvpaLcw4M
	6YqzNA91y7OrxyevlkIyISBAihMKFsgbTs+hSlivRHHZalCFeCLehECGPyRetiKZbgZt
	PbZPh86BamhrNwdpOTOhfhVCZSgcaN/XJmRJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Tf6hNB63L8tWhP6GLXx9mOiY+VPnQtmEp9h8aK8UQmcPQBxL25s6QospKMwVhhnSn4
	gvzb7V3rURZbo4bOTeDF7XRFu9YKtzKbh8JcAjoRSE9benppcOvV/xLHXqXu4kRJJkPG
	2cQbKm10gdBFvcgHSEIeNMJYz0bPLSVUSIgdw=
Received: by 10.223.74.83 with SMTP id t19mr2069136faj.149.1308808028976;
	Wed, 22 Jun 2011 22:47:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 10sm750667faw.0.2011.06.22.22.47.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 22:47:07 -0700 (PDT)
Date: Thu, 23 Jun 2011 07:47:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110623054700.GA3065@jama.jama.net>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex> <4E0235DA.8060200@windriver.com>
	<4E025052.6070300@windriver.com>
	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Thu, 23 Jun 2011 05:51:15 -0000
X-Groupsio-MsgNum: 4636
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 04:22:31PM -0700, Khem Raj wrote:
> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
> >> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com>=
 wrote:
> >> > On 6/22/11 1:35 PM, Mark Hatle wrote:
> >> >> Since applying this update, I'm not longer getting an rpc/rpc.h fil=
e, which
> >> >> breaks various things like busybox mount.
> >> >>
> >> >> Is anyone else seeing this behavior?
> >> >
> >> > Reverting:
> >> >
> >> > 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
> >> > 190a946e9a4213944e3ee675c4b3e18701698e87
> >> >
> >> > fixed the problem for me. =A0So there is definitely a problems in th=
e upgrade.
> >> >
> >>
> >> onward looking rpc is now maintained with libtirpc starting glibc 2.14=
 rpc is
> >> not to be used from bundled code in glibc. If we dont have recipes for=
 libtirpc
> >> then I will add that.
> >
> > There looks to be more than this wrong with this update. A quick
> > comparison shows the following changes in the list of files being
> > installed from do_install:
> >
> > -./lib/libmemusage.so
> > -./lib/libnss_hesiod-2.13.so
> > -./lib/libnss_nisplus-2.13.so
> > -./lib/libutil-2.13.so
> > -./lib/libresolv-2.13.so
> > -./lib/libm-2.13.so
> > -./lib/libnsl-2.13.so
> > -./lib/libnss_compat-2.13.so
> > -./lib/libnss_nis-2.13.so
> > -./lib/libnss_dns-2.13.so
> > -./lib/libanl-2.13.so
> > -./lib/libBrokenLocale-2.13.so
> > -./lib/libcrypt-2.13.so
> > -./etc/rpc
> > -./usr/lib/libnss_compat_pic.a
> > -./usr/lib/libnss_dns_pic.a
> > -./usr/lib/libnss_nisplus_pic.a
> > +./usr/lib/audit/sotruss-lib.so
> > -./usr/lib/libutil_pic.map
> > -./usr/lib/libBrokenLocale_pic.a
> > -./usr/lib/libBrokenLocale.a
> > -./usr/lib/libBrokenLocale_pic.map
> > -./usr/lib/libm.a
> > -./usr/lib/libnss_dns_pic.map
> > -./usr/lib/libm_pic.map
> > -./usr/lib/libnss_hesiod_pic.map
> > -./usr/lib/librpcsvc.a
> > -./usr/lib/libutil.a
> > -./usr/lib/libnss_compat_pic.map
> > -./usr/lib/libcrypt.a
> > -./usr/lib/libutil_pic.a
> > -./usr/lib/libanl.a
> > -./usr/lib/libnsl_pic.a
> > -./usr/lib/libresolv.a
> > -./usr/lib/libnss_hesiod_pic.a
> > -./usr/lib/libm_pic.a
> > -./usr/lib/libnsl_pic.map
> > -./usr/lib/libnss_nis_pic.map
> > -./usr/lib/libanl_pic.a
> > -./usr/lib/libcrypt_pic.map
> > -./usr/lib/libcrypt_pic.a
> > -./usr/lib/libnss_nis_pic.a
> > -./usr/lib/libresolv_pic.map
> > -./usr/lib/libresolv_pic.a
> > -./usr/lib/libanl_pic.map
> > -./usr/lib/libnss_nisplus_pic.map
> > -./usr/lib/libnsl.a
> > -./usr/bin/rpcgen
> > -./usr/bin/gencat
> > +./usr/bin/sotruss
> > -./usr/bin/localedef
> > -./usr/bin/locale
> > -./usr/sbin/rpcinfo
> > -./usr/sbin/nscd
> >
> > Some of these are rpc related but there are other issues too.
> >
> > I've reverted the upgrade itself for now until we have something in
> > place to address the issues and its actually had some testing...
> >
>=20
> some of these are due to rpc and others are due to nss being removed
> I need to backport the nss db re-implementation then most of it should
> be resolved
> I guess I will post 2.14 as additional recipes rather than replacement fo=
r 2.13
> that way we will get some soak time.

there are issues with 2.14 and standalone libtirtc too :/
http://blog.flameeyes.eu/2011/06/11/are-you-kidding-me-or-why-we-ll-wait-gl=
ibc-2-14-for-a-while

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4C01QACgkQN1Ujt2V2gBwmggCcDpJKaDHcuCcOr7Irayf2KMbT
OwYAn1POeoUZJphsnzfpDBgfvShYHLfA
=Qx25
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
