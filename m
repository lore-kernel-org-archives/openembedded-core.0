Return-Path: <martin.jansa@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACE87718D;
	Thu, 15 Sep 2016 14:17:41 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id 38so25788187qte.1;
	Thu, 15 Sep 2016 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lkxCOT1bYnD8yKP7LIBWsPUYnHs9C8rr/yVHtzMB/BU=;
	b=psJYsZ2SgmbOOUT3wMlAtQjok44qIYqFr+JZEtRsXNAj5MJqgw5nPaXX1dWmjHE+Iz
	5QzvykyNEz+jvvzvRhmt5t2x98IPL81fmSOGdbmhY3NveM74Sr1hdQ7vbH+bO4Ljn7MU
	3RtgiabC2ZyqkZ9Zl32p0jYf+Bevftw7hniYzTGJx2OGSfCTu5Ar6XK+WiG5T2kcC85T
	YnQQvydwJmvEfLQybAwA6/Uv33gzmeRbQhV4t+BEXPH1TVa/KjcjJOop40UiUvp5O3Vj
	i6uQuMIrg/WLUaJ/1sxhedaki/WFStz0z+dWCRvKrFzW/zQemXHntAfah1WBa4cIRz9R
	9moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lkxCOT1bYnD8yKP7LIBWsPUYnHs9C8rr/yVHtzMB/BU=;
	b=hvCA6O1jnVzpmdY1XIKr8JG9m3tGbvhQlS+CTtZroIy4IaBnJ9mJvNklnX/98/0KH5
	hwfrqe8ouX+yDfVYZCvmZlEOfq/XQFgwsgyY3plZmGaA+DpI62G6bH6j9QWUEzdPmqij
	0rg662lbnPNx0XNR3NwT6mM75ZpFbz3OgHJdJMNC4cLTwKiXrusaFB5rgI3JkvPVsgyx
	i4ujmAjDzwcLnOlMX3gy5x3tLKPIU0Jx4Ui3kmQWxwORSwbE7uAF5fp7NCJSDZq6NR3e
	8OJT10FybBq3nw044WX9Wlk8Nu/ohiEMQR/7bqoMlloXLKug1rWi+My051v/nhqqyabQ
	aCtQ==
X-Gm-Message-State: AE9vXwP8HCeJtl1uTzmUtUqLe3eW1cOicneDYjbt8kcNlsunkwO/C6qPca2UuBF/ZIcitA==
X-Received: by 10.28.209.76 with SMTP id i73mr3120897wmg.104.1473949061479;
	Thu, 15 Sep 2016 07:17:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm3651728wjc.49.2016.09.15.07.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Sep 2016 07:17:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Sep 2016 16:17:40 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160915141740.GD2641@jama>
References: <20160915084338.GC2641@jama>
MIME-Version: 1.0
In-Reply-To: <20160915084338.GC2641@jama>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: State of bitbake world 2016-09-13
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
X-List-Received-Date: Thu, 15 Sep 2016 14:17:42 -0000
X-Groupsio-MsgNum: 87155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline

--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:43:38AM +0200, Martin Jansa wrote:
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed de=
pencencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||=
min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	=
||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	|=
|unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgnam=
e	||=09
> |-
> ||2016-09-13	||3	||4	||4	||16	||4	||3	||16	||4	||4	||0	||0		||0		||1		||1=
0		||4		||0		||0		||0		||0		||0		||0		||0		||=09
> |}

> =3D=3D=3D Failed dependencies for qemuarm (16) =3D=3D=3D
>=20
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependen=
cies.qemuarm.20160913_042944.log/
> Found differences:=20
>     * WARN: jasper: jasper-bin rdepends on freeglut, but it isn't a build=
 dependency?
>     * WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a bui=
ld dependency?
>     * WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build d=
ependency?
>     * WARN: enchant: enchant rdepends on hunspell, but it isn't a build d=
ependency?
> Found errors:=20
>     * ERROR: 16 issues were found in these recipes: enchant jasper libdrm=
 libunwind qtwebkit samba xfsprogs

=2E..
> gammu-1.32.0: libgsmsd rdepends on unixodbc, but it isn't a build depende=
ncy, missing unixodbc in DEPENDS or PACKAGECONFIG? [build-deps]
> libgit2-0.24.1: libgit2 rdepends on libssh2, but it isn't a build depende=
ncy, missing libssh2 in DEPENDS or PACKAGECONFIG? [build-deps]
> mpv-0.15.0: mpv rdepends on libjack, but it isn't a build dependency, mis=
sing jack in DEPENDS or PACKAGECONFIG? [build-deps]

I'm testing  patches for these (and chrony reported 2016-09-01 in
complete QA log).

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfarYMACgkQN1Ujt2V2gBx31gCffk1xmaYAcNx+og44qBJYlJgZ
Y0wAni9UGAmddaK6mzwPYlVVwd4rVSU3
=mtGo
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
