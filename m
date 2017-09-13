Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7256F78401
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:48:14 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 189so781256wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6jm/l5zaI91+EmLdpIylKR1i9X8z1JCuxrqvQY6ryAU=;
	b=Nn1Mhj4FH5Bnn/mlSSWhr12P6rY6LUvNKIkqpxRl3sArHodXuUYn47OGfo4dCLfjEJ
	j8b78ekVWgckSeBnTFeXC5Cxg5a4vQJHsWV3rjN5OHnKbzndN7MtL9Y6A1LKXeBFQ5hx
	PnAC7R1gPGwVOcvWcvbOI5sIG8WII20/AQlTv2zblNeneDEKZoktaRvPGlx8S0s8Zbxt
	0BvlytaNqnIC9PlGovp+Yl/5uaVpfE8GyPOlM9/rs03ABYYmnSvUrkAp7ebtsDsDqdNt
	x41mX0u7MoEA457ufjxGP454OUNg7uNF0LFrmS6NJRQAEYhJrIL1HSWgd1butgbGhdCN
	fAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6jm/l5zaI91+EmLdpIylKR1i9X8z1JCuxrqvQY6ryAU=;
	b=EyrTO03p5O0bqTSk53jnFqkz3THs0K2KAwBEoH4wCt/nrNgeHpRayn7JYVdj7wltPB
	kYlO4JbzsDIGTDT7I8r9KuoFBQ+2LPK9uI0w7k885UH8Dp3v/11pdaeHSvwdilyEvNnn
	3uL+VgPtVPisoHuMroJvLO/Z+berzMQMXnA+DlsL85SXslJjZUSCG2eyLvuPvpmElT0U
	GteLeK53IuPZTQmNMqszKbmRHbUkGIUP3hux83S6qXUwwUqrtQPsx0BNtACo+XqFcsjk
	/VBsns5bTG72oGgZvm98DnyoiKbuluzQVIloIYLBjW2bj5dL2UzShDhCHx3xs/+FWNCQ
	/hPQ==
X-Gm-Message-State: AHPjjUhNvI7ce+8+1ZV6z5ET+1mnl6fbOHipi2X34iqsGORNCvDr95aq
	gIsa5Hjx3kKCiM+v
X-Google-Smtp-Source: AOwi7QAEjJ6VfZKO7ARUVQX42Bs1wfles2Poh7HGtmmgC7yENQft1sofOd0VKkOcVel4wh4TMbhHEQ==
X-Received: by 10.28.73.133 with SMTP id w127mr3671wma.55.1505335694553;
	Wed, 13 Sep 2017 13:48:14 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p200sm2852779wmg.48.2017.09.13.13.48.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 13:48:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 22:50:32 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20170913205032.GD3288@jama>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170913204659.1919-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Wed, 13 Sep 2017 20:48:14 -0000
X-Groupsio-MsgNum: 102865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline

--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 10:46:59PM +0200, Martin Jansa wrote:
> * we often see QA warnings like:
>   glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-en-gb/usr/lib=
/locale/en_GB/LC_MEASUREMENT is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
>   glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-nn-no.iso-885=
9-1/usr/lib/locale/nn_NO.ISO-8859-1/LC_MEASUREMENT is owned by uid 3004, wh=
ich is the same as the user running bitbake. This may be due to host contam=
ination [host-user-contaminated]
>   but we don't know the root cause of it.
> * the only theory we currently have is that it's a bug in pseudo when
>   inode is being reused for different files, which is supported by
>   pseudo.log entries:
>=20
>   Good build:
>   pseudo$ grep -v "^path mismatch" pseudo.log
>   debug_logfile: fd 2
>   pid 7975 [parent 7974], doing new pid setup and server start
>   Setup complete, sending SIGUSR1 to pid 7974.
>   db cleanup for server shutdown, 17:33:58.787
>   memory-to-file backup complete, 17:33:58.787.
>   db cleanup finished, 17:33:58.787
>=20
>   Build with QA host-user-contaminated issue:
>   ERROR: foo-1.0.0-r0 do_package_qa: QA Issue: foo: file-with-wrong-UID i=
s owned
>   by uid 2001, which is the same as the user running bitbake. This may be=
 due to
