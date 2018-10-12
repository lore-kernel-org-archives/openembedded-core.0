Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEAB79B24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:13:07 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 14so8014655oth.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZBRuXCVM49LfbHigPzpqokhoEhSViHbtXCbzQr0EoKM=;
	b=r0QKYjbM0pjTxaAIKbdA+CYl90HouDsCHLFHBPzs3/wSR/SkQwJb/PxRRiUPrW4Dh9
	1+JZB6WlwXg0b3oxKeSZUknVynglY9rBmFcp8S97tgnjvyEfrAlymUL/lv9/lQhAl3rn
	u9ZMYxEQ3fYEqSElNHjsw7eOfSuZVS0879qCWQSAWpiYOno/SqiTjEBK30WkKF5mFkPi
	s1Ww8Tz2f3/0b/lEGaE2ZAZjr08Hl/DTKUoTMH0jFbr6xacdJfMspRxOYyFQRQtCJ+Cm
	yWnJalyODI3WgxDAbWDvBATivkKQ/X+Jw5vyvj6tQKUm1IhvOcqy8ERaQnQf7SWIbcVY
	0Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZBRuXCVM49LfbHigPzpqokhoEhSViHbtXCbzQr0EoKM=;
	b=QKxxJier3I60hscowIQtrHj4IEAWdfT/qFPDN8xz1TeW6vn35w5DQt1VsdZEHWuC1b
	wPogG/FUOhT11M5ERvlF4a7A7AU1AFjnwKZYerlGu9rQjvNQcOb9US/jEO0MY0DpKI7X
	wem6Wk+ZcQPMd3ol+M9QNDhVXyrW0MR3bGcBj3l/w5KZc5VUG+ygZFfG9RQJ8IxHoyAv
	LSNUxTBh8vhS2zABGy/TjXJKMEUwyxtIA67llII9VTzpGAAZVSo8/uI6NmD/lt3lCmCg
	Zrht0G6gFBAdf9VVZOsCp4thHkPBZSndNSAOLjpPqbs5hnmVx86upM01AsG+deR8MQ4u
	vchw==
X-Gm-Message-State: ABuFfogE6nFbSHPJybOWIz74QbE+Lrm0WCr6tRanTSFGDGQ7y1+94u8V
	Hv/pR5ClzXvakM/E/4SFtcO2qPqns5dAXEbCJFVFQg==
X-Google-Smtp-Source: ACcGV61cee+QD3yNNH3h8EhbFbbHCMmffYUzcGK+G4qWO8LfFtHsdQA3Ckj07tNn7P5ym+TPxIS5PUdfqXmPA8y0pi8=
X-Received: by 2002:a9d:7613:: with SMTP id
	k19-v6mr3666435otl.297.1539342788211; 
	Fri, 12 Oct 2018 04:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1539312696-151975-1-git-send-email-rui.wang@windriver.com>
In-Reply-To: <1539312696-151975-1-git-send-email-rui.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Oct 2018 12:12:56 +0100
Message-ID: <CAJTo0LYw+QsCYT1FjAVtFEYZ3f1qS50vbowudmQs5whS2qn7hA@mail.gmail.com>
To: rui.wang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: fix utime for symlink
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
X-List-Received-Date: Fri, 12 Oct 2018 11:13:07 -0000
Content-Type: text/plain; charset="UTF-8"

Please change the shortlog to say that the patch is to unfs3 and not attr.

Ross

