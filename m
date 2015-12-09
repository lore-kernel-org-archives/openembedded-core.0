Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 82788601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:25:53 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so20682815pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=JBx7ShXwx/s4sLcnjbfHfYhfSNjevW2b34ry7EImCNg=;
	b=0B7g6sRi3k44GhoUruBfLHP8MgZNL3JgyxmKdx4wHqsXRByBbxN6byHjo/VuOTvfIK
	H+daERlzXm84FrgfIrQGtytjDQJcGWnS3MdS4vWWV49xQUFWzFAbVSog/1nYrI07lgCc
	M4B+5Ux7aUF0zxqDPYoyLjIyUY86391fl9VnWzUOqvOXObpBFBS2XJA6eUAwzj1a4/YG
	NEasfsyrNMnAlX9YF5caquaQ0nkNHo759Xi3QXR/3oaD6Q8RSpLOTMHb83BvjooX6WTF
	HE7NINnZ4PHzw3GEICx/xTFUtoXbsgsHqGxximCVAwyf622OBoKYhq/XAqcI4rz8aL74
	QXWg==
X-Received: by 10.66.100.196 with SMTP id fa4mr4250111pab.21.1449624354097;
	Tue, 08 Dec 2015 17:25:54 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:79ff:cd90:5118:eafc?
	([2601:646:8802:5d5c:79ff:cd90:5118:eafc])
	by smtp.gmail.com with ESMTPSA id
	p26sm7265920pfi.94.2015.12.08.17.25.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Dec 2015 17:25:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <58367996ce98eadb065c56cac62a034052e9cc4f.1449562195.git.raj.khem@gmail.com>
Date: Tue, 8 Dec 2015 17:25:48 -0800
Message-Id: <28D2A4B4-1CEF-4EF9-9A1B-698DB90F3491@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
	<cover.1449562195.git.raj.khem@gmail.com>
	<58367996ce98eadb065c56cac62a034052e9cc4f.1449562195.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH 10/13] busybox: Add config for musl
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
X-List-Received-Date: Wed, 09 Dec 2015 01:25:53 -0000
X-Groupsio-MsgNum: 74504
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9FB9488E-7855-481C-B05F-42B9CAAA2804";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9FB9488E-7855-481C-B05F-42B9CAAA2804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 8, 2015, at 12:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Default config is enabling additional features that dont compile with
> musl so lets disable them for musl case and use posix compliant
> getpwent()

0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch is no =
longer needed after 1.24 upgrade
so I have dropped it from pull request branch.


