Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id BAA9471C84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:25:13 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w20so159613141qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 05:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/KAGBhjbQI1n2YDZzHwtaSvn1sLf1XSfwYpJP7w+yAY=;
	b=skxPqFEpG3G6FzB/FwAt/Vvi2nlywwQ1CQs3LuKBZ0rlw897rMzEyDP9rCCaWaCyEi
	Tp6+QGazNhhnGiqwh6hhGHi0nHYXXA8YzblcRWXcn/iSIVNpK/4KerTlFwUiD/YYaSLl
	5YT1x0r7kmxUMovL1OKZ9pimdvnT/jkWQ9o4L4iD0zTbiHPJU52kT3I19eQVvDSjSqEN
	wfH5C1NVT5zsKgNvxOc5Bi/Rph//QL5lkxKLNyo+f8YehSZ0wHWBO2zaljya/bdnCll7
	BmKFr4OWQFy51LveBqMmiqHKkecu1hKCbroi9/A7gdUDPY+l0QpSXPnyDkSNbIJ9Pafp
	lnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/KAGBhjbQI1n2YDZzHwtaSvn1sLf1XSfwYpJP7w+yAY=;
	b=Ol8zNPsFXNnQal7CSRbNqfq6j+xzGwp0LPGrlCYqUAbK3qQS/1qQ77RgsTJs2IxFMq
	GcIZBx6TkToDRC//a5UHVznQr7+6ee7GTP7wRJLbwjLwzuD8hCtIWfVaXqJWbXXpLOJe
	YfGwWr3PBsxkJO7TNmWvHPkTZnuqvoYRdxuoLZk2gwkQe6th3EnHGiUDJ1T2byL77yZg
	3pwSk9aRreijszselLa9wlzU8I75MeVtGqVXXWxpfyk9uGCnIiasSIXcfNRb7V71jqDi
	w7/sysJYYofQ8cAakyBepAI5sr3SwOyMlREAyfu4r6Lki+RWWjE7wjTz2Crow/GFqDKZ
	w/Rg==
X-Gm-Message-State: AMke39nit9bekbIR9te25RSNy7kGkrJ4XhFcLIemHZVtN7hUgXKw4Y/t06hxzEL9V05jhgGWk+ODv1LN9zHSl34h
X-Received: by 10.200.53.247 with SMTP id l52mr19637587qtb.144.1486560313073; 
	Wed, 08 Feb 2017 05:25:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 05:24:52 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73204C8DBA@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1485139244-61226-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73204C8DBA@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 13:24:52 +0000
Message-ID: <CAJTo0LY=AOhJggQqjnhgGTj5+7uEP_jbw3VdRnYV4gzOvD4K5Q@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: 1.24.1 -> 1.26.2
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
X-List-Received-Date: Wed, 08 Feb 2017 13:25:14 -0000
Content-Type: multipart/alternative; boundary=001a1142ba2065f7f8054804cb4e

--001a1142ba2065f7f8054804cb4e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This doesn't apply to current master so can you please rebase.  Also when
git gets confused by character encodings don't press 'y' because it isn't
asking you to confirm the encoding, but to pick one.

(I've done this so many times, but it leads to patches that git won't apply=
)

Ross