On Fri, 12 Oct 2018 at 04:10, Rui Wang <rui.wang@windriver.com> wrote:
>
> Signed-off-by: Rui Wang <rui.wang@windriver.com>
>
> cherry-pick of fa191666b with context for SRC_URI addition
> modified to apply to current recipe.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../unfs3/0001-attr-fix-utime-for-symlink.patch    | 85 ++++++++++++++++++++++
>  meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb   |  3 +-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
>
> diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
> new file mode 100644
> index 0000000..6957d10
> --- /dev/null
> +++ b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
> @@ -0,0 +1,85 @@
> +From 3f4fcb62661059bad77a2e957b4621137797bc2f Mon Sep 17 00:00:00 2001
> +From: Rui Wang <rui.wang@windriver.com>
> +Date: Fri, 15 Jun 2018 14:19:10 +0800
> +Subject: [PATCH] attr: fix utime for symlink
> +
> +unfs3 has an old defect that it can not change the timestamps of a
> +symlink file because it only uses utime(), which will follow the
> +symlink. This will not cause an error if the symlink points to an
> +existent file. But under some special situation, such as installing
> +a rpm package, rpm tool will create the symlink first and try to
> +modify the timestamps of it, when the target file is non-existent.
> +This will cause an ESTALE error. Making rpm tool ignore this error
> +is a solution, but not the best one. An acceptable approach is
> +Making unfs3 support lutimes(), which can modify the symlink file
> +itself. Considering not every system support this function, so a
> +function checking is necessary.
> +
> +Upstream-Status: Submitted [https://sourceforge.net/p/unfs3/bugs/12/]
> +
> +Signed-off-by: Rui Wang <rui.wang@windriver.com>
> +---
> + attr.c         | 15 +++++++++++----
> + backend_unix.h |  2 ++
> + configure.ac   |  1 +
> + 3 files changed, 14 insertions(+), 4 deletions(-)
> +
> +diff --git a/attr.c b/attr.c
> +index 73e5c75..427d0e2 100644
> +--- a/attr.c
> ++++ b/attr.c
> +@@ -280,7 +280,7 @@ post_op_attr get_post_cached(struct svc_req * req)
> + static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
> + {
> +     time_t new_atime, new_mtime;
> +-    struct utimbuf utim;
> ++    struct timeval stamps[2];
> +     int res;
> +
> +     /* set atime and mtime */
> +@@ -302,10 +302,17 @@ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
> +       else                           /* DONT_CHANGE */
> +           new_mtime = buf.st_mtime;
> +
> +-      utim.actime = new_atime;
> +-      utim.modtime = new_mtime;
> ++      stamps[0].tv_sec = new_atime;
> ++      stamps[0].tv_usec = 0;
> ++      stamps[1].tv_sec = new_mtime;
> ++      stamps[1].tv_usec = 0;
> ++
> ++#if HAVE_LUTIMES
> ++      res = backend_lutimes(path, stamps);
> ++#else
> ++      res = backend_utimes(path, stamps);
> ++#endif
> +
> +-      res = backend_utime(path, &utim);
> +       if (res == -1)
> +           return setattr_err();
> +     }
> +diff --git a/backend_unix.h b/backend_unix.h
> +index fbc2af3..813ffd3 100644
> +--- a/backend_unix.h
> ++++ b/backend_unix.h
> +@@ -61,6 +61,8 @@
> + #define backend_symlink symlink
> + #define backend_truncate truncate
> + #define backend_utime utime
> ++#define backend_utimes utimes
> ++#define backend_lutimes lutimes
> + #define backend_statstruct struct stat
> + #define backend_dirstream DIR
> + #define backend_statvfsstruct struct statvfs
> +diff --git a/configure.ac b/configure.ac
> +index aeec598..ea7f167 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -37,6 +37,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
> + AC_CHECK_FUNCS(vsyslog)
> + AC_CHECK_FUNCS(lchown)
> + AC_CHECK_FUNCS(setgroups)
> ++AC_CHECK_FUNCS(lutimes)
> + UNFS3_SOLARIS_RPC
> + UNFS3_PORTMAP_DEFINE
> + UNFS3_COMPILE_WARNINGS
> diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
> index 8127e4a..5a81a8f 100644
> --- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
> +++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
> @@ -29,7 +29,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.ta
>             file://relative_max_socket_path_len.patch \
>             file://tcp_no_delay.patch \
>             file://0001-daemon.c-Libtirpc-porting-fixes.patch \
> -           "
> +           file://0001-attr-fix-utime-for-symlink.patch \
> +          "
>  SRC_URI[md5sum] = "2e43e471c77ade0331901c40b8f8e9a3"
>  SRC_URI[sha256sum] = "21009468a9ba07b72ea93780d025a63ab4e55bf8fc3127803c296f0900fe1bac"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