>   host contamination [host-user-contaminated]
>=20
>   pseudo$ grep "file-with-wrong-UID" pseudo.log
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   creat ignored for existing file 'file-with-wrong-UID'.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   inode mismatch: 'file-with-wrong-UID' ino 13242270 in db, 13242271 in r=
equest.
>   path mismatch [1 link]: ino 13242270 db 'file-with-wrong-UID' req 'some=
-other-unrelated-file'.
>   creat for 'some-other-unrelated-file' replaces existing 13242270 ['file=
-with-wrong-UID'].
>   db cleanup for server shutdown, 02:16:23.685
>   memory-to-file backup complete, 02:16:23.685.
>   db cleanup finished, 02:16:23.685
>=20
>   And some-other-unrelated-file is really some different file, not just h=
ardlink
>   to the same file from some different directory (like between WORKDIR an=
d sysroot
>   other "path mismatch" entries show).
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/insane.bbclass | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 78b41caf99..617bf7011d 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1237,6 +1237,41 @@ python do_qa_unpack() {
>          bb.warn('%s: the directory %s (%s) pointed to by the S variable =
doesn\'t exist - please set S within the recipe to point to where the sourc=
e has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
>  }
> =20
> +python do_qa_pseudo() {
> +    ####################################################################=
#######
> +    # Check pseudo.log for unexpected errors
> +    #
> +    # Typical pseudo.log contains many "^path mismatch" lines for all th=
e hardlinked files
> +    # e.g. in some smaller component I see 231/237 lines to be "^path mi=
smatch" other 6
> +    # lines are setup and cleanup lines like this:
> +    # debug_logfile: fd 2
> +    # pid 7975 [parent 7974], doing new pid setup and server start
> +    # Setup complete, sending SIGUSR1 to pid 7974.
> +    # db cleanup for server shutdown, 17:33:58.787
> +    # memory-to-file backup complete, 17:33:58.787.
> +    # db cleanup finished, 17:33:58.787
> +    #
> +    # but if there is one of:
> +    # "^inode mismatch"
> +    # "^creat ignored for existing file"
> +    # "^creat for.*replaces existing"
> +    # then there might be some bigger issue which sometimes results in h=
ost-user-contaminated QA warnings
> +    ####################################################################=
#######
> +
> +    import subprocess
> +
> +    pseudodir =3D d.getVar('PSEUDO_LOCALSTATEDIR')
> +    bb.note("Checking pseudo.log for common errors")
> +    pseudolog =3D os.path.join(pseudodir, "pseudo.log")
> +    statement =3D "grep" \
> +        " -e '^inode mismatch'" \
> +        " -e '^creat ignored for existing file'" \
> +        " -e '^creat for.*replaces existing'" \
> +        " %s" % pseudolog
> +    if subprocess.call("%s -q" % statement, shell=3DTrue) =3D=3D 0:
> +        bb.fatal("This %s indicates errors, see %s or grep -v '^path mis=
match' %s" % (pseudolog, statement, pseudolog))
> +}
> +
>  # The Staging Func, to check all staging
>  #addtask qa_staging after do_populate_sysroot before do_build
>  do_populate_sysroot[postfuncs] +=3D "do_qa_staging "
> @@ -1249,6 +1284,11 @@ do_configure[postfuncs] +=3D "do_qa_configure "
>  # Check does S exist.
>  do_unpack[postfuncs] +=3D "do_qa_unpack"
> =20
> +# Check pseudo.log for unexpected errors
> +# For some reason do_build postfunction isn't executed
> +# do_build[postfuncs] +=3D "do_qa_pseudo"
> +addtask do_qa_pseudo after do_populate_sysroot do_packagedata do_package=
 before do_build
> +
>  python () {
>      import re

Quick build of systemd with this enabled found 2 issues in dbus and
systemd:

ERROR: systemd-1_234-r0 do_qa_pseudo: This /OE/build/oe-core/tmp-glibc/work=
/core2-64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log indicates errors, see=
 grep -e '^inode mismatch' -e '^creat ignored for existing file' -e '^creat=
 for.*replaces existing' /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/systemd/1_234-r0/pseudo/pseudo.log or grep -v '^path mismatch' /OE/build/o=
e-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log
ERROR: systemd-1_234-r0 do_qa_pseudo: Function failed: do_qa_pseudo
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2=
-64-oe-linux/systemd/1_234-r0/temp/log.do_qa_pseudo.28996
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/systemd/=
systemd_234.bb:do_qa_pseudo) failed with exit code '1'
ERROR: dbus-1.10.20-r0 do_qa_pseudo: This /OE/build/oe-core/tmp-glibc/work/=
core2-64-oe-linux/dbus/1.10.20-r0/pseudo/pseudo.log indicates errors, see g=
rep -e '^inode mismatch' -e '^creat ignored for existing file' -e '^creat f=
or.*replaces existing' /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/d=
bus/1.10.20-r0/pseudo/pseudo.log or grep -v '^path mismatch' /OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/dbus/1.10.20-r0/pseudo/pseudo.log
ERROR: dbus-1.10.20-r0 do_qa_pseudo: Function failed: do_qa_pseudo
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2=
-64-oe-linux/dbus/1.10.20-r0/temp/log.do_qa_pseudo.29053
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/dbus/dbu=
s_1.10.20.bb:do_qa_pseudo) failed with exit code '1'

OE @ ~/openembedded-core $ grep -v '^path mismatch' /OE/build/oe-core/tmp-g=
libc/work/core2-64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log
debug_logfile: fd 2
pid 22562 [parent 22560], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 22560.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/group' ino 29361846 in db, 29361904 in request.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/group' ino 29361846 in db, 29361904 in request.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/group' ino 29361846 in db, 29361901 in request.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361911 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361911 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361942 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361942 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361901 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361901 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361957 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361957 in reques=
t.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
/1_234-r0/recipe-sysroot/etc/passwd' ino 29361844 in db, 29361972 in reques=
t.
db cleanup for server shutdown, 22:44:28.138
memory-to-file backup complete, 22:44:28.138.
db cleanup finished, 22:44:28.138


OE @ ~/openembedded-core $ grep -v '^path mismatch' /OE/build/oe-core/tmp-g=
libc/work/core2-64-oe-linux/dbus/1.10.20-r0/pseudo/pseudo.log
debug_logfile: fd 2
pid 23440 [parent 23433], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 23433.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/dbus/1.=
10.20-r0/recipe-sysroot/etc/group' ino 29391451 in db, 29391468 in request.
inode mismatch: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/dbus/1.=
10.20-r0/recipe-sysroot/etc/passwd' ino 29391450 in db, 29391470 in request.
db cleanup for server shutdown, 22:44:42.563
memory-to-file backup complete, 22:44:42.563.
db cleanup finished, 22:44:42.563

So maybe we should filter the log only for the other 2 entries.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbmaFwAKCRA3VSO3ZXaA
HMcVAJ9zSkQIGWf3GGvttFmfDAgRKLPjzQCgrtFUNywHAhRE8KubyS+2tH8eN6g=
=4DOy
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