On 8 February 2017 at 08:26, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> ping
>
>
> -----Original Message-----
> From: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6
> Sent: Monday, January 23, 2017 10:41 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>
> Subject: [OE-core] [PATCH] busybox: 1.24.1 -> 1.26.2
>
> 1) Upgrade busybox from 1.24.1 to 1.26.2
> 2) Delete 12 patches below, since they are integrated upstream.
>     busybox/0001-flock-update-the-behaviour-of-c-parameter-to-
> match-u.patch
>     busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
>     busybox/0001-sed-fix-sed-n-flushes-pattern-space-
> terminates-early.patch
>     busybox/CVE-2016-2147.patch
>     busybox/CVE-2016-2147_2.patch
>     busybox/CVE-2016-2148.patch
>     busybox/busybox-1.24.1-truncate-open-mode.patch
>     busybox/busybox-1.24.1-unzip-regression.patch
>     busybox/busybox-1.24.1-unzip.patch
>     busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
>     busybox/commit-applet_tables-fix-commit-0dddbc1.patch
>     busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
> 3) Modify 3 patches below to make it compatible with new version
>     busybox/busybox-cross-menuconfig.patch
>     busybox/busybox-udhcpc-no_deconfig.patch
>     busybox/makefile-fix-backport.patch
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...e-the-behaviour-of-c-parameter-to-match-u.patch |  73 -----------
>  ...biproute-handle-table-ids-larger-than-255.patch | 134
> -------------------
>  ...-n-flushes-pattern-space-terminates-early.patch |  72 -----------
>  .../busybox/busybox/CVE-2016-2147.patch            |  57 --------
>  .../busybox/busybox/CVE-2016-2147_2.patch          |  32 -----
>  .../busybox/busybox/CVE-2016-2148.patch            |  74 -----------
>  .../busybox-1.24.1-truncate-open-mode.patch        |  81 ------------
>  .../busybox/busybox-1.24.1-unzip-regression.patch  | 143
> ---------------------
>  .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118
> -----------------
>  .../busybox/busybox/busybox-cross-menuconfig.patch |  70 +++++-----
>  .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --------
>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  70 +++++-----
>  .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---------
>  ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 -------------
>  .../busybox/busybox/makefile-fix-backport.patch    |  30 ++---
>  .../{busybox_1.24.1.bb =3D> busybox_1.26.2.bb}       |  16 +--
>  16 files changed, 88 insertions(+), 1086 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/
> busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-
> handle-table-ids-larger-than-255.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-
> flushes-pattern-space-terminates-early.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
>  delete mode 100644 meta/recipes-core/busybox/
> busybox/CVE-2016-2147_2.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-
> truncate-open-mode.patch
>  delete mode 100644 meta/recipes-core/busybox/
> busybox/busybox-1.24.1-unzip-regression.patch
>  delete mode 100644 meta/recipes-core/busybox/
> busybox/busybox-1.24.1-unzip.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race=
-
> fix-commit-d8e61bb.patch
>  delete mode 100644 meta/recipes-core/busybox/
> busybox/commit-applet_tables-fix-commit-0dddbc1.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_
> mips64_n64_big_endian_musl_systems.patch
>  rename meta/recipes-core/busybox/{busybox_1.24.1.bb =3D> busybox_1.26.2.=
bb}
> (66%)
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-
> behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/
> busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
> deleted file mode 100644
> index 8bcbd73..0000000
> --- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-
> behaviour-of-c-parameter-to-match-u.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Wed, 20 Apr 2016 18:24:45 +0300
> -Subject: [PATCH] flock: update the behaviour of -c parameter to match
> upstream
> -
> -In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
> -
> -function                                             old     new   delta
> -flock_main                                           286     377     +91
> -.rodata                                           155849  155890     +41
> -
> -Upstream-Status: Submitted
> -[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
> -
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ----
> - util-linux/flock.c | 20 ++++++++++++++------
> - 1 file changed, 14 insertions(+), 6 deletions(-)
> -
> -diff --git a/util-linux/flock.c b/util-linux/flock.c
> -index 05a747f..c85a25d 100644
> ---- a/util-linux/flock.c
> -+++ b/util-linux/flock.c
> -@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv)
> MAIN_EXTERNALLY_VISIBLE;
> - int flock_main(int argc UNUSED_PARAM, char **argv)
> - {
> -       int mode, opt, fd;
> -+    char *cmd_args[4];
> -       enum {
> -               OPT_s =3D (1 << 0),
> -               OPT_x =3D (1 << 1),
> -@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> -       /* If it is "flock FILE -c PROG", then -c isn't caught by getopt3=
2:
> -        * we use "+" in order to support "flock -opt FILE PROG
> -with-opts",
> -        * we need to remove -c by hand.
> --       * TODO: in upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'=
"
> -        */
> -       if (argv[0]
> -        && argv[0][0] =3D=3D '-'
> -@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> -           || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") =3D=
=3D 0)
> -           )
> -       ) {
> --              argv++;
> -+        if (argc !=3D optind + 3)
> -+            bb_error_msg_and_die("-c requires exactly one command
> argument");
> -+        else
> -+            argv++;
> -       }
> -
> -       if (OPT_s =3D=3D LOCK_SH && OPT_x =3D=3D LOCK_EX && OPT_n =3D=3D =
LOCK_NB &&
> OPT_u =3D=3D LOCK_UN) {
> -@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> -                       return EXIT_FAILURE;
> -               bb_perror_nomsg_and_die();
> -       }
> --
> --      if (argv[0])
> --              return spawn_and_wait(argv);
> --
> -+    if (argv[0]) {
> -+        cmd_args[0] =3D getenv("SHELL");
> -+        if (!cmd_args[0])
> -+            cmd_args[0] =3D (char*)DEFAULT_SHELL;
> -+        cmd_args[1] =3D (char*)"-c";
> -+        cmd_args[2] =3D argv[0];
> -+        cmd_args[3] =3D NULL;
> -+        return spawn_and_wait(cmd_args);
> -+    }
> -       return EXIT_SUCCESS;
> - }
> ---
> -2.4.0
> -
> diff --git a/meta/recipes-core/busybox/busybox/0001-libiproute-
> handle-table-ids-larger-than-255.patch b/meta/recipes-core/busybox/
> busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
> deleted file mode 100644
> index aac5b40..0000000
> --- a/meta/recipes-core/busybox/busybox/0001-libiproute-
> handle-table-ids-larger-than-255.patch
> +++ /dev/null
> @@ -1,134 +0,0 @@
> -From b5a9234272e6084557224c73ab7737ed47f09848 Mon Sep 17 00:00:00 2001
> -From: Lukasz Nowak <lnowak@tycoint.com>
> -Date: Wed, 23 Nov 2016 12:48:21 +0000
> -Subject: [PATCH v2] libiproute: handle table ids larger than 255
> -
> -Linux kernel, starting from 2.6.19 allows ip table ids to have 32-bit
> values.
> -In order to preserve compatibility, the old 8-bit field: rtm_table is
> still
> -in use when table id is lower than 256.
> -
> -Add support for the 32-bit table id (RTA_TABLE attribute) in:
> -- ip route print
> -- ip route modify
> -- ip rule print
> -- ip rule modify
> -
> -Add printing of table ids to ip route.
> -
> -Changes are compatible with the mainline iproute2 utilities.
> -
> -These changes are required for compatibility with ConnMan, which by
> default
> -uses table ids greater than 255.
> -
> -Upstream-Status: Submitted [http://lists.busybox.net/
> pipermail/busybox/2016-December/084989.html]
> -
> -Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
> ----
> - networking/libiproute/iproute.c | 24 ++++++++++++++++++++----
> - networking/libiproute/iprule.c  | 11 +++++++++--
> - 2 files changed, 29 insertions(+), 6 deletions(-)
> -
> -diff --git a/networking/libiproute/iproute.c b/networking/libiproute/
> iproute.c
> -index 6ecd5f7..d5af498 100644
> ---- a/networking/libiproute/iproute.c
> -+++ b/networking/libiproute/iproute.c
> -@@ -87,6 +87,7 @@ static int FAST_FUNC print_route(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -       inet_prefix dst;
> -       inet_prefix src;
> -       int host_len =3D -1;
> -+      uint32_t tid;
> -
> -       if (n->nlmsg_type !=3D RTM_NEWROUTE && n->nlmsg_type !=3D
> RTM_DELROUTE) {
> -               fprintf(stderr, "Not a route: %08x %08x %08x\n",
> -@@ -99,6 +100,14 @@ static int FAST_FUNC print_route(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -       if (len < 0)
> -               bb_error_msg_and_die("wrong nlmsg len %d", len);
> -
> -+      memset(tb, 0, sizeof(tb));
> -+      parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
> -+
> -+      if (tb[RTA_TABLE])
> -+              tid =3D *(uint32_t *)RTA_DATA(tb[RTA_TABLE]);
> -+      else
> -+              tid =3D r->rtm_table;
> -+
> -       if (r->rtm_family =3D=3D AF_INET6)
> -               host_len =3D 128;
> -       else if (r->rtm_family =3D=3D AF_INET)
> -@@ -128,7 +137,7 @@ static int FAST_FUNC print_route(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -                       }
> -               }
> -       } else {
> --              if (G_filter.tb > 0 && G_filter.tb !=3D r->rtm_table) {
> -+              if (G_filter.tb > 0 && G_filter.tb !=3D tid) {
> -                       return 0;
> -               }
> -       }
> -@@ -157,10 +166,8 @@ static int FAST_FUNC print_route(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -               return 0;
> -       }
> -
> --      memset(tb, 0, sizeof(tb));
> -       memset(&src, 0, sizeof(src));
> -       memset(&dst, 0, sizeof(dst));
> --      parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);
> -
> -       if (tb[RTA_SRC]) {
> -               src.bitlen =3D r->rtm_src_len;
> -@@ -283,6 +290,10 @@ static int FAST_FUNC print_route(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -       if (tb[RTA_OIF]) {
> -               printf("dev %s ", ll_index_to_name(*(int*)RTA_
> DATA(tb[RTA_OIF])));
> -       }
> -+#if ENABLE_FEATURE_IP_RULE
> -+      if (tid && tid !=3D RT_TABLE_MAIN && !G_filter.tb)
> -+              printf("table %s ", rtnl_rttable_n2a(tid));
> -+#endif
> -
> -       /* Todo: parse & show "proto kernel", "scope link" here */
> -
> -@@ -434,7 +445,12 @@ IF_FEATURE_IP_RULE(ARG_table,)
> -                       NEXT_ARG();
> -                       if (rtnl_rttable_a2n(&tid, *argv))
> -                               invarg(*argv, "table");
> --                      req.r.rtm_table =3D tid;
> -+                      if (tid < 256)
> -+                              req.r.rtm_table =3D tid;
> -+                      else {
> -+                              req.r.rtm_table =3D RT_TABLE_UNSPEC;
> -+                              addattr32(&req.n, sizeof(req), RTA_TABLE,
> tid);
> -+                      }
> - #endif
> -               } else if (arg =3D=3D ARG_dev || arg =3D=3D ARG_oif) {
> -                       NEXT_ARG();
> -diff --git a/networking/libiproute/iprule.c b/networking/libiproute/
> iprule.c
> -index 774a3e2..3fac7c5 100644
> ---- a/networking/libiproute/iprule.c
> -+++ b/networking/libiproute/iprule.c
> -@@ -119,7 +119,9 @@ static int FAST_FUNC print_rule(const struct
> sockaddr_nl *who UNUSED_PARAM,
> -               printf("iif %s ", (char*)RTA_DATA(tb[RTA_IIF]));
> -       }
> -
> --      if (r->rtm_table)
> -+      if (tb[RTA_TABLE])
> -+              printf("lookup %s ", rtnl_rttable_n2a(*(uint32_t*)
> RTA_DATA(tb[RTA_TABLE])));
> -+      else if (r->rtm_table)
> -               printf("lookup %s ", rtnl_rttable_n2a(r->rtm_table));
> -
> -       if (tb[RTA_FLOW]) {
> -@@ -259,7 +261,12 @@ static int iprule_modify(int cmd, char **argv)
> -                       NEXT_ARG();
> -                       if (rtnl_rttable_a2n(&tid, *argv))
> -                               invarg(*argv, "table ID");
> --                      req.r.rtm_table =3D tid;
> -+                      if (tid < 256)
> -+                              req.r.rtm_table =3D tid;
> -+                      else {
> -+                              req.r.rtm_table =3D RT_TABLE_UNSPEC;
> -+                              addattr32(&req.n, sizeof(req), RTA_TABLE,
> tid);
> -+                      }
> -                       table_ok =3D 1;
> -               } else if (key =3D=3D ARG_dev ||
> -                          key =3D=3D ARG_iif
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-
> flushes-pattern-space-terminates-early.patch b/meta/recipes-core/busybox/
> busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
> deleted file mode 100644
> index 4f53984..0000000
> --- a/meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-
> flushes-pattern-space-terminates-early.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From 903542f7331c58007a3ef938d41e1c55fc329648 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Wed, 31 Aug 2016 23:40:43 -0400
> -Subject: [PATCH] sed: fix "sed n (flushes pattern space, terminates
> early)"
> - testcase failure
> -
> -This patch fix "sed n (flushes pattern space, terminates early)"
> -testcase failure. We can see it at:
> -
> -       https://git.busybox.net/busybox/commit/?id=3D
> 76d72376e0244a5cafd4880cdc623e37d86a75e4
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - editors/sed.c       | 19 ++++++++++---------
> - testsuite/sed.tests |  6 +-----
> - 2 files changed, 11 insertions(+), 14 deletions(-)
> -
> -diff --git a/editors/sed.c b/editors/sed.c
> -index 7bbf820..259c39c 100644
> ---- a/editors/sed.c
> -+++ b/editors/sed.c
> -@@ -1274,16 +1274,17 @@ static void process_files(void)
> -               case 'n':
> -                       if (!G.be_quiet)
> -                               sed_puts(pattern_space, last_gets_char);
> --                      if (next_line) {
> --                              free(pattern_space);
> --                              pattern_space =3D next_line;
> --                              last_gets_char =3D next_gets_char;
> --                              next_line =3D get_next_line(&next_gets_ch=
ar,
> &last_puts_char, last_gets_char);
> --                              substituted =3D 0;
> --                              linenum++;
> --                              break;
> -+                      if (next_line =3D=3D NULL) {
> -+                              /* If no next line, jump to end of script
> and exit. */
> -+                              goto discard_line;
> -                       }
> --                      /* fall through */
> -+                      free(pattern_space);
> -+                      pattern_space =3D next_line;
> -+                      last_gets_char =3D next_gets_char;
> -+                      next_line =3D get_next_line(&next_gets_char,
> &last_puts_char, last_gets_char);
> -+                      substituted =3D 0;
> -+                      linenum++;
> -+                      break;
> -
> -               /* Quit.  End of script, end of input. */
> -               case 'q':
> -diff --git a/testsuite/sed.tests b/testsuite/sed.tests
> -index 34479e5..96ff7a5 100755
> ---- a/testsuite/sed.tests
> -+++ b/testsuite/sed.tests
> -@@ -73,13 +73,9 @@ testing "sed t (test/branch clears test bit)" "sed -e
> 's/a/b/;:loop;t loop'" \
> - testing "sed T (!test/branch)" "sed -e 's/a/1/;T notone;p;: notone;p'" =
\
> -       "1\n1\n1\nb\nb\nc\nc\n" "" "a\nb\nc\n"
> -
> --test x"$SKIP_KNOWN_BUGS" =3D x"" && {
> --# Normal sed end-of-script doesn't print "c" because n flushed the
> pattern
> --# space.  If n hits EOF, pattern space is empty when script ends.
> --# Query: how does this interact with no newline at EOF?
> - testing "sed n (flushes pattern space, terminates early)" "sed -e 'n;p'=
"
> \
> -       "a\nb\nb\nc\n" "" "a\nb\nc\n"
> --}
> -+
> - # non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @
> script end
> - # GNU sed: N flushes pattern space, therefore c is printed too @ script
> end
> - testing "sed N (flushes pattern space (GNU behavior))" "sed -e 'N;p'" \
> ---
> -2.8.1
> -
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
> b/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
> deleted file mode 100644
> index 84cae6a..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From d474ffc68290e0a83651c4432eeabfa62cd51e87 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Thu, 10 Mar 2016 11:47:58 +0100
> -Subject: [PATCH] udhcp: fix a SEGV on malformed RFC1035-encoded domain
> name
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2147
> -
> -https://git.busybox.net/busybox/commit/?id=3Dd474ffc
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - networking/udhcp/domain_codec.c | 13 +++++++++----
> - 1 file changed, 9 insertions(+), 4 deletions(-)
> -
> -Index: busybox-1.23.2/networking/udhcp/domain_codec.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.23.2.orig/networking/udhcp/domain_codec.c
> -+++ busybox-1.23.2/networking/udhcp/domain_codec.c
> -@@ -63,11 +63,10 @@ char* FAST_FUNC dname_dec(const uint8_t
> -                               if (crtpos + *c + 1 > clen) /* label too
> long? abort */
> -                                       return NULL;
> -                               if (dst)
> --                                      memcpy(dst + len, c + 1, *c);
> -+                                      /* \3com ---> "com." */
> -+                                      ((char*)mempcpy(dst + len, c + 1,
> *c))[0] =3D '.';
> -                               len +=3D *c + 1;
> -                               crtpos +=3D *c + 1;
> --                              if (dst)
> --                                      dst[len - 1] =3D '.';
> -                       } else {
> -                               /* NUL: end of current domain name */
> -                               if (retpos =3D=3D 0) {
> -@@ -78,7 +77,10 @@ char* FAST_FUNC dname_dec(const uint8_t
> -                                       crtpos =3D retpos;
> -                                       retpos =3D depth =3D 0;
> -                               }
> --                              if (dst)
> -+                              if (dst && len !=3D 0)
> -+                                      /* \4host\3com\0\4host and we are
> at \0:
> -+                                       * \3com was converted to "com.",
> change dot to space.
> -+                                       */
> -                                       dst[len - 1] =3D ' ';
> -                       }
> -
> -@@ -228,6 +230,9 @@ int main(int argc, char **argv)
> -       int len;
> -       uint8_t *encoded;
> -
> -+        uint8_t str[6] =3D { 0x00, 0x00, 0x02, 0x65, 0x65, 0x00 };
> -+        printf("NUL:'%s'\n",   dname_dec(str, 6, ""));
> -+
> - #define DNAME_DEC(encoded,pre) dname_dec((uint8_t*)(encoded),
> sizeof(encoded), (pre))
> -       printf("'%s'\n",       DNAME_DEC("\4host\3com\0", "test1:"));
> -       printf("test2:'%s'\n", DNAME_DEC("\4host\3com\0\4host\3com\0",
> ""));
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
> b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
> deleted file mode 100644
> index 1473d46..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 1b7c17391de66502dd7a97c866e0a33681edbb1f Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Fri, 11 Mar 2016 00:26:58 +0100
> -Subject: [PATCH] udhcpc: fix a warning in debug code
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -Upsteam-Status: Backport
> -CVE: CVE-2016-2147 regression fix
> -
> -https://git.busybox.net/busybox/commit/?id=3D1b7c17
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - networking/udhcp/domain_codec.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/networking/udhcp/domain_codec.c b/networking/udhcp/domain_
> codec.c
> -index cee31f1..5a923cc 100644
> ---- a/networking/udhcp/domain_codec.c
> -+++ b/networking/udhcp/domain_codec.c
> -@@ -7,6 +7,7 @@
> -  * Licensed under GPLv2 or later, see file LICENSE in this source tree.
> -  */
> - #ifdef DNS_COMPR_TESTING
> -+# define _GNU_SOURCE
> - # define FAST_FUNC /* nothing */
> - # define xmalloc malloc
> - # include <stdlib.h>
> ---
> -2.3.5
> -
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
> b/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
> deleted file mode 100644
> index af04a7f..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 352f79acbd759c14399e39baef21fc4ffe180ac2 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Fri, 26 Feb 2016 15:54:56 +0100
> -Subject: [PATCH] udhcpc: fix OPTION_6RD parsing (could overflow its
> malloced
> - buffer)
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-2148
> -https://git.busybox.net/busybox/commit/?id=3D352f79
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - networking/udhcp/common.c | 15 +++++++++++++--
> - networking/udhcp/dhcpc.c  |  4 ++--
> - 2 files changed, 15 insertions(+), 4 deletions(-)
> -
> -Index: busybox-1.23.2/networking/udhcp/common.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.23.2.orig/networking/udhcp/common.c
> -+++ busybox-1.23.2/networking/udhcp/common.c
> -@@ -142,7 +142,7 @@ const char dhcp_option_strings[] ALIGN1
> -  * udhcp_str2optset: to determine how many bytes to allocate.
> -  * xmalloc_optname_optval: to estimate string length
> -  * from binary option length: (option[LEN] /
> dhcp_option_lengths[opt_type])
> -- * is the number of elements, multiply in by one element's string width
> -+ * is the number of elements, multiply it by one element's string width
> -  * (len_of_option_as_string[opt_type]) and you know how wide string you
> need.
> -  */
> - const uint8_t dhcp_option_lengths[] ALIGN1 =3D {
> -@@ -162,7 +162,18 @@ const uint8_t dhcp_option_lengths[] ALIG
> -       [OPTION_S32] =3D     4,
> -       /* Just like OPTION_STRING, we use minimum length here */
> -       [OPTION_STATIC_ROUTES] =3D 5,
> --      [OPTION_6RD] =3D    22,  /* ignored by udhcp_str2optset */
> -+      [OPTION_6RD] =3D    12,  /* ignored by udhcp_str2optset */
> -+      /* The above value was chosen as follows:
> -+       * len_of_option_as_string[] for this option is >60: it's a strin=
g
> of the form
> -+       * "32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
> 255.255.255.255 ".
> -+       * Each additional ipv4 address takes 4 bytes in binary option an=
d
> appends
> -+       * another "255.255.255.255 " 16-byte string. We can set
> [OPTION_6RD] =3D 4
> -+       * but this severely overestimates string length: instead of 16
> bytes,
> -+       * it adds >60 for every 4 bytes in binary option.
> -+       * We cheat and declare here that option is in units of 12 bytes.
> -+       * This adds more than 60 bytes for every three ipv4 addresses -
> more than enough.
> -+       * (Even 16 instead of 12 should work, but let's be paranoid).
> -+       */
> - };
> -
> -
> -Index: busybox-1.23.2/networking/udhcp/dhcpc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.23.2.orig/networking/udhcp/dhcpc.c
> -+++ busybox-1.23.2/networking/udhcp/dhcpc.c
> -@@ -103,7 +103,7 @@ static const uint8_t len_of_option_as_st
> -       [OPTION_IP              ] =3D sizeof("255.255.255.255 "),
> -       [OPTION_IP_PAIR         ] =3D sizeof("255.255.255.255 ") * 2,
> -       [OPTION_STATIC_ROUTES   ] =3D sizeof("255.255.255.255/32
> 255.255.255.255 "),
> --      [OPTION_6RD             ] =3D sizeof("32 128
> ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
> -+      [OPTION_6RD             ] =3D sizeof("132 128
> ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
> -       [OPTION_STRING          ] =3D 1,
> -       [OPTION_STRING_HOST     ] =3D 1,
> - #if ENABLE_FEATURE_UDHCP_RFC3397
> -@@ -214,7 +214,7 @@ static NOINLINE char *xmalloc_optname_op
> -       type =3D optflag->flags & OPTION_TYPE_MASK;
> -       optlen =3D dhcp_option_lengths[type];
> -       upper_length =3D len_of_option_as_string[type]
> --              * ((unsigned)(len + optlen - 1) / (unsigned)optlen);
> -+              * ((unsigned)(len + optlen) / (unsigned)optlen);
> -
> -       dest =3D ret =3D xmalloc(upper_length + strlen(opt_name) + 2);
> -       dest +=3D sprintf(ret, "%s=3D", opt_name);
> diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-op=
en-mode.patch
> b/meta/recipes-core/busybox/busybox/busybox-1.24.1-
> truncate-open-mode.patch
> deleted file mode 100644
> index cdc9108..0000000
> --- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-
> truncate-open-mode.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -Upstream-Status: Backport
> -
> -  http://busybox.net/downloads/fixes-1.24.1/
> -  https://git.busybox.net/busybox/commit/?id=3D
> e111a1640494fe87fc913f94fae3bb805de0fc99
> -  https://git.busybox.net/busybox/commit/?h=3D1_24_stable&id=3D
> be729c1d3b5c923f10871dd68ea94156d0f8c803
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
> -From be729c1d3b5c923f10871dd68ea94156d0f8c803 Mon Sep 17 00:00:00 2001
> -From: Ari Sundholm <ari@tuxera.com>
> -Date: Mon, 4 Jan 2016 15:40:37 +0200
> -Subject: [PATCH] truncate: always set mode when opening file to avoid
> fortify
> - errors
> -
> -Busybox crashes due to no mode being given when opening:
> -$ ./busybox truncate -s 1M foo
> -*** invalid open64 call: O_CREAT without mode ***: ./busybox terminated
> -=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
> -/lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x7f66d921338f]
> -/lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x7f66d92aac9c]
> -/lib/x86_64-linux-gnu/libc.so.6(+0xeb6aa)[0x7f66d928b6aa]
> -./busybox[0x4899f9]
> -=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D
> -00400000-004d0000 r-xp 00000000 00:1a 137559
>  /home/ari/busybox/busybox
> -006cf000-006d0000 r--p 000cf000 00:1a 137559
>  /home/ari/busybox/busybox
> -006d0000-006d1000 rw-p 000d0000 00:1a 137559
>  /home/ari/busybox/busybox
> -006d1000-006d4000 rw-p 00000000 00:00 0
> -014e7000-01508000 rw-p 00000000 00:00 0
> [heap]
> -7f66d8f8a000-7f66d8fa0000 r-xp 00000000 08:07 1579008
> /lib/x86_64-linux-gnu/libgcc_s.so.1
> -7f66d8fa0000-7f66d919f000 ---p 00016000 08:07 1579008
> /lib/x86_64-linux-gnu/libgcc_s.so.1
> -7f66d919f000-7f66d91a0000 rw-p 00015000 08:07 1579008
> /lib/x86_64-linux-gnu/libgcc_s.so.1
> -7f66d91a0000-7f66d935b000 r-xp 00000000 08:07 1578994
> /lib/x86_64-linux-gnu/libc-2.19.so
> -7f66d935b000-7f66d955a000 ---p 001bb000 08:07 1578994
> /lib/x86_64-linux-gnu/libc-2.19.so
> -7f66d955a000-7f66d955e000 r--p 001ba000 08:07 1578994
> /lib/x86_64-linux-gnu/libc-2.19.so
> -7f66d955e000-7f66d9560000 rw-p 001be000 08:07 1578994
> /lib/x86_64-linux-gnu/libc-2.19.so
> -7f66d9560000-7f66d9565000 rw-p 00000000 00:00 0
> -7f66d9565000-7f66d966a000 r-xp 00000000 08:07 1579020
> /lib/x86_64-linux-gnu/libm-2.19.so
> -7f66d966a000-7f66d9869000 ---p 00105000 08:07 1579020
> /lib/x86_64-linux-gnu/libm-2.19.so
> -7f66d9869000-7f66d986a000 r--p 00104000 08:07 1579020
> /lib/x86_64-linux-gnu/libm-2.19.so
> -7f66d986a000-7f66d986b000 rw-p 00105000 08:07 1579020
> /lib/x86_64-linux-gnu/libm-2.19.so
> -7f66d986b000-7f66d988e000 r-xp 00000000 08:07 1578981
> /lib/x86_64-linux-gnu/ld-2.19.so
> -7f66d9a64000-7f66d9a67000 rw-p 00000000 00:00 0
> -7f66d9a8a000-7f66d9a8d000 rw-p 00000000 00:00 0
> -7f66d9a8d000-7f66d9a8e000 r--p 00022000 08:07 1578981
> /lib/x86_64-linux-gnu/ld-2.19.so
> -7f66d9a8e000-7f66d9a8f000 rw-p 00023000 08:07 1578981
> /lib/x86_64-linux-gnu/ld-2.19.so
> -7f66d9a8f000-7f66d9a90000 rw-p 00000000 00:00 0
> -7ffc47761000-7ffc47782000 rw-p 00000000 00:00 0
> [stack]
> -7ffc477ab000-7ffc477ad000 r-xp 00000000 00:00 0
> [vdso]
> -ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
> [vsyscall]
> -Aborted (core dumped)
> -$
> -
> -Fix this by simply always setting the mode, as it doesn't hurt even
> -when O_CREAT is not specified.
> -
> -This bug is a regression introduced in fc3e40e, as xopen(), which
> -was originally used, would automatically set the mode.
> -
> -Signed-off-by: Ari Sundholm <ari@tuxera.com>
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> -(cherry picked from commit e111a1640494fe87fc913f94fae3bb805de0fc99)
> ----
> - coreutils/truncate.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/coreutils/truncate.c b/coreutils/truncate.c
> -index e5fa656..4c997bf 100644
> ---- a/coreutils/truncate.c
> -+++ b/coreutils/truncate.c
> -@@ -64,7 +64,7 @@ int truncate_main(int argc UNUSED_PARAM, char **argv)
> -
> -       argv +=3D optind;
> -       while (*argv) {
> --              int fd =3D open(*argv, flags);
> -+              int fd =3D open(*argv, flags, 0666);
> -               if (fd < 0) {
> -                       if (errno !=3D ENOENT || !(opts & OPT_NOCREATE)) =
{
> -                               bb_perror_msg("%s: open", *argv);
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regre=
ssion.patch
> b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
> deleted file mode 100644
> index e3c5020..0000000
> --- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-
> regression.patch
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -Upstream-Status: Backport
> -
> -  http://busybox.net/downloads/fixes-1.24.1/
> -  http://git.busybox.net/busybox/commit/?id=3D
> 092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
> -  http://git.busybox.net/busybox/commit/?h=3D1_24_stable&id=3D
> 092fabcf1df5d46cd22be4ffcd3b871f6180eb9c
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
> -From 092fabcf1df5d46cd22be4ffcd3b871f6180eb9c Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Fri, 30 Oct 2015 23:41:53 +0100
> -Subject: [PATCH] [g]unzip: fix recent breakage.
> -
> -Also, do emit error message we so painstakingly pass from gzip internals
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -(cherry picked from commit 6bd3fff51aa74e2ee2d87887b12182a3b09792ef)
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> - archival/libarchive/decompress_gunzip.c | 33
> +++++++++++++++++++++------------
> - testsuite/unzip.tests                   |  1 +
> - 2 files changed, 22 insertions(+), 12 deletions(-)
> -
> -diff --git a/archival/libarchive/decompress_gunzip.c
> b/archival/libarchive/decompress_gunzip.c
> -index c76fd31..357c9bf 100644
> ---- a/archival/libarchive/decompress_gunzip.c
> -+++ b/archival/libarchive/decompress_gunzip.c
> -@@ -309,8 +309,7 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -       huft_t *q;              /* points to current table */
> -       huft_t r;               /* table entry for structure assignment *=
/
> -       huft_t *u[BMAX];        /* table stack */
> --      unsigned v[N_MAX];      /* values in order of bit length */
> --      unsigned v_end;
> -+      unsigned v[N_MAX + 1];  /* values in order of bit length. last v[=
]
> is never used */
> -       int ws[BMAX + 1];       /* bits decoded stack */
> -       int w;                  /* bits decoded */
> -       unsigned x[BMAX + 1];   /* bit offsets, then code stack */
> -@@ -365,15 +364,17 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -               *xp++ =3D j;
> -       }
> -
> --      /* Make a table of values in order of bit lengths */
> -+      /* Make a table of values in order of bit lengths.
> -+       * To detect bad input, unused v[i]'s are set to invalid value
> UINT_MAX.
> -+       * In particular, last v[i] is never filled and must not be
> accessed.
> -+       */
> -+      memset(v, 0xff, sizeof(v));
> -       p =3D b;
> -       i =3D 0;
> --      v_end =3D 0;
> -       do {
> -               j =3D *p++;
> -               if (j !=3D 0) {
> -                       v[x[j]++] =3D i;
> --                      v_end =3D x[j];
> -               }
> -       } while (++i < n);
> -
> -@@ -435,7 +436,9 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -
> -                       /* set up table entry in r */
> -                       r.b =3D (unsigned char) (k - w);
> --                      if (p >=3D v + v_end) { // Was "if (p >=3D v + n)=
" but
> v[] can be shorter!
> -+                      if (/*p >=3D v + n || -- redundant, caught by the
> second check: */
> -+                          *p =3D=3D UINT_MAX /* do we access uninited v=
[i]?
> (see memset(v))*/
> -+                      ) {
> -                               r.e =3D 99; /* out of values--invalid cod=
e */
> -                       } else if (*p < s) {
> -                               r.e =3D (unsigned char) (*p < 256 ? 16 :
> 15);     /* 256 is EOB code */
> -@@ -520,8 +523,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
> -               e =3D t->e;
> -               if (e > 16)
> -                       do {
> --                              if (e =3D=3D 99)
> --                                      abort_unzip(PASS_STATE_ONLY);;
> -+                              if (e =3D=3D 99) {
> -+                                      abort_unzip(PASS_STATE_ONLY);
> -+                              }
> -                               bb >>=3D t->b;
> -                               k -=3D t->b;
> -                               e -=3D 16;
> -@@ -557,8 +561,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
> -                       e =3D t->e;
> -                       if (e > 16)
> -                               do {
> --                                      if (e =3D=3D 99)
> -+                                      if (e =3D=3D 99) {
> -
>  abort_unzip(PASS_STATE_ONLY);
> -+                                      }
> -                                       bb >>=3D t->b;
> -                                       k -=3D t->b;
> -                                       e -=3D 16;
> -@@ -824,8 +829,9 @@ static int inflate_block(STATE_PARAM smallint *e)
> -
> -               b_dynamic >>=3D 4;
> -               k_dynamic -=3D 4;
> --              if (nl > 286 || nd > 30)
> -+              if (nl > 286 || nd > 30) {
> -                       abort_unzip(PASS_STATE_ONLY);   /* bad lengths */
> -+              }
> -
> -               /* read in bit-length-code lengths */
> -               for (j =3D 0; j < nb; j++) {
> -@@ -906,12 +912,14 @@ static int inflate_block(STATE_PARAM smallint *e)
> -               bl =3D lbits;
> -
> -               i =3D huft_build(ll, nl, 257, cplens, cplext,
> &inflate_codes_tl, &bl);
> --              if (i !=3D 0)
> -+              if (i !=3D 0) {
> -                       abort_unzip(PASS_STATE_ONLY);
> -+              }
> -               bd =3D dbits;
> -               i =3D huft_build(ll + nl, nd, 0, cpdist, cpdext,
> &inflate_codes_td, &bd);
> --              if (i !=3D 0)
> -+              if (i !=3D 0) {
> -                       abort_unzip(PASS_STATE_ONLY);
> -+              }
> -
> -               /* set up data for inflate_codes() */
> -               inflate_codes_setup(PASS_STATE bl, bd);
> -@@ -999,6 +1007,7 @@ inflate_unzip_internal(STATE_PARAM
> transformer_state_t *xstate)
> -       error_msg =3D "corrupted data";
> -       if (setjmp(error_jmp)) {
> -               /* Error from deep inside zip machinery */
> -+              bb_error_msg(error_msg);
> -               n =3D -1;
> -               goto ret;
> -       }
> -diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
> -index ca0a458..d8738a3 100755
> ---- a/testsuite/unzip.tests
> -+++ b/testsuite/unzip.tests
> -@@ -34,6 +34,7 @@ rm foo.zip
> - testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" =
\
> - "Archive:  bad.zip
> -   inflating: ]3j=C3=82=C2=BDr=C3=82=C2=ABI  K-%Ix
> -+unzip: corrupted data
> - unzip: inflate error
> - 1
> - " \
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
> b/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
> deleted file mode 100644
> index 7186726..0000000
> --- a/meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
> +++ /dev/null
> @@ -1,118 +0,0 @@
> -Upstream-Status: Backport
> -
> -  http://busybox.net/downloads/fixes-1.24.1/
> -  http://git.busybox.net/busybox/commit/?id=3D
> 1de25a6e87e0e627aa34298105a3d17c60a1f44e
> -  http://git.busybox.net/busybox/commit/?h=3D1_24_stable&id=3D
> 6767af17f11144c7cd3cfe9ef799d7f89a78fe65
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
> -From 1de25a6e87e0e627aa34298105a3d17c60a1f44e Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Mon, 26 Oct 2015 19:33:05 +0100
> -Subject: [PATCH] unzip: test for bad archive SEGVing
> -
> -function                                             old     new   delta
> -huft_build                                          1296    1300      +4
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - archival/libarchive/decompress_gunzip.c | 11 +++++++----
> - testsuite/unzip.tests                   | 23 ++++++++++++++++++++++-
> - 2 files changed, 29 insertions(+), 5 deletions(-)
> -
> -diff --git a/archival/libarchive/decompress_gunzip.c
> b/archival/libarchive/decompress_gunzip.c
> -index 7b6f459..30bf451 100644
> ---- a/archival/libarchive/decompress_gunzip.c
> -+++ b/archival/libarchive/decompress_gunzip.c
> -@@ -305,11 +305,12 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -       unsigned i;             /* counter, current code */
> -       unsigned j;             /* counter */
> -       int k;                  /* number of bits in current code */
> --      unsigned *p;            /* pointer into c[], b[], or v[] */
> -+      const unsigned *p;      /* pointer into c[], b[], or v[] */
> -       huft_t *q;              /* points to current table */
> -       huft_t r;               /* table entry for structure assignment *=
/
> -       huft_t *u[BMAX];        /* table stack */
> -       unsigned v[N_MAX];      /* values in order of bit length */
> -+      unsigned v_end;
> -       int ws[BMAX + 1];       /* bits decoded stack */
> -       int w;                  /* bits decoded */
> -       unsigned x[BMAX + 1];   /* bit offsets, then code stack */
> -@@ -324,7 +325,7 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -
> -       /* Generate counts for each bit length */
> -       memset(c, 0, sizeof(c));
> --      p =3D (unsigned *) b; /* cast allows us to reuse p for pointing t=
o b
> */
> -+      p =3D b;
> -       i =3D n;
> -       do {
> -               c[*p]++; /* assume all entries <=3D BMAX */
> -@@ -365,12 +366,14 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -       }
> -
> -       /* Make a table of values in order of bit lengths */
> --      p =3D (unsigned *) b;
> -+      p =3D b;
> -       i =3D 0;
> -+      v_end =3D 0;
> -       do {
> -               j =3D *p++;
> -               if (j !=3D 0) {
> -                       v[x[j]++] =3D i;
> -+                      v_end =3D x[j];
> -               }
> -       } while (++i < n);
> -
> -@@ -432,7 +435,7 @@ static int huft_build(const unsigned *b, const
> unsigned n,
> -
> -                       /* set up table entry in r */
> -                       r.b =3D (unsigned char) (k - w);
> --                      if (p >=3D v + n) {
> -+                      if (p >=3D v + v_end) { // Was "if (p >=3D v + n)=
" but
> v[] can be shorter!
> -                               r.e =3D 99; /* out of values--invalid cod=
e */
> -                       } else if (*p < s) {
> -                               r.e =3D (unsigned char) (*p < 256 ? 16 :
> 15);     /* 256 is EOB code */
> -diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
> -index 8677a03..ca0a458 100755
> ---- a/testsuite/unzip.tests
> -+++ b/testsuite/unzip.tests
> -@@ -7,7 +7,7 @@
> -
> - . ./testing.sh
> -
> --# testing "test name" "options" "expected result" "file input" "stdin"
> -+# testing "test name" "commands" "expected result" "file input" "stdin"
> - #   file input will be file called "input"
> - #   test can create a file "actual" instead of writing to stdout
> -
> -@@ -30,6 +30,27 @@ testing "unzip (subdir only)" "unzip -q foo.zip foo/
> && test -d foo && test ! -f
> - rmdir foo
> - rm foo.zip
> -
> -+# File containing some damaged encrypted stream
> -+testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" =
\
> -+"Archive:  bad.zip
> -+  inflating: ]3j=C3=82=C2=BDr=C3=82=C2=ABI  K-%Ix
> -+unzip: inflate error
> -+1
> -+" \
> -+"" "\
> -+begin-base64 644 bad.zip
> -+UEsDBBQAAgkIAAAAIQA5AAAANwAAADwAAAAQAAcAXTNqwr1ywqtJGxJLLSVJ
> -+eCkBD0AdKBk8JzQsIj01JC0/ORJQSwMEFAECCAAAAAAhADoAAAAPAAAANgAA
> -+AAwAAQASw73Ct1DCokohPXQiNjoUNTUiHRwgLT4WHlBLAQIQABQAAggIAAAA
> -+oQA5AAAANwAAADwAAAAQQAcADAAAACwAMgCAAAAAAABdM2rCvXLCq0kbEkst
> -+JUl4KQEPQB0oGSY4Cz4QNgEnJSYIPVBLAQIAABQAAggAAAAAIQAqAAAADwAA
> -+BDYAAAAMAAEADQAAADIADQAAAEEAAAASw73Ct1DKokohPXQiNzA+FAI1HCcW
> -+NzITNFBLBQUKAC4JAA04Cw0EOhZQSwUGAQAABAIAAgCZAAAAeQAAAAIALhM=3D
> -+=3D=3D=3D=3D
> -+"
> -+
> -+rm *
> -+
> - # Clean up scratch directory.
> -
> - cd ..
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.p=
atch
> b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> index bda8685..9a59001 100644
> --- a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> +++ b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> @@ -1,6 +1,5 @@
> -From: Jason Wessel <jason.wessel@windriver.com>
> -Date: Sun, 3 Mar 2013 12:31:40 -0600
> -Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of
> ncurses location
> +Subject: [PATCH] Date: Sun, 3 Mar 2013 12:31:40 -0600 Subject: [PATCH]
> + menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
>
>  Upstream-Status: Submitted
>
> @@ -29,38 +28,20 @@ compiling and linking against the right headers and
> libraries.
>  Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>  cc: Michal Marek <mmarek@suse.cz>
>  cc: linux-kbuild@vger.kernel.org
> +
> +Updated to Busybox 1.26.2
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
> - scripts/kconfig/lxdialog/Makefile          |    2 +-
> - scripts/kconfig/lxdialog/check-lxdialog.sh |    8 ++++++++
> + scripts/kconfig/lxdialog/Makefile          | 2 +-
> + scripts/kconfig/lxdialog/check-lxdialog.sh | 8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> ---- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> -+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> -@@ -4,6 +4,10 @@
> - # What library to link
> - ldflags()
> - {
> -+      if [ x"$CROSS_CURSES_LIB" !=3D x ]; then
> -+              echo "$CROSS_CURSES_LIB"
> -+              exit
> -+      fi
> -       for ext in so a dylib ; do
> -               for lib in ncursesw ncurses curses ; do
> -                       $cc -print-file-name=3Dlib${lib}.${ext} | grep -q=
 /
> -@@ -19,6 +23,10 @@ ldflags()
> - # Where is ncurses.h?
> - ccflags()
> - {
> -+      if [ x"$CROSS_CURSES_INC" !=3D x ]; then
> -+              echo "$CROSS_CURSES_INC"
> -+              exit
> -+      fi
> -       if [ -f /usr/include/ncursesw/ncurses.h ]; then
> -               echo '-I/usr/include/ncursesw -DCURSES_LOC=3D"<ncurses.h>=
"'
> -       elif [ -f /usr/include/ncursesw/curses.h ]; then
> +diff --git a/scripts/kconfig/lxdialog/Makefile
> b/scripts/kconfig/lxdialog/Makefile
> +index 2c9dc48..cdb4413 100644
>  --- a/scripts/kconfig/lxdialog/Makefile
>  +++ b/scripts/kconfig/lxdialog/Makefile
> -@@ -5,7 +5,7 @@ check-lxdialog  :=3D $(srctree)/$(src)/che
> +@@ -5,7 +5,7 @@ check-lxdialog  :=3D $(srctree)/$(src)/check-lxdialog.sh
>
>   # Use reursively expanded variables so we do not call gcc unless
>   # we really need to do so. (Do not call gcc as part of make mrproper)
> @@ -69,3 +50,32 @@ cc: linux-kbuild@vger.kernel.org
>   HOST_LOADLIBES   =3D $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags
> $(HOSTCC))
>
>   HOST_EXTRACFLAGS +=3D -DLOCALE
> +diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
> b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +index 5075ebf..46266cb 100755
> +--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> ++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +@@ -6,6 +6,10 @@ ldflags()
> + {
> +       pkg-config --libs ncursesw 2>/dev/null && exit
> +       pkg-config --libs ncurses 2>/dev/null && exit
> ++        if [ x"$CROSS_CURSES_LIB" !=3D x ]; then
> ++                echo "$CROSS_CURSES_LIB"
> ++                exit
> ++        fi
> +       for ext in so a dll.a dylib ; do
> +               for lib in ncursesw ncurses curses ; do
> +                       $cc -print-file-name=3Dlib${lib}.${ext} | grep -q=
 /
> +@@ -21,6 +25,10 @@ ldflags()
> + # Where is ncurses.h?
> + ccflags()
> + {
> ++        if [ x"$CROSS_CURSES_INC" !=3D x ]; then
> ++                echo "$CROSS_CURSES_INC"
> ++                exit
> ++        fi
> +       if pkg-config --cflags ncursesw 2>/dev/null; then
> +               echo '-DCURSES_LOC=3D"<ncurses.h>" -DNCURSES_WIDECHAR=3D1=
'
> +       elif pkg-config --cflags ncurses 2>/dev/null; then
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-co=
mmit-d8e61bb.patch
> b/meta/recipes-core/busybox/busybox/busybox-kbuild-race-
> fix-commit-d8e61bb.patch
> deleted file mode 100644
> index 38302e0..0000000
> --- a/meta/recipes-core/busybox/busybox/busybox-kbuild-race-
> fix-commit-d8e61bb.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -Upstream-Status: Backport
> -
> -Patch addressing a parallel make race in Busybox
> -
> -  http://git.busybox.net/busybox/commit/?id=3D
> d8e61bbf13d0cf38d477255cfd5dc71c5d51d575
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -From d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Sun, 21 Aug 2016 22:00:20 +0200
> -Subject: build system: different fix for
> - include/applet_tables.h/include/NUM_APPLETS.h
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -
> -diff --git a/applets/Kbuild.src b/applets/Kbuild.src
> -index 5cc1827..3aedbbf 100644
> ---- a/applets/Kbuild.src
> -+++ b/applets/Kbuild.src
> -@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h
> include/applet_tables.h
> -
> - applets/applet_tables: .config include/applets.h
> - applets/usage:         .config include/applets.h
> --applets/usage_pod:     .config include/applets.h include/applet_tables.=
h
> include/NUM_APPLETS.h
> -+applets/usage_pod:     .config include/applets.h include/applet_tables.=
h
> -
> - quiet_cmd_gen_usage_compressed =3D GEN     include/usage_compressed.h
> -       cmd_gen_usage_compressed =3D $(srctree_slash)applets/usage_compre=
ssed
> include/usage_compressed.h applets
> -@@ -37,8 +37,21 @@ quiet_cmd_gen_usage_compressed =3D GEN
>  include/usage_compressed.h
> - include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage=
_
> compressed
> -       $(call cmd,gen_usage_compressed)
> -
> --quiet_cmd_gen_applet_tables =3D GEN     include/applet_tables.h
> -+quiet_cmd_gen_applet_tables =3D GEN     include/applet_tables.h
> include/NUM_APPLETS.h
> -       cmd_gen_applet_tables =3D applets/applet_tables
> include/applet_tables.h include/NUM_APPLETS.h
> -
> --include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
> -+include/NUM_APPLETS.h: applets/applet_tables
> -+      $(call cmd,gen_applet_tables)
> -+
> -+# In fact, include/applet_tables.h depends only on applets/applet_table=
s,
> -+# and is generated by it. But specifying only it can run
> -+# applets/applet_tables twice, possibly in parallel.
> -+# We say that it also needs NUM_APPLETS.h
> -+#
> -+# Unfortunately, we need to list the same command,
> -+# and it can be executed twice (sequentially).
> -+# The alternative is to not list any command,
> -+# and then if include/applet_tables.h is deleted, it won't be rebuilt.
> -+#
> -+include/applet_tables.h: include/NUM_APPLETS.h applets/applet_tables
> -       $(call cmd,gen_applet_tables)
> diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig=
.patch
> b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> index 4c9ce3b..202e086 100644
> --- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> +++ b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
> @@ -1,6 +1,3 @@
> -From 53626cd06a3ef05ed847daea802ef0aa9661caa7 Mon Sep 17 00:00:00 2001
> -From: Anders Darander <anders@chargestorm.se>
> -Date: Thu, 3 Nov 2011 08:51:31 +0100
>  Subject: [PATCH] busybox-udhcpc-no_deconfig.patch
>
>  Upstream-Status: Pending
> @@ -27,17 +24,21 @@ Signed-off-by: Anders Darander <anders@chargestorm.se=
>
>  Fixed options -b, -a and -P.
>
>  Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +
> +Updated to Busybox 1.26.2
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>  ---
> - networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
> - 1 files changed, 21 insertions(+), 8 deletions(-)
> + networking/udhcp/dhcpc.c | 26 +++++++++++++++++++-------
> + 1 file changed, 19 insertions(+), 7 deletions(-)
>
> -Index: busybox-1.20.2/networking/udhcp/dhcpc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- busybox-1.20.2.orig/networking/udhcp/dhcpc.c
> -+++ busybox-1.20.2/networking/udhcp/dhcpc.c
> -@@ -29,6 +29,9 @@
> - #include <netpacket/packet.h>
> - #include <linux/filter.h>
> +diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
> +index 0e23626..2f05ee3 100644
> +--- a/networking/udhcp/dhcpc.c
> ++++ b/networking/udhcp/dhcpc.c
> +@@ -50,6 +50,9 @@ struct tpacket_auxdata {
> + #endif
> +
>
>  +/* option whether to down the interface when reconfiguring */
>  +static int allow_deconfig =3D 1;
> @@ -45,7 +46,7 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>   /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
>
>
> -@@ -81,8 +84,9 @@ enum {
> +@@ -102,8 +105,9 @@ enum {
>         OPT_x =3D 1 << 18,
>         OPT_f =3D 1 << 19,
>         OPT_B =3D 1 << 20,
> @@ -56,7 +57,7 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>         USE_FOR_MMU(             OPTBIT_b,)
>         IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
>         IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
> -@@ -1040,7 +1044,8 @@ static void perform_renew(void)
> +@@ -1108,7 +1112,8 @@ static void perform_renew(void)
>                 state =3D RENEW_REQUESTED;
>                 break;
>         case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
> @@ -66,26 +67,16 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>         case REQUESTING:
>         case RELEASED:
>                 change_listen_mode(LISTEN_RAW);
> -@@ -1064,7 +1069,8 @@ static void perform_release(uint32_t ser
> -               bb_info_msg("Unicasting a release of %s to %s",
> -                               inet_ntoa(temp_addr), buffer);
> -               send_release(server_addr, requested_ip); /* unicast */
> --              udhcp_run_script(NULL, "deconfig");
> -+              if (allow_deconfig)
> -+                      udhcp_run_script(NULL, "deconfig");
> -       }
> -       bb_info_msg("Entering released state");
> -
> -@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +@@ -1298,7 +1303,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
>         /* O,x: list; -T,-t,-A take numeric param */
> -       opt_complementary =3D "O::x::T+:t+:A+" IF_UDHCP_VERBOSE(":vv") ;
> +       IF_UDHCP_VERBOSE(opt_complementary =3D "vv";)
>         IF_LONG_OPTS(applet_long_options =3D udhcpc_longopts;)
> --      opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
> -+      opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
> +-      opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
> ++        opt =3D getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
>                 USE_FOR_MMU("b")
> -               IF_FEATURE_UDHCPC_ARPING("a")
> +               IF_FEATURE_UDHCPC_ARPING("a::")
>                 IF_FEATURE_UDHCP_PORT("P:")
> -@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +@@ -1407,6 +1412,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
>                 logmode |=3D LOGMODE_SYSLOG;
>         }
>
> @@ -95,7 +86,7 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>         /* Make sure fd 0,1,2 are open */
>         bb_sanitize_stdio();
>         /* Equivalent of doing a fflush after every \n */
> -@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +@@ -1421,7 +1429,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
>         srand(monotonic_us());
>
>         state =3D INIT_SELECTING;
> @@ -105,17 +96,17 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>         change_listen_mode(LISTEN_RAW);
>         packet_num =3D 0;
>         timeout =3D 0;
> -@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +@@ -1575,7 +1584,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
>                                 }
>                                 /* Timed out, enter init state */
> -                               bb_info_msg("Lease lost, entering init
> state");
> +                               bb_error_msg("lease lost, entering init
> state");
>  -                              udhcp_run_script(NULL, "deconfig");
> -+                              if (allow_deconfig)
> -+                                      udhcp_run_script(NULL, "deconfig"=
);
> ++                                if (allow_deconfig)
> ++                                        udhcp_run_script(NULL,
> "deconfig");
>                                 state =3D INIT_SELECTING;
>                                 client_config.first_secs =3D 0; /* make s=
ecs
> field count from 0 */
>                                 /*timeout =3D 0; - already is */
> -@@ -1667,7 +1678,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> +@@ -1768,7 +1778,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
>                                                 send_decline(/*xid,*/
> server_addr, packet.yiaddr);
>
>                                                 if (state !=3D REQUESTING=
)
> @@ -125,8 +116,8 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>
> change_listen_mode(LISTEN_RAW);
>                                                 state =3D INIT_SELECTING;
>                                                 client_config.first_secs =
=3D
> 0; /* make secs field count from 0 */
> -@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
> -                               bb_info_msg("Received DHCP NAK");
> +@@ -1838,7 +1849,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv=
)
> +                               bb_error_msg("received %s", "DHCP NAK");
>                                 udhcp_run_script(&packet, "nak");
>                                 if (state !=3D REQUESTING)
>  -                                      udhcp_run_script(NULL, "deconfig"=
);
> @@ -135,3 +126,6 @@ Index: busybox-1.20.2/networking/udhcp/dhcpc.c
>                                 change_listen_mode(LISTEN_RAW);
>                                 sleep(3); /* avoid excessive network
> traffic */
>                                 state =3D INIT_SELECTING;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-c=
ommit-0dddbc1.patch
> b/meta/recipes-core/busybox/busybox/commit-applet_tables-
> fix-commit-0dddbc1.patch
> deleted file mode 100644
> index 7f80a1d..0000000
> --- a/meta/recipes-core/busybox/busybox/commit-applet_tables-
> fix-commit-0dddbc1.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Upstream-Status: Backport
> -
> -Patch addressing a parallel make race in Busybox
> -
> -  http://git.busybox.net/busybox/commit/?id=3D
> 0dddbc1a59795a77679d8c5ef48a2795cb470563
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -From 0dddbc1a59795a77679d8c5ef48a2795cb470563 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Tue, 23 Aug 2016 20:21:36 +0200
> -Subject: build system: always rewrite NUM_APPLETS.h
> -
> -Conditional rewrite can keep NUM_APPLETS.h mtime old,
> -this causes make to try to regenerate it at every invocation.
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -
> -diff --git a/applets/applet_tables.c b/applets/applet_tables.c
> -index 8401a15..ef911a4 100644
> ---- a/applets/applet_tables.c
> -+++ b/applets/applet_tables.c
> -@@ -192,27 +192,28 @@ int main(int argc, char **argv)
> -       printf("};\n");
> - #endif
> -       //printf("#endif /* SKIP_definitions */\n");
> -+
> - //    printf("\n");
> - //    printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
> -
> -       if (argv[2]) {
> --              char line_old[80];
> --              char line_new[80];
> -               FILE *fp;
> -+              char line_new[80];
> -+//            char line_old[80];
> -
> --              line_old[0] =3D 0;
> --              fp =3D fopen(argv[2], "r");
> --              if (fp) {
> --                      fgets(line_old, sizeof(line_old), fp);
> --                      fclose(fp);
> --              }
> -               sprintf(line_new, "#define NUM_APPLETS %u\n", NUM_APPLETS=
);
> --              if (strcmp(line_old, line_new) !=3D 0) {
> -+//            line_old[0] =3D 0;
> -+//            fp =3D fopen(argv[2], "r");
> -+//            if (fp) {
> -+//                    fgets(line_old, sizeof(line_old), fp);
> -+//                    fclose(fp);
> -+//            }
> -+//            if (strcmp(line_old, line_new) !=3D 0) {
> -                       fp =3D fopen(argv[2], "w");
> -                       if (!fp)
> -                               return 1;
> -                       fputs(line_new, fp);
> --              }
> -+//            }
> -       }
> -
> -       return 0;
> diff --git a/meta/recipes-core/busybox/busybox/ip_fix_problem_on_
> mips64_n64_big_endian_musl_systems.patch b/meta/recipes-core/busybox/
> busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
> deleted file mode 100644
> index 41c5656..0000000
> --- a/meta/recipes-core/busybox/busybox/ip_fix_problem_on_
> mips64_n64_big_endian_musl_systems.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 4ab372d49a6e82b0bf097dedb96d26330c5f2d5f Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <nsz@port70.net>
> -Date: Sun, 24 Apr 2016 17:39:02 +0200
> -Subject: [PATCH] ip: fix problem on mips64 n64 big endian musl systems
> -
> -Use designated initializers for struct msghdr.
> -The struct layout is non-portable and musl libc does not match what
> busybox expects.
> -
> -Signed-off-by: Szabolcs Nagy <nsz@port70.net>
> -Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> -
> -Upstream-Status: Backport
> -
> -https://git.busybox.net/busybox/commit/?id=3D4ab372d49a6e82b0bf097dedb96=
d26
> 330c5f2d5f
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - networking/libiproute/libnetlink.c | 37 ++++++++++++++++++++++++------
> -------
> - 1 file changed, 24 insertions(+), 13 deletions(-)
> -
> -diff --git a/networking/libiproute/libnetlink.c b/networking/libiproute/
> libnetlink.c
> -index c7533a4..cbb5daf 100644
> ---- a/networking/libiproute/libnetlink.c
> -+++ b/networking/libiproute/libnetlink.c
> -@@ -71,11 +71,15 @@ int FAST_FUNC rtnl_dump_request(struct rtnl_handle
> *rth, int type, void *req, in
> -       struct nlmsghdr nlh;
> -       struct sockaddr_nl nladdr;
> -       struct iovec iov[2] =3D { { &nlh, sizeof(nlh) }, { req, len } };
> -+      /* Use designated initializers, struct layout is non-portable */
> -       struct msghdr msg =3D {
> --              (void*)&nladdr, sizeof(nladdr),
> --              iov,  2,
> --              NULL, 0,
> --              0
> -+              .msg_name =3D (void*)&nladdr,
> -+              .msg_namelen =3D sizeof(nladdr),
> -+              .msg_iov =3D iov,
> -+              .msg_iovlen =3D 2,
> -+              .msg_control =3D NULL,
> -+              .msg_controllen =3D 0,
> -+              .msg_flags =3D 0
> -       };
> -
> -       memset(&nladdr, 0, sizeof(nladdr));
> -@@ -104,12 +108,15 @@ static int rtnl_dump_filter(struct rtnl_handle *rt=
h,
> -       while (1) {
> -               int status;
> -               struct nlmsghdr *h;
> --
> -+              /* Use designated initializers, struct layout is
> non-portable */
> -               struct msghdr msg =3D {
> --                      (void*)&nladdr, sizeof(nladdr),
> --                      &iov, 1,
> --                      NULL, 0,
> --                      0
> -+                      .msg_name =3D (void*)&nladdr,
> -+                      .msg_namelen =3D sizeof(nladdr),
> -+                      .msg_iov =3D &iov,
> -+                      .msg_iovlen =3D 1,
> -+                      .msg_control =3D NULL,
> -+                      .msg_controllen =3D 0,
> -+                      .msg_flags =3D 0
> -               };
> -
> -               status =3D recvmsg(rth->fd, &msg, 0);
> -@@ -211,11 +218,15 @@ int FAST_FUNC rtnl_talk(struct rtnl_handle *rtnl,
> struct nlmsghdr *n,
> -       struct sockaddr_nl nladdr;
> -       struct iovec iov =3D { (void*)n, n->nlmsg_len };
> -       char   *buf =3D xmalloc(8*1024); /* avoid big stack buffer */
> -+      /* Use designated initializers, struct layout is non-portable */
> -       struct msghdr msg =3D {
> --              (void*)&nladdr, sizeof(nladdr),
> --              &iov, 1,
> --              NULL, 0,
> --              0
> -+              .msg_name =3D (void*)&nladdr,
> -+              .msg_namelen =3D sizeof(nladdr),
> -+              .msg_iov =3D &iov,
> -+              .msg_iovlen =3D 1,
> -+              .msg_control =3D NULL,
> -+              .msg_controllen =3D 0,
> -+              .msg_flags =3D 0
> -       };
> -
> -       memset(&nladdr, 0, sizeof(nladdr));
> ---
> -2.3.5
> -
> diff --git a/meta/recipes-core/busybox/busybox/makefile-fix-backport.patc=
h
> b/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
> index 2e9842e..bc28df8 100644
> --- a/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
> +++ b/meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
> @@ -1,40 +1,38 @@
> -From 9e5820a86277818c2f83c11c2aa76d7f0a38283e Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Sun, 14 Aug 2016 02:54:27 +0200
> -Subject: build system: fix include/NUM_APPLETS.h generation
> +Subject: [PATCH] build system: fix include/NUM_APPLETS.h generation
>
>  TBH, it's more like "work around my bad makefile-fu" than "fix"...
>
>  Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - applets/Kbuild.src | 7 ++-----
> - 1 file changed, 2 insertions(+), 5 deletions(-)
>
> -Upstream-Status: Backport
> +Updated to Busybox 1.26.2
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + applets/Kbuild.src | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/applets/Kbuild.src b/applets/Kbuild.src
> -index b612399..5cc1827 100644
> +index 3aedbbf..d39b663 100644
>  --- a/applets/Kbuild.src
>  +++ b/applets/Kbuild.src
>  @@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h
> include/applet_tables.h
>
>   applets/applet_tables: .config include/applets.h
>   applets/usage:         .config include/applets.h
> --applets/usage_pod:     .config include/applet_tables.h include/applets.=
h
> +-applets/usage_pod:     .config include/applets.h include/applet_tables.=
h
>  +applets/usage_pod:     .config include/applets.h include/applet_tables.=
h
> include/NUM_APPLETS.h
>
>   quiet_cmd_gen_usage_compressed =3D GEN     include/usage_compressed.h
>         cmd_gen_usage_compressed =3D $(srctree_slash)applets/usage_compre=
ssed
> include/usage_compressed.h applets
> -@@ -40,8 +40,5 @@ include/usage_compressed.h: applets/usage
> $(srctree_slash)applets/usage_compress
> - quiet_cmd_gen_applet_tables =3D GEN     include/applet_tables.h
> +@@ -40,7 +40,7 @@ include/usage_compressed.h: applets/usage
> $(srctree_slash)applets/usage_compress
> + quiet_cmd_gen_applet_tables =3D GEN     include/applet_tables.h
> include/NUM_APPLETS.h
>         cmd_gen_applet_tables =3D applets/applet_tables
> include/applet_tables.h include/NUM_APPLETS.h
>
> --include/applet_tables.h: applets/applet_tables
> --      $(call cmd,gen_applet_tables)
> --
>  -include/NUM_APPLETS.h: applets/applet_tables
>  +include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
>         $(call cmd,gen_applet_tables)
> +
> + # In fact, include/applet_tables.h depends only on applets/applet_table=
s,
>  --
> -cgit v0.12
> +2.7.4
>
> diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb
> b/meta/recipes-core/busybox/busybox_1.26.2.bb
> similarity index 66%
> rename from meta/recipes-core/busybox/busybox_1.24.1.bb
> rename to meta/recipes-core/busybox/busybox_1.26.2.bb
> index afb69d1..130f513 100644
> --- a/meta/recipes-core/busybox/busybox_1.24.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.26.2.bb
> @@ -29,10 +29,6 @@ SRC_URI =3D "http://www.busybox.net/
> downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>             file://recognize_connmand.patch \
>             file://busybox-cross-menuconfig.patch \
>             file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-=
and.patch
> \
> -           file://busybox-1.24.1-unzip.patch \
> -           file://busybox-1.24.1-unzip-regression.patch \
> -           file://busybox-1.24.1-truncate-open-mode.patch \
> -           file://0001-flock-update-the-behaviour-of-c-parameter-to-matc=
h-u.patch
> \
>             file://mount-via-label.cfg \
>             file://sha1sum.cfg \
>             file://sha256sum.cfg \
> @@ -44,18 +40,10 @@ SRC_URI =3D "http://www.busybox.net/
> downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>             file://rcS \
>             file://rcK \
>             file://runlevel \
> -           file://CVE-2016-2148.patch \
> -           file://CVE-2016-2147.patch \
> -           file://CVE-2016-2147_2.patch \
> -           file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.p=
atch
> \
>             file://makefile-fix-backport.patch \
> -           file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-ea=
rly.patch
> \
> -           file://busybox-kbuild-race-fix-commit-d8e61bb.patch \
> -           file://commit-applet_tables-fix-commit-0dddbc1.patch \
>             file://makefile-libbb-race.patch \
> -           file://0001-libiproute-handle-table-ids-larger-than-255.patch
> \
>  "
>  SRC_URI_append_libc-musl =3D " file://musl.cfg "
>
> -SRC_URI[tarball.md5sum] =3D "be98a40cadf84ce2d6b05fa41a275c6a"
> -SRC_URI[tarball.sha256sum] =3D "37d03132cc078937360b392170b7a1
> d0e5b322eee9f57c0b82292a8b1f0afe3d"
> +SRC_URI[tarball.md5sum] =3D "bb59d25ee2643db20f212eec539429f1"
> +SRC_URI[tarball.sha256sum] =3D "da3e44913fc1a9c9b7c5337ea5292d
> a518683cbff32be630777f565d6036af16"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142ba2065f7f8054804cb4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to current master so can you please=
 rebase.=C2=A0 Also when git gets confused by character encodings don&#39;t=
 press &#39;y&#39; because it isn&#39;t asking you to confirm the encoding,=
 but to pick one.<div><br></div><div>(I&#39;ve done this so many times, but=
 it leads to patches that git won&#39;t apply)</div><div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8=
 February 2017 at 08:26, Zheng, Ruoqin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping<br>
<div><div class=3D"h5"><br>
<br>
-----Original Message-----<br>
From: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6<br>
Sent: Monday, January 23, 2017 10:41 AM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 &lt;<a href=3D"mailto:zhengr=
q.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
Subject: [OE-core] [PATCH] busybox: 1.24.1 -&gt; 1.26.2<br>
<br>
1) Upgrade busybox from 1.24.1 to 1.26.2<br>
2) Delete 12 patches below, since they are integrated upstream.<br>
=C2=A0 =C2=A0 busybox/0001-flock-update-the-<wbr>behaviour-of-c-parameter-t=
o-<wbr>match-u.patch<br>
=C2=A0 =C2=A0 busybox/0001-libiproute-<wbr>handle-table-ids-larger-than-<wb=
r>255.patch<br>
=C2=A0 =C2=A0 busybox/0001-sed-fix-sed-n-<wbr>flushes-pattern-space-<wbr>te=
rminates-early.patch<br>
=C2=A0 =C2=A0 busybox/CVE-2016-2147.patch<br>
=C2=A0 =C2=A0 busybox/CVE-2016-2147_2.patch<br>
=C2=A0 =C2=A0 busybox/CVE-2016-2148.patch<br>
=C2=A0 =C2=A0 busybox/busybox-1.24.1-<wbr>truncate-open-mode.patch<br>
=C2=A0 =C2=A0 busybox/busybox-1.24.1-unzip-<wbr>regression.patch<br>
=C2=A0 =C2=A0 busybox/busybox-1.24.1-unzip.<wbr>patch<br>
=C2=A0 =C2=A0 busybox/busybox-kbuild-race-<wbr>fix-commit-d8e61bb.patch<br>
=C2=A0 =C2=A0 busybox/commit-applet_tables-<wbr>fix-commit-0dddbc1.patch<br=
>
=C2=A0 =C2=A0 busybox/ip_fix_problem_on_<wbr>mips64_n64_big_endian_musl_<wb=
r>systems.patch<br>
3) Modify 3 patches below to make it compatible with new version<br>
=C2=A0 =C2=A0 busybox/busybox-cross-<wbr>menuconfig.patch<br>
=C2=A0 =C2=A0 busybox/busybox-udhcpc-no_<wbr>deconfig.patch<br>
=C2=A0 =C2=A0 busybox/makefile-fix-backport.<wbr>patch<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...e-the-behaviour-of-c-<wbr>parameter-to-match-u.patch |=C2=A0 73 --=
---------<br>
=C2=A0...biproute-handle-table-ids-<wbr>larger-than-255.patch | 134 -------=
------------<br>
=C2=A0...-n-flushes-pattern-space-<wbr>terminates-early.patch |=C2=A0 72 --=
---------<br>
=C2=A0.../busybox/busybox/CVE-2016-<wbr>2147.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 57 --------<br>
=C2=A0.../busybox/busybox/CVE-2016-<wbr>2147_2.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 32 -----<br>
=C2=A0.../busybox/busybox/CVE-2016-<wbr>2148.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 74 -----------<br>
=C2=A0.../busybox-1.24.1-truncate-<wbr>open-mode.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 81 ------------<br>
=C2=A0.../busybox/busybox-1.24.1-<wbr>unzip-regression.patch=C2=A0 | 143 --=
-------------------<br>
=C2=A0.../busybox/busybox/busybox-1.<wbr>24.1-unzip.patch=C2=A0 =C2=A0 =C2=
=A0| 118 -----------------<br>
=C2=A0.../busybox/busybox/busybox-<wbr>cross-menuconfig.patch |=C2=A0 70 ++=
+++-----<br>
=C2=A0.../busybox-kbuild-race-fix-<wbr>commit-d8e61bb.patch=C2=A0 =C2=A0|=
=C2=A0 53 --------<br>
=C2=A0.../busybox/busybox-udhcpc-no_<wbr>deconfig.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 70 +++++-----<br>
=C2=A0.../commit-applet_tables-fix-<wbr>commit-0dddbc1.patch=C2=A0 |=C2=A0 =
61 ---------<br>
=C2=A0...lem_on_mips64_n64_big_<wbr>endian_musl_systems.patch |=C2=A0 90 --=
-----------<br>
=C2=A0.../busybox/busybox/makefile-<wbr>fix-backport.patch=C2=A0 =C2=A0 |=
=C2=A0 30 ++---<br>
=C2=A0.../{<a href=3D"http://busybox_1.24.1.bb" rel=3D"noreferrer" target=
=3D"_blank">busybox_1.24.1.bb</a> =3D&gt; <a href=3D"http://busybox_1.26.2.=
bb" rel=3D"noreferrer" target=3D"_blank">busybox_1.26.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 16 +--<br>
=C2=A016 files changed, 88 insertions(+), 1086 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/0001-flock-=
update-the-<wbr>behaviour-of-c-parameter-to-<wbr>match-u.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/0001-libipr=
oute-<wbr>handle-table-ids-larger-than-<wbr>255.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/0001-sed-fi=
x-sed-n-<wbr>flushes-pattern-space-<wbr>terminates-early.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/CVE-2016-21=
47.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/CVE-2016-21=
47_2.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/CVE-2016-21=
48.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/busybox-1.2=
4.1-<wbr>truncate-open-mode.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/busybox-1.2=
4.1-unzip-<wbr>regression.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/busybox-1.2=
4.1-unzip.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/busybox-kbu=
ild-race-<wbr>fix-commit-d8e61bb.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/commit-appl=
et_tables-<wbr>fix-commit-0dddbc1.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/busybox/<wbr>busybox/ip_fix_prob=
lem_on_<wbr>mips64_n64_big_endian_musl_<wbr>systems.patch<br>
=C2=A0rename meta/recipes-core/busybox/{<a href=3D"http://busybox_1.24.1.bb=
" rel=3D"noreferrer" target=3D"_blank">bus<wbr>ybox_1.24.1.bb</a> =3D&gt; <=
a href=3D"http://busybox_1.26.2.bb" rel=3D"noreferrer" target=3D"_blank">bu=
sybox_1.26.2.bb</a>} (66%)<br>
<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/0001-flock-update-the-<=
wbr>behaviour-of-c-parameter-to-<wbr>match-u.patch b/meta/recipes-core/busy=
box/<wbr>busybox/0001-flock-update-the-<wbr>behaviour-of-c-parameter-to-<wb=
r>match-u.patch<br>
deleted file mode 100644<br>
index 8bcbd73..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/0001-flock-update-the-<wbr>beh=
aviour-of-c-parameter-to-<wbr>match-u.patch<br>
+++ /dev/null<br>
@@ -1,73 +0,0 @@<br>
-From 198f18addf1d814c2fefcb492f3b9f<wbr>bd221669bb Mon Sep 17 00:00:00 200=
1<br>
-From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin.john@intel.com=
">maxin.john@intel.com</a>&gt;<br>
-Date: Wed, 20 Apr 2016 18:24:45 +0300<br>
-Subject: [PATCH] flock: update the behaviour of -c parameter to match upst=
ream<br>
-<br>
-In upstream, -c &#39;PROG ARGS&#39; means &quot;run sh -c &#39;PROG ARGS&#=
39;&quot;<br>
-<br>
-function=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0old=C2=A0 =C2=A0 =C2=A0new=C2=A0 =C2=A0delta<br>
-flock_main=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0286=C2=A0 =C2=A0 =C2=A0377=C2=A0 =C2=A0 =C2=A0+91<br>
-.rodata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0155849=C2=A0 155890=C2=A0 =C2=A0 =C2=A0+41<br>
-<br>
-Upstream-Status: Submitted<br>
-[ <a href=3D"http://lists.busybox.net/pipermail/busybox/2016-April/084142.=
html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/<wbr>pi=
permail/busybox/2016-April/<wbr>084142.html</a> ]<br>
-<br>
-Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">m=
axin.john@intel.com</a>&gt;<br>
----<br>
- util-linux/flock.c | 20 ++++++++++++++------<br>
- 1 file changed, 14 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/util-linux/flock.c b/util-linux/flock.c<br>
-index 05a747f..c85a25d 100644<br>
---- a/util-linux/flock.c<br>
-+++ b/util-linux/flock.c<br>
-@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VI=
SIBLE;<br>
- int flock_main(int argc UNUSED_PARAM, char **argv)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int mode, opt, fd;<br>
-+=C2=A0 =C2=A0 char *cmd_args[4];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0enum {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT_s =3D (1 &lt;&l=
t; 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPT_x =3D (1 &lt;&l=
t; 1),<br>
-@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If it is &quot;flock FILE -c PROG&quot;, the=
n -c isn&#39;t caught by getopt32:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * we use &quot;+&quot; in order to support &qu=
ot;flock -opt FILE PROG -with-opts&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * we need to remove -c by hand.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO: in upstream, -c &#39;PROG ARGS&#39; me=
ans &quot;run sh -c &#39;PROG ARGS&#39;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (argv[0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; argv[0][0] =3D=3D &#39;-&#39;<br>
-@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (ENABLE_LONG_OPTS &amp;&amp; s=
trcmp(argv[0] + 1, &quot;-command&quot;) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv++;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (argc !=3D optind + 3)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_error_msg_and_die(&quot;-c r=
equires exactly one command argument&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (OPT_s =3D=3D LOCK_SH &amp;&amp; OPT_x =3D=
=3D LOCK_EX &amp;&amp; OPT_n =3D=3D LOCK_NB &amp;&amp; OPT_u =3D=3D LOCK_UN=
) {<br>
-@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return EXIT_FAILURE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_perror_nomsg_and=
_die();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 if (argv[0])<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return spawn_and_wait(ar=
gv);<br>
--<br>
-+=C2=A0 =C2=A0 if (argv[0]) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args[0] =3D getenv(&quot;SHELL&quot;);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cmd_args[0])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args[0] =3D (char*)DEFAULT_=
SHELL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args[1] =3D (char*)&quot;-c&quot;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args[2] =3D argv[0];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args[3] =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return spawn_and_wait(cmd_args);<br>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return EXIT_SUCCESS;<br>
- }<br>
---<br>
-2.4.0<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/0001-libiproute-<wbr>ha=
ndle-table-ids-larger-than-<wbr>255.patch b/meta/recipes-core/busybox/<wbr>=
busybox/0001-libiproute-<wbr>handle-table-ids-larger-than-<wbr>255.patch<br=
>
deleted file mode 100644<br>
index aac5b40..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/0001-libiproute-<wbr>handle-ta=
ble-ids-larger-than-<wbr>255.patch<br>
+++ /dev/null<br>
@@ -1,134 +0,0 @@<br>
-From b5a9234272e6084557224c73ab7737<wbr>ed47f09848 Mon Sep 17 00:00:00 200=
1<br>
-From: Lukasz Nowak &lt;<a href=3D"mailto:lnowak@tycoint.com">lnowak@tycoin=
t.com</a>&gt;<br>
-Date: Wed, 23 Nov 2016 12:48:21 +0000<br>
-Subject: [PATCH v2] libiproute: handle table ids larger than 255<br>
-<br>
-Linux kernel, starting from 2.6.19 allows ip table ids to have 32-bit valu=
es.<br>
-In order to preserve compatibility, the old 8-bit field: rtm_table is stil=
l<br>
-in use when table id is lower than 256.<br>
-<br>
-Add support for the 32-bit table id (RTA_TABLE attribute) in:<br>
-- ip route print<br>
-- ip route modify<br>
-- ip rule print<br>
-- ip rule modify<br>
-<br>
-Add printing of table ids to ip route.<br>
-<br>
-Changes are compatible with the mainline iproute2 utilities.<br>
-<br>
-These changes are required for compatibility with ConnMan, which by defaul=
t<br>
-uses table ids greater than 255.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"http://lists.busybox.net/pipermail/=
busybox/2016-December/084989.html" rel=3D"noreferrer" target=3D"_blank">htt=
p://lists.busybox.net/<wbr>pipermail/busybox/2016-<wbr>December/084989.html=
</a>]<br>
-<br>
-Signed-off-by: Lukasz Nowak &lt;<a href=3D"mailto:lnowak@tycoint.com">lnow=
ak@tycoint.com</a>&gt;<br>
----<br>
- networking/libiproute/iproute.<wbr>c | 24 ++++++++++++++++++++----<br>
- networking/libiproute/iprule.c=C2=A0 | 11 +++++++++--<br>
- 2 files changed, 29 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/networking/libiproute/<wbr>iproute.c b/networking/libiproute/=
<wbr>iproute.c<br>
-index 6ecd5f7..d5af498 100644<br>
---- a/networking/libiproute/<wbr>iproute.c<br>
-+++ b/networking/libiproute/<wbr>iproute.c<br>
-@@ -87,6 +87,7 @@ static int FAST_FUNC print_route(const struct sockaddr_n=
l *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0inet_prefix dst;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0inet_prefix src;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int host_len =3D -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint32_t tid;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n-&gt;nlmsg_type !=3D RTM_NEWROUTE &amp;&am=
p; n-&gt;nlmsg_type !=3D RTM_DELROUTE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;Not a route: %08x %08x %08x\n&quot;,<br>
-@@ -99,6 +100,14 @@ static int FAST_FUNC print_route(const struct sockaddr=
_nl *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_error_msg_and_di=
e(&quot;wrong nlmsg len %d&quot;, len);<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 memset(tb, 0, sizeof(tb));<br>
-+=C2=A0 =C2=A0 =C2=A0 parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (tb[RTA_TABLE])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tid =3D *(uint32_t *)RTA=
_DATA(tb[RTA_TABLE]);<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tid =3D r-&gt;rtm_table;=
<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r-&gt;rtm_family =3D=3D AF_INET6)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_len =3D 128;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (r-&gt;rtm_family =3D=3D AF_INET)<br>
-@@ -128,7 +137,7 @@ static int FAST_FUNC print_route(const struct sockaddr=
_nl *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (G_filter.tb &gt; 0 &=
amp;&amp; G_filter.tb !=3D r-&gt;rtm_table) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (G_filter.tb &gt; 0 &=
amp;&amp; G_filter.tb !=3D tid) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -157,10 +166,8 @@ static int FAST_FUNC print_route(const struct sockadd=
r_nl *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 memset(tb, 0, sizeof(tb));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;src, 0, sizeof(src));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;dst, 0, sizeof(dst));<br>
--=C2=A0 =C2=A0 =C2=A0 parse_rtattr(tb, RTA_MAX, RTM_RTA(r), len);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb[RTA_SRC]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src.bitlen =3D r-&g=
t;rtm_src_len;<br>
-@@ -283,6 +290,10 @@ static int FAST_FUNC print_route(const struct sockadd=
r_nl *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb[RTA_OIF]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;dev %s=
 &quot;, ll_index_to_name(*(int*)RTA_<wbr>DATA(tb[RTA_OIF])));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+#if ENABLE_FEATURE_IP_RULE<br>
-+=C2=A0 =C2=A0 =C2=A0 if (tid &amp;&amp; tid !=3D RT_TABLE_MAIN &amp;&amp;=
 !G_filter.tb)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;table %s &q=
uot;, rtnl_rttable_n2a(tid));<br>
-+#endif<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Todo: parse &amp; show &quot;proto kernel&qu=
ot;, &quot;scope link&quot; here */<br>
-<br>
-@@ -434,7 +445,12 @@ IF_FEATURE_IP_RULE(ARG_table,)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NEXT_ARG();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (rtnl_rttable_a2n(&amp;tid, *argv))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invarg(*argv, &quot;table&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 req.r.rtm_table =3D tid;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tid &lt; 256)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.r.rtm_table =3D tid;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.r.rtm_table =3D RT_TABLE_UNSPEC;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addattr32(&amp;req.n, sizeof(req), RTA_TABL=
E, tid);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (arg =3D=
=3D ARG_dev || arg =3D=3D ARG_oif) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NEXT_ARG();<br>
-diff --git a/networking/libiproute/<wbr>iprule.c b/networking/libiproute/<=
wbr>iprule.c<br>
-index 774a3e2..3fac7c5 100644<br>
---- a/networking/libiproute/<wbr>iprule.c<br>
-+++ b/networking/libiproute/<wbr>iprule.c<br>
-@@ -119,7 +119,9 @@ static int FAST_FUNC print_rule(const struct sockaddr_=
nl *who UNUSED_PARAM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;iif %s=
 &quot;, (char*)RTA_DATA(tb[RTA_IIF]));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (r-&gt;rtm_table)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (tb[RTA_TABLE])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;lookup %s &=
quot;, rtnl_rttable_n2a(*(uint32_t*)<wbr>RTA_DATA(tb[RTA_TABLE])));<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (r-&gt;rtm_table)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;lookup=
 %s &quot;, rtnl_rttable_n2a(r-&gt;rtm_table)<wbr>);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tb[RTA_FLOW]) {<br>
-@@ -259,7 +261,12 @@ static int iprule_modify(int cmd, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NEXT_ARG();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (rtnl_rttable_a2n(&amp;tid, *argv))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invarg(*argv, &quot;table ID&quot;);<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 req.r.rtm_table =3D tid;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (tid &lt; 256)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.r.rtm_table =3D tid;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.r.rtm_table =3D RT_TABLE_UNSPEC;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addattr32(&amp;req.n, sizeof(req), RTA_TABL=
E, tid);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0table_ok =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (key =3D=
=3D ARG_dev ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 key =3D=3D ARG_iif<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/0001-sed-fix-sed-n-<wbr=
>flushes-pattern-space-<wbr>terminates-early.patch b/meta/recipes-core/busy=
box/<wbr>busybox/0001-sed-fix-sed-n-<wbr>flushes-pattern-space-<wbr>termina=
tes-early.patch<br>
deleted file mode 100644<br>
index 4f53984..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/0001-sed-fix-sed-n-<wbr>flushe=
s-pattern-space-<wbr>terminates-early.patch<br>
+++ /dev/null<br>
@@ -1,72 +0,0 @@<br>
-From 903542f7331c58007a3ef938d41e1c<wbr>55fc329648 Mon Sep 17 00:00:00 200=
1<br>
-From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
-Date: Wed, 31 Aug 2016 23:40:43 -0400<br>
-Subject: [PATCH] sed: fix &quot;sed n (flushes pattern space, terminates e=
arly)&quot;<br>
- testcase failure<br>
-<br>
-This patch fix &quot;sed n (flushes pattern space, terminates early)&quot;=
<br>
-testcase failure. We can see it at:<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.busybox.net/busybox/comm=
it/?id=3D76d72376e0244a5cafd4880cdc623e37d86a75e4" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.busybox.net/<wbr>busybox/commit/?id=3D<wbr>76d7237=
6e0244a5cafd4880cdc623e<wbr>37d86a75e4</a><br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
----<br>
- editors/sed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++++++---------<br>
- testsuite/sed.tests |=C2=A0 6 +-----<br>
- 2 files changed, 11 insertions(+), 14 deletions(-)<br>
-<br>
-diff --git a/editors/sed.c b/editors/sed.c<br>
-index 7bbf820..259c39c 100644<br>
---- a/editors/sed.c<br>
-+++ b/editors/sed.c<br>
-@@ -1274,16 +1274,17 @@ static void process_files(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;n&#39;:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!G.be_quiet)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed_puts(pattern_space, last_gets_cha=
r);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (next_line) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(pattern_space);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pattern_space =3D next_line;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_gets_char =3D next_gets_char;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next_line =3D get_next_line(&amp;next_gets_=
char, &amp;last_puts_char, last_gets_char);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 substituted =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linenum++;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (next_line =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If no next line, jump to end of script a=
nd exit. */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto discard_line;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* fall through */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 free(pattern_space);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pattern_space =3D next_line;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 last_gets_char =3D next_gets_char;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 next_line =3D get_next_line(&amp;next_gets_char, &amp;last_puts_char, l=
ast_gets_char);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 substituted =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 linenum++;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Quit.=C2=A0 End =
of script, end of input. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;q&#39;:<b=
r>
-diff --git a/testsuite/sed.tests b/testsuite/sed.tests<br>
-index 34479e5..96ff7a5 100755<br>
---- a/testsuite/sed.tests<br>
-+++ b/testsuite/sed.tests<br>
-@@ -73,13 +73,9 @@ testing &quot;sed t (test/branch clears test bit)&quot;=
 &quot;sed -e &#39;s/a/b/;:loop;t loop&#39;&quot; \<br>
- testing &quot;sed T (!test/branch)&quot; &quot;sed -e &#39;s/a/1/;T noton=
e;p;: notone;p&#39;&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;1\n1\n1\nb\nb\nc\nc\n&quot; &quot;&quot; =
&quot;a\nb\nc\n&quot;<br>
-<br>
--test x&quot;$SKIP_KNOWN_BUGS&quot; =3D x&quot;&quot; &amp;&amp; {<br>
--# Normal sed end-of-script doesn&#39;t print &quot;c&quot; because n flus=
hed the pattern<br>
--# space.=C2=A0 If n hits EOF, pattern space is empty when script ends.<br=
>
--# Query: how does this interact with no newline at EOF?<br>
- testing &quot;sed n (flushes pattern space, terminates early)&quot; &quot=
;sed -e &#39;n;p&#39;&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;a\nb\nb\nc\n&quot; &quot;&quot; &quot;a\n=
b\nc\n&quot;<br>
--}<br>
-+<br>
- # non-GNU sed: N does _not_ flush pattern space, therefore c is eaten @ s=
cript end<br>
- # GNU sed: N flushes pattern space, therefore c is printed too @ script e=
nd<br>
- testing &quot;sed N (flushes pattern space (GNU behavior))&quot; &quot;se=
d -e &#39;N;p&#39;&quot; \<br>
---<br>
-2.8.1<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147.patch b/m=
eta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147.patch<br>
deleted file mode 100644<br>
index 84cae6a..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-From d474ffc68290e0a83651c4432eeabf<wbr>a62cd51e87 Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Thu, 10 Mar 2016 11:47:58 +0100<br>
-Subject: [PATCH] udhcp: fix a SEGV on malformed RFC1035-encoded domain nam=
e<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2016-2147<br>
-<br>
-<a href=3D"https://git.busybox.net/busybox/commit/?id=3Dd474ffc" rel=3D"no=
referrer" target=3D"_blank">https://git.busybox.net/<wbr>busybox/commit/?id=
=3Dd474ffc</a><br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akus=
ter@mvista.com</a>&gt;<br>
-<br>
----<br>
- networking/udhcp/domain_codec.<wbr>c | 13 +++++++++----<br>
- 1 file changed, 9 insertions(+), 4 deletions(-)<br>
-<br>
-Index: busybox-1.23.2/networking/<wbr>udhcp/domain_codec.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- busybox-1.23.2.orig/<wbr>networking/udhcp/domain_codec.<wbr>c<br>
-+++ busybox-1.23.2/networking/<wbr>udhcp/domain_codec.c<br>
-@@ -63,11 +63,10 @@ char* FAST_FUNC dname_dec(const uint8_t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtpos + *c + 1 &gt; clen) /* lab=
el too long? abort */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NU=
LL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dst)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(dst + le=
n, c + 1, *c);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* \3com ---&gt=
; &quot;com.&quot; */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char*)mempcpy=
(dst + len, c + 1, *c))[0] =3D &#39;.&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D *c + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtpos +=3D *c + 1;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dst)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst[len - 1] =
=3D &#39;.&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* NUL: end of current domain name */=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retpos =3D=3D 0) {<br>
-@@ -78,7 +77,10 @@ char* FAST_FUNC dname_dec(const uint8_t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtpos =
=3D retpos;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retpos =
=3D depth =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dst)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dst &amp;&amp; len !=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* \4host\3com\=
0\4host and we are at \0:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* \3com w=
as converted to &quot;com.&quot;, change dot to space.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[len -=
 1] =3D &#39; &#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-<br>
-@@ -228,6 +230,9 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *encoded;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t str[6] =3D { 0x00, 0x00, 0x02, 0x65, =
0x65, 0x00 };<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;NUL:&#39;%s&#39;\n&quot;,=C2=A0 =
=C2=A0dname_dec(str, 6, &quot;&quot;));<br>
-+<br>
- #define DNAME_DEC(encoded,pre) dname_dec((uint8_t*)(encoded), sizeof(enco=
ded), (pre))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;&#39;%s&#39;\n&quot;,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0DNAME_DEC(&quot;\4host\3com\0&quot;, &quot;test1:&quot;));<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;test2:&#39;%s&#39;\n&quot;, DNAME_=
DEC(&quot;\4host\3com\0\<wbr>4host\3com\0&quot;, &quot;&quot;));<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147_2.patch b=
/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147_2.patch<br>
deleted file mode 100644<br>
index 1473d46..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2147_2.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 1b7c17391de66502dd7a97c866e0a3<wbr>3681edbb1f Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Fri, 11 Mar 2016 00:26:58 +0100<br>
-Subject: [PATCH] udhcpc: fix a warning in debug code<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-Upsteam-Status: Backport<br>
-CVE: CVE-2016-2147 regression fix<br>
-<br>
-<a href=3D"https://git.busybox.net/busybox/commit/?id=3D1b7c17" rel=3D"nor=
eferrer" target=3D"_blank">https://git.busybox.net/<wbr>busybox/commit/?id=
=3D1b7c17</a><br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akus=
ter@mvista.com</a>&gt;<br>
-<br>
----<br>
- networking/udhcp/domain_codec.<wbr>c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/networking/udhcp/domain_<wbr>codec.c b/networking/udhcp/domai=
n_<wbr>codec.c<br>
-index cee31f1..5a923cc 100644<br>
---- a/networking/udhcp/domain_<wbr>codec.c<br>
-+++ b/networking/udhcp/domain_<wbr>codec.c<br>
-@@ -7,6 +7,7 @@<br>
-=C2=A0 * Licensed under GPLv2 or later, see file LICENSE in this source tr=
ee.<br>
-=C2=A0 */<br>
- #ifdef DNS_COMPR_TESTING<br>
-+# define _GNU_SOURCE<br>
- # define FAST_FUNC /* nothing */<br>
- # define xmalloc malloc<br>
- # include &lt;stdlib.h&gt;<br>
---<br>
-2.3.5<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2148.patch b/m=
eta/recipes-core/busybox/<wbr>busybox/CVE-2016-2148.patch<br>
deleted file mode 100644<br>
index af04a7f..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/CVE-2016-2148.patch<br>
+++ /dev/null<br>
@@ -1,74 +0,0 @@<br>
-From 352f79acbd759c14399e39baef21fc<wbr>4ffe180ac2 Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Fri, 26 Feb 2016 15:54:56 +0100<br>
-Subject: [PATCH] udhcpc: fix OPTION_6RD parsing (could overflow its malloc=
ed<br>
- buffer)<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2016-2148<br>
-<a href=3D"https://git.busybox.net/busybox/commit/?id=3D352f79" rel=3D"nor=
eferrer" target=3D"_blank">https://git.busybox.net/<wbr>busybox/commit/?id=
=3D352f79</a><br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akus=
ter@mvista.com</a>&gt;<br>
-<br>
----<br>
- networking/udhcp/common.c | 15 +++++++++++++--<br>
- networking/udhcp/dhcpc.c=C2=A0 |=C2=A0 4 ++--<br>
- 2 files changed, 15 insertions(+), 4 deletions(-)<br>
-<br>
-Index: busybox-1.23.2/networking/<wbr>udhcp/common.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- busybox-1.23.2.orig/<wbr>networking/udhcp/common.c<br>
-+++ busybox-1.23.2/networking/<wbr>udhcp/common.c<br>
-@@ -142,7 +142,7 @@ const char dhcp_option_strings[] ALIGN1<br>
-=C2=A0 * udhcp_str2optset: to determine how many bytes to allocate.<br>
-=C2=A0 * xmalloc_optname_optval: to estimate string length<br>
-=C2=A0 * from binary option length: (option[LEN] / dhcp_option_lengths[opt=
_type])<br>
-- * is the number of elements, multiply in by one element&#39;s string wid=
th<br>
-+ * is the number of elements, multiply it by one element&#39;s string wid=
th<br>
-=C2=A0 * (len_of_option_as_string[opt_<wbr>type]) and you know how wide st=
ring you need.<br>
-=C2=A0 */<br>
- const uint8_t dhcp_option_lengths[] ALIGN1 =3D {<br>
-@@ -162,7 +162,18 @@ const uint8_t dhcp_option_lengths[] ALIG<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_S32] =3D=C2=A0 =C2=A0 =C2=A04,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Just like OPTION_STRING, we use minimum leng=
th here */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_STATIC_ROUTES] =3D 5,<br>
--=C2=A0 =C2=A0 =C2=A0 [OPTION_6RD] =3D=C2=A0 =C2=A0 22,=C2=A0 /* ignored b=
y udhcp_str2optset */<br>
-+=C2=A0 =C2=A0 =C2=A0 [OPTION_6RD] =3D=C2=A0 =C2=A0 12,=C2=A0 /* ignored b=
y udhcp_str2optset */<br>
-+=C2=A0 =C2=A0 =C2=A0 /* The above value was chosen as follows:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* len_of_option_as_string[] for this option is=
 &gt;60: it&#39;s a string of the form<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;32 128 ffff:ffff:ffff:ffff:ffff:ffff:<=
wbr>ffff:ffff 255.255.255.255 &quot;.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* Each additional ipv4 address takes 4 bytes i=
n binary option and appends<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* another &quot;255.255.255.255 &quot; 16-byte=
 string. We can set [OPTION_6RD] =3D 4<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* but this severely overestimates string lengt=
h: instead of 16 bytes,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* it adds &gt;60 for every 4 bytes in binary o=
ption.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* We cheat and declare here that option is in =
units of 12 bytes.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* This adds more than 60 bytes for every three=
 ipv4 addresses - more than enough.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* (Even 16 instead of 12 should work, but let&=
#39;s be paranoid).<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
- };<br>
-<br>
-<br>
-Index: busybox-1.23.2/networking/<wbr>udhcp/dhcpc.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- busybox-1.23.2.orig/<wbr>networking/udhcp/dhcpc.c<br>
-+++ busybox-1.23.2/networking/<wbr>udhcp/dhcpc.c<br>
-@@ -103,7 +103,7 @@ static const uint8_t len_of_option_as_st<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_IP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ] =3D sizeof(&quot;255.255.255.255 &quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_IP_PAIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0] =3D sizeof(&quot;255.255.255.255 &quot;) * 2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_STATIC_ROUTES=C2=A0 =C2=A0] =3D sizeof(=
&quot;<a href=3D"http://255.255.255.255/32" rel=3D"noreferrer" target=3D"_b=
lank">255.255.255.255/32</a> 255.255.255.255 &quot;),<br>
--=C2=A0 =C2=A0 =C2=A0 [OPTION_6RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0] =3D sizeof(&quot;32 128 ffff:ffff:ffff:ffff:ffff:ffff:<wbr>ffff:ff=
ff 255.255.255.255 &quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 [OPTION_6RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0] =3D sizeof(&quot;132 128 ffff:ffff:ffff:ffff:ffff:ffff:<wbr>ffff:f=
fff 255.255.255.255 &quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_STRING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ] =3D 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_STRING_HOST=C2=A0 =C2=A0 =C2=A0] =3D 1,=
<br>
- #if ENABLE_FEATURE_UDHCP_RFC3397<br>
-@@ -214,7 +214,7 @@ static NOINLINE char *xmalloc_optname_op<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D optflag-&gt;flags &amp; OPTION_TYPE_MA=
SK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0optlen =3D dhcp_option_lengths[type];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0upper_length =3D len_of_option_as_string[type]<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ((unsigned)(len + optl=
en - 1) / (unsigned)optlen);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ((unsigned)(len + optl=
en) / (unsigned)optlen);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D ret =3D xmalloc(upper_length + strlen(=
opt_name) + 2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dest +=3D sprintf(ret, &quot;%s=3D&quot;, opt_n=
ame);<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-<wbr>tru=
ncate-open-mode.patch b/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24=
.1-<wbr>truncate-open-mode.patch<br>
deleted file mode 100644<br>
index cdc9108..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-<wbr>truncate-o=
pen-mode.patch<br>
+++ /dev/null<br>
@@ -1,81 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-=C2=A0 <a href=3D"http://busybox.net/downloads/fixes-1.24.1/" rel=3D"noref=
errer" target=3D"_blank">http://busybox.net/downloads/<wbr>fixes-1.24.1/</a=
><br>
-=C2=A0 <a href=3D"https://git.busybox.net/busybox/commit/?id=3De111a164049=
4fe87fc913f94fae3bb805de0fc99" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.busybox.net/<wbr>busybox/commit/?id=3D<wbr>e111a1640494fe87fc913f94fae=
3bb<wbr>805de0fc99</a><br>
-=C2=A0 <a href=3D"https://git.busybox.net/busybox/commit/?h=3D1_24_stable&=
amp;id=3Dbe729c1d3b5c923f10871dd68ea94156d0f8c803" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.busybox.net/<wbr>busybox/commit/?h=3D1_24_stable&a=
mp;<wbr>id=3D<wbr>be729c1d3b5c923f10871dd68ea941<wbr>56d0f8c803</a><br>
-<br>
-Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">ar=
mccurdy@gmail.com</a>&gt;<br>
-<br>
-From be729c1d3b5c923f10871dd68ea941<wbr>56d0f8c803 Mon Sep 17 00:00:00 200=
1<br>
-From: Ari Sundholm &lt;<a href=3D"mailto:ari@tuxera.com">ari@tuxera.com</a=
>&gt;<br>
-Date: Mon, 4 Jan 2016 15:40:37 +0200<br>
-Subject: [PATCH] truncate: always set mode when opening file to avoid fort=
ify<br>
- errors<br>
-<br>
-Busybox crashes due to no mode being given when opening:<br>
-$ ./busybox truncate -s 1M foo<br>
-*** invalid open64 call: O_CREAT without mode ***: ./busybox terminated<br=
>
-=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-/lib/x86_64-linux-gnu/libc.<wbr>so.6(+0x7338f)[0x7f66d921338f]<br>
-/lib/x86_64-linux-gnu/libc.<wbr>so.6(__fortify_fail+0x5c)[<wbr>0x7f66d92aa=
c9c]<br>
-/lib/x86_64-linux-gnu/libc.<wbr>so.6(+0xeb6aa)[0x7f66d928b6aa]<br>
-./busybox[0x4899f9]<br>
-=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D<br>
-00400000-004d0000 r-xp 00000000 00:1a 137559=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/home/ari/busybox/busybox<br>
-006cf000-006d0000 r--p 000cf000 00:1a 137559=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/home/ari/busybox/busybox<br>
-006d0000-006d1000 rw-p 000d0000 00:1a 137559=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/home/ari/busybox/busybox<br>
-006d1000-006d4000 rw-p 00000000 00:00 0<br>
-014e7000-01508000 rw-p 00000000 00:00 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [heap]<br>
-7f66d8f8a000-7f66d8fa0000 r-xp 00000000 08:07 1579008=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/libg=
cc_<wbr>s.so.1<br>
-7f66d8fa0000-7f66d919f000 ---p 00016000 08:07 1579008=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/libg=
cc_<wbr>s.so.1<br>
-7f66d919f000-7f66d91a0000 rw-p 00015000 08:07 1579008=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/libg=
cc_<wbr>s.so.1<br>
-7f66d91a0000-7f66d935b000 r-xp 00000000 08:07 1578994=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libc-2.19.so" rel=3D"noreferrer" target=3D"_blank">libc-2.<wb=
r>19.so</a><br>
-7f66d935b000-7f66d955a000 ---p 001bb000 08:07 1578994=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libc-2.19.so" rel=3D"noreferrer" target=3D"_blank">libc-2.<wb=
r>19.so</a><br>
-7f66d955a000-7f66d955e000 r--p 001ba000 08:07 1578994=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libc-2.19.so" rel=3D"noreferrer" target=3D"_blank">libc-2.<wb=
r>19.so</a><br>
-7f66d955e000-7f66d9560000 rw-p 001be000 08:07 1578994=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libc-2.19.so" rel=3D"noreferrer" target=3D"_blank">libc-2.<wb=
r>19.so</a><br>
-7f66d9560000-7f66d9565000 rw-p 00000000 00:00 0<br>
-7f66d9565000-7f66d966a000 r-xp 00000000 08:07 1579020=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libm-2.19.so" rel=3D"noreferrer" target=3D"_blank">libm-2.<wb=
r>19.so</a><br>
-7f66d966a000-7f66d9869000 ---p 00105000 08:07 1579020=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libm-2.19.so" rel=3D"noreferrer" target=3D"_blank">libm-2.<wb=
r>19.so</a><br>
-7f66d9869000-7f66d986a000 r--p 00104000 08:07 1579020=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libm-2.19.so" rel=3D"noreferrer" target=3D"_blank">libm-2.<wb=
r>19.so</a><br>
-7f66d986a000-7f66d986b000 rw-p 00105000 08:07 1579020=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://libm-2.19.so" rel=3D"noreferrer" target=3D"_blank">libm-2.<wb=
r>19.so</a><br>
-7f66d986b000-7f66d988e000 r-xp 00000000 08:07 1578981=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://ld-2.19.so" rel=3D"noreferrer" target=3D"_blank">ld-2.19.<wbr=
>so</a><br>
-7f66d9a64000-7f66d9a67000 rw-p 00000000 00:00 0<br>
-7f66d9a8a000-7f66d9a8d000 rw-p 00000000 00:00 0<br>
-7f66d9a8d000-7f66d9a8e000 r--p 00022000 08:07 1578981=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://ld-2.19.so" rel=3D"noreferrer" target=3D"_blank">ld-2.19.<wbr=
>so</a><br>
-7f66d9a8e000-7f66d9a8f000 rw-p 00023000 08:07 1578981=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib/x86_64-linux-gnu/<a h=
ref=3D"http://ld-2.19.so" rel=3D"noreferrer" target=3D"_blank">ld-2.19.<wbr=
>so</a><br>
-7f66d9a8f000-7f66d9a90000 rw-p 00000000 00:00 0<br>
-7ffc47761000-7ffc47782000 rw-p 00000000 00:00 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [stack]<br>
-7ffc477ab000-7ffc477ad000 r-xp 00000000 00:00 0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [vdso]<br>
-ffffffffff600000-<wbr>ffffffffff601000 r-xp 00000000 00:00 0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [vsyscall]<br>
-Aborted (core dumped)<br>
-$<br>
-<br>
-Fix this by simply always setting the mode, as it doesn&#39;t hurt even<br=
>
-when O_CREAT is not specified.<br>
-<br>
-This bug is a regression introduced in fc3e40e, as xopen(), which<br>
-was originally used, would automatically set the mode.<br>
-<br>
-Signed-off-by: Ari Sundholm &lt;<a href=3D"mailto:ari@tuxera.com">ari@tuxe=
ra.com</a>&gt;<br>
-Signed-off-by: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org">vap=
ier@gentoo.org</a>&gt;<br>
-(cherry picked from commit e111a1640494fe87fc913f94fae3bb<wbr>805de0fc99)<=
br>
----<br>
- coreutils/truncate.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/coreutils/truncate.c b/coreutils/truncate.c<br>
-index e5fa656..4c997bf 100644<br>
---- a/coreutils/truncate.c<br>
-+++ b/coreutils/truncate.c<br>
-@@ -64,7 +64,7 @@ int truncate_main(int argc UNUSED_PARAM, char **argv)<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0argv +=3D optind;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (*argv) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd =3D open(*argv, f=
lags);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd =3D open(*argv, f=
lags, 0666);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (errno !=3D ENOENT || !(opts &amp; OPT_NOCREATE)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_perror_msg(&quot;%s: open&quot;, *=
argv);<br>
---<br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-unzip-<w=
br>regression.patch b/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1=
-unzip-<wbr>regression.patch<br>
deleted file mode 100644<br>
index e3c5020..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-unzip-<wbr>regr=
ession.patch<br>
+++ /dev/null<br>
@@ -1,143 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-=C2=A0 <a href=3D"http://busybox.net/downloads/fixes-1.24.1/" rel=3D"noref=
errer" target=3D"_blank">http://busybox.net/downloads/<wbr>fixes-1.24.1/</a=
><br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?id=3D092fabcf1df5=
d46cd22be4ffcd3b871f6180eb9c" rel=3D"noreferrer" target=3D"_blank">http://g=
it.busybox.net/<wbr>busybox/commit/?id=3D<wbr>092fabcf1df5d46cd22be4ffcd3b8=
7<wbr>1f6180eb9c</a><br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?h=3D1_24_stable&a=
mp;id=3D092fabcf1df5d46cd22be4ffcd3b871f6180eb9c" rel=3D"noreferrer" target=
=3D"_blank">http://git.busybox.net/<wbr>busybox/commit/?h=3D1_24_stable&amp=
;<wbr>id=3D<wbr>092fabcf1df5d46cd22be4ffcd3b87<wbr>1f6180eb9c</a><br>
-<br>
-Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">ar=
mccurdy@gmail.com</a>&gt;<br>
-<br>
-From 092fabcf1df5d46cd22be4ffcd3b87<wbr>1f6180eb9c Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Fri, 30 Oct 2015 23:41:53 +0100<br>
-Subject: [PATCH] [g]unzip: fix recent breakage.<br>
-<br>
-Also, do emit error message we so painstakingly pass from gzip internals<b=
r>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-(cherry picked from commit 6bd3fff51aa74e2ee2d87887b12182<wbr>a3b09792ef)<=
br>
-Signed-off-by: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org">vap=
ier@gentoo.org</a>&gt;<br>
----<br>
- archival/libarchive/<wbr>decompress_gunzip.c | 33 +++++++++++++++++++++--=
-------<wbr>---<br>
- testsuite/unzip.tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
- 2 files changed, 22 insertions(+), 12 deletions(-)<br>
-<br>
-diff --git a/archival/libarchive/<wbr>decompress_gunzip.c b/archival/libar=
chive/<wbr>decompress_gunzip.c<br>
-index c76fd31..357c9bf 100644<br>
---- a/archival/libarchive/<wbr>decompress_gunzip.c<br>
-+++ b/archival/libarchive/<wbr>decompress_gunzip.c<br>
-@@ -309,8 +309,7 @@ static int huft_build(const unsigned *b, const unsigne=
d n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t *q;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* points to current table */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t r;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* table entry for structure assignment */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t *u[BMAX];=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
table stack */<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned v[N_MAX];=C2=A0 =C2=A0 =C2=A0 /* values in =
order of bit length */<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned v_end;<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned v[N_MAX + 1];=C2=A0 /* values in order of b=
it length. last v[] is never used */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ws[BMAX + 1];=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
bits decoded stack */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int w;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* bits decoded */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned x[BMAX + 1];=C2=A0 =C2=A0/* bit offset=
s, then code stack */<br>
-@@ -365,15 +364,17 @@ static int huft_build(const unsigned *b, const unsig=
ned n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*xp++ =3D j;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 /* Make a table of values in order of bit lengths */=
<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Make a table of values in order of bit lengths.<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* To detect bad input, unused v[i]&#39;s are s=
et to invalid value UINT_MAX.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* In particular, last v[i] is never filled and=
 must not be accessed.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 memset(v, 0xff, sizeof(v));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 v_end =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D *p++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (j !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0v[x[j]++] =3D i;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 v_end =3D x[j];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (++i &lt; n);<br>
-<br>
-@@ -435,7 +436,9 @@ static int huft_build(const unsigned *b, const unsigne=
d n,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* set up table entry in r */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r.b =3D (unsigned char) (k - w);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (p &gt;=3D v + v_end) { // Was &quot;if (p &gt;=3D v + n)&quot; but =
v[] can be shorter!<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (/*p &gt;=3D v + n || -- redundant, caught by the second check: */<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *p =3D=3D UINT_MAX /* do we access uninited v[i]? (see me=
mset(v))*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.e =3D 99; /* out of values--invalid=
 code */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else if (*p &lt; s) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.e =3D (unsigned char) (*p &lt; 256 =
? 16 : 15);=C2=A0 =C2=A0 =C2=A0/* 256 is EOB code */<br>
-@@ -520,8 +523,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_<wbr>ONL=
Y)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D t-&gt;e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e &gt; 16)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0do {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D 99)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort_unzip(PAS=
S_STATE_ONLY);;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D 99) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort_unzip(PAS=
S_STATE_ONLY);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb &gt;&gt;=3D t-&gt;b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k -=3D t-&gt;b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e -=3D 16;<br>
-@@ -557,8 +561,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_<wbr>ONL=
Y)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0e =3D t-&gt;e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (e &gt; 16)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D 99=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e =3D=3D 99=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0abort_unzip(PASS_STATE_ONLY);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb &gt;&g=
t;=3D t-&gt;b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k -=3D t-=
&gt;b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e -=3D 16=
;<br>
-@@ -824,8 +829,9 @@ static int inflate_block(STATE_PARAM smallint *e)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b_dynamic &gt;&gt;=
=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k_dynamic -=3D 4;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nl &gt; 286 || nd &g=
t; 30)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nl &gt; 286 || nd &g=
t; 30) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0abort_unzip(PASS_STATE_ONLY);=C2=A0 =C2=A0/* bad lengths */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* read in bit-leng=
th-code lengths */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt=
; nb; j++) {<br>
-@@ -906,12 +912,14 @@ static int inflate_block(STATE_PARAM smallint *e)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bl =3D lbits;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D huft_build(ll=
, nl, 257, cplens, cplext, &amp;inflate_codes_tl, &amp;bl);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i !=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0abort_unzip(PASS_STATE_ONLY);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bd =3D dbits;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D huft_build(ll=
 + nl, nd, 0, cpdist, cpdext, &amp;inflate_codes_td, &amp;bd);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i !=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0abort_unzip(PASS_STATE_ONLY);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set up data for =
inflate_codes() */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inflate_codes_setup=
(PASS_STATE bl, bd);<br>
-@@ -999,6 +1007,7 @@ inflate_unzip_internal(STATE_<wbr>PARAM transformer_s=
tate_t *xstate)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0error_msg =3D &quot;corrupted data&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(error_jmp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Error from deep =
inside zip machinery */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_error_msg(error_msg);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests<br>
-index ca0a458..d8738a3 100755<br>
---- a/testsuite/unzip.tests<br>
-+++ b/testsuite/unzip.tests<br>
-@@ -34,6 +34,7 @@ rm foo.zip<br>
- testing &quot;unzip (bad archive)&quot; &quot;uudecode; unzip bad.zip 2&g=
t;&amp;1; echo \$?&quot; \<br>
- &quot;Archive:=C2=A0 bad.zip<br>
</div></div>-=C2=A0 =C2=A0inflating: ]3j=C3=82=C2=BDr=C3=82=C2=ABI=C2=A0 K-=
%Ix<br>
<div><div class=3D"h5">-+unzip: corrupted data<br>
- unzip: inflate error<br>
- 1<br>
- &quot; \<br>
---<br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-unzip.<w=
br>patch b/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-unzip.<wbr=
>patch<br>
deleted file mode 100644<br>
index 7186726..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-1.24.1-unzip.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,118 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-=C2=A0 <a href=3D"http://busybox.net/downloads/fixes-1.24.1/" rel=3D"noref=
errer" target=3D"_blank">http://busybox.net/downloads/<wbr>fixes-1.24.1/</a=
><br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?id=3D1de25a6e87e0=
e627aa34298105a3d17c60a1f44e" rel=3D"noreferrer" target=3D"_blank">http://g=
it.busybox.net/<wbr>busybox/commit/?id=3D<wbr>1de25a6e87e0e627aa34298105a3d=
1<wbr>7c60a1f44e</a><br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?h=3D1_24_stable&a=
mp;id=3D6767af17f11144c7cd3cfe9ef799d7f89a78fe65" rel=3D"noreferrer" target=
=3D"_blank">http://git.busybox.net/<wbr>busybox/commit/?h=3D1_24_stable&amp=
;<wbr>id=3D<wbr>6767af17f11144c7cd3cfe9ef799d7<wbr>f89a78fe65</a><br>
-<br>
-Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">ar=
mccurdy@gmail.com</a>&gt;<br>
-<br>
-From 1de25a6e87e0e627aa34298105a3d1<wbr>7c60a1f44e Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Mon, 26 Oct 2015 19:33:05 +0100<br>
-Subject: [PATCH] unzip: test for bad archive SEGVing<br>
-<br>
-function=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0old=C2=A0 =C2=A0 =C2=A0new=C2=A0 =C2=A0delta<br>
-huft_build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1296=C2=A0 =C2=A0 1300=C2=A0 =C2=A0 =C2=A0 +4<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
----<br>
- archival/libarchive/<wbr>decompress_gunzip.c | 11 +++++++----<br>
- testsuite/unzip.tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++++++++-<br>
- 2 files changed, 29 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/archival/libarchive/<wbr>decompress_gunzip.c b/archival/libar=
chive/<wbr>decompress_gunzip.c<br>
-index 7b6f459..30bf451 100644<br>
---- a/archival/libarchive/<wbr>decompress_gunzip.c<br>
-+++ b/archival/libarchive/<wbr>decompress_gunzip.c<br>
-@@ -305,11 +305,12 @@ static int huft_build(const unsigned *b, const unsig=
ned n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned i;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* counter, current code */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned j;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* counter */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int k;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* number of bits in current code */<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* pointer into c[], b[], or v[] */<br>
-+=C2=A0 =C2=A0 =C2=A0 const unsigned *p;=C2=A0 =C2=A0 =C2=A0 /* pointer in=
to c[], b[], or v[] */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t *q;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* points to current table */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t r;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* table entry for structure assignment */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0huft_t *u[BMAX];=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
table stack */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned v[N_MAX];=C2=A0 =C2=A0 =C2=A0 /* value=
s in order of bit length */<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned v_end;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ws[BMAX + 1];=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
bits decoded stack */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int w;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* bits decoded */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned x[BMAX + 1];=C2=A0 =C2=A0/* bit offset=
s, then code stack */<br>
-@@ -324,7 +325,7 @@ static int huft_build(const unsigned *b, const unsigne=
d n,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Generate counts for each bit length */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(c, 0, sizeof(c));<br>
--=C2=A0 =C2=A0 =C2=A0 p =3D (unsigned *) b; /* cast allows us to reuse p f=
or pointing to b */<br>
-+=C2=A0 =C2=A0 =C2=A0 p =3D b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D n;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c[*p]++; /* assume =
all entries &lt;=3D BMAX */<br>
-@@ -365,12 +366,14 @@ static int huft_build(const unsigned *b, const unsig=
ned n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make a table of values in order of bit lengt=
hs */<br>
--=C2=A0 =C2=A0 =C2=A0 p =3D (unsigned *) b;<br>
-+=C2=A0 =C2=A0 =C2=A0 p =3D b;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 v_end =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j =3D *p++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (j !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0v[x[j]++] =3D i;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 v_end =3D x[j];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (++i &lt; n);<br>
-<br>
-@@ -432,7 +435,7 @@ static int huft_build(const unsigned *b, const unsigne=
d n,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* set up table entry in r */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0r.b =3D (unsigned char) (k - w);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (p &gt;=3D v + n) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (p &gt;=3D v + v_end) { // Was &quot;if (p &gt;=3D v + n)&quot; but =
v[] can be shorter!<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.e =3D 99; /* out of values--invalid=
 code */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else if (*p &lt; s) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.e =3D (unsigned char) (*p &lt; 256 =
? 16 : 15);=C2=A0 =C2=A0 =C2=A0/* 256 is EOB code */<br>
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests<br>
-index 8677a03..ca0a458 100755<br>
---- a/testsuite/unzip.tests<br>
-+++ b/testsuite/unzip.tests<br>
-@@ -7,7 +7,7 @@<br>
-<br>
- . ./testing.sh<br>
-<br>
--# testing &quot;test name&quot; &quot;options&quot; &quot;expected result=
&quot; &quot;file input&quot; &quot;stdin&quot;<br>
-+# testing &quot;test name&quot; &quot;commands&quot; &quot;expected resul=
t&quot; &quot;file input&quot; &quot;stdin&quot;<br>
- #=C2=A0 =C2=A0file input will be file called &quot;input&quot;<br>
- #=C2=A0 =C2=A0test can create a file &quot;actual&quot; instead of writin=
g to stdout<br>
-<br>
-@@ -30,6 +30,27 @@ testing &quot;unzip (subdir only)&quot; &quot;unzip -q =
foo.zip foo/ &amp;&amp; test -d foo &amp;&amp; test ! -f<br>
- rmdir foo<br>
- rm foo.zip<br>
-<br>
-+# File containing some damaged encrypted stream<br>
-+testing &quot;unzip (bad archive)&quot; &quot;uudecode; unzip bad.zip 2&g=
t;&amp;1; echo \$?&quot; \<br>
-+&quot;Archive:=C2=A0 bad.zip<br>
</div></div>-+=C2=A0 inflating: ]3j=C3=82=C2=BDr=C3=82=C2=ABI=C2=A0 K-%Ix<b=
r>
<div class=3D"HOEnZb"><div class=3D"h5">-+unzip: inflate error<br>
-+1<br>
-+&quot; \<br>
-+&quot;&quot; &quot;\<br>
-+begin-base64 644 bad.zip<br>
-+<wbr>UEsDBBQAAgkIAAAAIQA5AAAANwAAAD<wbr>wAAAAQAAcAXTNqwr1ywqtJGxJLLSVJ<br=
>
-+eCkBD0AdKBk8JzQsIj01JC0/<wbr>ORJQSwMEFAECCAAAAAAhADoAAAAPAA<wbr>AANgAA<br=
>
-+<wbr>AAwAAQASw73Ct1DCokohPXQiNjoUNT<wbr>UiHRwgLT4WHlBLAQIQABQAAggIAAAA<br=
>
-+<wbr>oQA5AAAANwAAADwAAAAQQAcADAAAAC<wbr>wAMgCAAAAAAABdM2rCvXLCq0kbEkst<br=
>
-+<wbr>JUl4KQEPQB0oGSY4Cz4QNgEnJSYIPV<wbr>BLAQIAABQAAggAAAAAIQAqAAAADwAA<br=
>
-+<wbr>BDYAAAAMAAEADQAAADIADQAAAEEAAA<wbr>ASw73Ct1DKokohPXQiNzA+FAI1HCcW<br=
>
-+<wbr>NzITNFBLBQUKAC4JAA04Cw0EOhZQSw<wbr>UGAQAABAIAAgCZAAAAeQAAAAIALhM=3D<=
br>
-+=3D=3D=3D=3D<br>
-+&quot;<br>
-+<br>
-+rm *<br>
-+<br>
- # Clean up scratch directory.<br>
-<br>
- cd ..<br>
---<br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-cross-<wbr>menu=
config.patch b/meta/recipes-core/busybox/<wbr>busybox/busybox-cross-<wbr>me=
nuconfig.patch<br>
index bda8685..9a59001 100644<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-cross-<wbr>menuconfig.=
patch<br>
+++ b/meta/recipes-core/busybox/<wbr>busybox/busybox-cross-<wbr>menuconfig.=
patch<br>
@@ -1,6 +1,5 @@<br>
-From: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason=
.wessel@windriver.com</a>&gt;<br>
-Date: Sun, 3 Mar 2013 12:31:40 -0600<br>
-Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of ncu=
rses location<br>
+Subject: [PATCH] Date: Sun, 3 Mar 2013 12:31:40 -0600 Subject: [PATCH]<br>
+ menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location<br=
>
<br>
=C2=A0Upstream-Status: Submitted<br>
<br>
@@ -29,38 +28,20 @@ compiling and linking against the right headers and lib=
raries.<br>
=C2=A0Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windri=
ver.com">jason.wessel@windriver.com</a>&gt;<br>
=C2=A0cc: Michal Marek &lt;<a href=3D"mailto:mmarek@suse.cz">mmarek@suse.cz=
</a>&gt;<br>
=C2=A0cc: <a href=3D"mailto:linux-kbuild@vger.kernel.org">linux-kbuild@vger=
.kernel.org</a><br>
+<br>
+Updated to Busybox 1.26.2<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0---<br>
- scripts/kconfig/lxdialog/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
- scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh |=C2=A0 =C2=A0 8 ++++++++=
<br>
+ scripts/kconfig/lxdialog/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
+ scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh | 8 ++++++++<br>
=C2=A0 2 files changed, 9 insertions(+), 1 deletion(-)<br>
<br>
---- a/scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh<br>
-+++ b/scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh<br>
-@@ -4,6 +4,10 @@<br>
- # What library to link<br>
- ldflags()<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_LIB&quot; !=3D x ]; then<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$CROSS_CURSES=
_LIB&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for ext in so a dylib ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for lib in ncursesw=
 ncurses curses ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$cc -print-file-name=3Dlib${lib}.${<wbr>ext} | grep -q /<br>
-@@ -19,6 +23,10 @@ ldflags()<br>
- # Where is ncurses.h?<br>
- ccflags()<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_INC&quot; !=3D x ]; then<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$CROSS_CURSES=
_INC&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f /usr/include/ncursesw/ncurses.<wbr>h ];=
 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;-I/usr/in=
clude/ncursesw -DCURSES_LOC=3D&quot;&lt;ncurses.h&gt;&quot;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -f /usr/include/ncursesw/curses.h ]; the=
n<br>
+diff --git a/scripts/kconfig/lxdialog/<wbr>Makefile b/scripts/kconfig/lxdi=
alog/<wbr>Makefile<br>
+index 2c9dc48..cdb4413 100644<br>
=C2=A0--- a/scripts/kconfig/lxdialog/<wbr>Makefile<br>
=C2=A0+++ b/scripts/kconfig/lxdialog/<wbr>Makefile<br>
-@@ -5,7 +5,7 @@ check-lxdialog=C2=A0 :=3D $(srctree)/$(src)/che<br>
+@@ -5,7 +5,7 @@ check-lxdialog=C2=A0 :=3D $(srctree)/$(src)/check-<wbr>lxd=
ialog.sh<br>
<br>
=C2=A0 # Use reursively expanded variables so we do not call gcc unless<br>
=C2=A0 # we really need to do so. (Do not call gcc as part of make mrproper=
)<br>
@@ -69,3 +50,32 @@ cc: <a href=3D"mailto:linux-kbuild@vger.kernel.org">linu=
x-kbuild@vger.kernel.org</a><br>
=C2=A0 HOST_LOADLIBES=C2=A0 =C2=A0=3D $(shell $(CONFIG_SHELL) $(check-lxdia=
log) -ldflags $(HOSTCC))<br>
<br>
=C2=A0 HOST_EXTRACFLAGS +=3D -DLOCALE<br>
+diff --git a/scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh b/scripts/kco=
nfig/lxdialog/<wbr>check-lxdialog.sh<br>
+index 5075ebf..46266cb 100755<br>
+--- a/scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh<br>
++++ b/scripts/kconfig/lxdialog/<wbr>check-lxdialog.sh<br>
+@@ -6,6 +6,10 @@ ldflags()<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkg-config --libs ncursesw 2&gt;/dev/null &amp;=
&amp; exit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pkg-config --libs ncurses 2&gt;/dev/null &amp;&=
amp; exit<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_LIB&quot; !=3D x ];=
 then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$CROSS=
_CURSES_LIB&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ext in so a dll.a dylib ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for lib in ncursesw=
 ncurses curses ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$cc -print-file-name=3Dlib${lib}.${<wbr>ext} | grep -q /<br>
+@@ -21,6 +25,10 @@ ldflags()<br>
+ # Where is ncurses.h?<br>
+ ccflags()<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_INC&quot; !=3D x ];=
 then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$CROSS=
_CURSES_INC&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg-config --cflags ncursesw 2&gt;/dev/null;=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;-DCURSES_=
LOC=3D&quot;&lt;ncurses.h&gt;&quot; -DNCURSES_WIDECHAR=3D1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0elif pkg-config --cflags ncurses 2&gt;/dev/null=
; then<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-kbuild-race-<wb=
r>fix-commit-d8e61bb.patch b/meta/recipes-core/busybox/<wbr>busybox/busybox=
-kbuild-race-<wbr>fix-commit-d8e61bb.patch<br>
deleted file mode 100644<br>
index 38302e0..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-kbuild-race-<wbr>fix-c=
ommit-d8e61bb.patch<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Patch addressing a parallel make race in Busybox<br>
-<br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?id=3Dd8e61bbf13d0=
cf38d477255cfd5dc71c5d51d575" rel=3D"noreferrer" target=3D"_blank">http://g=
it.busybox.net/<wbr>busybox/commit/?id=3D<wbr>d8e61bbf13d0cf38d477255cfd5dc=
7<wbr>1c5d51d575</a><br>
-<br>
-Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om">juro.bystricky@intel.com</a>&gt;<br>
-<br>
-From d8e61bbf13d0cf38d477255cfd5dc7<wbr>1c5d51d575 Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Sun, 21 Aug 2016 22:00:20 +0200<br>
-Subject: build system: different fix for<br>
- include/applet_tables.h/<wbr>include/NUM_APPLETS.h<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-<br>
-diff --git a/applets/Kbuild.src b/applets/Kbuild.src<br>
-index 5cc1827..3aedbbf 100644<br>
---- a/applets/Kbuild.src<br>
-+++ b/applets/Kbuild.src<br>
-@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h include/ap=
plet_tables.h<br>
-<br>
- applets/applet_tables: .config include/applets.h<br>
- applets/usage:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config include/applets.h=
<br>
--applets/usage_pod:=C2=A0 =C2=A0 =C2=A0.config include/applets.h include/a=
pplet_tables.h include/NUM_APPLETS.h<br>
-+applets/usage_pod:=C2=A0 =C2=A0 =C2=A0.config include/applets.h include/a=
pplet_tables.h<br>
-<br>
- quiet_cmd_gen_usage_compressed =3D GEN=C2=A0 =C2=A0 =C2=A0include/usage_c=
ompressed.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_gen_usage_compressed =3D $(srctree_slash)ap=
plets/usage_<wbr>compressed include/usage_compressed.h applets<br>
-@@ -37,8 +37,21 @@ quiet_cmd_gen_usage_compressed =3D GEN=C2=A0 =C2=A0 =C2=
=A0include/usage_compressed.h<br>
- include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage_<=
wbr>compressed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call cmd,gen_usage_compressed)<br>
-<br>
--quiet_cmd_gen_applet_tables =3D GEN=C2=A0 =C2=A0 =C2=A0include/applet_tab=
les.h<br>
-+quiet_cmd_gen_applet_tables =3D GEN=C2=A0 =C2=A0 =C2=A0include/applet_tab=
les.h include/NUM_APPLETS.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd_gen_applet_tables =3D applets/applet_tables=
 include/applet_tables.h include/NUM_APPLETS.h<br>
-<br>
--include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables<br>
-+include/NUM_APPLETS.h: applets/applet_tables<br>
-+=C2=A0 =C2=A0 =C2=A0 $(call cmd,gen_applet_tables)<br>
-+<br>
-+# In fact, include/applet_tables.h depends only on applets/applet_tables,=
<br>
-+# and is generated by it. But specifying only it can run<br>
-+# applets/applet_tables twice, possibly in parallel.<br>
-+# We say that it also needs NUM_APPLETS.h<br>
-+#<br>
-+# Unfortunately, we need to list the same command,<br>
-+# and it can be executed twice (sequentially).<br>
-+# The alternative is to not list any command,<br>
-+# and then if include/applet_tables.h is deleted, it won&#39;t be rebuilt=
.<br>
-+#<br>
-+include/applet_tables.h: include/NUM_APPLETS.h applets/applet_tables<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call cmd,gen_applet_tables)<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/busybox-udhcpc-no_<wbr>=
deconfig.patch b/meta/recipes-core/busybox/<wbr>busybox/busybox-udhcpc-no_<=
wbr>deconfig.patch<br>
index 4c9ce3b..202e086 100644<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/busybox-udhcpc-no_<wbr>deconfi=
g.patch<br>
+++ b/meta/recipes-core/busybox/<wbr>busybox/busybox-udhcpc-no_<wbr>deconfi=
g.patch<br>
@@ -1,6 +1,3 @@<br>
-From 53626cd06a3ef05ed847daea802ef0<wbr>aa9661caa7 Mon Sep 17 00:00:00 200=
1<br>
-From: Anders Darander &lt;<a href=3D"mailto:anders@chargestorm.se">anders@=
chargestorm.se</a>&gt;<br>
-Date: Thu, 3 Nov 2011 08:51:31 +0100<br>
=C2=A0Subject: [PATCH] busybox-udhcpc-no_deconfig.<wbr>patch<br>
<br>
=C2=A0Upstream-Status: Pending<br>
@@ -27,17 +24,21 @@ Signed-off-by: Anders Darander &lt;<a href=3D"mailto:an=
ders@chargestorm.se">anders@chargestorm.se</a>&gt;<br>
=C2=A0Fixed options -b, -a and -P.<br>
<br>
=C2=A0Signed-off-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendream=
box.org">obi@opendreambox.org</a>&gt;<br>
+<br>
+Updated to Busybox 1.26.2<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0---<br>
- networking/udhcp/dhcpc.c |=C2=A0 =C2=A029 +++++++++++++++++++++--------<b=
r>
- 1 files changed, 21 insertions(+), 8 deletions(-)<br>
+ networking/udhcp/dhcpc.c | 26 +++++++++++++++++++-------<br>
+ 1 file changed, 19 insertions(+), 7 deletions(-)<br>
<br>
-Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- busybox-1.20.2.orig/<wbr>networking/udhcp/dhcpc.c<br>
-+++ busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
-@@ -29,6 +29,9 @@<br>
- #include &lt;netpacket/packet.h&gt;<br>
- #include &lt;linux/filter.h&gt;<br>
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c<br>
+index 0e23626..2f05ee3 100644<br>
+--- a/networking/udhcp/dhcpc.c<br>
++++ b/networking/udhcp/dhcpc.c<br>
+@@ -50,6 +50,9 @@ struct tpacket_auxdata {<br>
+ #endif<br>
+<br>
<br>
=C2=A0+/* option whether to down the interface when reconfiguring */<br>
=C2=A0+static int allow_deconfig =3D 1;<br>
@@ -45,7 +46,7 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 /* &quot;struct client_config_t client_config&quot; is in bb_common_=
bufsiz1 */<br>
<br>
<br>
-@@ -81,8 +84,9 @@ enum {<br>
+@@ -102,8 +105,9 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT_x =3D 1 &lt;&lt; 18,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT_f =3D 1 &lt;&lt; 19,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OPT_B =3D 1 &lt;&lt; 20,<br>
@@ -56,7 +57,7 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 USE_FOR_MMU(=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0OPTBIT_b,)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IF_FEATURE_UDHCPC_ARPING(<wbr>OPTBIT_a,)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IF_FEATURE_UDHCP_PORT(=C2=A0 =C2=A0OPTBIT_P,)<b=
r>
-@@ -1040,7 +1044,8 @@ static void perform_renew(void)<br>
+@@ -1108,7 +1112,8 @@ static void perform_renew(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D RENEW_REQ=
UESTED;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RENEW_REQUESTED: /* impatient are we? fine=
, square 1 */<br>
@@ -66,26 +67,16 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case REQUESTING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RELEASED:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 change_listen_mode(=
LISTEN_RAW)<wbr>;<br>
-@@ -1064,7 +1069,8 @@ static void perform_release(uint32_t ser<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_info_msg(&quot;U=
nicasting a release of %s to %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inet_ntoa(temp_addr), buffer);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_release(server=
_addr, requested_ip); /* unicast */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_run_script(NULL, &=
quot;deconfig&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allow_deconfig)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 udhcp_run_script(NULL, &quot;deconfig&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bb_info_msg(&quot;Entering released state&quot;=
);<br>
-<br>
-@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
+@@ -1298,7 +1303,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* O,x: list; -T,-t,-A take numeric param */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0opt_complementary =3D &quot;O::x::T+:t+:A+&quot=
; IF_UDHCP_VERBOSE(&quot;:vv&quot;) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IF_UDHCP_VERBOSE(opt_<wbr>complementary =3D &qu=
ot;vv&quot;;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IF_LONG_OPTS(applet_long_<wbr>options =3D udhcp=
c_longopts;)<br>
--=C2=A0 =C2=A0 =C2=A0 opt =3D getopt32(argv, &quot;CV:H:h:F:i:np:qRr:s:T:t=
:SA:O:<wbr>ox:fB&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 opt =3D getopt32(argv, &quot;CV:H:h:F:i:np:qRr:s:T:t=
:SA:O:<wbr>ox:fBD&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 opt =3D getopt32(argv, &quot;CV:H:h:F:i:np:qRr:s:T:+=
t:+SA:<wbr>+O:*ox:*fB&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 opt =3D getopt32(argv, &quot;CV:H:h:F:i:np:qR=
r:s:T:t:SA:O:<wbr>ox:fBD&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USE_FOR_MMU(&quot;b=
&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IF_FEATURE_UDHCPC_A=
RPING(&quot;a&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IF_FEATURE_UDHCPC_A=
RPING(&quot;a::&quot;<wbr>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IF_FEATURE_UDHCP_PO=
RT(&quot;P:&quot;)<br>
-@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
+@@ -1407,6 +1412,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logmode |=3D LOGMOD=
E_SYSLOG;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -95,7 +86,7 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Make sure fd 0,1,2 are open */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_sanitize_stdio();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Equivalent of doing a fflush after every \n =
*/<br>
-@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
+@@ -1421,7 +1429,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 srand(monotonic_us());<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D INIT_SELECTING;<br>
@@ -105,17 +96,17 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 change_listen_mode(LISTEN_RAW)<wbr>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 packet_num =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout =3D 0;<br>
-@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
+@@ -1575,7 +1584,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Timed out, enter init state */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_info_msg(&quot;Lease lost, enterin=
g init state&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_error_msg(&quot;lease lost, enteri=
ng init state&quot;);<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_run_script(NULL, &quot;deconfi=
g&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allow_deconfig)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_run_scrip=
t(NULL, &quot;deconfig&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allow_deconfig)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_ru=
n_script(NULL, &quot;deconfig&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D INIT_SELECTING;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_config.first_secs =3D 0; /* m=
ake secs field count from 0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*timeout =3D 0; - already is */<br>
-@@ -1667,7 +1678,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
+@@ -1768,7 +1778,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 send_decline(/*xid,*/ server_addr, packet.yiaddr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (state !=3D REQUESTING)<br>
@@ -125,8 +116,8 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 change_listen_mode(LISTEN_RAW)<wbr>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 state =3D INIT_SELECTING;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 client_config.first_secs =3D 0; /* make secs field cou=
nt from 0 */<br>
-@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_info_msg(&quot;Received DHCP NAK&q=
uot;);<br>
+@@ -1838,7 +1849,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_error_msg(&quot;received %s&quot;,=
 &quot;DHCP NAK&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_run_script(&amp;packet, &quot;=
nak&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state !=3D REQUESTING)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udhcp_ru=
n_script(NULL, &quot;deconfig&quot;);<br>
@@ -135,3 +126,6 @@ Index: busybox-1.20.2/networking/<wbr>udhcp/dhcpc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 change_listen_mode(LISTEN_RAW)<wbr>;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep(3); /* avoid excessive network=
 traffic */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state =3D INIT_SELECTING;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/commit-applet_tables-<w=
br>fix-commit-0dddbc1.patch b/meta/recipes-core/busybox/<wbr>busybox/commit=
-applet_tables-<wbr>fix-commit-0dddbc1.patch<br>
deleted file mode 100644<br>
index 7f80a1d..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/commit-applet_tables-<wbr>fix-=
commit-0dddbc1.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Patch addressing a parallel make race in Busybox<br>
-<br>
-=C2=A0 <a href=3D"http://git.busybox.net/busybox/commit/?id=3D0dddbc1a5979=
5a77679d8c5ef48a2795cb470563" rel=3D"noreferrer" target=3D"_blank">http://g=
it.busybox.net/<wbr>busybox/commit/?id=3D<wbr>0dddbc1a59795a77679d8c5ef48a2=
7<wbr>95cb470563</a><br>
-<br>
-Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om">juro.bystricky@intel.com</a>&gt;<br>
-<br>
-From 0dddbc1a59795a77679d8c5ef48a27<wbr>95cb470563 Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Tue, 23 Aug 2016 20:21:36 +0200<br>
-Subject: build system: always rewrite NUM_APPLETS.h<br>
-<br>
-Conditional rewrite can keep NUM_APPLETS.h mtime old,<br>
-this causes make to try to regenerate it at every invocation.<br>
-<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-<br>
-diff --git a/applets/applet_tables.c b/applets/applet_tables.c<br>
-index 8401a15..ef911a4 100644<br>
---- a/applets/applet_tables.c<br>
-+++ b/applets/applet_tables.c<br>
-@@ -192,27 +192,28 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;};\n&quot;);<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0//printf(&quot;#endif /* SKIP_definitions */\n&=
quot;);<br>
-+<br>
- //=C2=A0 =C2=A0 printf(&quot;\n&quot;);<br>
- //=C2=A0 =C2=A0 printf(&quot;#define MAX_APPLET_NAME_LEN %u\n&quot;, MAX_=
APPLET_NAME_LEN);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (argv[2]) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char line_old[80];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char line_new[80];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *fp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char line_new[80];<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char line_old[80];<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line_old[0] =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D fopen(argv[2], &q=
uot;r&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fgets(line_old, sizeof(line_old), fp);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fclose(fp);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(line_new, &=
quot;#define NUM_APPLETS %u\n&quot;, NUM_APPLETS);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(line_old, lin=
e_new) !=3D 0) {<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line_old[0] =3D 0;<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp =3D fopen(argv[2], &quot;r=
&quot;);<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp) {<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
gets(line_old, sizeof(line_old), fp);<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
close(fp);<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(line_old, line_new=
) !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fp =3D fopen(argv[2], &quot;w&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!fp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fputs(line_new, fp);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+//=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/ip_fix_problem_on_<wbr>=
mips64_n64_big_endian_musl_<wbr>systems.patch b/meta/recipes-core/busybox/<=
wbr>busybox/ip_fix_problem_on_<wbr>mips64_n64_big_endian_musl_<wbr>systems.=
patch<br>
deleted file mode 100644<br>
index 41c5656..0000000<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/ip_fix_problem_on_<wbr>mips64_=
n64_big_endian_musl_<wbr>systems.patch<br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-From 4ab372d49a6e82b0bf097dedb96d26<wbr>330c5f2d5f Mon Sep 17 00:00:00 200=
1<br>
-From: Szabolcs Nagy &lt;<a href=3D"mailto:nsz@port70.net">nsz@port70.net</=
a>&gt;<br>
-Date: Sun, 24 Apr 2016 17:39:02 +0200<br>
-Subject: [PATCH] ip: fix problem on mips64 n64 big endian musl systems<br>
-<br>
-Use designated initializers for struct msghdr.<br>
-The struct layout is non-portable and musl libc does not match what busybo=
x expects.<br>
-<br>
-Signed-off-by: Szabolcs Nagy &lt;<a href=3D"mailto:nsz@port70.net">nsz@por=
t70.net</a>&gt;<br>
-Tested-by: Waldemar Brodkorb &lt;<a href=3D"mailto:wbx@openadk.org">wbx@op=
enadk.org</a>&gt;<br>
-Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.c=
om">vda.linux@googlemail.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-<a href=3D"https://git.busybox.net/busybox/commit/?id=3D4ab372d49a6e82b0bf=
097dedb96d26330c5f2d5f" rel=3D"noreferrer" target=3D"_blank">https://git.bu=
sybox.net/<wbr>busybox/commit/?id=3D<wbr>4ab372d49a6e82b0bf097dedb96d26<wbr=
>330c5f2d5f</a><br>
-<br>
-Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akus=
ter@mvista.com</a>&gt;<br>
-<br>
----<br>
- networking/libiproute/<wbr>libnetlink.c | 37 ++++++++++++++++++++++++----=
--<wbr>-------<br>
- 1 file changed, 24 insertions(+), 13 deletions(-)<br>
-<br>
-diff --git a/networking/libiproute/<wbr>libnetlink.c b/networking/libiprou=
te/<wbr>libnetlink.c<br>
-index c7533a4..cbb5daf 100644<br>
---- a/networking/libiproute/<wbr>libnetlink.c<br>
-+++ b/networking/libiproute/<wbr>libnetlink.c<br>
-@@ -71,11 +71,15 @@ int FAST_FUNC rtnl_dump_request(struct rtnl_handle *rt=
h, int type, void *req, in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nlmsghdr nlh;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_nl nladdr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iovec iov[2] =3D { { &amp;nlh, sizeof(nl=
h) }, { req, len } };<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Use designated initializers, struct layout is non=
-portable */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msghdr msg =3D {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void*)&amp;nladdr, size=
of(nladdr),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iov,=C2=A0 2,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_name =3D (void*)&am=
p;nladdr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_namelen =3D sizeof(=
nladdr),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_iov =3D iov,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_iovlen =3D 2,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_control =3D NULL,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_controllen =3D 0,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_flags =3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;nladdr, 0, sizeof(nladdr));<br>
-@@ -104,12 +108,15 @@ static int rtnl_dump_filter(struct rtnl_handle *rth,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nlmsghdr *h;=
<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Use designated initia=
lizers, struct layout is non-portable */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct msghdr msg =
=3D {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (void*)&amp;nladdr, sizeof(nladdr),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;iov, 1,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, 0,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_name =3D (void*)&amp;nladdr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_namelen =3D sizeof(nladdr),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_iov =3D &amp;iov,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_iovlen =3D 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_control =3D NULL,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_controllen =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .msg_flags =3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D recvmsg(=
rth-&gt;fd, &amp;msg, 0);<br>
-@@ -211,11 +218,15 @@ int FAST_FUNC rtnl_talk(struct rtnl_handle *rtnl, st=
ruct nlmsghdr *n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_nl nladdr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iovec iov =3D { (void*)n, n-&gt;nlmsg_le=
n };<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0*buf =3D xmalloc(8*1024); /* a=
void big stack buffer */<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Use designated initializers, struct layout is non=
-portable */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msghdr msg =3D {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void*)&amp;nladdr, size=
of(nladdr),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;iov, 1,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_name =3D (void*)&am=
p;nladdr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_namelen =3D sizeof(=
nladdr),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_iov =3D &amp;iov,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_iovlen =3D 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_control =3D NULL,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_controllen =3D 0,<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .msg_flags =3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;nladdr, 0, sizeof(nladdr));<br>
---<br>
-2.3.5<br>
-<br>
diff --git a/meta/recipes-core/busybox/<wbr>busybox/makefile-fix-backport.<=
wbr>patch b/meta/recipes-core/busybox/<wbr>busybox/makefile-fix-backport.<w=
br>patch<br>
index 2e9842e..bc28df8 100644<br>
--- a/meta/recipes-core/busybox/<wbr>busybox/makefile-fix-backport.<wbr>pat=
ch<br>
+++ b/meta/recipes-core/busybox/<wbr>busybox/makefile-fix-backport.<wbr>pat=
ch<br>
@@ -1,40 +1,38 @@<br>
-From 9e5820a86277818c2f83c11c2aa76d<wbr>7f0a38283e Mon Sep 17 00:00:00 200=
1<br>
-From: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlemail.com">vda.l=
inux@googlemail.com</a>&gt;<br>
-Date: Sun, 14 Aug 2016 02:54:27 +0200<br>
-Subject: build system: fix include/NUM_APPLETS.h generation<br>
+Subject: [PATCH] build system: fix include/NUM_APPLETS.h generation<br>
<br>
=C2=A0TBH, it&#39;s more like &quot;work around my bad makefile-fu&quot; th=
an &quot;fix&quot;...<br>
<br>
=C2=A0Signed-off-by: Denys Vlasenko &lt;<a href=3D"mailto:vda.linux@googlem=
ail.com">vda.linux@googlemail.com</a>&gt;<br>
----<br>
- applets/Kbuild.src | 7 ++-----<br>
- 1 file changed, 2 insertions(+), 5 deletions(-)<br>
<br>
-Upstream-Status: Backport<br>
+Updated to Busybox 1.26.2<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ applets/Kbuild.src | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/applets/Kbuild.src b/applets/Kbuild.src<br>
-index b612399..5cc1827 100644<br>
+index 3aedbbf..d39b663 100644<br>
=C2=A0--- a/applets/Kbuild.src<br>
=C2=A0+++ b/applets/Kbuild.src<br>
=C2=A0@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h inclu=
de/applet_tables.h<br>
<br>
=C2=A0 applets/applet_tables: .config include/applets.h<br>
=C2=A0 applets/usage:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.config include/appl=
ets.h<br>
--applets/usage_pod:=C2=A0 =C2=A0 =C2=A0.config include/applet_tables.h inc=
lude/applets.h<br>
+-applets/usage_pod:=C2=A0 =C2=A0 =C2=A0.config include/applets.h include/a=
pplet_tables.h<br>
=C2=A0+applets/usage_pod:=C2=A0 =C2=A0 =C2=A0.config include/applets.h incl=
ude/applet_tables.h include/NUM_APPLETS.h<br>
<br>
=C2=A0 quiet_cmd_gen_usage_compressed =3D GEN=C2=A0 =C2=A0 =C2=A0include/us=
age_compressed.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_gen_usage_compressed =3D $(srctree_slash)ap=
plets/usage_<wbr>compressed include/usage_compressed.h applets<br>
-@@ -40,8 +40,5 @@ include/usage_compressed.h: applets/usage $(srctree_slas=
h)applets/usage_<wbr>compress<br>
- quiet_cmd_gen_applet_tables =3D GEN=C2=A0 =C2=A0 =C2=A0include/applet_tab=
les.h<br>
+@@ -40,7 +40,7 @@ include/usage_compressed.h: applets/usage $(srctree_slas=
h)applets/usage_<wbr>compress<br>
+ quiet_cmd_gen_applet_tables =3D GEN=C2=A0 =C2=A0 =C2=A0include/applet_tab=
les.h include/NUM_APPLETS.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_gen_applet_tables =3D applets/applet_tables=
 include/applet_tables.h include/NUM_APPLETS.h<br>
<br>
--include/applet_tables.h: applets/applet_tables<br>
--=C2=A0 =C2=A0 =C2=A0 $(call cmd,gen_applet_tables)<br>
--<br>
=C2=A0-include/NUM_APPLETS.h: applets/applet_tables<br>
=C2=A0+include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call cmd,gen_applet_tables)<br>
+<br>
+ # In fact, include/applet_tables.h depends only on applets/applet_tables,=
<br>
=C2=A0--<br>
-cgit v0.12<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">bu<wbr>sybox_1.24.1.bb</a> b/meta/rec=
ipes-core/busybox/<a href=3D"http://busybox_1.26.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">bu<wbr>sybox_1.26.2.bb</a><br>
similarity index 66%<br>
rename from meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" =
rel=3D"noreferrer" target=3D"_blank">busy<wbr>box_1.24.1.bb</a><br>
rename to meta/recipes-core/busybox/<a href=3D"http://busybox_1.26.2.bb" re=
l=3D"noreferrer" target=3D"_blank">busy<wbr>box_1.26.2.bb</a><br>
index afb69d1..130f513 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.24.1.bb" rel=3D=
"noreferrer" target=3D"_blank">bu<wbr>sybox_1.24.1.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.26.2.bb" rel=3D=
"noreferrer" target=3D"_blank">bu<wbr>sybox_1.26.2.bb</a><br>
@@ -29,10 +29,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.busybox.net/down=
loads/busybox-${PV}.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=3D"_b=
lank">http://www.busybox.net/<wbr>downloads/busybox-${PV}.tar.<wbr>bz2;name=
=3Dtarball</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://recognize_connmand.<wbr>pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://busybox-cross-<wbr>menucon=
fig.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-CC-when-<wbr>link=
ing-instead-of-LD-and-use-<wbr>CFLAGS-and.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.24.1-unzip.<wbr>=
patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.24.1-unzip-<wbr>=
regression.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.24.1-<wbr>trunca=
te-open-mode.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-flock-update-the-<wbr=
>behaviour-of-c-parameter-to-<wbr>match-u.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mount-via-label.cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sha1sum.cfg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sha256sum.cfg \<br>
@@ -44,18 +40,10 @@ SRC_URI =3D &quot;<a href=3D"http://www.busybox.net/dow=
nloads/busybox-${PV}.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=3D"_=
blank">http://www.busybox.net/<wbr>downloads/busybox-${PV}.tar.<wbr>bz2;nam=
e=3Dtarball</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rcS \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rcK \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runlevel \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-2148.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-2147.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-2147_2.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ip_fix_problem_on_<wbr>mip=
s64_n64_big_endian_musl_<wbr>systems.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makefile-fix-backport.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sed-fix-sed-n-<wbr>fl=
ushes-pattern-space-<wbr>terminates-early.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-kbuild-race-<wbr>f=
ix-commit-d8e61bb.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://commit-applet_tables-<wbr>=
fix-commit-0dddbc1.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makefile-libbb-race.<wbr>p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libiproute-handle-<wb=
r>table-ids-larger-than-255.<wbr>patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://musl.cfg &quot;<br>
<br>
-SRC_URI[tarball.md5sum] =3D &quot;<wbr>be98a40cadf84ce2d6b05fa41a275c<wbr>=
6a&quot;<br>
-SRC_URI[tarball.sha256sum] =3D &quot;<wbr>37d03132cc078937360b392170b7a1<w=
br>d0e5b322eee9f57c0b82292a8b1f0a<wbr>fe3d&quot;<br>
+SRC_URI[tarball.md5sum] =3D &quot;<wbr>bb59d25ee2643db20f212eec539429<wbr>=
f1&quot;<br>
+SRC_URI[tarball.sha256sum] =3D &quot;<wbr>da3e44913fc1a9c9b7c5337ea5292d<w=
br>a518683cbff32be630777f565d6036<wbr>af16&quot;<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1142ba2065f7f8054804cb4e--
