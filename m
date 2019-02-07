Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5976A7C409
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:36:20 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b3so593399ede.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dBPK0AUjKzr3HeLVE50ClTtVyxUgPWYpcA7AWnUqTBQ=;
	b=vayA3P3P8npiJLrdkP+LLeMTz69cFjzA/ydwniNF9TwEO0w3ThO66OPj0g46oMC3c+
	BseauCBpiWy6RcOBk2guDO9EJZFNn2oh0RgP4/mjWn08mpbbNjXOLJzLf+cd5LX/gyx/
	ArGLxM6TBx3D1GSqFAnv3fw9Jia6Of8+0kEutAURlAcfBUVsGh5YvcFctMmdv3aOneJD
	Ue0BLiqHjpnB9G3fHW93bS+dQiSR6RKEMPtmysn5YxmbShn7SGlZiXJ2q4cFDhCu2u7t
	iCss0cVAgpAfocqnC3kOLthboXYlbCqqO+VrZfclgOvzQEQyHdnm/2EDd9CLGiDBRR9l
	c3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dBPK0AUjKzr3HeLVE50ClTtVyxUgPWYpcA7AWnUqTBQ=;
	b=TxVcizDMRHO3kJYZh3FoNyVECS0GwfXRlblpgwLskYm2VzO9Cu+eXrv5Ux5D/pFG3y
	ffcOMpkztRtVURga/X6o11DyTyU3ZuKu3ADcLJdIOqiNLp5MIpNJisHXMQ/upXHfcQXU
	cKGLITWPH+A59fMWzc0Y40nrgKBhqXwvixNEEb6cF4rhZdBx5W1EkRiVys2yl6kTGf89
	bPSPbLdU70P6rVAqNL5wbRzpcvsYIQxsippSRDBJnbYPWoFS87MeLalmOchEbIdBamrV
	8N30+7iJglZKtaf0xJ50SGBYttv+p3+bew9B7e1mDb6w3BBlkbapd8ItB1tW9YQnEIV5
	NMOw==
X-Gm-Message-State: AHQUAuYy3zlU9rFADT2UOLK0vWzTfGu9G/kliRcM8Ar+Gkufs7y1ffnd
	1RY7N0p8Rb5xmISKpdvtssyoz47kTacRX4sy074=
X-Google-Smtp-Source: AHgI3IZeoUPk2smPl/TDSBn/KUfDBPyDzAU8XvwsY4utTSQOdGEmIs8OHvWUXyE7TaTuLVe1RFatgnYXU4pQ1zO1VSo=
X-Received: by 2002:aa7:d60c:: with SMTP id c12mr12211878edr.238.1549560980745;
	Thu, 07 Feb 2019 09:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
	<20190207155759.6082-2-alejandro.delcastillo@ni.com>
In-Reply-To: <20190207155759.6082-2-alejandro.delcastillo@ni.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Thu, 7 Feb 2019 09:36:08 -0800
Message-ID: <CAFNP8OudFqyxzvMCHjENBnDg+REZnsaLjg6X=4pd=s9=reKWSA@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] opkg: add --ignore-recommends flag
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
X-List-Received-Date: Thu, 07 Feb 2019 17:36:21 -0000
Content-Type: multipart/alternative; boundary="000000000000d0b3d00581514722"

--000000000000d0b3d00581514722
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change looks like it impacts documentation (i.e.
https://yoctoproject.org/docs/2.7/ref-manual/ref-manual.html#var-BAD_RECOMM=
ENDATIONS).
When will this change go into effect?

Scott

