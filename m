Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5007CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:44:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56282.1780929873989560488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HRRtHAjP;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so14095955e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780929872; x=1781534672; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYC/QoerkCXoCwd1pmMngDyF8HEs8+DeAy/uw1ET+t8=;
        b=HRRtHAjPpqYZ1861CbOvmhe5Cs3ObpBsQaVZy25zRoSantOtWvOeqNe+7VUwpdLSOc
         v6Reqjo7G3um/nrgpyVKuk7F3qmCMd+ALj2xnMFQC3sxywsg6sIXbx7QIu7gVSknCx0/
         UAqkltW4suKGIkt524dT+E5ohJblpfZaM6mBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929872; x=1781534672;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYC/QoerkCXoCwd1pmMngDyF8HEs8+DeAy/uw1ET+t8=;
        b=HHqUqFAOdTHhRWwLijsochD0X6xkir2JbaXV+G2fSH/7DHVmJZINkbO8vjGOGR7Ttn
         R5bwTS+wfh2DvpTNh/6GY70Fjl7eGDsBDKwJM9qKs7MnCabQhsNnjkjx1rQJjZzcJljp
         E5z87LVKUOJu87zdh4ZYVsMkjc4gprtmrSF+69Zi8zve5TZbkLElm9BQrGyvYdixC8in
         EBYlRAEejHn+EY2J1ONuIU2PIrmfGMEl0b96hM1FeNHCRM7Icj2I3usCLOttDfIr1dg2
         Pqr3aYBQBtDZ1DSmIp7O3x1TydulHCqh/uqXvAiZ5lwzoh3x3qTqeiZaAd4+cJzh+dXV
         bwoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+doClNJOIBxa6BXNfrVGlLiviGgv8pIXYLnIeQh1tLSDq8CYBlmZJ+JrfszwT2bZ6+AQaO6ECuxY5WXzYfW3HSuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9a5MkrmIUWp4tr/PiflOr5wZ2CZ20h0fX8IAcP8zcsucWPxyh
	Ziye1ADLzSlKVnbnK00z9vT8jM1TEvI3gLBP8wBqkPIZWnAbk7EgBS8aBKVRpWsPNQ==
X-Gm-Gg: Acq92OFxRUKDPk5pqCwFbDjOSyKToD3WWvaJjtMevpOZfztAFW55oUk3ZPaepMlt0CQ
	SmbQ63T07eB1MtxgNZ5Iv/CP40vbDCKWE1eW4UKcRAjlve3W3y4TrzdSdXv3STX4oOZ9FImTy8l
	uZX9hRb5yyhPE4PxN56DE0/POdzqL8nqq4Anxz5SPqFiwha7XbnwlN4lQ53LYZpl6SzqdtybJIf
	Xb+E8z9zSBq2bg/jD0/zxzFonIESeNH4L3GIlHtz4OpkApbPS1rZK4Rpn17K0EocH5049I0ylgR
	HO/SqlJnmYyD6UT+3GTEO4CjqtWkHBIdA6uK6BOhZAX8lEeAto0GsOl+mCbKGgiUJJvEOxSRn9X
	cJqxPrvBCbim3nwxGGgiZpql8+CGrZyw3lXkVwie4kaMj+CqnyUKdWd2q2IkaPLQyB/lIE1rw+z
	jykNAgtT+RdlNonoBBUqyYmGsNvz5tlmIhUAiKR3g0rf0=
X-Received: by 2002:a05:600c:310e:b0:490:b58b:a8cb with SMTP id 5b1f17b1804b1-490c263a615mr258031575e9.26.1780929872220;
        Mon, 08 Jun 2026 07:44:32 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm435079175e9.8.2026.06.08.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:44:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:44:31 +0200
Message-Id: <DJ3QY884Q2R3.3DTBWW97HDVD8@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH] libcap: Fix CVE-2026-4878
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
X-Mailer: aerc 0.21.0
References: <20260601134257.47867-1-adongare@cisco.com>
In-Reply-To: <20260601134257.47867-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238248

Hello Anil

from what I can tell, this CVE was fixed in master but not in wrynose
please submit a patch for wrynose then ping this thread so we can apply
to scarthgap


thanks a lot
Jeremy


