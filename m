Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F420CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 10:34:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18117.1782210857166561410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 03:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=diYvUePn;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso37031845e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782210855; x=1782815655; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAmCq3NGvS1r7Ju946AxIQzlGNfD9CwbwmW4rKd+63o=;
        b=diYvUePnaEXVzd/ZlCEK1pf/3LtD8bADtJ7vYBB7W9JxIyh0+nXvEWefuEVuLGkFWg
         wLmJ9luvXbCUTLhALKZRa6HDo/bxxKG3X8pSZi6gqDsigJD7qFAKV0q99G4+AlCrglfl
         6nrpOHSX7qM/h7YdSniqrcAzsa++l7gCyQDzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210855; x=1782815655;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAmCq3NGvS1r7Ju946AxIQzlGNfD9CwbwmW4rKd+63o=;
        b=XNLL1ceEJGv0VYriL+4LxwQNOsEz++5oNrG4bq9VluOCrzmaMqLugVqo8thI/Q/EqN
         SehMOb63FVTj+7/zu5aZ/NDLu0fDaHek+m4JR0GYYl7wawdP2UPPnP9PAV54p51qZ0Gc
         XiDGjelvpWLM4/7yMC1WaIGXJg6ltMVSLQZ7VjJIGAQE8TMq5g3stdlpHKBXlm/LSKrC
         hqbmXqozSMljvE6zId4yDNlXydm/fsRz/LLRFdZ6xG4CE3IbE1YooJ27CXr3aaId18Dw
         vYm0Nbcx3IHMIeMjXlx8l/7KJ70rXrYvhB3Lk5hTFSX5+LQsAzTSF5Zlf2vdap2RDk7/
         T2eA==
X-Forwarded-Encrypted: i=1; AFNElJ9B9BNbKp7v7Qa9im+S2qgrblTyAjQIeilzNHgbFeozwo/UxWq5UHX++oTG//doHaFT9HhZrLRRtjTgJsNNTGO8pw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2fRSbcHl5nPCYSzNuRImqDs35x4zp1i0A1v4/2CRA9lLlfoq2
	g5r+8BPPQICXEkI7lMRUSCZma8OKk0boOT7y+GjrZlpGagKbDctDrhykv4wlgGWGxBNbwAlsHYy
	qFxqm
X-Gm-Gg: AfdE7cnHODx087W1FbehdjBktwHrpUwCwmiK0/H3bIjNetJaJWIVUBy1RkSpdORQALe
	sHS7PBkDK6sri//5WD9YLkRfG1ymkGp8xs+OOZ9EkX0lnNnSf+PqmuOJfmu9Vj1chyTqxt9Vh9q
	FVBGKHyd77zUOa4NJYlepE4e0v2uVItZ9jzh5+mdj+w5qQk8vIyGzAJ/f9ccy0wzculcfvoLYxv
	7lCKhM5cGOil/mCuDsPcdStk2mNMyIqU6KB6FcvVEvl1ndq4/VohQAzf1pMlemWgenvmoHYfqOg
	IAKxNTiNxE6Q2Ct3YRX2b3c7Jpd0qptTKDL2GMKX30z8QGSlnvFn1cx8sMiYROZbeY/G+Cevepn
	i0A5c89EXx/3+jSHL9EN8Bri+ZNEZsy7WEdZ0zgwLKbkGL/GtxbY+KNTYkgDaDewOOjVWMKQSNc
	gFcKsqX87gldtRefiQMq2VJckz3NfawzFFGmEaDFDxfzMPR7Lmt5e79JxlX+wS0ZuhcteHWVJjA
	mMnnQ==
X-Received: by 2002:a05:600c:33a6:b0:490:cb90:3e13 with SMTP id 5b1f17b1804b1-49240e85dc5mr203790525e9.21.1782210854952;
        Tue, 23 Jun 2026 03:34:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm261982375e9.1.2026.06.23.03.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:34:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 12:34:13 +0200
Message-Id: <DJGD0RGZ1VSK.2VOB7YO1D6IS9@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <sudumbha@cisco.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] nfs-utils: fix CVE-2025-12801
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260525075233.3501427-1-sudumbha@cisco.com>
 <20260623102540.601753-1-sudumbha@cisco.com>
 <DJGCZWZ6TL22.100HO9OCMQAYN@smile.fr>
In-Reply-To: <DJGCZWZ6TL22.100HO9OCMQAYN@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 10:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239347

