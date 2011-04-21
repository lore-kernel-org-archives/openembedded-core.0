Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCt4s-0000A7-TB
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 14:33:47 +0200
Received: by bwz5 with SMTP id 5so1511823bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/BlCOGiLm5Lypa0+8mjbjPs2/aNQAYAUWItzkyzMs0s=;
	b=cW1wiuO3pOWFgsu6Qz6HtbdPe8FfRQElwSEyYy52Q8rMh3TmZ+n7b1uCxNYWFXag1a
	NIHG1mP+icVn/FQDl/cDoskQPjf5wsgVfNzy2O3jJhZM1nvVon5qoDMkCVRU7dE9DmXo
	CG9Vu4SV7llGZ9XlztFnI5QKQLNg37GzEmpsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EwqfMLjHbpSStScvXXUjiPGQQmbc+oVdEfbqDYpKJVEY/amspMn2gn5t9/uUetio/a
	FntouSKVsEK8bHtzUXpe0VlhtHne0R3mxURwn4gpuIT296WEApCHJb7vUJndOafrUF8C
	JAh6rMN4WnYF1FsypDH0lg6R/+A0isBpWA6Zs=
Received: by 10.204.84.137 with SMTP id j9mr1239132bkl.120.1303389082948;
	Thu, 21 Apr 2011 05:31:22 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q18sm1097847bka.15.2011.04.21.05.31.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 05:31:22 -0700 (PDT)
Date: Thu, 21 Apr 2011 14:31:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110421123115.GB6678@jama.jama.net>
References: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Thu, 21 Apr 2011 12:33:47 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2011 at 02:21:25PM +0200, Koen Kooi wrote:
> The symptom:
>=20
> root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
> g_module_open() failed for /home/root/--update-cache: /home/root/--update=
-cache.so: cannot open shared object file: No such file or directory
> root@pandaboard-core:~#
>=20
> the gdk-pixbuf-query-loaders app doesn't support arguments, only .so name=
s, so remove --update-cache

I can confirm same symptom here

shouldn't we store output from it as we did in oe.dev to
/etc/gtk-2.0/gdk-pixbuf.loaders ?

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.32.1.bb
> index ea9456d..08ac01d 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f \
>  SECTION =3D "x11/utils"
>  DEPENDS =3D "gtk+ libcroco cairo libxml2 popt"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  inherit autotools pkgconfig gnome
> =20
> @@ -43,6 +43,6 @@ if [ "x$D" !=3D "x" ]; then
>    exit 1
>  fi
> =20
> -test -x ${bindir}/gdk-pixbuf-query-loaders && { GDK_PIXBUF_MODULEDIR=3D$=
{libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-ca=
che ; }
> +test -x ${bindir}/gdk-pixbuf-query-loaders && { GDK_PIXBUF_MODULEDIR=3D$=
{libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders ; }
>  test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${d=
atadir}/icons/hicolor
>  }
> --=20
> 1.6.6.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+BazGySraz5kW0T--