On Thu, Feb 7, 2019 at 7:58 AM Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> To be used for BAD_RECOMMENDATIONS feature.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  ...pkg-add-add-ignore-recommends-option.patch | 259 ++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.4.0.bb      |   1 +
>  2 files changed, 260 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-op=
tion.patch
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-=
option.patch
> b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-=
option.patch
> new file mode 100644
> index 0000000000..47d1b3c37e
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-=
option.patch
> @@ -0,0 +1,259 @@
> +From 64aa98646a17c299bf37af2975b98daf5d7d30b4 Mon Sep 17 00:00:00 2001
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Date: Thu, 31 Jan 2019 18:16:08 -0600
> +Subject: [PATCH] libopkg: add --add-ignore-recommends option
> +
> +Add option to ignore specific recommended packages. On the libsolv
> +backed, this feature will only work on libsolv version > 0.7.2 [1].
> +
> +[1]
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_openSUS=
E_libsolv_issues_254&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcS=
jixA&r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3DGObNHzFJpWpf_PripI=
rf-K2RhsktYdAUEieAJexXOKw&s=3D3G-meChUqClFggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&e=
=3D
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +
> +Upstream-Status: Accepted
> +---
> + libopkg/opkg_conf.c                           |  2 +
> + libopkg/opkg_conf.h                           |  1 +
> + .../solvers/internal/pkg_depends_internal.c   |  3 +-
> + libopkg/solvers/libsolv/opkg_solver_libsolv.c | 21 ++++++-
> + man/opkg.1.in                                 |  3 +
> + src/opkg.c                                    |  6 ++
> + tests/Makefile                                |  1 +
> + tests/core/43_add_ignore_recommends.py        | 62 +++++++++++++++++++
> + 8 files changed, 97 insertions(+), 2 deletions(-)
> + create mode 100755 tests/core/43_add_ignore_recommends.py
> +
> +diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
> +index 06880a1..f2330cd 100644
> +--- a/libopkg/opkg_conf.c
> ++++ b/libopkg/opkg_conf.c
> +@@ -597,6 +597,7 @@ int opkg_conf_init(void)
> +     pkg_dest_list_init(&opkg_config->tmp_dest_list);
> +     nv_pair_list_init(&opkg_config->arch_list);
> +     str_list_init(&opkg_config->exclude_list);
> ++    str_list_init(&opkg_config->ignore_recommends_list);
> +
> +     return 0;
> + }
> +@@ -938,6 +939,7 @@ void opkg_conf_deinit(void)
> +     pkg_dest_list_deinit(&opkg_config->pkg_dest_list);
> +     nv_pair_list_deinit(&opkg_config->arch_list);
> +     str_list_deinit(&opkg_config->exclude_list);
> ++    str_list_deinit(&opkg_config->ignore_recommends_list);
> +
> +     if (opkg_config->verbosity >=3D DEBUG) {
> +         hash_print_stats(&opkg_config->pkg_hash);
> +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> +index eb56a29..316c500 100644
> +--- a/libopkg/opkg_conf.h
> ++++ b/libopkg/opkg_conf.h
> +@@ -61,6 +61,7 @@ typedef struct opkg_conf {
> +     pkg_dest_list_t tmp_dest_list;
> +     nv_pair_list_t arch_list;
> +     str_list_t exclude_list;
> ++    str_list_t ignore_recommends_list;
> +
> +     int restrict_to_default_dest;
> +     pkg_dest_t *default_dest;
> +diff --git a/libopkg/solvers/internal/pkg_depends_internal.c
> b/libopkg/solvers/internal/pkg_depends_internal.c
> +index cd56d84..5deee70 100644
> +--- a/libopkg/solvers/internal/pkg_depends_internal.c
> ++++ b/libopkg/solvers/internal/pkg_depends_internal.c
> +@@ -228,7 +228,8 @@ int pkg_hash_fetch_unsatisfied_dependencies(pkg_t
> *pkg,
> +                             || compound_depend->type =3D=3D SUGGEST)
> +                         && (satisfying_pkg->state_want =3D=3D SW_DEINST=
ALL
> +                             || satisfying_pkg->state_want =3D=3D SW_PUR=
GE
> +-                            || opkg_config->no_install_recommends);
> ++                            || opkg_config->no_install_recommends
> ++                            ||
> str_list_contains(&opkg_config->ignore_recommends_list,
> satisfying_pkg->name));
> +                 if (ignore) {
> +                     opkg_msg(NOTICE,
> +                              "%s: ignoring recommendation for "
> +diff --git a/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> +index 2b27e3a..403e07b 100644
> +--- a/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> ++++ b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> +@@ -484,6 +484,7 @@ static void pkg2solvable(pkg_t *pkg, Solvable
> *solvable_out)
> + static void populate_installed_repo(libsolv_solver_t *libsolv_solver)
> + {
> +     int i;
> ++    Id what;
> +
> +     pkg_vec_t *installed_pkgs =3D pkg_vec_alloc();
> +
> +@@ -507,6 +508,15 @@ static void populate_installed_repo(libsolv_solver_=
t
> *libsolv_solver)
> +         /* set solvable attributes */
> +         pkg2solvable(pkg, solvable);
> +
> ++        /* if the package is in ignore-recommends-list, disfavor
> installation */
> ++        if (str_list_contains(&opkg_config->ignore_recommends_list,
> pkg->name)) {
> ++            opkg_message(NOTICE, "Disfavor package: %s\n",
> ++                         pkg->name);
> ++            what =3D pool_str2id(libsolv_solver->pool, pkg->name, 1);
> ++            queue_push2(&libsolv_solver->solver_jobs,
> SOLVER_SOLVABLE_NAME
> ++                        | SOLVER_DISFAVOR, what);
> ++        }
> ++
> +         /* if the package is not autoinstalled, mark it as user
> installed */
> +         if (!pkg->auto_installed)
> +             queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE
> +@@ -539,7 +549,7 @@ static void populate_available_repos(libsolv_solver_=
t
> *libsolv_solver)
> + {
> +     int i;
> +     Solvable *solvable;
> +-    Id solvable_id;
> ++    Id solvable_id, what;
> +
> +     pkg_vec_t *available_pkgs =3D pkg_vec_alloc();
> +
> +@@ -608,6 +618,15 @@ static void
> populate_available_repos(libsolv_solver_t *libsolv_solver)
> +         solvable =3D pool_id2solvable(libsolv_solver->pool, solvable_id=
);
> +         pkg2solvable(pkg, solvable);
> +
> ++        /* if the package is in ignore-recommends-list, disfavor
> installation */
> ++        if (str_list_contains(&opkg_config->ignore_recommends_list,
> pkg->name)) {
> ++            opkg_message(NOTICE, "Disfavor package: %s\n",
> ++                         pkg->name);
> ++            what =3D pool_str2id(libsolv_solver->pool, pkg->name, 1);
> ++            queue_push2(&libsolv_solver->solver_jobs,
> SOLVER_SOLVABLE_NAME
> ++                        | SOLVER_DISFAVOR, what);
> ++        }
> ++
> +         /* if the --force-depends option is specified make dependencies
> weak */
> +         if (opkg_config->force_depends)
> +             queue_push2(&libsolv_solver->solver_jobs, SOLVER_SOLVABLE
> +diff --git a/man/opkg.1.in b/man/opkg.1.in
> +index 27fa9c1..f192c3b 100644
> +--- a/man/opkg.1.in
> ++++ b/man/opkg.1.in
> +@@ -162,6 +162,9 @@ priority \fIprio\fP. Lower priorities take precedenc=
e.
> + \fB\--add-exclude <\fIname\fP>\fR
> + Register package to be excluded from install
> + .TP
> ++\fB\--add-ignore-recommends <\fIname\fP>\fR
> ++Register package to be ignored as a recomendee
> ++.TP
> + \fB\--prefer-arch-to-version\fR
> + Use the architecture priority package rather than the higher version
> + one if more than one candidate is found.
> +diff --git a/src/opkg.c b/src/opkg.c
> +index 650e278..3c93a3b 100644
> +--- a/src/opkg.c
> ++++ b/src/opkg.c
> +@@ -51,6 +51,7 @@ enum {
> +     ARGS_OPT_ADD_DEST,
> +     ARGS_OPT_SIZE,
> +     ARGS_OPT_ADD_EXCLUDE,
> ++    ARGS_OPT_ADD_IGNORE_RECOMMENDS,
> +     ARGS_OPT_NOACTION,
> +     ARGS_OPT_DOWNLOAD_ONLY,
> +     ARGS_OPT_NODEPS,
> +@@ -112,6 +113,7 @@ static struct option long_options[] =3D {
> +     {"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
> +     {"size", 0, 0, ARGS_OPT_SIZE},
> +     {"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
> ++    {"add-ignore-recommends", 1, 0, ARGS_OPT_ADD_IGNORE_RECOMMENDS},
> +     {"test", 0, 0, ARGS_OPT_NOACTION},
> +     {"tmp-dir", 1, 0, 't'},
> +     {"tmp_dir", 1, 0, 't'},
> +@@ -234,6 +236,9 @@ static int args_parse(int argc, char *argv[])
> +         case ARGS_OPT_ADD_EXCLUDE:
> +             str_list_append(&opkg_config->exclude_list, optarg);
> +             break;
> ++        case ARGS_OPT_ADD_IGNORE_RECOMMENDS:
> ++            str_list_append(&opkg_config->ignore_recommends_list,
> optarg);
> ++            break;
> +         case ARGS_OPT_SIZE:
> +             opkg_config->size =3D 1;
> +             break;
> +@@ -343,6 +348,7 @@ static void usage()
> +     printf("\t--add-dest <name>:<path>        Register destination with
> given path\n");
> +     printf("\t--add-arch <arch>:<prio>        Register architecture wit=
h
> given priority\n");
> +     printf("\t--add-exclude <name>            Register package to be
> excluded from install\n");
> ++    printf("\t--add-ignore-recommends <name>  Register package to be
> ignored as a recomendee\n");
> +     printf("\t--prefer-arch-to-version        Use the architecture
> priority package rather\n");
> +     printf("\t                                than the higher version
> one if more\n");
> +     printf("\t                                than one candidate is
> found.\n");
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 8e5be08..799816d 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -42,6 +42,7 @@ REGRESSION_TESTS :=3D core/01_install.py \
> +                   core/40_arch.py \
> +                   core/41_info_fields.py \
> +                   core/42_info_description.py \
> ++                  core/43_add_ignore_recommends.py \
> +                   regress/issue26.py \
> +                   regress/issue31.py \
> +                   regress/issue32.py \
> +diff --git a/tests/core/43_add_ignore_recommends.py
> b/tests/core/43_add_ignore_recommends.py
> +new file mode 100755
> +index 0000000..7da0096
> +--- /dev/null
> ++++ b/tests/core/43_add_ignore_recommends.py
> +@@ -0,0 +1,62 @@
> ++#! /usr/bin/env python3
> ++#
> ++# Create package 'a' (1.0) which Recommends 'c'.
> ++# Install 'a' with --add-ignore-recommends 'c'.
> ++# Check that only 'a' (1.0) is installed.
> ++# Create package 'b' which Depends on 'c'.
> ++# Install 'a' & 'b', with --add-ignore-recommends 'c'.
> ++# Verify that 'a','b' & 'c' are installed.
> ++# Uninstall 'b' & 'c'.
> ++# Create package 'a' (2.0), which Recommends 'c'.
> ++# Upgrade 'a' with --add-ignore-recommends 'c'
> ++# Verify that only 'a' (2.0) is installed
> ++#
> ++
> ++import os
> ++import opk, cfg, opkgcl
> ++
> ++opk.regress_init()
> ++o =3D opk.OpkGroup()
> ++
> ++o.add(Package=3D'a', Recommends=3D'c', Version=3D'1.0')
> ++o.add(Package=3D'b', Depends=3D'c')
> ++o.add(Package=3D'c')
> ++o.write_opk()
> ++o.write_list()
> ++
> ++opkgcl.update()
> ++
> ++opkgcl.install('a', '--add-ignore-recommends c')
> ++
> ++if not opkgcl.is_installed('a'):
> ++      opk.fail("Package 'a' installed but reports as not installed.")
> ++
> ++if opkgcl.is_installed('c'):
> ++      opk.xfail("[libsolv<0.7.3] Package 'c' should not have been
> installed since it was in --add-ignore-recommends.")
> ++
> ++opkgcl.remove('a')
> ++opkgcl.install('a b', '--add-ignore-recommends c')
> ++
> ++if not opkgcl.is_installed('a'):
> ++      opk.fail("Package 'a' installed but reports as not installed.")
> ++
> ++if not opkgcl.is_installed('b'):
> ++      opk.fail("Package 'b' installed but reports as not installed.")
> ++
> ++if not opkgcl.is_installed('c'):
> ++      opk.fail("Package 'c' should have been installed since 'b' depend=
s
> on it.")
> ++
> ++opkgcl.remove('b c', '--force-depends')
> ++o.add(Package=3D'a', Recommends=3D'c', Version=3D'2.0')
> ++o.write_opk()
> ++o.write_list()
> ++
> ++opkgcl.update()
> ++
> ++opkgcl.upgrade('a', '--add-ignore-recommends c')
> ++
> ++if not opkgcl.is_installed('a', '2.0'):
> ++      opk.fail("Package 'a (2.0)' installed but reports as not
> installed.")
> ++
> ++if opkgcl.is_installed('c'):
> ++      opk.fail("Package 'c' should not have been installed since it was
> in --add-ignore-recommends.")
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> index 9b7cf3f596..a2329d3e71 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> @@ -14,6 +14,7 @@ PE =3D "1"
>  SRC_URI =3D "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +           file://0001-libopkg-add-add-ignore-recommends-option.patch \
>  "
>
>  SRC_URI[md5sum] =3D "ae51d95fee599bb4dce08453529158f5"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d0b3d00581514722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This change looks like it impacts documen=
tation (i.e. <a href=3D"https://yoctoproject.org/docs/2.7/ref-manual/ref-ma=
nual.html#var-BAD_RECOMMENDATIONS">https://yoctoproject.org/docs/2.7/ref-ma=
nual/ref-manual.html#var-BAD_RECOMMENDATIONS</a>).=C2=A0 When will this cha=
nge go into effect?</div><div dir=3D"ltr"><br></div><div>Scott<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Feb 7, 2019 at 7:58 AM Alejandro del Castillo &lt;<a href=3D"mailto:al=
ejandro.delcastillo@ni.com">alejandro.delcastillo@ni.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">To be used for BAD_=
RECOMMENDATIONS feature.<br>
<br>
Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delca=
stillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
---<br>
=C2=A0...pkg-add-add-ignore-recommends-option.patch | 259 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 260 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-add-a=
dd-ignore-recommends-option.patch<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-re=
commends-option.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-ad=
d-ignore-recommends-option.patch<br>
new file mode 100644<br>
index 0000000000..47d1b3c37e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommend=
s-option.patch<br>
@@ -0,0 +1,259 @@<br>
+From 64aa98646a17c299bf37af2975b98daf5d7d30b4 Mon Sep 17 00:00:00 2001<br>
+From: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@n=
i.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+Date: Thu, 31 Jan 2019 18:16:08 -0600<br>
+Subject: [PATCH] libopkg: add --add-ignore-recommends option<br>
+<br>
+Add option to ignore specific recommended packages. On the libsolv<br>
+backed, this feature will only work on libsolv version &gt; 0.7.2 [1].<br>
+<br>
+[1] <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gith=
ub.com_openSUSE_libsolv_issues_254&amp;d=3DDwIBaQ&amp;c=3DI_0YwoKy7z5LMTVdy=
O6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zz=
gXQ&amp;m=3DGObNHzFJpWpf_PripIrf-K2RhsktYdAUEieAJexXOKw&amp;s=3D3G-meChUqCl=
FggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_open=
SUSE_libsolv_issues_254&amp;d=3DDwIBaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1=
jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=
=3DGObNHzFJpWpf_PripIrf-K2RhsktYdAUEieAJexXOKw&amp;s=3D3G-meChUqClFggFPqsrA=
xIZBfLnRKIHm62Uuy1X6nQQ&amp;e=3D</a><br>
+<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+<br>
+Upstream-Status: Accepted<br>
+---<br>
+ libopkg/opkg_conf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
+ libopkg/opkg_conf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ .../solvers/internal/pkg_depends_internal.c=C2=A0 =C2=A0|=C2=A0 3 +-<br>
+ libopkg/solvers/libsolv/opkg_solver_libsolv.c | 21 ++++++-<br>
+ man/<a href=3D"http://opkg.1.in" rel=3D"noreferrer" target=3D"_blank">opk=
g.1.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
+ src/opkg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++=
<br>
+ tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ tests/core/43_add_ignore_recommends.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 62 ++=
+++++++++++++++++<br>
+ 8 files changed, 97 insertions(+), 2 deletions(-)<br>
+ create mode 100755 tests/core/43_add_ignore_recommends.py<br>
+<br>
+diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c<br>
+index 06880a1..f2330cd 100644<br>
+--- a/libopkg/opkg_conf.c<br>
++++ b/libopkg/opkg_conf.c<br>
+@@ -597,6 +597,7 @@ int opkg_conf_init(void)<br>
+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_init(&amp;opkg_config-&gt;tmp_dest_list)=
;<br>
+=C2=A0 =C2=A0 =C2=A0nv_pair_list_init(&amp;opkg_config-&gt;arch_list);<br>
+=C2=A0 =C2=A0 =C2=A0str_list_init(&amp;opkg_config-&gt;exclude_list);<br>
++=C2=A0 =C2=A0 str_list_init(&amp;opkg_config-&gt;ignore_recommends_list);=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+@@ -938,6 +939,7 @@ void opkg_conf_deinit(void)<br>
+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_deinit(&amp;opkg_config-&gt;pkg_dest_lis=
t);<br>
+=C2=A0 =C2=A0 =C2=A0nv_pair_list_deinit(&amp;opkg_config-&gt;arch_list);<b=
r>
+=C2=A0 =C2=A0 =C2=A0str_list_deinit(&amp;opkg_config-&gt;exclude_list);<br=
>
++=C2=A0 =C2=A0 str_list_deinit(&amp;opkg_config-&gt;ignore_recommends_list=
);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (opkg_config-&gt;verbosity &gt;=3D DEBUG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hash_print_stats(&amp;opkg_config-&gt;pk=
g_hash);<br>
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h<br>
+index eb56a29..316c500 100644<br>
+--- a/libopkg/opkg_conf.h<br>
++++ b/libopkg/opkg_conf.h<br>
+@@ -61,6 +61,7 @@ typedef struct opkg_conf {<br>
+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_t tmp_dest_list;<br>
+=C2=A0 =C2=A0 =C2=A0nv_pair_list_t arch_list;<br>
+=C2=A0 =C2=A0 =C2=A0str_list_t exclude_list;<br>
++=C2=A0 =C2=A0 str_list_t ignore_recommends_list;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0int restrict_to_default_dest;<br>
+=C2=A0 =C2=A0 =C2=A0pkg_dest_t *default_dest;<br>
+diff --git a/libopkg/solvers/internal/pkg_depends_internal.c b/libopkg/sol=
vers/internal/pkg_depends_internal.c<br>
+index cd56d84..5deee70 100644<br>
+--- a/libopkg/solvers/internal/pkg_depends_internal.c<br>
++++ b/libopkg/solvers/internal/pkg_depends_internal.c<br>
+@@ -228,7 +228,8 @@ int pkg_hash_fetch_unsatisfied_dependencies(pkg_t *pkg=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| compound_depend-&gt;type =3D=3D SUGGEST)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;&amp; (satisfying_pkg-&gt;state_want =3D=3D SW_DEINST=
ALL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| satisfying_pkg-&gt;state_want =3D=3D SW_P=
URGE<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 || opkg_config-&gt;no_install_recommends);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 || opkg_config-&gt;no_install_recommends<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 || str_list_contains(&amp;opkg_config-&gt;ignore_r=
ecommends_list, satisfying_pkg-&gt;name));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ignore) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0opkg_msg(NOTICE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: ignoring recommendation for &quot=
;<br>
+diff --git a/libopkg/solvers/libsolv/opkg_solver_libsolv.c b/libopkg/solve=
rs/libsolv/opkg_solver_libsolv.c<br>
+index 2b27e3a..403e07b 100644<br>
+--- a/libopkg/solvers/libsolv/opkg_solver_libsolv.c<br>
++++ b/libopkg/solvers/libsolv/opkg_solver_libsolv.c<br>
+@@ -484,6 +484,7 @@ static void pkg2solvable(pkg_t *pkg, Solvable *solvabl=
e_out)<br>
+ static void populate_installed_repo(libsolv_solver_t *libsolv_solver)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0int i;<br>
++=C2=A0 =C2=A0 Id what;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0pkg_vec_t *installed_pkgs =3D pkg_vec_alloc();<br>
+ <br>
+@@ -507,6 +508,15 @@ static void populate_installed_repo(libsolv_solver_t =
*libsolv_solver)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set solvable attributes */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg2solvable(pkg, solvable);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if the package is in ignore-recommends-lis=
t, disfavor installation */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (str_list_contains(&amp;opkg_config-&gt;ig=
nore_recommends_list, pkg-&gt;name)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_message(NOTICE, &quot;Disf=
avor package: %s\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pkg-&gt;name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what =3D pool_str2id(libsolv_so=
lver-&gt;pool, pkg-&gt;name, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_push2(&amp;libsolv_solver=
-&gt;solver_jobs, SOLVER_SOLVABLE_NAME<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | SOLVER_DISFAVOR, what);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the package is not autoinstalled, =
mark it as user installed */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pkg-&gt;auto_installed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue_push2(&amp;libsolv_s=
olver-&gt;solver_jobs, SOLVER_SOLVABLE<br>
+@@ -539,7 +549,7 @@ static void populate_available_repos(libsolv_solver_t =
*libsolv_solver)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0Solvable *solvable;<br>
+-=C2=A0 =C2=A0 Id solvable_id;<br>
++=C2=A0 =C2=A0 Id solvable_id, what;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0pkg_vec_t *available_pkgs =3D pkg_vec_alloc();<br>
+ <br>
+@@ -608,6 +618,15 @@ static void populate_available_repos(libsolv_solver_t=
 *libsolv_solver)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0solvable =3D pool_id2solvable(libsolv_so=
lver-&gt;pool, solvable_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg2solvable(pkg, solvable);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if the package is in ignore-recommends-lis=
t, disfavor installation */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (str_list_contains(&amp;opkg_config-&gt;ig=
nore_recommends_list, pkg-&gt;name)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_message(NOTICE, &quot;Disf=
avor package: %s\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pkg-&gt;name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what =3D pool_str2id(libsolv_so=
lver-&gt;pool, pkg-&gt;name, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_push2(&amp;libsolv_solver=
-&gt;solver_jobs, SOLVER_SOLVABLE_NAME<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | SOLVER_DISFAVOR, what);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the --force-depends option is spec=
ified make dependencies weak */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opkg_config-&gt;force_depends)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue_push2(&amp;libsolv_s=
olver-&gt;solver_jobs, SOLVER_SOLVABLE<br>
+diff --git a/man/<a href=3D"http://opkg.1.in" rel=3D"noreferrer" target=3D=
"_blank">opkg.1.in</a> b/man/<a href=3D"http://opkg.1.in" rel=3D"noreferrer=
" target=3D"_blank">opkg.1.in</a><br>
+index 27fa9c1..f192c3b 100644<br>
+--- a/man/<a href=3D"http://opkg.1.in" rel=3D"noreferrer" target=3D"_blank=
">opkg.1.in</a><br>
++++ b/man/<a href=3D"http://opkg.1.in" rel=3D"noreferrer" target=3D"_blank=
">opkg.1.in</a><br>
+@@ -162,6 +162,9 @@ priority \fIprio\fP. Lower priorities take precedence.=
<br>
+ \fB\--add-exclude &lt;\fIname\fP&gt;\fR<br>
+ Register package to be excluded from install<br>
+ .TP<br>
++\fB\--add-ignore-recommends &lt;\fIname\fP&gt;\fR<br>
++Register package to be ignored as a recomendee<br>
++.TP<br>
+ \fB\--prefer-arch-to-version\fR<br>
+ Use the architecture priority package rather than the higher version<br>
+ one if more than one candidate is found.<br>
+diff --git a/src/opkg.c b/src/opkg.c<br>
+index 650e278..3c93a3b 100644<br>
+--- a/src/opkg.c<br>
++++ b/src/opkg.c<br>
+@@ -51,6 +51,7 @@ enum {<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_ADD_DEST,<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_ADD_EXCLUDE,<br>
++=C2=A0 =C2=A0 ARGS_OPT_ADD_IGNORE_RECOMMENDS,<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_NOACTION,<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_DOWNLOAD_ONLY,<br>
+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_NODEPS,<br>
+@@ -112,6 +113,7 @@ static struct option long_options[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;add-dest&quot;, 1, 0, ARGS_OPT_ADD_DEST},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;size&quot;, 0, 0, ARGS_OPT_SIZE},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;add-exclude&quot;, 1, 0, ARGS_OPT_ADD_EXCLUDE},=
<br>
++=C2=A0 =C2=A0 {&quot;add-ignore-recommends&quot;, 1, 0, ARGS_OPT_ADD_IGNO=
RE_RECOMMENDS},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;test&quot;, 0, 0, ARGS_OPT_NOACTION},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;tmp-dir&quot;, 1, 0, &#39;t&#39;},<br>
+=C2=A0 =C2=A0 =C2=A0{&quot;tmp_dir&quot;, 1, 0, &#39;t&#39;},<br>
+@@ -234,6 +236,9 @@ static int args_parse(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ARGS_OPT_ADD_EXCLUDE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str_list_append(&amp;opkg_=
config-&gt;exclude_list, optarg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case ARGS_OPT_ADD_IGNORE_RECOMMENDS:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str_list_append(&amp;opkg_confi=
g-&gt;ignore_recommends_list, optarg);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ARGS_OPT_SIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_config-&gt;size =3D 1=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -343,6 +348,7 @@ static void usage()<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-dest &lt;name&gt;:&lt;path&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Register destination with given path\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-arch &lt;arch&gt;:&lt;prio&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Register architecture with given priority\n&quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-exclude &lt;name&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Register package to be excluded from install\n=
&quot;);<br>
++=C2=A0 =C2=A0 printf(&quot;\t--add-ignore-recommends &lt;name&gt;=C2=A0 R=
egister package to be ignored as a recomendee\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--prefer-arch-to-version=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Use the architecture priority package rather\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
han the higher version one if more\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
han one candidate is found.\n&quot;);<br>
+diff --git a/tests/Makefile b/tests/Makefile<br>
+index 8e5be08..799816d 100644<br>
+--- a/tests/Makefile<br>
++++ b/tests/Makefile<br>
+@@ -42,6 +42,7 @@ REGRESSION_TESTS :=3D core/01_install.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core/=
40_arch.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core/=
41_info_fields.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0core/=
42_info_description.py \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core/43_ad=
d_ignore_recommends.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regre=
ss/issue26.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regre=
ss/issue31.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regre=
ss/issue32.py \<br>
+diff --git a/tests/core/43_add_ignore_recommends.py b/tests/core/43_add_ig=
nore_recommends.py<br>
+new file mode 100755<br>
+index 0000000..7da0096<br>
+--- /dev/null<br>
++++ b/tests/core/43_add_ignore_recommends.py<br>
+@@ -0,0 +1,62 @@<br>
++#! /usr/bin/env python3<br>
++#<br>
++# Create package &#39;a&#39; (1.0) which Recommends &#39;c&#39;.<br>
++# Install &#39;a&#39; with --add-ignore-recommends &#39;c&#39;.<br>
++# Check that only &#39;a&#39; (1.0) is installed.<br>
++# Create package &#39;b&#39; which Depends on &#39;c&#39;.<br>
++# Install &#39;a&#39; &amp; &#39;b&#39;, with --add-ignore-recommends &#3=
9;c&#39;.<br>
++# Verify that &#39;a&#39;,&#39;b&#39; &amp; &#39;c&#39; are installed.<br=
>
++# Uninstall &#39;b&#39; &amp; &#39;c&#39;.<br>
++# Create package &#39;a&#39; (2.0), which Recommends &#39;c&#39;.<br>
++# Upgrade &#39;a&#39; with --add-ignore-recommends &#39;c&#39;<br>
++# Verify that only &#39;a&#39; (2.0) is installed<br>
++#<br>
++<br>
++import os<br>
++import opk, cfg, opkgcl<br>
++<br>
++opk.regress_init()<br>
++o =3D opk.OpkGroup()<br>
++<br>
++o.add(Package=3D&#39;a&#39;, Recommends=3D&#39;c&#39;, Version=3D&#39;1.0=
&#39;)<br>
++o.add(Package=3D&#39;b&#39;, Depends=3D&#39;c&#39;)<br>
++o.add(Package=3D&#39;c&#39;)<br>
++o.write_opk()<br>
++o.write_list()<br>
++<br>
++opkgcl.update()<br>
++<br>
++opkgcl.install(&#39;a&#39;, &#39;--add-ignore-recommends c&#39;)<br>
++<br>
++if not opkgcl.is_installed(&#39;a&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;a&#39; installed but rep=
orts as not installed.&quot;)<br>
++<br>
++if opkgcl.is_installed(&#39;c&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.xfail(&quot;[libsolv&lt;0.7.3] Package &#39;c&#3=
9; should not have been installed since it was in --add-ignore-recommends.&=
quot;)<br>
++<br>
++opkgcl.remove(&#39;a&#39;)<br>
++opkgcl.install(&#39;a b&#39;, &#39;--add-ignore-recommends c&#39;)<br>
++<br>
++if not opkgcl.is_installed(&#39;a&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;a&#39; installed but rep=
orts as not installed.&quot;)<br>
++<br>
++if not opkgcl.is_installed(&#39;b&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;b&#39; installed but rep=
orts as not installed.&quot;)<br>
++<br>
++if not opkgcl.is_installed(&#39;c&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;c&#39; should have been =
installed since &#39;b&#39; depends on it.&quot;)<br>
++<br>
++opkgcl.remove(&#39;b c&#39;, &#39;--force-depends&#39;)<br>
++o.add(Package=3D&#39;a&#39;, Recommends=3D&#39;c&#39;, Version=3D&#39;2.0=
&#39;)<br>
++o.write_opk()<br>
++o.write_list()<br>
++<br>
++opkgcl.update()<br>
++<br>
++opkgcl.upgrade(&#39;a&#39;, &#39;--add-ignore-recommends c&#39;)<br>
++<br>
++if not opkgcl.is_installed(&#39;a&#39;, &#39;2.0&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;a (2.0)&#39; installed b=
ut reports as not installed.&quot;)<br>
++<br>
++if opkgcl.is_installed(&#39;c&#39;):<br>
++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;c&#39; should not have b=
een installed since it was in --add-ignore-recommends.&quot;)<br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.4.0.bb</a><br>
index 9b7cf3f596..a2329d3e71 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
@@ -14,6 +14,7 @@ PE =3D &quot;1&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/releas=
es/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libopkg-add-add-ignor=
e-recommends-option.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;ae51d95fee599bb4dce08453529158f5&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d0b3d00581514722--