>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> ...user-use-POSIX-getpwent-instead-of-getpwe.patch | 71 =
++++++++++++++++++++++
> meta/recipes-core/busybox/busybox/musl.cfg         | 12 ++++
> meta/recipes-core/busybox/busybox_1.24.1.bb        |  2 +
> 3 files changed, 85 insertions(+)
> create mode 100644 =
meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-=
instead-of-getpwe.patch
> create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
>=20
> diff --git =
a/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwen=
t-instead-of-getpwe.patch =
b/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwen=
t-instead-of-getpwe.patch
> new file mode 100644
> index 0000000..4cb9a73
> --- /dev/null
> +++ =
b/meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwen=
t-instead-of-getpwe.patch
> @@ -0,0 +1,71 @@
> +=46rom f47fa75ef19a43848dedb4a2bff79368878362bf Mon Sep 17 00:00:00 =
2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Tue, 22 Apr 2014 12:41:20 +0000
> +Subject: [PATCH] linedit, deluser: use POSIX getpwent instead of =
getpwent_r
> +
> +This fixes building with musl libc.
> +
> +Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> +---
> +Upstream-Status: backport
> +
> + libbb/lineedit.c     | 11 ++++-------
> + loginutils/deluser.c | 11 +++++------
> + 2 files changed, 9 insertions(+), 13 deletions(-)
> +
> +diff --git a/libbb/lineedit.c b/libbb/lineedit.c
> +index 8564307..99e6e2c 100644
> +--- a/libbb/lineedit.c
> ++++ b/libbb/lineedit.c
> +@@ -672,20 +672,17 @@ static char *username_path_completion(char *ud)
> +  */
> + static NOINLINE unsigned complete_username(const char *ud)
> + {
> +-	/* Using _r function to avoid pulling in static buffers */
> +-	char line_buff[256];
> +-	struct passwd pwd;
> +-	struct passwd *result;
> ++	struct passwd *pw;
> + 	unsigned userlen;
> +
> + 	ud++; /* skip ~ */
> + 	userlen =3D strlen(ud);
> +
> + 	setpwent();
> +-	while (!getpwent_r(&pwd, line_buff, sizeof(line_buff), &result)) =
{
> ++	while ((pw =3D getpwent())) {
> + 		/* Null usernames should result in all users as possible =
completions. */
> +-		if (/*!userlen || */ strncmp(ud, pwd.pw_name, userlen) =
=3D=3D 0) {
> +-			add_match(xasprintf("~%s/", pwd.pw_name));
> ++		if (/*!userlen || */ strncmp(ud, pw->pw_name, userlen) =
=3D=3D 0) {
> ++			add_match(xasprintf("~%s/", pw->pw_name));
> + 		}
> + 	}
> + 	endpwent();
> +diff --git a/loginutils/deluser.c b/loginutils/deluser.c
> +index e39ac55..d7d9b24 100644
> +--- a/loginutils/deluser.c
> ++++ b/loginutils/deluser.c
> +@@ -73,14 +73,13 @@ int deluser_main(int argc, char **argv)
> + 			if (!member) {
> + 				/* "delgroup GROUP" */
> + 				struct passwd *pw;
> +-				struct passwd pwent;
> + 				/* Check if the group is in use */
> +-#define passwd_buf bb_common_bufsiz1
> +-				while (!getpwent_r(&pwent, passwd_buf, =
sizeof(passwd_buf), &pw)) {
> +-					if (pwent.pw_gid =3D=3D =
gr->gr_gid)
> +-						=
bb_error_msg_and_die("'%s' still has '%s' as their primary group!", =
pwent.pw_name, name);
> ++				setpwent();
> ++				while ((pw =3D getpwent())) {
> ++					if (pw->pw_gid =3D=3D =
gr->gr_gid)
> ++						=
bb_error_msg_and_die("'%s' still has '%s' as their primary group!", =
pw->pw_name, name);
> + 				}
> +-				//endpwent();
> ++				endpwent();
> + 			}
> + 			pfile =3D bb_path_group_file;
> + 			if (ENABLE_FEATURE_SHADOWPASSWDS)
> +--
> +1.9.2
> +
> diff --git a/meta/recipes-core/busybox/busybox/musl.cfg =
b/meta/recipes-core/busybox/busybox/musl.cfg
> new file mode 100644
> index 0000000..facfe85
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/musl.cfg
> @@ -0,0 +1,12 @@
> +# CONFIG_EXTRA_COMPAT is not set
> +# CONFIG_SELINUX is not set
> +# CONFIG_FEATURE_HAVE_RPC is not set
> +# CONFIG_WERROR is not set
> +# CONFIG_FEATURE_SYSTEMD is not set
> +# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
> +# CONFIG_PAM is not set
> +# CONFIG_FEATURE_INETD_RPC is not set
> +# CONFIG_SELINUXENABLED is not set
> +# CONFIG_FEATURE_MOUNT_NFS is not set
> +# CONFIG_FEATURE_UTMP is not set
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb =
b/meta/recipes-core/busybox/busybox_1.24.1.bb
> index 7d2a7b2..7c9e5ea 100644
> --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
> @@ -32,12 +32,14 @@ SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>            file://busybox-cross-menuconfig.patch \
>            =
file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
>            file://0002-Passthrough-r-to-linker.patch \
> +           =
file://0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch \
>            file://mount-via-label.cfg \
>            file://sha1sum.cfg \
>            file://sha256sum.cfg \
>            file://getopts.cfg \
>            file://resize.cfg \
> "
> +SRC_URI_append_libc-musl =3D " file://musl.cfg "
>=20
> SRC_URI[tarball.md5sum] =3D "be98a40cadf84ce2d6b05fa41a275c6a"
> SRC_URI[tarball.sha256sum] =3D =
"37d03132cc078937360b392170b7a1d0e5b322eee9f57c0b82292a8b1f0afe3d"
> --
> 2.6.3
>=20


--Apple-Mail=_9FB9488E-7855-481C-B05F-42B9CAAA2804
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZngyAACgkQuwUzVZGdMxRKXwCeKnfU9rsstgVfnCmWRpDUFZr4
e2YAn2imk46R++0PgoueG7EueDzYqMfm
=qI0S
-----END PGP SIGNATURE-----

--Apple-Mail=_9FB9488E-7855-481C-B05F-42B9CAAA2804--