On Tue Jun 23, 2026 at 12:33 PM CEST, Yoann Congal wrote:
> On Tue Jun 23, 2026 at 12:25 PM CEST, Sudhir Dumbhare via lists.openembed=
ded.org wrote:
>> From: Sudhir Dumbhare <sudumbha@cisco.com>
>>
>> - This patch applies the upstream fix [5] as referenced in [7].
>> - To successfully apply the fixed commit, apply the dependent commits [2=
] to [4]
>>   which are included in v2.8.6, as referenced in [7].
>> - Additionally, include dependent commit [1] from v2.8.3, as referenced =
in [8]
>>   under the [2.5.4-38.2] description, along with compilation fix commit =
[6]
>>   from v2.7.1
>> - Reference:
>>   [1] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3Dcd90f2925790
>>   [2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3D7e8b36522f58
>>   [3] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3D42f01e6a78fe
>>   [4] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3D51738ae56d92
>>   [5] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3Df36bd900a899
>>   [6] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=
=3Da2c95e4f557a
>>   [7] https://security-tracker.debian.org/tracker/CVE-2025-12801
>>   [8] https://linux.oracle.com/errata/ELSA-2026-3940.html
>>
>> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> ---
>> Changes v1 -> v2:
>> - Fully backport commit cd90f29257904f36509ea5a04a86f42398fbe94a for com=
pleteness.
>
> I understand that I need to drop the v1.
> What was the issue with the partial cd90f2925 commit?

Oh right: https://lore.kernel.org/all/c00944a7d36d2836e7dad02aa060e57d8ad52=
15f.camel@pbarker.dev/

Got it!

> This is a really big CVE patch. Anything to simplify its review would be
> welcome.
>
> Regards,
>>
>>  .../nfs-utils/CVE-2025-12801-build-fix.patch  |  44 ++
>>  .../CVE-2025-12801-dependent_p1.patch         | 450 +++++++++++++++++
>>  .../CVE-2025-12801-dependent_p2.patch         |  81 +++
>>  .../CVE-2025-12801-dependent_p3.patch         | 181 +++++++
>>  .../CVE-2025-12801-dependent_p4.patch         | 468 ++++++++++++++++++
>>  .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 ++++++++++
>>  .../nfs-utils/nfs-utils_2.6.4.bb              |   6 +
>>  7 files changed, 1484 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-build-fix.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p1.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p2.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p3.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p4.patch
>>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801.patch
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1-build-fix.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-=
12801-build-fix.patch
>> new file mode 100644
>> index 0000000000..d7aaca2242
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build=
-fix.patch
>> @@ -0,0 +1,44 @@
>> +From 30e0f57fff545b0bb3071fa071c7b12c2923bac8 Mon Sep 17 00:00:00 2001
>> +From: Steve Dickson <steved@redhat.com>
>> +Date: Mon, 22 Jan 2024 13:23:57 -0500
>> +Subject: [PATCH] reexport.c: Some Distros need the following include to
>> + avoid the following error
>> +
>> +reexport.c: In function =E2=80=98connect_fsid_service=E2=80=99:
>> +reexport.c:41:28: error: implicit declaration of function =E2=80=98offs=
etof=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>> +   41 |                 addr_len =3D offsetof(struct sockaddr_un, sun_p=
ath) + strlen(addr.sun_path);
>> +      |                            ^~~~~~~~
>> +reexport.c:19:1: note: =E2=80=98offsetof=E2=80=99 is defined in header =
=E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#include <stddef.h=
>=E2=80=99?
>> +   18 | #include "xlog.h"
>> +  +++ |+#include <stddef.h>
>> +   19 |
>> +reexport.c:41:37: error: expected expression before =E2=80=98struct=E2=
=80=99
>> +   41 |                 addr_len =3D offsetof(struct sockaddr_un, sun_p=
ath) + strlen(addr.sun_path);
>> +      |                                     ^~~~~~
>> +cc1: some warnings being treated as errors
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3Da2c95e4f557a71b482bb62bad6d93ddde51e5dc6]
>> +
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit a2c95e4f557a71b482bb62bad6d93ddde51e5dc6)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + support/reexport/reexport.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
>> +index 78516586..16dde0fb 100644
>> +--- a/support/reexport/reexport.c
>> ++++ b/support/reexport/reexport.c
>> +@@ -8,6 +8,7 @@
>> + #include <sys/types.h>
>> + #include <sys/vfs.h>
>> + #include <errno.h>
>> ++#include <stddef.h>
>> +=20
>> + #include "nfsd_path.h"
>> + #include "conffile.h"
>> +--=20
>> +2.44.4
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1-dependent_p1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p1.patch
>> new file mode 100644
>> index 0000000000..c1fb7c2f12
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depen=
dent_p1.patch
>> @@ -0,0 +1,450 @@
>> +From bbec1c68cbf9a9b3b28aad213b4573d288879a6f Mon Sep 17 00:00:00 2001
>> +From: Christopher Bii <christopherbii@hyub.org>
>> +Date: Wed, 15 Jan 2025 12:10:48 -0500
>> +Subject: [PATCH] NFS export symlink vulnerability fix
>> +
>> +Replaced dangerous use of realpath within support/nfs/export.c with
>> +nfsd_realpath variant that is executed within the chrooted thread
>> +rather than main thread.
>> +
>> +Implemented nfsd_path.h methods to work securely within chrooted
>> +thread using nfsd_run_task() help
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3Dcd90f29257904f36509ea5a04a86f42398fbe94a]
>> +
>> +Signed-off-by: Christopher Bii <christopherbii@hyub.org>
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit cd90f29257904f36509ea5a04a86f42398fbe94a)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + support/export/cache.c      |   2 +-
>> + support/include/nfsd_path.h |   5 +-
>> + support/misc/nfsd_path.c    | 257 +++++++++++-------------------------
>> + support/nfs/exports.c       |   3 +-
>> + 4 files changed, 83 insertions(+), 184 deletions(-)
>> +
>> +diff --git a/support/export/cache.c b/support/export/cache.c
>> +index 6c0a44a3..a4c339f2 100644
>> +--- a/support/export/cache.c
>> ++++ b/support/export/cache.c
>> +@@ -65,7 +65,7 @@ static ssize_t cache_read(int fd, char *buf, size_t l=
en)
>> + 	return nfsd_path_read(fd, buf, len);
>> + }
>> +=20
>> +-static ssize_t cache_write(int fd, const char *buf, size_t len)
>> ++static ssize_t cache_write(int fd, void *buf, size_t len)
>> + {
>> + 	return nfsd_path_write(fd, buf, len);
>> + }
>> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
>> +index aa1e1dd0..f600fb5a 100644
>> +--- a/support/include/nfsd_path.h
>> ++++ b/support/include/nfsd_path.h
>> +@@ -8,6 +8,7 @@
>> +=20
>> + struct file_handle;
>> + struct statfs;
>> ++struct nfsd_task_t;
>> +=20
>> + void 		nfsd_path_init(void);
>> +=20
>> +@@ -23,8 +24,8 @@ int		nfsd_path_statfs(const char *pathname,
>> +=20
>> + char *		nfsd_realpath(const char *path, char *resolved_path);
>> +=20
>> +-ssize_t		nfsd_path_read(int fd, char *buf, size_t len);
>> +-ssize_t		nfsd_path_write(int fd, const char *buf, size_t len);
>> ++ssize_t		nfsd_path_read(int fd, void* buf, size_t len);
>> ++ssize_t		nfsd_path_write(int fd, void* buf, size_t len);
>> +=20
>> + int		nfsd_name_to_handle_at(int fd, const char *path,
>> + 				       struct file_handle *fh,
>> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
>> +index c3dea4f0..caec33ca 100644
>> +--- a/support/misc/nfsd_path.c
>> ++++ b/support/misc/nfsd_path.c
>> +@@ -19,7 +19,20 @@
>> + #include "nfsd_path.h"
>> + #include "workqueue.h"
>> +=20
>> +-static struct xthread_workqueue *nfsd_wq;
>> ++static struct xthread_workqueue *nfsd_wq =3D NULL;
>> ++
>> ++struct nfsd_task_t {
>> ++        int             ret;
>> ++        void*           data;
>> ++};
>> ++/* Function used to offload tasks that must be ran within the correct
>> ++ * chroot environment.
>> ++ */
>> ++static void
>> ++nfsd_run_task(void (*func)(void*), void* data){
>> ++        nfsd_wq ? xthread_work_run_sync(nfsd_wq, func, data) : func(da=
ta);
>> ++};
>> ++
>> +=20
>> + static int
>> + nfsd_path_isslash(const char *path)
>> +@@ -124,224 +137,119 @@ nfsd_path_init(void)
>> + }
>> +=20
>> + struct nfsd_stat_data {
>> +-	const char *pathname;
>> +-	struct stat *statbuf;
>> +-	int ret;
>> +-	int err;
>> ++	const char      *pathname;
>> ++	struct stat     *statbuf;
>> ++        int             (*stat_handler)(const char*, struct stat*);
>> + };
>> +=20
>> + static void
>> +-nfsd_statfunc(void *data)
>> +-{
>> +-	struct nfsd_stat_data *d =3D data;
>> +-
>> +-	d->ret =3D xstat(d->pathname, d->statbuf);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> +-}
>> +-
>> +-static void
>> +-nfsd_lstatfunc(void *data)
>> ++nfsd_handle_stat(void *data)
>> + {
>> +-	struct nfsd_stat_data *d =3D data;
>> +-
>> +-	d->ret =3D xlstat(d->pathname, d->statbuf);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> ++        struct nfsd_task_t*     t =3D data;
>> ++	struct nfsd_stat_data*  d =3D t->data;
>> ++        t->ret =3D d->stat_handler(d->pathname, d->statbuf);
>> + }
>> +=20
>> + static int
>> +-nfsd_run_stat(struct xthread_workqueue *wq,
>> +-		void (*func)(void *),
>> +-		const char *pathname,
>> +-		struct stat *statbuf)
>> ++nfsd_run_stat(const char *pathname,
>> ++	        struct stat *statbuf,
>> ++                int (*handler)(const char*, struct stat*))
>> + {
>> +-	struct nfsd_stat_data data =3D {
>> +-		pathname,
>> +-		statbuf,
>> +-		0,
>> +-		0
>> +-	};
>> +-	xthread_work_run_sync(wq, func, &data);
>> +-	if (data.ret < 0)
>> +-		errno =3D data.err;
>> +-	return data.ret;
>> ++        struct nfsd_task_t      t;
>> ++        struct nfsd_stat_data   d =3D { pathname, statbuf, handler };
>> ++        t.data =3D &d;
>> ++        nfsd_run_task(nfsd_handle_stat, &t);
>> ++	return t.ret;
>> + }
>> +=20
>> + int
>> + nfsd_path_stat(const char *pathname, struct stat *statbuf)
>> + {
>> +-	if (!nfsd_wq)
>> +-		return xstat(pathname, statbuf);
>> +-	return nfsd_run_stat(nfsd_wq, nfsd_statfunc, pathname, statbuf);
>> ++        return nfsd_run_stat(pathname, statbuf, stat);
>> + }
>> +=20
>> + int
>> +-nfsd_path_lstat(const char *pathname, struct stat *statbuf)
>> +-{
>> +-	if (!nfsd_wq)
>> +-		return xlstat(pathname, statbuf);
>> +-	return nfsd_run_stat(nfsd_wq, nfsd_lstatfunc, pathname, statbuf);
>> +-}
>> +-
>> +-struct nfsd_statfs_data {
>> +-	const char *pathname;
>> +-	struct statfs *statbuf;
>> +-	int ret;
>> +-	int err;
>> ++nfsd_path_lstat(const char* pathname, struct stat* statbuf){
>> ++        return nfsd_run_stat(pathname, statbuf, lstat);
>> + };
>> +=20
>> +-static void
>> +-nfsd_statfsfunc(void *data)
>> +-{
>> +-	struct nfsd_statfs_data *d =3D data;
>> +-
>> +-	d->ret =3D statfs(d->pathname, d->statbuf);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> +-}
>> +-
>> +-static int
>> +-nfsd_run_statfs(struct xthread_workqueue *wq,
>> +-		  const char *pathname,
>> +-		  struct statfs *statbuf)
>> +-{
>> +-	struct nfsd_statfs_data data =3D {
>> +-		pathname,
>> +-		statbuf,
>> +-		0,
>> +-		0
>> +-	};
>> +-	xthread_work_run_sync(wq, nfsd_statfsfunc, &data);
>> +-	if (data.ret < 0)
>> +-		errno =3D data.err;
>> +-	return data.ret;
>> +-}
>> +-
>> + int
>> +-nfsd_path_statfs(const char *pathname, struct statfs *statbuf)
>> ++nfsd_path_statfs(const char* pathname, struct statfs* statbuf)
>> + {
>> +-	if (!nfsd_wq)
>> +-		return statfs(pathname, statbuf);
>> +-	return nfsd_run_statfs(nfsd_wq, pathname, statbuf);
>> +-}
>> ++        return nfsd_run_stat(pathname, (struct stat*)statbuf, (int (*)=
(const char*, struct stat*))statfs);
>> ++};
>> +=20
>> +-struct nfsd_realpath_data {
>> +-	const char *pathname;
>> +-	char *resolved;
>> +-	int err;
>> ++struct nfsd_realpath_t {
>> ++        const char*     path;
>> ++        char*           resolved_buf;
>> ++        char*           res_ptr;
>> + };
>> +=20
>> + static void
>> + nfsd_realpathfunc(void *data)
>> + {
>> +-	struct nfsd_realpath_data *d =3D data;
>> +-
>> +-	d->resolved =3D realpath(d->pathname, d->resolved);
>> +-	if (!d->resolved)
>> +-		d->err =3D errno;
>> ++        struct nfsd_realpath_t *d =3D data;
>> ++        d->res_ptr =3D realpath(d->path, d->resolved_buf);
>> + }
>> +=20
>> +-char *
>> +-nfsd_realpath(const char *path, char *resolved_path)
>> ++char*
>> ++nfsd_realpath(const char *path, char *resolved_buf)
>> + {
>> +-	struct nfsd_realpath_data data =3D {
>> +-		path,
>> +-		resolved_path,
>> +-		0
>> +-	};
>> +-
>> +-	if (!nfsd_wq)
>> +-		return realpath(path, resolved_path);
>> +-
>> +-	xthread_work_run_sync(nfsd_wq, nfsd_realpathfunc, &data);
>> +-	if (!data.resolved)
>> +-		errno =3D data.err;
>> +-	return data.resolved;
>> ++        struct nfsd_realpath_t realpath_buf =3D {
>> ++                .path =3D path,
>> ++                .resolved_buf =3D resolved_buf
>> ++        };
>> ++        nfsd_run_task(nfsd_realpathfunc, &realpath_buf);
>> ++        return realpath_buf.res_ptr;
>> + }
>> +=20
>> +-struct nfsd_read_data {
>> +-	int fd;
>> +-	char *buf;
>> +-	size_t len;
>> +-	ssize_t ret;
>> +-	int err;
>> ++struct nfsd_rw_data {
>> ++	int             fd;
>> ++	void*           buf;
>> ++	size_t          len;
>> ++        ssize_t         bytes_read;
>> + };
>> +=20
>> + static void
>> + nfsd_readfunc(void *data)
>> + {
>> +-	struct nfsd_read_data *d =3D data;
>> +-
>> +-	d->ret =3D read(d->fd, d->buf, d->len);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> ++        struct nfsd_rw_data* t =3D (struct nfsd_rw_data*)data;
>> ++        t->bytes_read =3D read(t->fd, t->buf, t->len);
>> + }
>> +=20
>> + static ssize_t
>> +-nfsd_run_read(struct xthread_workqueue *wq, int fd, char *buf, size_t =
len)
>> ++nfsd_run_read(int fd, void* buf, size_t len)
>> + {
>> +-	struct nfsd_read_data data =3D {
>> +-		fd,
>> +-		buf,
>> +-		len,
>> +-		0,
>> +-		0
>> +-	};
>> +-	xthread_work_run_sync(wq, nfsd_readfunc, &data);
>> +-	if (data.ret < 0)
>> +-		errno =3D data.err;
>> +-	return data.ret;
>> ++        struct nfsd_rw_data d =3D { .fd =3D fd, .buf =3D buf, .len =3D=
 len };
>> ++        nfsd_run_task(nfsd_readfunc, &d);
>> ++	return d.bytes_read;
>> + }
>> +=20
>> + ssize_t
>> +-nfsd_path_read(int fd, char *buf, size_t len)
>> ++nfsd_path_read(int fd, void* buf, size_t len)
>> + {
>> +-	if (!nfsd_wq)
>> +-		return read(fd, buf, len);
>> +-	return nfsd_run_read(nfsd_wq, fd, buf, len);
>> ++	return nfsd_run_read(fd, buf, len);
>> + }
>> +=20
>> +-struct nfsd_write_data {
>> +-	int fd;
>> +-	const char *buf;
>> +-	size_t len;
>> +-	ssize_t ret;
>> +-	int err;
>> +-};
>> +-
>> + static void
>> + nfsd_writefunc(void *data)
>> + {
>> +-	struct nfsd_write_data *d =3D data;
>> +-
>> +-	d->ret =3D write(d->fd, d->buf, d->len);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> ++	struct nfsd_rw_data* d =3D data;
>> ++	d->bytes_read =3D write(d->fd, d->buf, d->len);
>> + }
>> +=20
>> + static ssize_t
>> +-nfsd_run_write(struct xthread_workqueue *wq, int fd, const char *buf, =
size_t len)
>> ++nfsd_run_write(int fd, void* buf, size_t len)
>> + {
>> +-	struct nfsd_write_data data =3D {
>> +-		fd,
>> +-		buf,
>> +-		len,
>> +-		0,
>> +-		0
>> +-	};
>> +-	xthread_work_run_sync(wq, nfsd_writefunc, &data);
>> +-	if (data.ret < 0)
>> +-		errno =3D data.err;
>> +-	return data.ret;
>> ++        struct nfsd_rw_data d =3D { .fd =3D fd, .buf =3D buf, .len =3D=
 len };
>> ++        nfsd_run_task(nfsd_writefunc, &d);
>> ++	return d.bytes_read;
>> + }
>> +=20
>> + ssize_t
>> +-nfsd_path_write(int fd, const char *buf, size_t len)
>> ++nfsd_path_write(int fd, void* buf, size_t len)
>> + {
>> +-	if (!nfsd_wq)
>> +-		return write(fd, buf, len);
>> +-	return nfsd_run_write(nfsd_wq, fd, buf, len);
>> ++	return nfsd_run_write(fd, buf, len);
>> + }
>> +=20
>> + #if defined(HAVE_NAME_TO_HANDLE_AT)
>> +@@ -352,23 +260,18 @@ struct nfsd_handle_data {
>> + 	int *mount_id;
>> + 	int flags;
>> + 	int ret;
>> +-	int err;
>> + };
>> +=20
>> + static void
>> + nfsd_name_to_handle_func(void *data)
>> + {
>> + 	struct nfsd_handle_data *d =3D data;
>> +-
>> +-	d->ret =3D name_to_handle_at(d->fd, d->path,
>> +-			d->fh, d->mount_id, d->flags);
>> +-	if (d->ret < 0)
>> +-		d->err =3D errno;
>> ++	d->ret =3D name_to_handle_at(d->fd, d->path, d->fh, d->mount_id, d->f=
lags);
>> + }
>> +=20
>> + static int
>> +-nfsd_run_name_to_handle_at(struct xthread_workqueue *wq,
>> +-		int fd, const char *path, struct file_handle *fh,
>> ++nfsd_run_name_to_handle_at(int fd, const char *path,
>> ++                struct file_handle *fh,
>> + 		int *mount_id, int flags)
>> + {
>> + 	struct nfsd_handle_data data =3D {
>> +@@ -377,25 +280,19 @@ nfsd_run_name_to_handle_at(struct xthread_workque=
ue *wq,
>> + 		fh,
>> + 		mount_id,
>> + 		flags,
>> +-		0,
>> + 		0
>> + 	};
>> +=20
>> +-	xthread_work_run_sync(wq, nfsd_name_to_handle_func, &data);
>> +-	if (data.ret < 0)
>> +-		errno =3D data.err;
>> ++	nfsd_run_task(nfsd_name_to_handle_func, &data);
>> + 	return data.ret;
>> + }
>> +=20
>> + int
>> +-nfsd_name_to_handle_at(int fd, const char *path, struct file_handle *f=
h,
>> ++nfsd_name_to_handle_at(int fd, const char *path,
>> ++                struct file_handle *fh,
>> + 		int *mount_id, int flags)
>> + {
>> +-	if (!nfsd_wq)
>> +-		return name_to_handle_at(fd, path, fh, mount_id, flags);
>> +-
>> +-	return nfsd_run_name_to_handle_at(nfsd_wq, fd, path, fh,
>> +-			mount_id, flags);
>> ++        return nfsd_run_name_to_handle_at(fd, path, fh, mount_id, flag=
s);
>> + }
>> + #else
>> + int
>> +diff --git a/support/nfs/exports.c b/support/nfs/exports.c
>> +index 15dc574c..c47e3d0a 100644
>> +--- a/support/nfs/exports.c
>> ++++ b/support/nfs/exports.c
>> +@@ -32,6 +32,7 @@
>> + #include "xio.h"
>> + #include "pseudoflavors.h"
>> + #include "reexport.h"
>> ++#include "nfsd_path.h"
>> +=20
>> + #define EXPORT_DEFAULT_FLAGS	\
>> +   (NFSEXP_READONLY|NFSEXP_ROOTSQUASH|NFSEXP_GATHERED_WRITES|NFSEXP_NOS=
UBTREECHECK)
>> +@@ -200,7 +201,7 @@ getexportent(int fromkernel, int fromexports)
>> + 		return NULL;
>> +         }
>> + 	/* resolve symlinks */
>> +-	if (realpath(ee.e_path, rpath) !=3D NULL) {
>> ++	if (nfsd_realpath(ee.e_path, rpath) !=3D NULL) {
>> + 		rpath[sizeof (rpath) - 1] =3D '\0';
>> + 		strncpy(ee.e_path, rpath, sizeof (ee.e_path) - 1);
>> + 		ee.e_path[sizeof (ee.e_path) - 1] =3D '\0';
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1-dependent_p2.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p2.patch
>> new file mode 100644
>> index 0000000000..f088eadb4b
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depen=
dent_p2.patch
>> @@ -0,0 +1,81 @@
>> +From a6ddd0e9594884cf61816478e8c561f1b3aac709 Mon Sep 17 00:00:00 2001
>> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Date: Mon, 10 Nov 2025 11:26:03 -0500
>> +Subject: [PATCH] mountd: Minor refactor of get_rootfh()
>> +
>> +Perform the mountpoint checks before checking the user path.
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3D7e8b36522f58657359c6842119fc516c6dd1baa4]
>> +
>> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
>> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit 7e8b36522f58657359c6842119fc516c6dd1baa4)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + utils/mountd/mountd.c | 34 +++++++++++++++++-----------------
>> + 1 file changed, 17 insertions(+), 17 deletions(-)
>> +
>> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
>> +index dbd5546d..39afd4aa 100644
>> +--- a/utils/mountd/mountd.c
>> ++++ b/utils/mountd/mountd.c
>> +@@ -412,6 +412,23 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
>> + 		*error =3D MNT3ERR_ACCES;
>> + 		return NULL;
>> + 	}
>> ++	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
>> ++		xlog(L_WARNING, "can't stat export point %s: %s",
>> ++		     p, strerror(errno));
>> ++		*error =3D MNT3ERR_NOENT;
>> ++		return NULL;
>> ++	}
>> ++	if (exp->m_export.e_mountpoint &&
>> ++		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
>> ++				  exp->m_export.e_mountpoint:
>> ++				  exp->m_export.e_path,
>> ++				  nfsd_path_lstat)) {
>> ++		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
>> ++		     p);
>> ++		*error =3D MNT3ERR_NOENT;
>> ++		return NULL;
>> ++	}
>> ++
>> + 	if (nfsd_path_stat(p, &stb) < 0) {
>> + 		xlog(L_WARNING, "can't stat exported dir %s: %s",
>> + 				p, strerror(errno));
>> +@@ -426,12 +443,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
>> + 		*error =3D MNT3ERR_NOTDIR;
>> + 		return NULL;
>> + 	}
>> +-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
>> +-		xlog(L_WARNING, "can't stat export point %s: %s",
>> +-		     p, strerror(errno));
>> +-		*error =3D MNT3ERR_NOENT;
>> +-		return NULL;
>> +-	}
>> + 	if (estb.st_dev !=3D stb.st_dev
>> + 	    && !(exp->m_export.e_flags & NFSEXP_CROSSMOUNT)) {
>> + 		xlog(L_WARNING, "request to export directory %s below nearest filesy=
stem %s",
>> +@@ -439,17 +450,6 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
>> + 		*error =3D MNT3ERR_ACCES;
>> + 		return NULL;
>> + 	}
>> +-	if (exp->m_export.e_mountpoint &&
>> +-		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
>> +-				  exp->m_export.e_mountpoint:
>> +-				  exp->m_export.e_path,
>> +-				  nfsd_path_lstat)) {
>> +-		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
>> +-		     p);
>> +-		*error =3D MNT3ERR_NOENT;
>> +-		return NULL;
>> +-	}
>> +-
>> + 	/* This will be a static private nfs_export with just one
>> + 	 * address.  We feed it to kernel then extract the filehandle,
>> + 	 */
>> +--=20
>> +2.44.4
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1-dependent_p3.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p3.patch
>> new file mode 100644
>> index 0000000000..901069e3b9
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depen=
dent_p3.patch
>> @@ -0,0 +1,181 @@
>> +From 57732919d26ce523161392d688e3b67d6fc50839 Mon Sep 17 00:00:00 2001
>> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Date: Mon, 10 Nov 2025 11:28:39 -0500
>> +Subject: [PATCH] mountd: Separate lookup of the exported directory and =
the
>> + mount path
>> +
>> +When the caller asks to mount a path that does not terminate with an
>> +exported directory, we want to split up the lookups so that we can
>> +look up the exported directory using the mountd privileged credential,
>> +and the remaining subdirectory lookups using the RPC caller's
>> +credential.
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3D42f01e6a78fed98f12437ac8b28cfb12b6bad056]
>> +
>> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
>> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit 42f01e6a78fed98f12437ac8b28cfb12b6bad056)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + support/include/nfsd_path.h |  1 +
>> + support/misc/nfsd_path.c    | 31 ++++++++++++++++++
>> + utils/mountd/mountd.c       | 63 +++++++++++++++++++++++++++++++------
>> + 3 files changed, 86 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
>> +index f600fb5a..3e5a2f5d 100644
>> +--- a/support/include/nfsd_path.h
>> ++++ b/support/include/nfsd_path.h
>> +@@ -18,6 +18,7 @@ char *		nfsd_path_prepend_dir(const char *dir, const =
char *pathname);
>> +=20
>> + int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
>> + int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
>> ++int		nfsd_openat(int dirfd, const char *path, int flags);
>> +=20
>> + int		nfsd_path_statfs(const char *pathname,
>> + 				   struct statfs *statbuf);
>> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
>> +index caec33ca..dfe88e4f 100644
>> +--- a/support/misc/nfsd_path.c
>> ++++ b/support/misc/nfsd_path.c
>> +@@ -203,6 +203,37 @@ nfsd_realpath(const char *path, char *resolved_buf=
)
>> +         return realpath_buf.res_ptr;
>> + }
>> +=20
>> ++struct nfsd_openat_t {
>> ++	const char *path;
>> ++	int dirfd;
>> ++	int flags;
>> ++	int res_fd;
>> ++	int res_error;
>> ++};
>> ++
>> ++static void nfsd_openatfunc(void *data)
>> ++{
>> ++	struct nfsd_openat_t *d =3D data;
>> ++
>> ++	d->res_fd =3D openat(d->dirfd, d->path, d->flags);
>> ++	if (d->res_fd =3D=3D -1)
>> ++		d->res_error =3D errno;
>> ++}
>> ++
>> ++int nfsd_openat(int dirfd, const char *path, int flags)
>> ++{
>> ++	struct nfsd_openat_t open_buf =3D {
>> ++		.path =3D path,
>> ++		.dirfd =3D dirfd,
>> ++		.flags =3D flags,
>> ++	};
>> ++
>> ++	nfsd_run_task(nfsd_openatfunc, &open_buf);
>> ++	if (open_buf.res_fd =3D=3D -1)
>> ++		errno =3D open_buf.res_error;
>> ++	return open_buf.res_fd;
>> ++}
>> ++
>> + struct nfsd_rw_data {
>> + 	int             fd;
>> + 	void*           buf;
>> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
>> +index 39afd4aa..f43ebef5 100644
>> +--- a/utils/mountd/mountd.c
>> ++++ b/utils/mountd/mountd.c
>> +@@ -392,7 +392,10 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, n=
fs_export **expret,
>> + 	struct nfs_fh_len *fh;
>> + 	char		rpath[MAXPATHLEN+1];
>> + 	char		*p =3D *path;
>> ++	char		*subpath;
>> + 	char		buf[INET6_ADDRSTRLEN];
>> ++	size_t		epathlen;
>> ++	int		dirfd;
>> +=20
>> + 	if (*p =3D=3D '\0')
>> + 		p =3D "/";
>> +@@ -412,12 +415,21 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, =
nfs_export **expret,
>> + 		*error =3D MNT3ERR_ACCES;
>> + 		return NULL;
>> + 	}
>> +-	if (nfsd_path_stat(exp->m_export.e_path, &estb) < 0) {
>> +-		xlog(L_WARNING, "can't stat export point %s: %s",
>> ++
>> ++	dirfd =3D nfsd_openat(AT_FDCWD, exp->m_export.e_path, O_PATH);
>> ++	if (dirfd =3D=3D -1) {
>> ++		xlog(L_WARNING, "can't open export point %s: %s",
>> + 		     p, strerror(errno));
>> + 		*error =3D MNT3ERR_NOENT;
>> + 		return NULL;
>> + 	}
>> ++	if (fstat(dirfd, &estb) =3D=3D -1) {
>> ++		xlog(L_WARNING, "can't stat export point %s: %s",
>> ++		     p, strerror(errno));
>> ++		*error =3D MNT3ERR_ACCES;
>> ++		close(dirfd);
>> ++		return NULL;
>> ++	}
>> + 	if (exp->m_export.e_mountpoint &&
>> + 		   !check_is_mountpoint(exp->m_export.e_mountpoint[0]?
>> + 				  exp->m_export.e_mountpoint:
>> +@@ -426,18 +438,51 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, =
nfs_export **expret,
>> + 		xlog(L_WARNING, "request to export an unmounted filesystem: %s",
>> + 		     p);
>> + 		*error =3D MNT3ERR_NOENT;
>> ++		close(dirfd);
>> + 		return NULL;
>> + 	}
>> +=20
>> +-	if (nfsd_path_stat(p, &stb) < 0) {
>> +-		xlog(L_WARNING, "can't stat exported dir %s: %s",
>> +-				p, strerror(errno));
>> +-		if (errno =3D=3D ENOENT)
>> +-			*error =3D MNT3ERR_NOENT;
>> +-		else
>> +-			*error =3D MNT3ERR_ACCES;
>> ++	epathlen =3D strlen(exp->m_export.e_path);
>> ++	if (epathlen > strlen(p)) {
>> ++		xlog(L_WARNING, "raced with change of exported path: %s", p);
>> ++		*error =3D MNT3ERR_NOENT;
>> ++		close(dirfd);
>> + 		return NULL;
>> + 	}
>> ++	subpath =3D &p[epathlen];
>> ++	while (*subpath =3D=3D '/')
>> ++		subpath++;
>> ++	if (*subpath !=3D '\0') {
>> ++		int fd;
>> ++
>> ++		/* Just perform a lookup of the path */
>> ++		fd =3D nfsd_openat(dirfd, subpath, O_PATH);
>> ++		close(dirfd);
>> ++		if (fd =3D=3D -1) {
>> ++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
>> ++			     strerror(errno));
>> ++			if (errno =3D=3D ENOENT)
>> ++				*error =3D MNT3ERR_NOENT;
>> ++			else
>> ++				*error =3D MNT3ERR_ACCES;
>> ++			return NULL;
>> ++		}
>> ++		if (fstat(fd, &stb) =3D=3D -1) {
>> ++			xlog(L_WARNING, "can't open exported dir %s: %s", p,
>> ++			     strerror(errno));
>> ++			if (errno =3D=3D ENOENT)
>> ++				*error =3D MNT3ERR_NOENT;
>> ++			else
>> ++				*error =3D MNT3ERR_ACCES;
>> ++			close(fd);
>> ++			return NULL;
>> ++		}
>> ++		close(fd);
>> ++	} else {
>> ++		close(dirfd);
>> ++		stb =3D estb;
>> ++	}
>> ++
>> + 	if (!S_ISDIR(stb.st_mode) && !S_ISREG(stb.st_mode)) {
>> + 		xlog(L_WARNING, "%s is not a directory or regular file", p);
>> + 		*error =3D MNT3ERR_NOTDIR;
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1-dependent_p4.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-20=
25-12801-dependent_p4.patch
>> new file mode 100644
>> index 0000000000..4ef529e737
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-depen=
dent_p4.patch
>> @@ -0,0 +1,468 @@
>> +From 7eef498b6bd01adc45415b03ddf321c84f82aa45 Mon Sep 17 00:00:00 2001
>> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Date: Mon, 10 Nov 2025 12:18:38 -0500
>> +Subject: [PATCH] support: Add a mini-library to extract and apply RPC
>> + credentials
>> +
>> +Add server functionality to extract the credentials from the client RPC
>> +call, and apply them. This is needed in order to perform access checkin=
g
>> +on the requested path in the mountd daemon.
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3D51738ae56d922d4961e60dad73ad1c2d97d8d99b]
>> +
>> +Backport Changes:
>> +- In support/misc/Makefile.am, the non-essential file.c was omitted
>> +  as it does not exist in the current nfs-utils version.
>> +
>> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
>> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit 51738ae56d922d4961e60dad73ad1c2d97d8d99b)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + aclocal/libtirpc.m4         |  11 +++
>> + support/include/Makefile.am |   1 +
>> + support/include/nfs_ucred.h |  44 ++++++++++
>> + support/misc/Makefile.am    |   2 +-
>> + support/misc/ucred.c        | 162 ++++++++++++++++++++++++++++++++++++
>> + support/nfs/Makefile.am     |   2 +-
>> + support/nfs/ucred.c         | 147 ++++++++++++++++++++++++++++++++
>> + 7 files changed, 367 insertions(+), 2 deletions(-)
>> + create mode 100644 support/include/nfs_ucred.h
>> + create mode 100644 support/misc/ucred.c
>> + create mode 100644 support/nfs/ucred.c
>> +
>> +diff --git a/aclocal/libtirpc.m4 b/aclocal/libtirpc.m4
>> +index bddae022..84e18f7e 100644
>> +--- a/aclocal/libtirpc.m4
>> ++++ b/aclocal/libtirpc.m4
>> +@@ -26,6 +26,17 @@ AC_DEFUN([AC_LIBTIRPC], [
>> +                                     [Define to 1 if your tirpc library=
 provides libtirpc_set_debug])],,
>> +                          [${LIBS}])])
>> +=20
>> ++     AS_IF([test -n "${LIBTIRPC}"],
>> ++           [AC_CHECK_LIB([tirpc], [rpc_gss_getcred],
>> ++                         [AC_DEFINE([HAVE_TIRPC_GSS_GETCRED], [1],
>> ++                                    [Define to 1 if your tirpc library=
 provides rpc_gss_getcred])],,
>> ++                         [${LIBS}])])
>> ++
>> ++     AS_IF([test -n "${LIBTIRPC}"],
>> ++           [AC_CHECK_LIB([tirpc], [authdes_getucred],
>> ++                         [AC_DEFINE([HAVE_TIRPC_AUTHDES_GETUCRED], [1]=
,
>> ++                                    [Define to 1 if your tirpc library=
 provides authdes_getucred])],,
>> ++                         [${LIBS}])])
>> +   AC_SUBST([AM_CPPFLAGS])
>> +   AC_SUBST(LIBTIRPC)
>> +=20
>> +diff --git a/support/include/Makefile.am b/support/include/Makefile.am
>> +index 1373891a..631a84f8 100644
>> +--- a/support/include/Makefile.am
>> ++++ b/support/include/Makefile.am
>> +@@ -10,6 +10,7 @@ noinst_HEADERS =3D \
>> + 	misc.h \
>> + 	nfs_mntent.h \
>> + 	nfs_paths.h \
>> ++	nfs_ucred.h \
>> + 	nfsd_path.h \
>> + 	nfslib.h \
>> + 	nfsrpc.h \
>> +diff --git a/support/include/nfs_ucred.h b/support/include/nfs_ucred.h
>> +new file mode 100644
>> +index 00000000..d58b61e4
>> +--- /dev/null
>> ++++ b/support/include/nfs_ucred.h
>> +@@ -0,0 +1,44 @@
>> ++#ifndef _NFS_UCRED_H
>> ++#define _NFS_UCRED_H
>> ++
>> ++#include <sys/types.h>
>> ++
>> ++struct nfs_ucred {
>> ++	uid_t uid;
>> ++	gid_t gid;
>> ++	int ngroups;
>> ++	gid_t *groups;
>> ++};
>> ++
>> ++struct svc_req;
>> ++struct exportent;
>> ++
>> ++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
>> ++		  const struct exportent *ep);
>> ++
>> ++void nfs_ucred_squash_groups(struct nfs_ucred *cred,
>> ++			     const struct exportent *ep);
>> ++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct expor=
tent *ep);
>> ++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
>> ++			     struct nfs_ucred **savedp);
>> ++
>> ++static inline void nfs_ucred_free(struct nfs_ucred *cred)
>> ++{
>> ++	free(cred->groups);
>> ++	free(cred);
>> ++}
>> ++
>> ++static inline void nfs_ucred_init_groups(struct nfs_ucred *cred, gid_t=
 *groups,
>> ++					 int ngroups)
>> ++{
>> ++	cred->groups =3D groups;
>> ++	cred->ngroups =3D ngroups;
>> ++}
>> ++
>> ++static inline void nfs_ucred_free_groups(struct nfs_ucred *cred)
>> ++{
>> ++	free(cred->groups);
>> ++	nfs_ucred_init_groups(cred, NULL, 0);
>> ++}
>> ++
>> ++#endif /* _NFS_UCRED_H */
>> +diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
>> +index 8b0e9db9..ea970064 100644
>> +--- a/support/misc/Makefile.am
>> ++++ b/support/misc/Makefile.am
>> +@@ -2,6 +2,6 @@
>> +=20
>> + noinst_LIBRARIES =3D libmisc.a
>> + libmisc_a_SOURCES =3D tcpwrapper.c from_local.c mountpoint.c misc.c \
>> +-		    nfsd_path.c workqueue.c xstat.c
>> ++		    nfsd_path.c ucred.c workqueue.c xstat.c
>> +=20
>> + MAINTAINERCLEANFILES =3D Makefile.in
>> +diff --git a/support/misc/ucred.c b/support/misc/ucred.c
>> +new file mode 100644
>> +index 00000000..92d97912
>> +--- /dev/null
>> ++++ b/support/misc/ucred.c
>> +@@ -0,0 +1,162 @@
>> ++#ifdef HAVE_CONFIG_H
>> ++#include <config.h>
>> ++#endif
>> ++
>> ++#include <alloca.h>
>> ++#include <errno.h>
>> ++#include <pwd.h>
>> ++#include <stdlib.h>
>> ++#include <unistd.h>
>> ++#include <grp.h>
>> ++
>> ++#include "exportfs.h"
>> ++#include "nfs_ucred.h"
>> ++
>> ++#include "xlog.h"
>> ++
>> ++void nfs_ucred_squash_groups(struct nfs_ucred *cred, const struct expo=
rtent *ep)
>> ++{
>> ++	int i;
>> ++
>> ++	if (!(ep->e_flags & NFSEXP_ROOTSQUASH))
>> ++		return;
>> ++	if (cred->gid =3D=3D 0)
>> ++		cred->gid =3D ep->e_anongid;
>> ++	for (i =3D 0; i < cred->ngroups; i++) {
>> ++		if (cred->groups[i] =3D=3D 0)
>> ++			cred->groups[i] =3D ep->e_anongid;
>> ++	}
>> ++}
>> ++
>> ++static int nfs_ucred_init_effective(struct nfs_ucred *cred)
>> ++{
>> ++	int ngroups =3D getgroups(0, NULL);
>> ++
>> ++	if (ngroups > 0) {
>> ++		size_t sz =3D ngroups * sizeof(gid_t);
>> ++		gid_t *groups =3D malloc(sz);
>> ++		if (groups =3D=3D NULL)
>> ++			return ENOMEM;
>> ++		if (getgroups(ngroups, groups) =3D=3D -1) {
>> ++			free(groups);
>> ++			return errno;
>> ++		}
>> ++		nfs_ucred_init_groups(cred, groups, ngroups);
>> ++	} else
>> ++		nfs_ucred_init_groups(cred, NULL, 0);
>> ++	cred->uid =3D geteuid();
>> ++	cred->gid =3D getegid();
>> ++	return 0;
>> ++}
>> ++
>> ++static size_t nfs_ucred_getpw_r_size_max(void)
>> ++{
>> ++	long buflen =3D sysconf(_SC_GETPW_R_SIZE_MAX);
>> ++
>> ++	if (buflen =3D=3D -1)
>> ++		return 16384;
>> ++	return buflen;
>> ++}
>> ++
>> ++int nfs_ucred_reload_groups(struct nfs_ucred *cred, const struct expor=
tent *ep)
>> ++{
>> ++	struct passwd pwd, *pw;
>> ++	uid_t uid =3D cred->uid;
>> ++	gid_t gid =3D cred->gid;
>> ++	size_t buflen;
>> ++	char *buf;
>> ++	int ngroups =3D 0;
>> ++	int ret;
>> ++
>> ++	if (ep->e_flags & (NFSEXP_ALLSQUASH | NFSEXP_ROOTSQUASH) &&
>> ++	    (int)uid =3D=3D ep->e_anonuid)
>> ++		return 0;
>> ++	buflen =3D nfs_ucred_getpw_r_size_max();
>> ++	buf =3D alloca(buflen);
>> ++	ret =3D getpwuid_r(uid, &pwd, buf, buflen, &pw);
>> ++	if (ret !=3D 0)
>> ++		return ret;
>> ++	if (!pw)
>> ++		return ENOENT;
>> ++	if (getgrouplist(pw->pw_name, gid, NULL, &ngroups) =3D=3D -1 &&
>> ++	    ngroups > 0) {
>> ++		gid_t *groups =3D malloc(ngroups * sizeof(groups[0]));
>> ++		if (groups =3D=3D NULL)
>> ++			return ENOMEM;
>> ++		if (getgrouplist(pw->pw_name, gid, groups, &ngroups) =3D=3D -1) {
>> ++			free(groups);
>> ++			return ENOMEM;
>> ++		}
>> ++		free(cred->groups);
>> ++		nfs_ucred_init_groups(cred, groups, ngroups);
>> ++		nfs_ucred_squash_groups(cred, ep);
>> ++	} else
>> ++		nfs_ucred_free_groups(cred);
>> ++	return 0;
>> ++}
>> ++
>> ++static int nfs_ucred_set_effective(const struct nfs_ucred *cred,
>> ++				   const struct nfs_ucred *saved)
>> ++{
>> ++	uid_t suid =3D saved ? saved->uid : geteuid();
>> ++	gid_t sgid =3D saved ? saved->gid : getegid();
>> ++	int ret;
>> ++
>> ++	/* Start with a privileged effective user */
>> ++	if (setresuid(-1, 0, -1) < 0) {
>> ++		xlog(L_WARNING, "can't change privileged user %u-%u. %s",
>> ++		     geteuid(), getegid(), strerror(errno));
>> ++		return errno;
>> ++	}
>> ++
>> ++	if (setgroups(cred->ngroups, cred->groups) =3D=3D -1) {
>> ++		xlog(L_WARNING, "can't change groups for user %u-%u. %s",
>> ++		     geteuid(), getegid(), strerror(errno));
>> ++		return errno;
>> ++	}
>> ++	if (setresgid(-1, cred->gid, sgid) =3D=3D -1) {
>> ++		xlog(L_WARNING, "can't change gid for user %u-%u. %s",
>> ++		     geteuid(), getegid(), strerror(errno));
>> ++		ret =3D errno;
>> ++		goto restore_groups;
>> ++	}
>> ++	if (setresuid(-1, cred->uid, suid) =3D=3D -1) {
>> ++		xlog(L_WARNING, "can't change uid for user %u-%u. %s",
>> ++		     geteuid(), getegid(), strerror(errno));
>> ++		ret =3D errno;
>> ++		goto restore_gid;
>> ++	}
>> ++	return 0;
>> ++restore_gid:
>> ++	if (setresgid(-1, sgid, -1) < 0) {
>> ++		xlog(L_WARNING, "can't restore privileged user %u-%u. %s",
>> ++		     geteuid(), getegid(), strerror(errno));
>> ++	}
>> ++restore_groups:
>> ++	if (saved)
>> ++		setgroups(saved->ngroups, saved->groups);
>> ++	else
>> ++		setgroups(0, NULL);
>> ++	return ret;
>> ++}
>> ++
>> ++int nfs_ucred_swap_effective(const struct nfs_ucred *cred,
>> ++			     struct nfs_ucred **savedp)
>> ++{
>> ++	struct nfs_ucred *saved =3D malloc(sizeof(*saved));
>> ++	int ret;
>> ++
>> ++	if (saved =3D=3D NULL)
>> ++		return ENOMEM;
>> ++	ret =3D nfs_ucred_init_effective(saved);
>> ++	if (ret !=3D 0) {
>> ++		free(saved);
>> ++		return ret;
>> ++	}
>> ++	ret =3D nfs_ucred_set_effective(cred, saved);
>> ++	if (savedp =3D=3D NULL || ret !=3D 0)
>> ++		nfs_ucred_free(saved);
>> ++	else
>> ++		*savedp =3D saved;
>> ++	return ret;
>> ++}
>> +diff --git a/support/nfs/Makefile.am b/support/nfs/Makefile.am
>> +index 2e1577cc..f6921265 100644
>> +--- a/support/nfs/Makefile.am
>> ++++ b/support/nfs/Makefile.am
>> +@@ -7,7 +7,7 @@ libnfs_la_SOURCES =3D exports.c rmtab.c xio.c rpcmisc.c=
 rpcdispatch.c \