On Mon Jun 1, 2026 at 3:42 PM CEST, Anil Dongare -X (adongare - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick the upstream patch [1] as mentioned in [2].
>
> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=3D286=
ace1259992bd0c5d9016715833f2e148ac596
> [2] https://security-tracker.debian.org/tracker/CVE-2026-4878
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../libcap/files/CVE-2026-4878.patch          | 162 ++++++++++++++++++
>  meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
>  2 files changed, 163 insertions(+)
>  create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch
>
> diff --git a/meta/recipes-support/libcap/files/CVE-2026-4878.patch b/meta=
/recipes-support/libcap/files/CVE-2026-4878.patch
> new file mode 100644
> index 0000000000..827e41b8a0
> --- /dev/null
> +++ b/meta/recipes-support/libcap/files/CVE-2026-4878.patch
> @@ -0,0 +1,162 @@
> +From 286ace1259992bd0c5d9016715833f2e148ac596 Mon Sep 17 00:00:00 2001
> +From: "Andrew G. Morgan" <morgan@kernel.org>
> +Date: Thu, 12 Mar 2026 07:38:05 -0700
> +Subject: [PATCH] Address a potential TOCTOU race condition in cap_set_fi=
le().
> +
> +This issue was researched and reported by Ali Raza (@locus-x64). It
> +has been assigned CVE-2026-4878.
> +
> +The finding is that while cap_set_file() checks if a file is a regular
> +file before applying or removing a capability attribute, a small
> +window existed after that check when the filepath could be overwritten
> +either with new content or a symlink to some other file. To do this
> +would imply that the caller of cap_set_file() was directing it to a
> +directory over which a local attacker has write access, and performed
> +the operation frequently enough that an attacker had a non-negligible
> +chance of exploiting the race condition. The code now locks onto the
> +intended file, eliminating the race condition.
> +
> +CVE: CVE-2026-4878
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/li=
bcap.git/commit/?id=3D286ace1259992bd0c5d9016715833f2e148ac596]
> +
> +Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> +(cherry picked from commit 286ace1259992bd0c5d9016715833f2e148ac596)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + libcap/cap_file.c  | 69 +++++++++++++++++++++++++++++++++++++++-------
> + progs/quicktest.sh | 14 +++++++++-
> + 2 files changed, 72 insertions(+), 11 deletions(-)
> +
> +diff --git a/libcap/cap_file.c b/libcap/cap_file.c
> +index 0bc07f7..f02bf9f 100644
> +--- a/libcap/cap_file.c
> ++++ b/libcap/cap_file.c
> +@@ -8,8 +8,13 @@
> + #define _DEFAULT_SOURCE
> + #endif
> +=20
> ++#ifndef _GNU_SOURCE
> ++#define _GNU_SOURCE
> ++#endif
> ++
> + #include <sys/types.h>
> + #include <byteswap.h>
> ++#include <fcntl.h>
> + #include <sys/stat.h>
> + #include <unistd.h>
> +=20
> +@@ -322,26 +327,70 @@ int cap_set_file(const char *filename, cap_t cap_d=
)
> +     struct vfs_ns_cap_data rawvfscap;
> +     int sizeofcaps;
> +     struct stat buf;
> ++    char fdpath[64];
> ++    int fd, ret;
> ++
> ++    _cap_debug("setting filename capabilities");
> ++    fd =3D open(filename, O_RDONLY|O_NOFOLLOW);
> ++    if (fd >=3D 0) {
> ++	ret =3D cap_set_fd(fd, cap_d);
> ++	close(fd);
> ++	return ret;
> ++    }
> +=20
> +-    if (lstat(filename, &buf) !=3D 0) {
> +-	_cap_debug("unable to stat file [%s]", filename);
> ++    /*
> ++     * Attempting to set a file capability on a file the process can't
> ++     * read the content of. This is considered a non-standard use case
> ++     * and the following (slower) code is complicated because it is
> ++     * trying to avoid a TOCTOU race condition.
> ++     */
> ++
> ++    fd =3D open(filename, O_PATH|O_NOFOLLOW);
> ++    if (fd < 0) {
> ++	_cap_debug("cannot find file at path [%s]", filename);
> ++	return -1;
> ++    }
> ++    if (fstat(fd, &buf) !=3D 0) {
> ++	_cap_debug("unable to stat file [%s] descriptor %d",
> ++		   filename, fd);
> ++	close(fd);
> + 	return -1;
> +     }
> +     if (S_ISLNK(buf.st_mode) || !S_ISREG(buf.st_mode)) {
> +-	_cap_debug("file [%s] is not a regular file", filename);
> ++	_cap_debug("file [%s] descriptor %d for non-regular file",
> ++		   filename, fd);
> ++	close(fd);
> + 	errno =3D EINVAL;
> + 	return -1;
> +     }
> +=20
> +-    if (cap_d =3D=3D NULL) {
> +-	_cap_debug("removing filename capabilities");
> +-	return removexattr(filename, XATTR_NAME_CAPS);
> ++    /*
> ++     * While the fd remains open, this named file is locked to the
> ++     * origin regular file. The size of the fdpath variable is
> ++     * sufficient to support a 160+ bit number.
> ++     */
> ++    if (snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd)
> ++	>=3D sizeof(fdpath)) {
> ++	_cap_debug("file descriptor too large %d", fd);
> ++	errno =3D EINVAL;
> ++	ret =3D -1;
> ++
> ++    } else if (cap_d =3D=3D NULL) {
> ++	_cap_debug("dropping file caps on [%s] via [%s]",
> ++		   filename, fdpath);
> ++	ret =3D removexattr(fdpath, XATTR_NAME_CAPS);
> ++
> +     } else if (_fcaps_save(&rawvfscap, cap_d, &sizeofcaps) !=3D 0) {
> +-	return -1;
> +-    }
> ++	_cap_debug("problem converting cap_d to vfscap format");
> ++	ret =3D -1;
> +=20
> +-    _cap_debug("setting filename capabilities");
> +-    return setxattr(filename, XATTR_NAME_CAPS, &rawvfscap, sizeofcaps, =
0);
> ++    } else {
> ++	_cap_debug("setting filename capabilities");
> ++	ret =3D setxattr(fdpath, XATTR_NAME_CAPS, &rawvfscap,
> ++		       sizeofcaps, 0);
> ++    }
> ++    close(fd);
> ++    return ret;
> + }
> +=20
> + /*
> +diff --git a/progs/quicktest.sh b/progs/quicktest.sh
> +index e6c48e6..5dc72f9 100755
> +--- a/progs/quicktest.sh
> ++++ b/progs/quicktest.sh
> +@@ -148,7 +148,19 @@ pass_capsh --caps=3D"cap_setpcap=3Dp" --inh=3Dcap_c=
hown --current
> + pass_capsh --strict --caps=3D"cap_chown=3Dp" --inh=3Dcap_chown --curren=
t
> +=20
> + # change the way the capability is obtained (make it inheritable)
> ++chmod 0000 ./privileged
> + ./setcap cap_setuid,cap_setgid=3Dei ./privileged
> ++if [ $? -ne 0 ]; then
> ++    echo "FAILED to set file capability"
> ++    exit 1
> ++fi
> ++chmod 0755 ./privileged
> ++ln -s privileged unprivileged
> ++./setcap -r ./unprivileged
> ++if [ $? -eq 0 ]; then
> ++    echo "FAILED by removing a capability from a symlinked file"
> ++    exit 1
> ++fi
> +=20
> + # Note, the bounding set (edited with --drop) only limits p
> + # capabilities, not i's.
> +@@ -246,7 +258,7 @@ EOF
> +     pass_capsh --iab=3D'!%cap_chown,^cap_setpcap,cap_setuid'
> +     fail_capsh --mode=3DPURE1E --iab=3D'!%cap_chown,^cap_setuid'
> + fi
> +-/bin/rm -f ./privileged
> ++/bin/rm -f ./privileged ./unprivileged
> +=20
> + echo "testing namespaced file caps"
> +=20
> +--=20
> diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-su=
pport/libcap/libcap_2.69.bb
> index 03975b44a0..43185f027e 100644
> --- a/meta/recipes-support/libcap/libcap_2.69.bb
> +++ b/meta/recipes-support/libcap/libcap_2.69.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/li=
nux-privs/${BPN}2/${BPN}-${
>             file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-=
use.patch \
>             file://0002-tests-do-not-run-target-executables.patch \
>             file://CVE-2025-1390.patch \
> +           file://CVE-2026-4878.patch \
>             "
>  SRC_URI:append:class-nativesdk =3D " \
>             file://0001-nativesdk-libcap-Raise-the-size-of-arrays-contain=
ing.patch \


