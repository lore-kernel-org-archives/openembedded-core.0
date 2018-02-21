Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78B21786DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:22:35 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u49so8024223wrc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rRYLqZyop6U8NQP9LehRA34T4qvQiwtcJrvqMG8hOUM=;
	b=Wro41AUc/MvfmWPERYVajdVo2ym0iBrz55+sYlHxJv0/hua7/LduUorPlIxaX1sA9g
	pwNKJymqeB1E7Z64N2aetkQTGqX21W7+nv+fD6JT4MRhl/2UJICtIyFCQB25kUz14+YS
	h0W5VcEwY1q3UlCOb23lDY6SH18JRtggX8AdljYNdf5fg6u3wayOGmh+c+fWr9ZxMuOf
	Cb5mCz6AoDbSH1c2CXP4mLhNCm2DeV0SmfRFXmR29GhNp5ks14FZg/0/usfxbUBoXimf
	Smk1AjIk7rk49fxZNV/aT4Jfm+UBje5ttb54Iw+QKT2mYWJgKroc0PvcBp/OLykL/Wn/
	3YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rRYLqZyop6U8NQP9LehRA34T4qvQiwtcJrvqMG8hOUM=;
	b=BtpPjg6veRS2ISZZXQLz702FFzFQ53WvXsV+pWtlcpKlDqwqKIcpf+prtJTYLTn1i7
	xakvZfvXilGQUueoZ6jWqWS/foIk1g3akCQJxtk41dkn7haAr7KacGMaWL5+7NBGpRvj
	w/nc/20ws1PJlK9NZU6QtQiPgEYU1iKUKSxvx3p8FUHQEWAjn9K276SlgWTjMovc9Mtn
	/0ePfm8S6jUq9+5JP3s0i57erKXzQ0VsCSkPXHeb/A48mxc25QcV+fshaMqBAmpSx5P0
	iNLhFYEY+KXXgNIKO0nDXVkVkjI2y2jJ1z6FyyM2lLhbAxU/Uz0JU6+vtK485o1pQzq3
	Rjzw==
X-Gm-Message-State: APf1xPDNdMZ2f5VHamrMKUbE6HLH6rhcbspcfLZY5WekWzWpF6mOBnkp
	i7NVvJbNR5UJ9iF+oAFSDg5557bzdm5SY4RGcLM80A==
X-Google-Smtp-Source: AH8x226tJyUyIxHtd4biF4Ly2dEk0w8CsIN4Ok5xmVVvDQs57zrNa+PLe1QxxW9NHLf3aVmxuZyO8YUcdYy3hBnnt38=
X-Received: by 10.223.161.10 with SMTP id o10mr4167655wro.60.1519244556191;
	Wed, 21 Feb 2018 12:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Wed, 21 Feb 2018 12:22:35 -0800 (PST)
In-Reply-To: <20180212110521.16974-7-alexander.kanavin@linux.intel.com>
References: <20180212110521.16974-1-alexander.kanavin@linux.intel.com>
	<20180212110521.16974-7-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 21 Feb 2018 12:22:35 -0800
Message-ID: <CAJ86T=UAyydyERNCAdoMC_rpjpa461tOo23b6qxJF6FJOmFzSA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] man-db: replace the outdated man implementation
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
X-List-Received-Date: Wed, 21 Feb 2018 20:22:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 12, 2018 at 3:05 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Until now oe-core has been using a well obsolete implementation of man.
>
> Man-db on the other hand is used by all modern Linux distros, is actively
> maintained, has a standard build system, and does not require 30 patches
> to build.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>
> diff --git a/meta/recipes-extended/man-db/man-db_2.8.1.bb b/meta/recipes-extended/man-db/man-db_2.8.1.bb
> new file mode 100644
> index 00000000000..4e633acd09e
> --- /dev/null
> +++ b/meta/recipes-extended/man-db/man-db_2.8.1.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
> +HOMEPAGE = "http://man-db.nongnu.org/"
> +LICENSE = "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> +                    file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
> +
> +SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
> +SRC_URI[md5sum] = "51842978e06686286421f9498d1009b7"
> +SRC_URI[sha256sum] = "a6aec641ca3d9942b054cc0e9c3f05cb46a3a992bc0006795755e2fed1357f3e"
> +
> +DEPENDS = "libpipeline gdbm groff-native less"

less should be a runtime dependency, not build time.

> +# | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
> +USE_NLS_libc-musl = "no"
> +
> +inherit gettext pkgconfig autotools
> +
> +EXTRA_OECONF = "--with-pager=less --disable-cache-owner"
> +
> +do_install_append_libc-musl() {
> +        rm -f ${D}${libdir}/charset.alias
> +}
> +
> +FILES_${PN} += "${libdir}/tmpfiles.d"
> +
> +FILES_${PN}-dev += "${libdir}/${PN}/libman.so ${libdir}/${PN}/libmandb.so"
> +
> +RPROVIDES_${PN} += " man"
> +
> +def compress_pkg(d):
> +    if "compress_doc" in (d.getVar("INHERIT") or "").split():
> +         compress = d.getVar("DOC_COMPRESS")
> +         if compress == "gz":
> +             return "gzip"
> +         elif compress == "bz2":
> +             return "bzip2"
> +         elif compress == "xz":
> +             return "xz"
> +    return ""
> +
> +RDEPENDS_${PN} += "${@compress_pkg(d)}"

