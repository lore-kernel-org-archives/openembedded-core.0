Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E901091936
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:59:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2171.1773964750866439354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 16:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uWYj5REp;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so482235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773964749; x=1774569549; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P/AsxYAWPgZbbxjSl8zpp3FUlUHmXwAeoxv8ISeads=;
        b=uWYj5REp37ldS1KNIbYMfDUz/mjrUACp3RMoDYPpd3qZo9EoMlGRTQrSFJ0W+WDXK6
         wxwoJtCj5ilTCqnJwfAhJn3d1QrcFlT+aY/NCME6+GS2T/t7m/Y8xiumZedBC9BOM7WY
         /j+5gDw+QPO4YybcSHP/U5WA60bL1Imuboc5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773964749; x=1774569549;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5P/AsxYAWPgZbbxjSl8zpp3FUlUHmXwAeoxv8ISeads=;
        b=IkVFxC82eKaG0T7aRgzUmyd3+QykZKnQzd5tAFImOEzmWVFrzRSllQzJnHv/NyWxB2
         X3tOJINLj4urAGJolYuhyn58DOq42kv4eWRMTISlF5RYXwhJXM56k/nzKcDjP78Tetz4
         bqunfs/I01LuSFNK2qJoMdpzn2JSg5uKse5R8OF7I/QC8PGFSrryD/hYPKX7mgL0UfoD
         2AVgvaaVMFtxUd4RYddIPcm5pqpMVaruZQCw93GjVf+0Os8bUp0x7N2HkcU4vXEBGEX6
         us+qhOgjFbYp7alBhtYx9kI43kte9Afi3Z8wIng4rTsebUepUSM07zMPLiJuPGA3zrUK
         +ctA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhIEPhIA0JlPny2xZac+8iSsn5BEnf7TWVshSTEAablbYLhBDJ4OfD/Sz34zZOwB77gKFN4NT9CTjNMy8h0/Blw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywpx/yIT00J+JGQinWyhxfM1lpCNS+L6u5qijHtt1P/IpuwxW2i
	AvP9A3ZB+njep1hArSYEsiae1tpuw3zogoE2BCJKiCIW8TSFg1GorcXI3ydxNhFjt7tMnVnVpVR
	XT8xM
X-Gm-Gg: ATEYQzxR5bVe+8O+BM7vYZbuEg01mSnINevUaljtukYGeZAPGE/XS6PyksIlYV/x52m
	bCf5IHTLlXRvJqLJY1GB17F3WfXBUrhdc/XqGZ/502EeNsdPp4kLhiHeurY8b1dgF81gDrwIrzg
	3mJiQd9sBIYEC43KZ1KIZy/yTY4KNnVb7P/WyobfOpkcvppjy2FTNvB84ttwU+1E2yw6nhmgmUO
	5H6QMEupb7eU7+VhDWHpHtdXABk8CNXzSudMJLYF7Cyoc3JQpWB3gKYb3CoI7xhOI0wqSvWE4e4
	qi/6j4431XiJ+JD85xEs5ctMjFJIh4t8movBFMmYIwL+9JVTO05hdRPOIlFzP8h6zaR/XAM3lZa
	gb88vA0sHJlwOSDOHc0tr2M1IetIRH/nGqabIQz+M2h5hhhHBQZKfWq43co0+iJHrdWSUJsKIjV
	SeLjbY3xpTdl+4nCEEzihFHaVP/u7vmZt8iVFeG955DaNlzI3cgCS1iSMwO4r9iAtknhhR0zhq/
	EawLzaw/hNqyZTWfiey/b7q8w==
X-Received: by 2002:a05:600c:8718:b0:485:45fb:3472 with SMTP id 5b1f17b1804b1-486fedab438mr14139545e9.7.1773964748911;
        Thu, 19 Mar 2026 16:59:08 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm2205466f8f.22.2026.03.19.16.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 16:59:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 00:59:08 +0100
Message-Id: <DH760QUX2R8M.1E344RKCB934Z@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] nfs-utils: Fix CVE-2025-12801
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260318160331.398003-1-deeratho@cisco.com>
In-Reply-To: <20260318160331.398003-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 23:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233560

On Wed Mar 18, 2026 at 5:03 PM CET, Deepak Rathore via lists.openembedded.o=
rg wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> - This patch applies the upstream fix [1] as referenced in [5].
> - To successfully apply the fixed commit, apply the dependent commits
>   [2] to [4] which are included in v2.8.6, as referenced in [5].
> - Reference:
>   [1] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
f36bd900a899
>   [2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
7e8b36522f58
>   [3] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
42f01e6a78fe
>   [4] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D=
51738ae56d92
>   [5] https://security-tracker.debian.org/tracker/CVE-2025-12801
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801=
-depended_p1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025=
-12801-depended_p1.patch
> new file mode 100644
> index 0000000000..39c0c12e38
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depend=
ed_p1.patch
> @@ -0,0 +1,80 @@
> +From f642bba8c6c59352ab7259dc5321805cd6236638 Mon Sep 17 00:00:00 2001
> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Date: Mon, 10 Nov 2025 11:26:03 -0500
> +Subject: [PATCH 1/4] mountd: Minor refactor of get_rootfh()
> +
> +Perform the mountpoint checks before checking the user path.
> +
> +CVE: CVE-2025-12801
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3D7e8b36522f58657359c6842119fc516c6dd1baa4]
> +
> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +(cherry picked from commit 7e8b36522f58657359c6842119fc516c6dd1baa4)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + utils/mountd/mountd.c | 34 +++++++++++++++++-----------------
> + 1 file changed, 17 insertions(+), 17 deletions(-)
> +
> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
> +index dbd5546d..39afd4aa 100644
> +--- a/utils/mountd/mountd.c
> ++++ b/utils/mountd/mountd.c
> +@@ -412,6 +412,23 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nf=
s_export **expret,
> +		*error =3D MNT3ERR_ACCES;

