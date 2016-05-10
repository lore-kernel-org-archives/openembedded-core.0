Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF73731C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:31:20 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id iv1so77842587pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 17:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cvbF1xMfdTQhdfNi9aUsXatxbLnTQPNIBgQQXGAc6hs=;
	b=TZSta7yzf+x9elVQOpbB/h9V3kyYsTCI8mImVfbiJIQEdeg/wDh9V3rqvlGTiWOdYC
	jCKWGesQcRcczJqnTHVV+UfmljvWY9T61Yn7bNs7LxOTMAmQKe/9gU394kPQ51JvCLHM
	fu84TsIGLgTg9qsYbaZxTnZFbz8OG/jHd96y+JnjGF80Ilc3qjUl9ZRKhQe6BlCZsh1s
	xOG/lfP8liUgmaj8cc9rLak2evSfsI5iW4jF42QL0imDcLsvG6gJ0nPx+M/YDr877oq2
	ZTEN9r1acSqdXrsyu+s2Z8L0OJQVLXMDU5FiWbSmNgmbeMDD27EktDEEGtf3pjiErimd
	qbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cvbF1xMfdTQhdfNi9aUsXatxbLnTQPNIBgQQXGAc6hs=;
	b=HuQU7hEpgSJx05Nwjk9DwAVELloR/OIQXUlUwkvcbf4S+d8R5HAxZZvYLQZDF3ubaK
	GkQAoADt2TWv1/HTXr3+ge5N0FAaymAOi4q7ilM+86ckZyWbIA8UJOpX+dI76TjpjvLM
	zs04QkgK/F7w1ui8Hl3YQtwLj5CrcpVj2hh0s5dhimxYvnWhpUu2obaHPfBZhVCPb8A8
	JFTHr8VS2HfybtDraiOM181xAkARWzhp5ymNCkPzVP9luNByZbalUTkLVUityH4T8QAj
	EB4LrziMoFK5/epIn4ON9QbofzdpbHSE4vAxlXrVCTn+dv86Un4U8C0JtkWfH+drXhhP
	V7Og==
X-Gm-Message-State: AOPr4FUbauBgaIiFQkj/lVX8zR5r+/uHDTq842c9hhCjR7/IzMQpL0SiFIT4nd/G7xbyeA==
X-Received: by 10.66.123.105 with SMTP id lz9mr54665821pab.37.1462840281044;
	Mon, 09 May 2016 17:31:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1462:b3e2:90da:dbff?
	([2601:646:8800:5a9a:1462:b3e2:90da:dbff])
	by smtp.gmail.com with ESMTPSA id n6sm43144295pfa.2.2016.05.09.17.31.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 17:31:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <992d6a28565d33b924df7e500eaff1de952ef926.1462768634.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 17:31:30 -0700
Message-Id: <4665D6E0-64F7-4438-837C-7F5CCDBE2B18@gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<cover.1462768634.git.paul.eggleton@linux.intel.com>
	<992d6a28565d33b924df7e500eaff1de952ef926.1462768634.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/6] systemd: check for required kernel config options
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
X-List-Received-Date: Tue, 10 May 2016 00:31:21 -0000
X-Groupsio-MsgNum: 81778
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF00CEF1-B89D-4E9F-94D1-F3F0CF787817";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DF00CEF1-B89D-4E9F-94D1-F3F0CF787817
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 8, 2016, at 9:43 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> Use the list in the systemd 225 README to set required Linux kernel
> config options.
>=20
> Fixes [YOCTO #5574].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-core/systemd/systemd_229.bb | 19 ++++++++++++++++++-
> 1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_229.bb =
b/meta/recipes-core/systemd/systemd_229.bb
> index c23c749..d64b3cd 100644
> --- a/meta/recipes-core/systemd/systemd_229.bb
> +++ b/meta/recipes-core/systemd/systemd_229.bb
> @@ -22,7 +22,7 @@ DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native =
intltool-native gperf-native acl rea
>=20
> SECTION =3D "base/shell"
>=20
> -inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext bash-completion
> +inherit useradd pkgconfig autotools perlnative update-rc.d =
update-alternatives qemu systemd ptest gettext bash-completion =
kernel-check
>=20
> SRCREV =3D "714c62b46379abb7558c544665522aca91691e10"
>=20
> @@ -192,6 +192,23 @@ CFLAGS .=3D =
"${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=3D1', ''
> # disable problematic GCC 5.2 optimizations [YOCTO #8291]
> FULL_OPTIMIZATION_append_arm =3D " -fno-schedule-insns =
-fno-schedule-insns2"
>=20
> +# All the required options from the systemd README
> +REQUIRED_KERNEL_OPTIONS =3D "\
> +                           CONFIG_DEVTMPFS \
> +                           CONFIG_CGROUPS \
> +                           CONFIG_INOTIFY_USER \
> +                           CONFIG_SIGNALFD \
> +                           CONFIG_TIMERFD \
> +                           CONFIG_EPOLL \
> +                           CONFIG_NET \
> +                           CONFIG_SYSFS \
> +                           CONFIG_PROC_FS \
> +                           CONFIG_FHANDLE \
> +                           CONFIG_SYSFS_DEPRECATED=3Dn \
> +                           CONFIG_UEVENT_HELPER_PATH=3D'' \
> +                           CONFIG_FW_LOADER_USER_HELPER=3Dn \

We still carry the patch for user fw loader. So this may be removed.

> +                           "
> +
> do_configure_prepend() {
> 	export NM=3D"${HOST_PREFIX}gcc-nm"
> 	export AR=3D"${HOST_PREFIX}gcc-ar"
> --
> 2.5.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DF00CEF1-B89D-4E9F-94D1-F3F0CF787817
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcxK+UACgkQuwUzVZGdMxSkmQCeMvUJL3rhp7zKWysFZcpe0KzI
SLcAnRD3wRckVmEXO4Jdh7pOjSudCxJ7
=fgfW
-----END PGP SIGNATURE-----

--Apple-Mail=_DF00CEF1-B89D-4E9F-94D1-F3F0CF787817--