>> + 		   xcommon.c wildmat.c mydaemon.c \
>> + 		   rpc_socket.c getport.c \
>> + 		   svc_socket.c cacheio.c closeall.c nfs_mntent.c \
>> +-		   svc_create.c atomicio.c strlcat.c strlcpy.c
>> ++		   svc_create.c atomicio.c strlcat.c strlcpy.c ucred.c
>> + libnfs_la_LIBADD =3D libnfsconf.la
>> + libnfs_la_CPPFLAGS =3D $(AM_CPPFLAGS) $(CPPFLAGS) -I$(top_srcdir)/supp=
ort/reexport
>> +=20
>> +diff --git a/support/nfs/ucred.c b/support/nfs/ucred.c
>> +new file mode 100644
>> +index 00000000..6ea8efdf
>> +--- /dev/null
>> ++++ b/support/nfs/ucred.c
>> +@@ -0,0 +1,147 @@
>> ++#ifdef HAVE_CONFIG_H
>> ++#include <config.h>
>> ++#endif
>> ++
>> ++#include <errno.h>
>> ++#include <stdlib.h>
>> ++#include <unistd.h>
>> ++#include <rpc/rpc.h>
>> ++
>> ++#include "exportfs.h"
>> ++#include "nfs_ucred.h"
>> ++
>> ++#ifdef HAVE_TIRPC_GSS_GETCRED
>> ++#include <rpc/rpcsec_gss.h>
>> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
>> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
>> ++#include <rpc/auth_des.h>
>> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
>> ++
>> ++static int nfs_ucred_copy_cred(struct nfs_ucred *cred, uid_t uid, gid_=
t gid,
>> ++			       const gid_t *groups, int ngroups)
>> ++{
>> ++	if (ngroups > 0) {
>> ++		size_t sz =3D ngroups * sizeof(groups[0]);
>> ++		cred->groups =3D malloc(sz);
>> ++		if (cred->groups =3D=3D NULL)
>> ++			return ENOMEM;
>> ++		cred->ngroups =3D ngroups;
>> ++		memcpy(cred->groups, groups, sz);
>> ++	} else
>> ++		nfs_ucred_init_groups(cred, NULL, 0);
>> ++	cred->uid =3D uid;
>> ++	cred->gid =3D gid;
>> ++	return 0;
>> ++}
>> ++
>> ++static int nfs_ucred_init_cred_squashed(struct nfs_ucred *cred,
>> ++					const struct exportent *ep)
>> ++{
>> ++	cred->uid =3D ep->e_anonuid;
>> ++	cred->gid =3D ep->e_anongid;
>> ++	nfs_ucred_init_groups(cred, NULL, 0);
>> ++	return 0;
>> ++}
>> ++
>> ++static int nfs_ucred_init_cred(struct nfs_ucred *cred, uid_t uid, gid_=
t gid,
>> ++			       const gid_t *groups, int ngroups,
>> ++			       const struct exportent *ep)
>> ++{
>> ++	if (ep->e_flags & NFSEXP_ALLSQUASH) {
>> ++		nfs_ucred_init_cred_squashed(cred, ep);
>> ++	} else if (ep->e_flags & NFSEXP_ROOTSQUASH && uid =3D=3D 0) {
>> ++		nfs_ucred_init_cred_squashed(cred, ep);
>> ++		if (gid !=3D 0)
>> ++			cred->gid =3D gid;
>> ++	} else {
>> ++		int ret =3D nfs_ucred_copy_cred(cred, uid, gid, groups, ngroups);
>> ++		if (ret !=3D 0)
>> ++			return ret;
>> ++		nfs_ucred_squash_groups(cred, ep);
>> ++	}
>> ++	return 0;
>> ++}
>> ++
>> ++static int nfs_ucred_init_null(struct nfs_ucred *cred,
>> ++			       const struct exportent *ep)
>> ++{
>> ++	return nfs_ucred_init_cred_squashed(cred, ep);
>> ++}
>> ++
>> ++static int nfs_ucred_init_unix(struct nfs_ucred *cred, struct svc_req =
*rqst,
>> ++			       const struct exportent *ep)
>> ++{
>> ++	struct authunix_parms *aup;
>> ++
>> ++	aup =3D (struct authunix_parms *)rqst->rq_clntcred;
>> ++	return nfs_ucred_init_cred(cred, aup->aup_uid, aup->aup_gid,
>> ++				   aup->aup_gids, aup->aup_len, ep);
>> ++}
>> ++
>> ++#ifdef HAVE_TIRPC_GSS_GETCRED
>> ++static int nfs_ucred_init_gss(struct nfs_ucred *cred, struct svc_req *=
rqst,
>> ++			      const struct exportent *ep)
>> ++{
>> ++	rpc_gss_ucred_t *gss_ucred =3D NULL;
>> ++
>> ++	if (!rpc_gss_getcred(rqst, NULL, &gss_ucred, NULL) || gss_ucred =3D=
=3D NULL)
>> ++		return EINVAL;
>> ++	return nfs_ucred_init_cred(cred, gss_ucred->uid, gss_ucred->gid,
>> ++				   gss_ucred->gidlist, gss_ucred->gidlen, ep);
>> ++}
>> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
>> ++
>> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
>> ++int authdes_getucred(struct authdes_cred *adc, uid_t *uid, gid_t *gid,
>> ++		     int *grouplen, gid_t *groups);
>> ++
>> ++static int nfs_ucred_init_des(struct nfs_ucred *cred, struct svc_req *=
rqst,
>> ++			      const struct exportent *ep)
>> ++{
>> ++	struct authdes_cred *des_cred;
>> ++	uid_t uid;
>> ++	gid_t gid;
>> ++	int grouplen;
>> ++	gid_t groups[NGROUPS];
>> ++
>> ++	des_cred =3D (struct authdes_cred *)rqst->rq_clntcred;
>> ++	if (!authdes_getucred(des_cred, &uid, &gid, &grouplen, &groups[0]))
>> ++		return EINVAL;
>> ++	return nfs_ucred_init_cred(cred, uid, gid, groups, grouplen, ep);
>> ++}
>> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
>> ++
>> ++int nfs_ucred_get(struct nfs_ucred **credp, struct svc_req *rqst,
>> ++		  const struct exportent *ep)
>> ++{
>> ++	struct nfs_ucred *cred =3D malloc(sizeof(*cred));
>> ++	int ret;
>> ++
>> ++	*credp =3D NULL;
>> ++	if (cred =3D=3D NULL)
>> ++		return ENOMEM;
>> ++	switch (rqst->rq_cred.oa_flavor) {
>> ++	case AUTH_UNIX:
>> ++		ret =3D nfs_ucred_init_unix(cred, rqst, ep);
>> ++		break;
>> ++#ifdef HAVE_TIRPC_GSS_GETCRED
>> ++	case RPCSEC_GSS:
>> ++		ret =3D nfs_ucred_init_gss(cred, rqst, ep);
>> ++		break;
>> ++#endif /* HAVE_TIRPC_GSS_GETCRED */
>> ++#ifdef HAVE_TIRPC_AUTHDES_GETUCRED
>> ++	case AUTH_DES:
>> ++		ret =3D nfs_ucred_init_des(cred, rqst, ep);
>> ++		break;
>> ++#endif /* HAVE_TIRPC_AUTHDES_GETUCRED */
>> ++	default:
>> ++		ret =3D nfs_ucred_init_null(cred, ep);
>> ++		break;
>> ++	}
>> ++	if (ret =3D=3D 0) {
>> ++		*credp =3D cred;
>> ++		return 0;
>> ++	}
>> ++	free(cred);
>> ++	return ret;
>> ++}
>> +--=20
>> +2.44.4
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-1280=
1.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patc=
h
>> new file mode 100644
>> index 0000000000..9f01604af0
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
>> @@ -0,0 +1,254 @@
>> +From a94b2b6002f31acc5a66893b7c6d368c6b7b8806 Mon Sep 17 00:00:00 2001
>> +From: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Date: Thu, 5 Mar 2026 10:41:02 -0500
>> +Subject: [PATCH] Fix access checks when mounting subdirectories in NFSv=
3
>> +
>> +If a NFSv3 client asks to mount a subdirectory of one of the exported
>> +directories, then apply the RPC credential together with any root
>> +or all squash rules that would apply to the client in question.
>> +
>> +CVE: CVE-2025-12801
>> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/nfs-ut=
ils.git;a=3Dcommit;h=3Df36bd900a899088ca1925de079bd58d6205a1f3c]
>> +
>> +Reviewed-by: Jeff Layton <jlayton@kernel.org>
>> +Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
>> +Signed-off-by: Scott Mayhew <smayhew@redhat.com>
>> +Signed-off-by: Steve Dickson <steved@redhat.com>
>> +(cherry picked from commit f36bd900a899088ca1925de079bd58d6205a1f3c)
>> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> +---
>> + nfs.conf                    |  1 +
>> + support/include/nfsd_path.h |  9 ++++++++-
>> + support/misc/nfsd_path.c    | 32 ++++++++++++++++++++++++++++++--
>> + utils/mountd/mountd.c       | 28 ++++++++++++++++++++++++++--
>> + utils/mountd/mountd.man     | 26 ++++++++++++++++++++++++++
>> + 5 files changed, 91 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/nfs.conf b/nfs.conf
>> +index 323f072b..e08cd9a9 100644
>> +--- a/nfs.conf
>> ++++ b/nfs.conf
>> +@@ -45,6 +45,7 @@
>> + # ttl=3D1800
>> + [mountd]
>> + # debug=3D"all|auth|call|general|parse"
>> ++# apply-root-cred=3Dn
>> + # manage-gids=3Dn
>> + # descriptors=3D0
>> + # port=3D0
>> +diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
>> +index 3e5a2f5d..06c0f2f4 100644
>> +--- a/support/include/nfsd_path.h
>> ++++ b/support/include/nfsd_path.h
>> +@@ -9,6 +9,7 @@
>> + struct file_handle;
>> + struct statfs;
>> + struct nfsd_task_t;
>> ++struct nfs_ucred;
>> +=20
>> + void 		nfsd_path_init(void);
>> +=20
>> +@@ -18,7 +19,8 @@ char *		nfsd_path_prepend_dir(const char *dir, const =
char *pathname);
>> +=20
>> + int 		nfsd_path_stat(const char *pathname, struct stat *statbuf);
>> + int 		nfsd_path_lstat(const char *pathname, struct stat *statbuf);
>> +-int		nfsd_openat(int dirfd, const char *path, int flags);
>> ++int		nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd,
>> ++				 const char *path, int flags);
>> +=20
>> + int		nfsd_path_statfs(const char *pathname,
>> + 				   struct statfs *statbuf);
>> +@@ -31,4 +33,9 @@ ssize_t		nfsd_path_write(int fd, void* buf, size_t le=
n);
>> + int		nfsd_name_to_handle_at(int fd, const char *path,
>> + 				       struct file_handle *fh,
>> + 				       int *mount_id, int flags);
>> ++
>> ++static inline int nfsd_openat(int dirfd, const char *path, int flags)
>> ++{
>> ++	return nfsd_cred_openat(NULL, dirfd, path, flags);
>> ++}
>> + #endif
>> +diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
>> +index dfe88e4f..6466666d 100644
>> +--- a/support/misc/nfsd_path.c
>> ++++ b/support/misc/nfsd_path.c
>> +@@ -17,6 +17,7 @@
>> + #include "xstat.h"
>> + #include "nfslib.h"
>> + #include "nfsd_path.h"
>> ++#include "nfs_ucred.h"
>> + #include "workqueue.h"
>> +=20
>> + static struct xthread_workqueue *nfsd_wq =3D NULL;
>> +@@ -204,6 +205,7 @@ nfsd_realpath(const char *path, char *resolved_buf)
>> + }
>> +=20
>> + struct nfsd_openat_t {
>> ++	const struct nfs_ucred *cred;
>> + 	const char *path;
>> + 	int dirfd;
>> + 	int flags;
>> +@@ -220,15 +222,41 @@ static void nfsd_openatfunc(void *data)
>> + 		d->res_error =3D errno;
>> + }
>> +=20
>> +-int nfsd_openat(int dirfd, const char *path, int flags)
>> ++static void nfsd_cred_openatfunc(void *data)
>> ++{
>> ++	struct nfsd_openat_t *d =3D data;
>> ++	struct nfs_ucred *saved =3D NULL;
>> ++	int ret;
>> ++
>> ++	ret =3D nfs_ucred_swap_effective(d->cred, &saved);
>> ++	if (ret !=3D 0) {
>> ++		d->res_fd =3D -1;
>> ++		d->res_error =3D ret;
>> ++		return;
>> ++	}
>> ++
>> ++	nfsd_openatfunc(data);
>> ++
>> ++	if (saved !=3D NULL) {
>> ++		nfs_ucred_swap_effective(saved, NULL);
>> ++		nfs_ucred_free(saved);
>> ++	}
>> ++}
>> ++
>> ++int nfsd_cred_openat(const struct nfs_ucred *cred, int dirfd, const ch=
ar *path,
>> ++		     int flags)
>> + {
>> + 	struct nfsd_openat_t open_buf =3D {
>> ++		.cred =3D cred,
>> + 		.path =3D path,
>> + 		.dirfd =3D dirfd,
>> + 		.flags =3D flags,
>> + 	};
>> +=20
>> +-	nfsd_run_task(nfsd_openatfunc, &open_buf);
>> ++	if (cred)
>> ++		nfsd_run_task(nfsd_cred_openatfunc, &open_buf);
>> ++	else
>> ++		nfsd_run_task(nfsd_openatfunc, &open_buf);
>> + 	if (open_buf.res_fd =3D=3D -1)
>> + 		errno =3D open_buf.res_error;
>> + 	return open_buf.res_fd;
>> +diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
>> +index f43ebef5..6e6777cd 100644
>> +--- a/utils/mountd/mountd.c
>> ++++ b/utils/mountd/mountd.c
>> +@@ -31,6 +31,7 @@
>> + #include "nfsd_path.h"
>> + #include "nfslib.h"
>> + #include "export.h"
>> ++#include "nfs_ucred.h"
>> +=20
>> + extern void my_svc_run(void);
>> +=20
>> +@@ -40,6 +41,7 @@ static struct nfs_fh_len *get_rootfh(struct svc_req *=
, dirpath *, nfs_export **,
>> +=20
>> + int reverse_resolve =3D 0;
>> + int manage_gids;
>> ++int apply_root_cred;
>> + int use_ipaddr =3D -1;
>> +=20
>> + /* PRC: a high-availability callout program can be specified with -H
>> +@@ -74,9 +76,10 @@ static struct option longopts[] =3D
>> + 	{ "log-auth", 0, 0, 'l'},
>> + 	{ "cache-use-ipaddr", 0, 0, 'i'},
>> + 	{ "ttl", 1, 0, 'T'},
>> ++	{ "apply-root-cred", 0, 0, 'c' },
>> + 	{ NULL, 0, 0, 0 }
>> + };
>> +-static char shortopts[] =3D "o:nFd:p:P:hH:N:V:vurs:t:gliT:";
>> ++static char shortopts[] =3D "o:nFd:p:P:hH:N:V:vurs:t:gliT:c";
>> +=20
>> + #define NFSVERSBIT(vers)	(0x1 << (vers - 1))
>> + #define NFSVERSBIT_ALL		(NFSVERSBIT(2) | NFSVERSBIT(3) | NFSVERSBIT(4)=
)
>> +@@ -453,11 +456,27 @@ get_rootfh(struct svc_req *rqstp, dirpath *path, =
nfs_export **expret,
>> + 	while (*subpath =3D=3D '/')
>> + 		subpath++;
>> + 	if (*subpath !=3D '\0') {
>> ++		struct nfs_ucred *cred =3D NULL;
>> + 		int fd;
>> +=20
>> ++		/* Load the user cred */
>> ++		if (!apply_root_cred) {
>> ++			nfs_ucred_get(&cred, rqstp, &exp->m_export);
>> ++			if (cred =3D=3D NULL) {
>> ++				xlog(L_WARNING, "can't retrieve credential");
>> ++				*error =3D MNT3ERR_ACCES;
>> ++				close(dirfd);
>> ++				return NULL;
>> ++			}
>> ++			if (manage_gids)
>> ++				nfs_ucred_reload_groups(cred, &exp->m_export);
>> ++		}
>> ++
>> + 		/* Just perform a lookup of the path */
>> +-		fd =3D nfsd_openat(dirfd, subpath, O_PATH);
>> ++		fd =3D nfsd_cred_openat(cred, dirfd, subpath, O_PATH);
>> + 		close(dirfd);
>> ++		if (cred)
>> ++			nfs_ucred_free(cred);
>> + 		if (fd =3D=3D -1) {
>> + 			xlog(L_WARNING, "can't open exported dir %s: %s", p,
>> + 			     strerror(errno));
>> +@@ -681,6 +700,8 @@ read_mountd_conf(char **argv)
>> + 	ttl =3D conf_get_num("mountd", "ttl", default_ttl);
>> + 	if (ttl > 0)
>> + 		default_ttl =3D ttl;
>> ++	apply_root_cred =3D conf_get_bool("mountd", "apply-root-cred",
>> ++					apply_root_cred);
>> + }
>> +=20
>> + int
>> +@@ -794,6 +815,9 @@ main(int argc, char **argv)
>> + 			}
>> + 			default_ttl =3D ttl;
>> + 			break;
>> ++		case 'c':
>> ++			apply_root_cred =3D 1;
>> ++			break;
>> + 		case 0:
>> + 			break;
>> + 		case '?':
>> +diff --git a/utils/mountd/mountd.man b/utils/mountd/mountd.man
>> +index a206a3e2..f4f1fc23 100644
>> +--- a/utils/mountd/mountd.man
>> ++++ b/utils/mountd/mountd.man
>> +@@ -242,6 +242,32 @@ can support both NFS version 2 and the newer versi=
on 3.
>> + Print the version of
>> + .B rpc.mountd
>> + and exit.
>> ++.TP
>> ++.B \-c " or " \-\-apply-root-cred
>> ++When mountd is asked to allow a NFSv3 mount to a subdirectory of the
>> ++exported directory, then it will check if the user asking to mount has
>> ++lookup rights to the directories below that exported directory. When
>> ++performing the check, mountd will apply any root squash or all squash
>> ++rules that were specified for that client.
>> ++
>> ++Performing lookup checks as the user requires that the mountd daemon
>> ++be run as root or that it be given CAP_SETUID and CAP_SETGID privilege=
s
>> ++so that it can change its own effective user and effective group setti=
ngs.
>> ++When troubleshooting, please also note that LSM frameworks such as SEL=
inux
>> ++can sometimes prevent the daemon from changing the effective user/grou=
ps
>> ++despite the capability settings.
>> ++
>> ++In earlier versions of mountd, the same checks were performed using th=
e
>> ++mountd daemon's root privileges, meaning that it could authorise acces=
s
>> ++to directories that are not normally accessible to the user requesting
>> ++to mount them. This option enables that legacy behaviour.
>> ++
>> ++.BR Note:
>> ++If there is a need to provide access to specific subdirectories that
>> ++are not normally accessible to a client, it is always possible to add
>> ++export entries that explicitly grant such access. That ability does
>> ++not depend on this option being enabled.
>> ++
>> + .TP
>> + .B \-g " or " \-\-manage-gids
>> + Accept requests from the kernel to map user id numbers into  lists of
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/me=
ta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
>> index 2f2644f9a8..91c74fe5ef 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
>> @@ -33,6 +33,12 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-util=
s/${PV}/nfs-utils-${PV}.tar.x
>>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patc=
h \
>>             file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch=
 \
>>             file://0001-reexport.h-Include-unistd.h-to-compile-with-musl=
.patch \
>> +           file://CVE-2025-12801-dependent_p1.patch \
>> +           file://CVE-2025-12801-dependent_p2.patch \
>> +           file://CVE-2025-12801-dependent_p3.patch \
>> +           file://CVE-2025-12801-dependent_p4.patch \
>> +           file://CVE-2025-12801.patch \
>> +           file://CVE-2025-12801-build-fix.patch \
>>             "
>>  SRC_URI[sha256sum] =3D "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd973=
4744201e9b0a1119d"
>> =20


--=20
Yoann Congal
Smile ECS