Hello,

This patch has a weird format. The context lines starts with tabs and
not a single space as usual. While it seems like it passes tests, I'm
afraid it will break something down the line and I'd rather not take
this like this.

Can you please check?

Thanks!

> +		return NULL;
> +	}
> ++	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
> ++		xlog(L_WARNING, "can't stat export point %s: %s",
> ++		     p, strerror(errno));
> ++		*error =3D MNT3ERR_NOENT;
> ++		return NULL;
> ++	}
> ++	if (exp->m_export.e_mountpoint &&
> ++		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
> ++				  exp->m_export.e_mountpoint:
> ++				  exp->m_export.e_path,
> ++				  nfsd_path_lstat)) {
> ++		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
> ++		     p);
> ++		*error =3D MNT3ERR_NOENT;
> ++		return NULL;
> ++	}
> ++
> +	if (nfsd_path_stat(p, &stb) < 0) {
> +		xlog(L_WARNING, "can't stat exported dir %s: %s",
> +				p, strerror(errno));
> +@@ -426,12 +443,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nf=
s_export **expret,
> +		*error =3D MNT3ERR_NOTDIR;
> +		return NULL;
> +	}
> +-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
> +-		xlog(L_WARNING, "can't stat export point %s: %s",
> +-		     p, strerror(errno));
> +-		*error =3D MNT3ERR_NOENT;
> +-		return NULL;
> +-	}
> +	if (estb.st_dev !=3D stb.st_dev
> +	    && !(exp->m_export.e_flags & NFSEXP_CROSSMOUNT)) {
> +		xlog(L_WARNING, "request to export directory %s below nearest filesyst=
em %s",
> +@@ -439,17 +450,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nf=
s_export **expret,
> +		*error =3D MNT3ERR_ACCES;
> +		return NULL;
> +	}
> +-	if (exp->m_export.e_mountpoint &&
> +-		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
> +-				  exp->m_export.e_mountpoint:
> +-				  exp->m_export.e_path,
> +-				  nfsd_path_lstat)) {
> +-		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
> +-		     p);
> +-		*error =3D MNT3ERR_NOENT;
> +-		return NULL;
> +-	}
> +-
> +	/* This will be a static private nfs_export with just one
> +	 * address.  We feed it to kernel then extract the filehandle,
> +	 */
> +--
> +2.35.6
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801=
-depended_p2.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025=
-12801-depended_p2.patch
> new file mode 100644
> index 0000000000..45ab31642c
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depend=
ed_p2.patch
> @@ -0,0 +1,180 @@
> +From 105b2b59292de54565e27b4cb88e7b7e6ff855f5 Mon Sep 17 00:00:00 2001
> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Date: Mon, 10 Nov 2025 11:28:39 -0500
> +Subject: [PATCH 2/4] mountd: Separate lookup of the exported directory a=
nd the
> + mount path
> +
> +When the caller asks to mount a path that does not terminate with an
> +exported directory, we want to split up the lookups so that we can
> +look up the exported directory using the mountd privileged credential,
> +and the remaining subdirectory lookups using the RPC caller's
> +credential.
> +
> +CVE: CVE-2025-12801
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3D42f01e6a78fed98f12437ac8b28cfb12b6bad056]
> +
> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +(cherry picked from commit 42f01e6a78fed98f12437ac8b28cfb12b6bad056)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + support/include/nfsd_path.h |  1 +
> + support/misc/nfsd_path.c    | 31 ++++++++++++++++++
> + utils/mountd/mountd.c       | 63 +++++++++++++++++++++++++++++++------
> + 3 files changed, 86 insertions(+), 9 deletions(-)
> +
> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
> +index f600fb5a..3e5a2f5d 100644
> +--- a/support/include/nfsd_path.h
> ++++ b/support/include/nfsd_path.h
> +@@ -18,6 +18,7 @@ char *		nfsd_path_prepend_dir(const char *dir, const c=
har *pathname);
> +
> + int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
> + int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
> ++int		nfsd_openat(int dirfd, const char *path, int flags);
> +
> + int		nfsd_path_statfs(const char *pathname,
> +				   struct statfs *statbuf);
> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
> +index caec33ca..dfe88e4f 100644
> +--- a/support/misc/nfsd_path.c
> ++++ b/support/misc/nfsd_path.c
> +@@ -203,6 +203,37 @@ nfsd_realpath(const char *path, char *resolved_buf)
> +         return realpath_buf.res_ptr;
> + }
> +
> ++struct nfsd_openat_t {
> ++	const char *path;
> ++	int dirfd;
> ++	int flags;
> ++	int res_fd;
> ++	int res_error;
> ++};
> ++
> ++static void nfsd_openatfunc(void *data)
> ++{
> ++	struct nfsd_openat_t *d =3D data;
> ++
> ++	d->res_fd =3D openat(d->dirfd, d->path, d->flags);
> ++	if (d->res_fd =3D=3D -1)
> ++		d->res_error =3D errno;
> ++}
> ++
> ++int nfsd_openat(int dirfd, const char *path, int flags)
> ++{
> ++	struct nfsd_openat_t open_buf =3D {
> ++		.path =3D path,
> ++		.dirfd =3D dirfd,
> ++		.flags =3D flags,
> ++	};
> ++
> ++	nfsd_run_task(nfsd_openatfunc, &open_buf);
> ++	if (open_buf.res_fd =3D=3D -1)
> ++		errno =3D open_buf.res_error;
> ++	return open_buf.res_fd;
> ++}
> ++
> + struct nfsd_rw_data {
> +	int             fd;
> +	void*           buf;
> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
> +index 39afd4aa..f43ebef5 100644
> +--- a/utils/mountd/mountd.c
> ++++ b/utils/mountd/mountd.c
> +@@ -392,7 +392,10 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, nf=
s_export **expret,
> +	struct nfs_fh_len *fh;
> +	char		rpath[MAXPATHLEN+1];
> +	char		*p =3D *path;
> ++	char		*subpath;
> +	char		buf[INET6_ADDRSTRLEN];
> ++	size_t		epathlen;
> ++	int		dirfd;
> +
> +	if (*p =3D=3D '\0')
> +		p =3D "/";
> +@@ -412,12 +415,21 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
> +		*error =3D MNT3ERR_ACCES;
> +		return NULL;
> +	}
> +-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
> +-		xlog(L_WARNING, "can't stat export point %s: %s",
> ++
> ++	dirfd =3D nfsd_openat(AT_FDCWD, exp->m_export.e_path, O_PATH);
> ++	if (dirfd =3D=3D -1) {
> ++		xlog(L_WARNING, "can't open export point %s: %s",
> +		     p, strerror(errno));
> +		*error =3D MNT3ERR_NOENT;
> +		return NULL;
> +	}
> ++	if (fstat(dirfd, &estb) =3D=3D -1) {
> ++		xlog(L_WARNING, "can't stat export point %s: %s",
> ++		     p, strerror(errno));
> ++		*error =3D MNT3ERR_ACCES;
> ++		close(dirfd);
> ++		return NULL;
> ++	}
> +	if (exp->m_export.e_mountpoint &&
> +		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
> +				  exp->m_export.e_mountpoint:
> +@@ -426,18 +438,51 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
> +		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
> +		     p);
> +		*error =3D MNT3ERR_NOENT;
> ++		close(dirfd);
> +		return NULL;
> +	}
> +
> +-	if (nfsd_path_stat(p, &stb) < 0) {
> +-		xlog(L_WARNING, "can't stat exported dir %s: %s",
> +-				p, strerror(errno));
> +-		if (errno =3D=3D ENOENT)
> +-			*error =3D MNT3ERR_NOENT;
> +-		else
> +-			*error =3D MNT3ERR_ACCES;
> ++	epathlen =3D strlen(exp->m_export.e_path);
> ++	if (epathlen > strlen(p)) {
> ++		xlog(L_WARNING, "raced with change of exported path: %s", p);
> ++		*error =3D MNT3ERR_NOENT;
> ++		close(dirfd);
> +		return NULL;
> +	}
> ++	subpath =3D &p[epathlen];
> ++	while (*subpath =3D=3D '/')
> ++		subpath++;
> ++	if (*subpath !=3D '\0') {
> ++		int fd;
> ++
> ++		/* Just perform a lookup of the path */
> ++		fd =3D nfsd_openat(dirfd, subpath, O_PATH);
> ++		close(dirfd);
> ++		if (fd =3D=3D -1) {
> ++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
> ++			     strerror(errno));
> ++			if (errno =3D=3D ENOENT)
> ++				*error =3D MNT3ERR_NOENT;
> ++			else
> ++				*error =3D MNT3ERR_ACCES;
> ++			return NULL;
> ++		}
> ++		if (fstat(fd, &stb) =3D=3D -1) {
> ++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
> ++			     strerror(errno));
> ++			if (errno =3D=3D ENOENT)
> ++				*error =3D MNT3ERR_NOENT;
> ++			else
> ++				*error =3D MNT3ERR_ACCES;
> ++			close(fd);
> ++			return NULL;
> ++		}
> ++		close(fd);
> ++	} else {
> ++		close(dirfd);
> ++		stb =3D estb;
> ++	}
> ++
> +	if (!S_ISDIR(stb.st_mode) && !S_ISREG(stb.st_mode)) {
> +		xlog(L_WARNING, "%s is not a directory or regular file", p);
> +		*error =3D MNT3ERR_NOTDIR;
> +--
> +2.35.6
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801=
-depended_p3.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025=
-12801-depended_p3.patch
> new file mode 100644
> index 0000000000..456fefdff8
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depend=
ed_p3.patch
> @@ -0,0 +1,464 @@
> +From 23e06d86004a8d5e3549e026183263584d056bc7 Mon Sep 17 00:00:00 2001
> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Date: Mon, 10 Nov 2025 12:18:38 -0500
> +Subject: [PATCH 3/4] support: Add a mini-library to extract and apply RP=
C
> + credentials
> +
> +Add server functionality to extract the credentials from the client RPC
> +call, and apply them. This is needed in order to perform access checking
> +on the requested path in the mountd daemon.
> +
> +CVE: CVE-2025-12801
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3D51738ae56d922d4961e60dad73ad1c2d97d8d99b]
> +
> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +(cherry picked from commit 51738ae56d922d4961e60dad73ad1c2d97d8d99b)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + aclocal/libtirpc.m4         |  12 +++
> + support/include/Makefile.am |   1 +
> + support/include/nfs_ucred.h |  44 ++++++++++
> + support/misc/Makefile.am    |   2 +-
> + support/misc/ucred.c        | 162 ++++++++++++++++++++++++++++++++++++
> + support/nfs/Makefile.am     |   2 +-
> + support/nfs/ucred.c         | 147 ++++++++++++++++++++++++++++++++
> + 7 files changed, 368 insertions(+), 2 deletions(-)
> + create mode 100644 support/include/nfs_ucred.h
> + create mode 100644 support/misc/ucred.c
> + create mode 100644 support/nfs/ucred.c
> +
> +diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
> +index ef48a2ae..06629db9 100644
> +--- a/aclocal/libtirpc.m4
> ++++ b/aclocal/libtirpc.m4
> +@@ -31,6 +31,18 @@ AC_DEFUN([AC_LIBTIRPC], [
> +                          [AC_DEFINE([HAVE_TIRPC_GSS_SECCREATE], [1],
> +                                     [Define to 1 if your tirpc library =
provides rpc_gss_seccreate])],,
> +                          [${LIBS}])])
> ++
> ++     AS_IF([test -n "${LIBTIRPC}"],
> ++           [AC_CHECK_LIB([tirpc], [rpc_gss_getcred],
> ++                         [AC_DEFINE([HAVE_TIRPC_GSS_GETCRED], [1],
> ++                                    [Define to 1 if your tirpc library =
provides rpc_gss_getcred])],,
> ++                         [${LIBS}])])
> ++
> ++     AS_IF([test -n "${LIBTIRPC}"],
> ++           [AC_CHECK_LIB([tirpc], [authdes_getucred],
> ++                         [AC_DEFINE([HAVE_TIRPC_AUTHDES_GETUCRED], [1],
> ++                                    [Define to 1 if your tirpc library =
provides authdes_getucred])],,
> ++                         [${LIBS}])])
> +   AC_SUBST([AM_CPPFLAGS])
> +   AC_SUBST(LIBTIRPC)
> +
> +diff --git a/support/include/Makefile.am b/support/include/Makefile.am
> +index 1373891a..631a84f8 100644
> +--- a/support/include/Makefile.am
> ++++ b/support/include/Makefile.am
> +@@ -10,6 +10,7 @@ noinst_HEADERS =3D \
> +	misc.h \
> +	nfs_mntent.h \
> +	nfs_paths.h \
> ++	nfs_ucred.h \
> +	nfsd_path.h \
> +	nfslib.h \
> +	nfsrpc.h \
> +diff --git a/support/include/nfs_ucred.h b/support/include/nfs_ucred.h
> +new file mode 100644
> +index 00000000..d58b61e4
> +--- /dev/null
> ++++ b/support/include/nfs_ucred.h
> +@@ -0,0 +1,44 @@
> ++#ifndef _NFS_UCRED_H
> ++#define _NFS_UCRED_H
> ++
> ++#include <sys/types.h>
> ++
> ++struct nfs_ucred {
> ++	uid_t uid;
> ++	gid_t gid;
> ++	int ngroups;
> ++	gid_t *groups;
> ++};
> ++
> ++struct svc_req;
> ++struct exportent;
> ++
> ++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
> ++		  const struct exportent *ep);
> ++
> ++void nfs_ucred_squash_groups(struct nfs_ucred *cred,
> ++			     const struct exportent *ep);
> ++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct export=
ent *ep);
> ++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
> ++			     struct nfs_ucred **savedp);
> ++
> ++static inline void nfs_ucred_free(struct nfs_ucred *cred)
> ++{
> ++	free(cred->groups);
> ++	free(cred);
> ++}
> ++
> ++static inline void nfs_ucred_init_groups(struct nfs_ucred *cred, gid_t =
*groups,
> ++					 int ngroups)
> ++{
> ++	cred->groups =3D groups;
> ++	cred->ngroups =3D ngroups;
> ++}
> ++
> ++static inline void nfs_ucred_free_groups(struct nfs_ucred *cred)
> ++{
> ++	free(cred->groups);
> ++	nfs_ucred_init_groups(cred, NULL, 0);
> ++}
> ++
> ++#endif /* _NFS_UCRED_H */
> +diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
> +index f9993e3a..7ea2d798 100644
> +--- a/support/misc/Makefile.am
> ++++ b/support/misc/Makefile.am
> +@@ -2,6 +2,6 @@
> +
> + noinst_LIBRARIES =3D libmisc.a
> + libmisc_a_SOURCES =3D tcpwrapper.c from_local.c mountpoint.c file.c \
> +-		    nfsd_path.c workqueue.c xstat.c
> ++		    nfsd_path.c ucred.c workqueue.c xstat.c
> +
> + MAINTAINERCLEANFILES =3D Makefile.in
> +diff --git a/support/misc/ucred.c b/support/misc/ucred.c
> +new file mode 100644
> +index 00000000..92d97912
> +--- /dev/null
> ++++ b/support/misc/ucred.c
> +@@ -0,0 +1,162 @@
> ++#ifdef HAVE_CONFIG_H
> ++#include <config.h>
> ++#endif
> ++
> ++#include <alloca.h>
> ++#include <errno.h>
> ++#include <pwd.h>
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <grp.h>
> ++
> ++#include "exportfs.h"
> ++#include "nfs_ucred.h"
> ++
> ++#include "xlog.h"
> ++
> ++void nfs_ucred_squash_groups(struct nfs_ucred *cred, const struct expor=
tent *ep)
> ++{
> ++	int i;
> ++
> ++	if (!(ep->e_flags & NFSEXP_ROOTSQUASH))
> ++		return;
> ++	if (cred->gid =3D=3D 0)
> ++		cred->gid =3D ep->e_anongid;
> ++	for (i =3D 0; i < cred->ngroups; i++) {
> ++		if (cred->groups[i] =3D=3D 0)
> ++			cred->groups[i] =3D ep->e_anongid;
> ++	}
> ++}
> ++
> ++static int nfs_ucred_init_effective(struct nfs_ucred *cred)
> ++{
> ++	int ngroups =3D getgroups(0, NULL);
> ++
> ++	if (ngroups > 0) {
> ++		size_t sz =3D ngroups * sizeof(gid_t);
> ++		gid_t *groups =3D malloc(sz);
> ++		if (groups =3D=3D NULL)
> ++			return ENOMEM;
> ++		if (getgroups(ngroups, groups) =3D=3D -1) {
> ++			free(groups);
> ++			return errno;
> ++		}
> ++		nfs_ucred_init_groups(cred, groups, ngroups);
> ++	} else
> ++		nfs_ucred_init_groups(cred, NULL, 0);
> ++	cred->uid =3D geteuid();
> ++	cred->gid =3D getegid();
> ++	return 0;
> ++}
> ++
> ++static size_t nfs_ucred_getpw_r_size_max(void)
> ++{
> ++	long buflen =3D sysconf(_SC_GETPW_R_SIZE_MAX);
> ++
> ++	if (buflen =3D=3D -1)
> ++		return 16384;
> ++	return buflen;
> ++}
> ++
> ++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct export=
ent *ep)
> ++{
> ++	struct passwd pwd, *pw;
> ++	uid_t uid =3D cred->uid;
> ++	gid_t gid =3D cred->gid;
> ++	size_t buflen;
> ++	char *buf;
> ++	int ngroups =3D 0;
> ++	int ret;
> ++
> ++	if (ep->e_flags & (NFSEXP_ALLSQUASH | NFSEXP_ROOTSQUASH) &&
> ++	    (int)uid =3D=3D ep->e_anonuid)
> ++		return 0;
> ++	buflen =3D nfs_ucred_getpw_r_size_max();
> ++	buf =3D alloca(buflen);
> ++	ret =3D getpwuid_r(uid, &pwd, buf, buflen, &pw);
> ++	if (ret !=3D 0)
> ++		return ret;
> ++	if (!pw)
> ++		return ENOENT;
> ++	if (getgrouplist(pw->pw_name, gid, NULL, &ngroups) =3D=3D -1 &&
> ++	    ngroups > 0) {
> ++		gid_t *groups =3D malloc(ngroups * sizeof(groups[0]));
> ++		if (groups =3D=3D NULL)
> ++			return ENOMEM;
> ++		if (getgrouplist(pw->pw_name, gid, groups, &ngroups) =3D=3D -1) {
> ++			free(groups);
> ++			return ENOMEM;
> ++		}
> ++		free(cred->groups);
> ++		nfs_ucred_init_groups(cred, groups, ngroups);
> ++		nfs_ucred_squash_groups(cred, ep);
> ++	} else
> ++		nfs_ucred_free_groups(cred);
> ++	return 0;
> ++}
> ++
> ++static int nfs_ucred_set_effective(const struct nfs_ucred *cred,
> ++				   const struct nfs_ucred *saved)
> ++{
> ++	uid_t suid =3D saved ? saved->uid : geteuid();
> ++	gid_t sgid =3D saved ? saved->gid : getegid();
> ++	int ret;
> ++
> ++	/* Start with a privileged effective user */
> ++	if (setresuid(-1, 0, -1) < 0) {
> ++		xlog(L_WARNING, "can't change privileged user %u-%u. %s",
> ++		     geteuid(), getegid(), strerror(errno));
> ++		return errno;
> ++	}
> ++
> ++	if (setgroups(cred->ngroups, cred->groups) =3D=3D -1) {
> ++		xlog(L_WARNING, "can't change groups for user %u-%u. %s",
> ++		     geteuid(), getegid(), strerror(errno));
> ++		return errno;
> ++	}
> ++	if (setresgid(-1, cred->gid, sgid) =3D=3D -1) {
> ++		xlog(L_WARNING, "can't change gid for user %u-%u. %s",
> ++		     geteuid(), getegid(), strerror(errno));
> ++		ret =3D errno;
> ++		goto restore_groups;
> ++	}
> ++	if (setresuid(-1, cred->uid, suid) =3D=3D -1) {
> ++		xlog(L_WARNING, "can't change uid for user %u-%u. %s",
> ++		     geteuid(), getegid(), strerror(errno));
> ++		ret =3D errno;
> ++		goto restore_gid;
> ++	}
> ++	return 0;
> ++restore_gid:
> ++	if (setresgid(-1, sgid, -1) < 0) {
> ++		xlog(L_WARNING, "can't restore privileged user %u-%u. %s",
> ++		     geteuid(), getegid(), strerror(errno));
> ++	}
> ++restore_groups:
> ++	if (saved)
> ++		setgroups(saved->ngroups, saved->groups);
> ++	else
> ++		setgroups(0, NULL);
> ++	return ret;
> ++}
> ++
> ++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
> ++			     struct nfs_ucred **savedp)
> ++{
> ++	struct nfs_ucred *saved =3D malloc(sizeof(*saved));
> ++	int ret;
> ++
> ++	if (saved =3D=3D NULL)
> ++		return ENOMEM;
> ++	ret =3D nfs_ucred_init_effective(saved);
> ++	if (ret !=3D 0) {
> ++		free(saved);
> ++		return ret;
> ++	}
> ++	ret =3D nfs_ucred_set_effective(cred, saved);
> ++	if (savedp =3D=3D NULL || ret !=3D 0)
> ++		nfs_ucred_free(saved);
> ++	else
> ++		*savedp =3D saved;
> ++	return ret;
> ++}
> +diff --git a/support/nfs/Makefile.am b/support/nfs/Makefile.am
> +index 2e1577cc..f6921265 100644
> +--- a/support/nfs/Makefile.am
> ++++ b/support/nfs/Makefile.am
> +@@ -7,7 +7,7 @@ libnfs_la_SOURCES =3D exports.c rmtab.c xio.c rpcmisc.c =
rpcdispatch.c \
> +		   xcommon.c wildmat.c mydaemon.c \
> +		   rpc_socket.c getport.c \
> +		   svc_socket.c cacheio.c closeall.c nfs_mntent.c \
> +-		   svc_create.c atomicio.c strlcat.c strlcpy.c
> ++		   svc_create.c atomicio.c strlcat.c strlcpy.c ucred.c
> + libnfs_la_LIBADD =3D libnfsconf.la
> + libnfs_la_CPPFLAGS =3D $(AM_CPPFLAGS) $(CPPFLAGS) -I$(top_srcdir)/suppo=
rt/reexport
> +
> +diff --git a/support/nfs/ucred.c b/support/nfs/ucred.c
> +new file mode 100644
> +index 00000000..6ea8efdf
> +--- /dev/null
> ++++ b/support/nfs/ucred.c
> +@@ -0,0 +1,147 @@
> ++#ifdef HAVE_CONFIG_H
> ++#include <config.h>
> ++#endif
> ++
> ++#include <errno.h>
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <rpc/rpc.h>
> ++
> ++#include "exportfs.h"
> ++#include "nfs_ucred.h"
> ++
> ++#ifdef HAVE_TIRPC_GSS_GETCRED
> ++#include <rpc/rpcsec_gss.h>
> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
> ++#include <rpc/auth_des.h>
> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
> ++
> ++static int nfs_ucred_copy_cred(struct nfs_ucred *cred, uid_t uid, gid_t=
 gid,
> ++			       const gid_t *groups, int ngroups)
> ++{
> ++	if (ngroups > 0) {
> ++		size_t sz =3D ngroups * sizeof(groups[0]);
> ++		cred->groups =3D malloc(sz);
> ++		if (cred->groups =3D=3D NULL)
> ++			return ENOMEM;
> ++		cred->ngroups =3D ngroups;
> ++		memcpy(cred->groups, groups, sz);
> ++	} else
> ++		nfs_ucred_init_groups(cred, NULL, 0);
> ++	cred->uid =3D uid;
> ++	cred->gid =3D gid;
> ++	return 0;
> ++}
> ++
> ++static int nfs_ucred_init_cred_squashed(struct nfs_ucred *cred,
> ++					const struct exportent *ep)
> ++{
> ++	cred->uid =3D ep->e_anonuid;
> ++	cred->gid =3D ep->e_anongid;
> ++	nfs_ucred_init_groups(cred, NULL, 0);
> ++	return 0;
> ++}
> ++
> ++static int nfs_ucred_init_cred(struct nfs_ucred *cred, uid_t uid, gid_t=
 gid,
> ++			       const gid_t *groups, int ngroups,
> ++			       const struct exportent *ep)
> ++{
> ++	if (ep->e_flags & NFSEXP_ALLSQUASH) {
> ++		nfs_ucred_init_cred_squashed(cred, ep);
> ++	} else if (ep->e_flags & NFSEXP_ROOTSQUASH && uid =3D=3D 0) {
> ++		nfs_ucred_init_cred_squashed(cred, ep);
> ++		if (gid !=3D 0)
> ++			cred->gid =3D gid;
> ++	} else {
> ++		int ret =3D nfs_ucred_copy_cred(cred, uid, gid, groups, ngroups);
> ++		if (ret !=3D 0)
> ++			return ret;
> ++		nfs_ucred_squash_groups(cred, ep);
> ++	}
> ++	return 0;
> ++}
> ++
> ++static int nfs_ucred_init_null(struct nfs_ucred *cred,
> ++			       const struct exportent *ep)
> ++{
> ++	return nfs_ucred_init_cred_squashed(cred, ep);
> ++}
> ++
> ++static int nfs_ucred_init_unix(struct nfs_ucred *cred, struct svc_req *=
rqst,
> ++			       const struct exportent *ep)
> ++{
> ++	struct authunix_parms *aup;
> ++
> ++	aup =3D (struct authunix_parms *)rqst->rq_clntcred;
> ++	return nfs_ucred_init_cred(cred, aup->aup_uid, aup->aup_gid,
> ++				   aup->aup_gids, aup->aup_len, ep);
> ++}
> ++
> ++#ifdef HAVE_TIRPC_GSS_GETCRED
> ++static int nfs_ucred_init_gss(struct nfs_ucred *cred, struct svc_req *r=
qst,
> ++			      const struct exportent *ep)
> ++{
> ++	rpc_gss_ucred_t *gss_ucred =3D NULL;
> ++
> ++	if (!rpc_gss_getcred(rqst, NULL, &gss_ucred, NULL) || gss_ucred =3D=3D=
 NULL)
> ++		return EINVAL;
> ++	return nfs_ucred_init_cred(cred, gss_ucred->uid, gss_ucred->gid,
> ++				   gss_ucred->gidlist, gss_ucred->gidlen, ep);
> ++}
> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
> ++
> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
> ++int authdes_getucred(struct authdes_cred *adc, uid_t *uid, gid_t *gid,
> ++		     int *grouplen, gid_t *groups);
> ++
> ++static int nfs_ucred_init_des(struct nfs_ucred *cred, struct svc_req *r=
qst,
> ++			      const struct exportent *ep)
> ++{
> ++	struct authdes_cred *des_cred;
> ++	uid_t uid;
> ++	gid_t gid;
> ++	int grouplen;
> ++	gid_t groups[NGROUPS];
> ++
> ++	des_cred =3D (struct authdes_cred *)rqst->rq_clntcred;
> ++	if (!authdes_getucred(des_cred, &uid, &gid, &grouplen, &groups[0]))
> ++		return EINVAL;
> ++	return nfs_ucred_init_cred(cred, uid, gid, groups, grouplen, ep);
> ++}
> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
> ++
> ++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
> ++		  const struct exportent *ep)
> ++{
> ++	struct nfs_ucred *cred =3D malloc(sizeof(*cred));
> ++	int ret;
> ++
> ++	*credp =3D NULL;
> ++	if (cred =3D=3D NULL)
> ++		return ENOMEM;
> ++	switch (rqst->rq_cred.oa_flavor) {
> ++	case AUTH_UNIX:
> ++		ret =3D nfs_ucred_init_unix(cred, rqst, ep);
> ++		break;
> ++#ifdef HAVE_TIRPC_GSS_GETCRED
> ++	case RPCSEC_GSS:
> ++		ret =3D nfs_ucred_init_gss(cred, rqst, ep);
> ++		break;
> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
> ++	case AUTH_DES:
> ++		ret =3D nfs_ucred_init_des(cred, rqst, ep);
> ++		break;
> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
> ++	default:
> ++		ret =3D nfs_ucred_init_null(cred, ep);
> ++		break;
> ++	}
> ++	if (ret =3D=3D 0) {
> ++		*credp =3D cred;
> ++		return 0;
> ++	}
> ++	free(cred);
> ++	return ret;
> ++}
> +--
> +2.35.6
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801=
.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
> new file mode 100644
> index 0000000000..bd36331f6c
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
> @@ -0,0 +1,253 @@
> +From d2e0fff6ad07e71d405ddbbe7eb3a07407c9a204 Mon Sep 17 00:00:00 2001
> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Date: Thu, 5 Mar 2026 10:41:02 -0500
> +Subject: [PATCH 4/4] Fix access checks when mounting subdirectories in N=
FSv3
> +
> +If a NFSv3 client asks to mount a subdirectory of one of the exported
> +directories, then apply the RPC credential together with any root
> +or all squash rules that would apply to the client in question.
> +
> +CVE: CVE-2025-12801
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-uti=
ls.git;a=3Dcommit;h=3Df36bd900a899088ca1925de079bd58d6205a1f3c]
> +
> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
> +Signed-off-by: Scott Mayhew <smayhew@redhat.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +(cherry picked from commit f36bd900a899088ca1925de079bd58d6205a1f3c)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + nfs.conf                    |  1 +
> + support/include/nfsd_path.h |  9 ++++++++-
> + support/misc/nfsd_path.c    | 32 ++++++++++++++++++++++++++++++--
> + utils/mountd/mountd.c       | 28 ++++++++++++++++++++++++++--
> + utils/mountd/mountd.man     | 26 ++++++++++++++++++++++++++
> + 5 files changed, 91 insertions(+), 5 deletions(-)
> +
> +diff --git a/nfs.conf b/nfs.conf
> +index 3cca68c3..ddf0c143 100644
> +--- a/nfs.conf
> ++++ b/nfs.conf
> +@@ -46,6 +46,7 @@
> + # ttl=3D1800
> + [mountd]
> + # debug=3D"all|auth|call|general|parse"
> ++# apply-root-cred=3Dn
> + # manage-gids=3Dn
> + # descriptors=3D0
> + # port=3D0
> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
> +index 3e5a2f5d..06c0f2f4 100644
> +--- a/support/include/nfsd_path.h
> ++++ b/support/include/nfsd_path.h
> +@@ -9,6 +9,7 @@
> + struct file_handle;
> + struct statfs;
> + struct nfsd_task_t;
> ++struct nfs_ucred;
> +
> + void 		nfsd_path_init(void);
> +
> +@@ -18,7 +19,8 @@ char *		nfsd_path_prepend_dir(const char *dir, const c=
har *pathname);
> +
> + int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
> + int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
> +-int		nfsd_openat(int dirfd, const char *path, int flags);
> ++int		nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd,
> ++				 const char *path, int flags);
> +
> + int		nfsd_path_statfs(const char *pathname,
> +				   struct statfs *statbuf);
> +@@ -31,4 +33,9 @@ ssize_t		nfsd_path_write(int fd, void* buf, size_t len=
);
> + int		nfsd_name_to_handle_at(int fd, const char *path,
> +				       struct file_handle *fh,
> +				       int *mount_id, int flags);
> ++
> ++static inline int nfsd_openat(int dirfd, const char *path, int flags)
> ++{
> ++	return nfsd_cred_openat(NULL, dirfd, path, flags);
> ++}
> + #endif
> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
> +index dfe88e4f..6466666d 100644
> +--- a/support/misc/nfsd_path.c
> ++++ b/support/misc/nfsd_path.c
> +@@ -17,6 +17,7 @@
> + #include "xstat.h"
> + #include "nfslib.h"
> + #include "nfsd_path.h"
> ++#include "nfs_ucred.h"
> + #include "workqueue.h"
> +
> + static struct xthread_workqueue *nfsd_wq =3D NULL;
> +@@ -204,6 +205,7 @@ nfsd_realpath(const char *path, char *resolved_buf)
> + }
> +
> + struct nfsd_openat_t {
> ++	const struct nfs_ucred *cred;
> +	const char *path;
> +	int dirfd;
> +	int flags;
> +@@ -220,15 +222,41 @@ static void nfsd_openatfunc(void *data)
> +		d->res_error =3D errno;
> + }
> +
> +-int nfsd_openat(int dirfd, const char *path, int flags)
> ++static void nfsd_cred_openatfunc(void *data)
> ++{
> ++	struct nfsd_openat_t *d =3D data;
> ++	struct nfs_ucred *saved =3D NULL;
> ++	int ret;
> ++
> ++	ret =3D nfs_ucred_swap_effective(d->cred, &saved);
> ++	if (ret !=3D 0) {
> ++		d->res_fd =3D -1;
> ++		d->res_error =3D ret;
> ++		return;
> ++	}
> ++
> ++	nfsd_openatfunc(data);
> ++
> ++	if (saved !=3D NULL) {
> ++		nfs_ucred_swap_effective(saved, NULL);
> ++		nfs_ucred_free(saved);
> ++	}
> ++}
> ++
> ++int nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd, const cha=
r *path,
> ++		     int flags)
> + {
> +	struct nfsd_openat_t open_buf =3D {
> ++		.cred =3D cred,
> +		.path =3D path,
> +		.dirfd =3D dirfd,
> +		.flags =3D flags,
> +	};
> +
> +-	nfsd_run_task(nfsd_openatfunc, &open_buf);
> ++	if (cred)
> ++		nfsd_run_task(nfsd_cred_openatfunc, &open_buf);
> ++	else
> ++		nfsd_run_task(nfsd_openatfunc, &open_buf);
> +	if (open_buf.res_fd =3D=3D -1)
> +		errno =3D open_buf.res_error;
> +	return open_buf.res_fd;
> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
> +index f43ebef5..6e6777cd 100644
> +--- a/utils/mountd/mountd.c
> ++++ b/utils/mountd/mountd.c
> +@@ -31,6 +31,7 @@
> + #include "nfsd_path.h"
> + #include "nfslib.h"
> + #include "export.h"
> ++#include "nfs_ucred.h"
> +
> + extern void my_svc_run(void);
> +
> +@@ -40,6 +41,7 @@ static struct nfs_fh_len *get_rootfh(struct svc_req *,=
 dirpath *, nfs_export **,
> +
> + int reverse_resolve =3D 0;
> + int manage_gids;
> ++int apply_root_cred;
> + int use_ipaddr =3D -1;
> +
> + /* PRC: a high-availability callout program can be specified with -H
> +@@ -74,9 +76,10 @@ static struct option longopts[] =3D
> +	{ "log-auth", 0, 0, 'l'},
> +	{ "cache-use-ipaddr", 0, 0, 'i'},
> +	{ "ttl", 1, 0, 'T'},
> ++	{ "apply-root-cred", 0, 0, 'c' },
> +	{ NULL, 0, 0, 0 }
> + };
> +-static char shortopts[] =3D "o:nFd:p:P:hH:N:V:vurs:t:gliT:";
> ++static char shortopts[] =3D "o:nFd:p:P:hH:N:V:vurs:t:gliT:c";
> +
> + #define NFSVERSBIT(vers)	(0x1 << (vers - 1))
> + #define NFSVERSBIT_ALL		(NFSVERSBIT(2) | NFSVERSBIT(3) | NFSVERSBIT(4))
> +@@ -453,11 +456,27 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
> +	while (*subpath =3D=3D '/')
> +		subpath++;
> +	if (*subpath !=3D '\0') {
> ++		struct nfs_ucred *cred =3D NULL;
> +		int fd;
> +
> ++		/* Load the user cred */
> ++		if (!apply_root_cred) {
> ++			nfs_ucred_get(&cred, rqstp, &exp->m_export);
> ++			if (cred =3D=3D NULL) {
> ++				xlog(L_WARNING, "can't retrieve credential");
> ++				*error =3D MNT3ERR_ACCES;
> ++				close(dirfd);
> ++				return NULL;
> ++			}
> ++			if (manage_gids)
> ++				nfs_ucred_reload_groups(cred, &exp->m_export);
> ++		}
> ++
> +		/* Just perform a lookup of the path */
> +-		fd =3D nfsd_openat(dirfd, subpath, O_PATH);
> ++		fd =3D nfsd_cred_openat(cred, dirfd, subpath, O_PATH);
> +		close(dirfd);
> ++		if (cred)
> ++			nfs_ucred_free(cred);
> +		if (fd =3D=3D -1) {
> +			xlog(L_WARNING, "can't open exported dir %s: %s", p,
> +			     strerror(errno));
> +@@ -681,6 +700,8 @@ read_mountd_conf(char **argv)
> +	ttl =3D conf_get_num("mountd", "ttl", default_ttl);
> +	if (ttl > 0)
> +		default_ttl =3D ttl;
> ++	apply_root_cred =3D conf_get_bool("mountd", "apply-root-cred",
> ++					apply_root_cred);
> + }
> +
> + int
> +@@ -794,6 +815,9 @@ main(int argc, char **argv)
> +			}
> +			default_ttl =3D ttl;
> +			break;
> ++		case 'c':
> ++			apply_root_cred =3D 1;
> ++			break;
> +		case 0:
> +			break;
> +		case '?':
> +diff --git a/utils/mountd/mountd.man b/utils/mountd/mountd.man
> +index a206a3e2..f4f1fc23 100644
> +--- a/utils/mountd/mountd.man
> ++++ b/utils/mountd/mountd.man
> +@@ -242,6 +242,32 @@ can support both NFS version 2 and the newer versio=
n 3.
> + Print the version of
> + .B rpc.mountd
> + and exit.
> ++.TP
> ++.B \-c " or " \-\-apply-root-cred
> ++When mountd is asked to allow a NFSv3 mount to a subdirectory of the
> ++exported directory, then it will check if the user asking to mount has
> ++lookup rights to the directories below that exported directory. When
> ++performing the check, mountd will apply any root squash or all squash
> ++rules that were specified for that client.
> ++
> ++Performing lookup checks as the user requires that the mountd daemon
> ++be run as root or that it be given CAP_SETUID and CAP_SETGID privileges
> ++so that it can change its own effective user and effective group settin=
gs.
> ++When troubleshooting, please also note that LSM frameworks such as SELi=
nux
> ++can sometimes prevent the daemon from changing the effective user/group=
s
> ++despite the capability settings.
> ++
> ++In earlier versions of mountd, the same checks were performed using the
> ++mountd daemon's root privileges, meaning that it could authorise access
> ++to directories that are not normally accessible to the user requesting
> ++to mount them. This option enables that legacy behaviour.
> ++
> ++.BR Note:
> ++If there is a need to provide access to specific subdirectories that
> ++are not normally accessible to a client, it is always possible to add
> ++export entries that explicitly grant such access. That ability does
> ++not depend on this option being enabled.
> ++
> + .TP
> + .B \-g " or " \-\-manage-gids
> + Accept requests from the kernel to map user id numbers into  lists of
> +--
> +2.35.6
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> index 08e7dd8900..c7f0656ed8 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> @@ -24,6 +24,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils=
/${PV}/nfs-utils-${PV}.tar.x
>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch=
 \
>             file://0004-Use-nogroup-for-nobody-group.patch \
>             file://0005-find-OE-provided-Kerberos.patch \
> +		   file://CVE-2025-12801-depended_p1.patch \
> +		   file://CVE-2025-12801-depended_p2.patch \
> +		   file://CVE-2025-12801-depended_p3.patch \
> +		   file://CVE-2025-12801.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44=
b202222b78ecdbf5"


--=20
Yoann Congal
Smile ECS


