Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ue3QO-0001uN-UB
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 15:13:26 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz12so332049pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=L1YIeTUxYS3xN/7pDj+veBs+7amZvVS+WsSqpT/IyoQ=;
	b=cpOwtqchjNxUhbaJjinSfsZGds0z++kPCZ2njOaOwQ3s3YCT/LQyG4ceOkMTP1ca0C
	F//jQJecrE4T6nP/wDP2YPA3x/VseKGajmIK7HQWLJGIeyJtymi8oykzN1f6yg1OpPim
	KVzl+K9ZiILJxveXas5vRvHFgNVZADzhGt7r8iSXC6T6HHuhhEK+ETj2ms6I6tKumuL6
	z3Bg3YqaKLkmXI5RGudTdUPVhzFf4vjcidTaTGfdEYXlMro/eHCYKtGM2MSbBij1HeMB
	JxUHWhJvdvvOIHPe5ACAmxpUwcwVDz5Pj+u+ilbZU9CPlXj8SX8qH5P2ZA5FZOAu1s3W
	dwrw==
X-Received: by 10.66.219.228 with SMTP id pr4mr6416513pac.155.1368968101258;
	Sun, 19 May 2013 05:55:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aj2sm19658223pbc.1.2013.05.19.05.54.58 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 05:55:00 -0700 (PDT)
Date: Sun, 19 May 2013 14:54:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130519125451.GH3196@jama>
References: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8eXDE0PFgtzrBdXw3=eXrn5H_hdZ6ivVj4+TRQbnC1+eg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Clashing man pages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 13:13:48 -0000
X-Groupsio-MsgNum: 39431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jaoouwwPWoQSJZYp"
Content-Disposition: inline

--jaoouwwPWoQSJZYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2013 at 01:00:24PM +0100, Paul Barker wrote:
> I'm generating a rootfs image which I intend to be usable
> interactively so I've added IMAGE_FEATURES +=3D "doc-pkgs" to my image
> recipe. do_rootfs fails with the following clashes:
>=20
> |  * check_data_file_clashes: Package ncurses-doc wants to install
> file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-=
gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/reset.1
> | But that file is already provided by package  * util-linux-doc
> |  * opkg_install_cmd: Cannot install package ncurses-doc.
> |  * check_data_file_clashes: Package coreutils-doc wants to install
> file /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-=
gnueabi/wych-image-full/1.0-r0/rootfs/usr/share/man/man1/kill.1
> | But that file is already provided by package  * util-linux-doc
> |  * opkg_install_cmd: Cannot install package coreutils-doc.
> |  * check_data_file_clashes: Package shadow-doc wants to install file
> /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnuea=
bi/wych-image-full/1.0-r0/rootfs/usr/share/man/man5/passwd.5
> | But that file is already provided by package  * man-pages
> |  * check_data_file_clashes: Package shadow-doc wants to install file
> /home/pbarker/build/20130518_wych/build/tmp/work/qemuarm-wych-linux-gnuea=
bi/wych-image-full/1.0-r0/rootfs/usr/share/man/man3/getspnam.3
> | But that file is already provided by package  * man-pages
> |  * opkg_install_cmd: Cannot install package shadow-doc.
>=20
> I've explicitly said I want coreutils and man-pages, the rest is being
> pulled in implicitly as dependencies of something. There's nothing in
> qa.log or the bitbake output to suggest that installed files are
> clashing so I'm not sure if this could have been reported earlier.
>=20
> The best fix I can think of at the minute is to add a bbappend to my
> layer which removes the clashing man pages from one of the packages in
> each case, leaving the files just in the package I do want to take
> precedence. If anyone has any better ideas let me know.
>=20
> I know we have update-alternatives for executables but is there a way
> to link this with the relevant man page? So for example when I select
> kill from coreutils, kill.1 is provided by coreutils as well, when I
> select kill from util-linux, kill.1 is provided by util-linux as well.

There was some discussion about this already
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034744.=
html
but only response I got was about conflicting /usr/share/info/dir :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jaoouwwPWoQSJZYp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYy5sACgkQN1Ujt2V2gByKTACcDnUKAbSc2L7Wut+TYXRdG6jq
llcAn3vjI9PvxJYuche1z5jBD3at0Jfb
=7Bjc
-----END PGP SIGNATURE-----

--jaoouwwPWoQSJZYp--
