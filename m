Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 557887C4BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 20:33:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b3so1023497ede.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 12:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yyZ0qhXyP/YXVj0NwSPOyiNe9oj6NkFvCbnvuM5egaU=;
	b=gyEQAA22NXZVjsCDFxVfa8LQh3ZyEfSQB1m2ItKxOrcbmWxI3yqd19yA7OIaVUJWjw
	P7ok2x12XWB8WmWDOp3M66pi1YuzKcNs/YNchd5qJsKKjrWW6Jkfz4RwVSwW5bJkvLHY
	mL7jPUf/HLMkPehzK4z/UIKOvxhFOQhdV5aCBaCyZCazjtM/4YG3SP+BfM/C2v1N1YV+
	jct36xgv/vRDqAsrF5pTDFQVxhRLKFADzXS9LVyEPUXnxjr6ENkJ4In28zWguS8u0VUm
	TDHA2ker/sS++Tgnkej/5Y5PDWE9/yjeMt8B5maCZbphdT2AhNBfHqLEO/7LBBv8RQEn
	+GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yyZ0qhXyP/YXVj0NwSPOyiNe9oj6NkFvCbnvuM5egaU=;
	b=E4tjN/UX3NOe6zArTT4Mx7eqMBJLttqrvIp0OtE0hTlTV5e5egDY0O6SuHBg/4Eu4N
	MpYoA6tesBkXWbZ60CtTYP2ptotf3ZZ2CnqKtjwE0hs5SUo3pURMtWPvdSbHOq3i/+Ky
	acpAp4VJdfHhWQ3MAiSur3Lsm6B93Y12YSpi76dvNNJpHgUG+26EXJl9qS+bNmrHWxSm
	IxuEzuHKpYNmTXqx7kEOvIpszAtvUI+OYZpHhygs0V8dGf7tIShBBBmEEIaDIgEdonGO
	5sY2XktolsPEZPW6nXlUL3pZqOXDHC7SxPOiEBpsR9+hlE1z+Wyjwzni+0GO5KNZa3ER
	pO+A==
X-Gm-Message-State: AHQUAua55OBRr+cHonuv5sGsRD4yBivkKe05eqzR0To7+Q1MkzPkwk6H
	T7lvO7WMKdyyHBCSfXT7bJT6GoOY7tdVrlXlTwg=
X-Google-Smtp-Source: AHgI3IbeB0iH/oVNZocxbhqR1P5zI6mpeSYVj9HCIctgmyJVfhw+xyggQQ2TqhfnMrxrC2pd2/VVcOZPedOioR5HML8=
X-Received: by 2002:aa7:d60c:: with SMTP id c12mr12743711edr.238.1549571620558;
	Thu, 07 Feb 2019 12:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20190207155759.6082-1-alejandro.delcastillo@ni.com>
	<20190207155759.6082-2-alejandro.delcastillo@ni.com>
	<CAFNP8OudFqyxzvMCHjENBnDg+REZnsaLjg6X=4pd=s9=reKWSA@mail.gmail.com>
	<289113b8-790a-0046-d997-b5cd609bd2cb@ni.com>
In-Reply-To: <289113b8-790a-0046-d997-b5cd609bd2cb@ni.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Thu, 7 Feb 2019 12:33:28 -0800
Message-ID: <CAFNP8OuTkFQ-jZ1ifXmgiqCo_aN+xCBhXX0dzpJbeXjFZWDh+A@mail.gmail.com>
To: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
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
X-List-Received-Date: Thu, 07 Feb 2019 20:33:40 -0000
Content-Type: multipart/alternative; boundary="000000000000ff5e84058153c13a"

--000000000000ff5e84058153c13a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 7, 2019 at 9:44 AM Alejandro Del Castillo <
alejandro.delcastillo@ni.com> wrote:

>
>
> On 2/7/19 11:36 AM, Scott Rifenbark wrote:
> > This change looks like it impacts documentation (i.e.
> >
> https://yoctoproject.org/docs/2.7/ref-manual/ref-manual.html#var-BAD_RECO=
MMENDATIONS.
>
> > When will this change go into effect?
>
> I believe it doesn't. It is refactoring the opkg implementation to
> leverage a new opkg feature (--add-ignore-recommends), which is a more
> robust implementation. Should be transparent to users.
>

Thank you for the clarification... I thought it might be a user option.


> > On Thu, Feb 7, 2019 at 7:58 AM Alejandro del Castillo
> > <alejandro.delcastillo@ni.com <mailto:alejandro.delcastillo@ni.com>>
> wrote:
> >
> >     To be used for BAD_RECOMMENDATIONS feature.
> >
> >     Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com
> >     <mailto:alejandro.delcastillo@ni.com>>
> >     ---
> >       ...pkg-add-add-ignore-recommends-option.patch | 259
> ++++++++++++++++++
> >       meta/recipes-devtools/opkg/opkg_0.4.0.bb
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&d=
=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv=
5j8&s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&e=3D>
>
> >          |   1 +
> >       2 files changed, 260 insertions(+)
> >       create mode 100644
> >
>  meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends-o=
ption.patch
> >
> >     diff --git
> >
>  a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends=
-option.patch
> >
>  b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends=
-option.patch
> >     new file mode 100644
> >     index 0000000000..47d1b3c37e
> >     --- /dev/null
> >     +++
> >
>  b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-add-ignore-recommends=
-option.patch
> >     @@ -0,0 +1,259 @@
> >     +From 64aa98646a17c299bf37af2975b98daf5d7d30b4 Mon Sep 17 00:00:00
> 2001
> >     +From: Alejandro del Castillo <alejandro.delcastillo@ni.com
> >     <mailto:alejandro.delcastillo@ni.com>>
> >     +Date: Thu, 31 Jan 2019 18:16:08 -0600
> >     +Subject: [PATCH] libopkg: add --add-ignore-recommends option
> >     +
> >     +Add option to ignore specific recommended packages. On the libsolv
> >     +backed, this feature will only work on libsolv version > 0.7.2 [1]=
.
> >     +
> >     +[1]
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_openSUS=
E_libsolv_issues_254&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcS=
jixA&r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3DGObNHzFJpWpf_PripI=
rf-K2RhsktYdAUEieAJexXOKw&s=3D3G-meChUqClFggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&e=
=3D
> >     +
> >     +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.co=
m
> >     <mailto:alejandro.delcastillo@ni.com>>
> >     +
> >     +Upstream-Status: Accepted
> >     +---
> >     + libopkg/opkg_conf.c                           |  2 +
> >     + libopkg/opkg_conf.h                           |  1 +
> >     + .../solvers/internal/pkg_depends_internal.c   |  3 +-
> >     + libopkg/solvers/libsolv/opkg_solver_libsolv.c | 21 ++++++-
> >     + man/opkg.1.in
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&d=3DDwMFa=
Q&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavU=
rJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3D=
8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&e=3D>
>
> >                                     |  3 +
> >     + src/opkg.c                                    |  6 ++
> >     + tests/Makefile                                |  1 +
> >     + tests/core/43_add_ignore_recommends.py        | 62
> +++++++++++++++++++
> >     + 8 files changed, 97 insertions(+), 2 deletions(-)
> >     + create mode 100755 tests/core/43_add_ignore_recommends.py
> >     +
> >     +diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
> >     +index 06880a1..f2330cd 100644
> >     +--- a/libopkg/opkg_conf.c
> >     ++++ b/libopkg/opkg_conf.c
> >     +@@ -597,6 +597,7 @@ int opkg_conf_init(void)
> >     +     pkg_dest_list_init(&opkg_config->tmp_dest_list);
> >     +     nv_pair_list_init(&opkg_config->arch_list);
> >     +     str_list_init(&opkg_config->exclude_list);
> >     ++    str_list_init(&opkg_config->ignore_recommends_list);
> >     +
> >     +     return 0;
> >     + }
> >     +@@ -938,6 +939,7 @@ void opkg_conf_deinit(void)
> >     +     pkg_dest_list_deinit(&opkg_config->pkg_dest_list);
> >     +     nv_pair_list_deinit(&opkg_config->arch_list);
> >     +     str_list_deinit(&opkg_config->exclude_list);
> >     ++    str_list_deinit(&opkg_config->ignore_recommends_list);
> >     +
> >     +     if (opkg_config->verbosity >=3D DEBUG) {
> >     +         hash_print_stats(&opkg_config->pkg_hash);
> >     +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> >     +index eb56a29..316c500 100644
> >     +--- a/libopkg/opkg_conf.h
> >     ++++ b/libopkg/opkg_conf.h
> >     +@@ -61,6 +61,7 @@ typedef struct opkg_conf {
> >     +     pkg_dest_list_t tmp_dest_list;
> >     +     nv_pair_list_t arch_list;
> >     +     str_list_t exclude_list;
> >     ++    str_list_t ignore_recommends_list;
> >     +
> >     +     int restrict_to_default_dest;
> >     +     pkg_dest_t *default_dest;
> >     +diff --git a/libopkg/solvers/internal/pkg_depends_internal.c
> >     b/libopkg/solvers/internal/pkg_depends_internal.c
> >     +index cd56d84..5deee70 100644
> >     +--- a/libopkg/solvers/internal/pkg_depends_internal.c
> >     ++++ b/libopkg/solvers/internal/pkg_depends_internal.c
> >     +@@ -228,7 +228,8 @@ int
> >     pkg_hash_fetch_unsatisfied_dependencies(pkg_t *pkg,
> >     +                             || compound_depend->type =3D=3D SUGGE=
ST)
> >     +                         && (satisfying_pkg->state_want =3D=3D
> SW_DEINSTALL
> >     +                             || satisfying_pkg->state_want =3D=3D
> SW_PURGE
> >     +-                            || opkg_config->no_install_recommends=
);
> >     ++                            || opkg_config->no_install_recommends
> >     ++                            ||
> >     str_list_contains(&opkg_config->ignore_recommends_list,
> >     satisfying_pkg->name));
> >     +                 if (ignore) {
> >     +                     opkg_msg(NOTICE,
> >     +                              "%s: ignoring recommendation for "
> >     +diff --git a/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> >     b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> >     +index 2b27e3a..403e07b 100644
> >     +--- a/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> >     ++++ b/libopkg/solvers/libsolv/opkg_solver_libsolv.c
> >     +@@ -484,6 +484,7 @@ static void pkg2solvable(pkg_t *pkg, Solvable
> >     *solvable_out)
> >     + static void populate_installed_repo(libsolv_solver_t
> *libsolv_solver)
> >     + {
> >     +     int i;
> >     ++    Id what;
> >     +
> >     +     pkg_vec_t *installed_pkgs =3D pkg_vec_alloc();
> >     +
> >     +@@ -507,6 +508,15 @@ static void
> >     populate_installed_repo(libsolv_solver_t *libsolv_solver)
> >     +         /* set solvable attributes */
> >     +         pkg2solvable(pkg, solvable);
> >     +
> >     ++        /* if the package is in ignore-recommends-list, disfavor
> >     installation */
> >     ++        if
> >     (str_list_contains(&opkg_config->ignore_recommends_list, pkg->name)=
)
> {
> >     ++            opkg_message(NOTICE, "Disfavor package: %s\n",
> >     ++                         pkg->name);
> >     ++            what =3D pool_str2id(libsolv_solver->pool, pkg->name,=
 1);
> >     ++            queue_push2(&libsolv_solver->solver_jobs,
> >     SOLVER_SOLVABLE_NAME
> >     ++                        | SOLVER_DISFAVOR, what);
> >     ++        }
> >     ++
> >     +         /* if the package is not autoinstalled, mark it as user
> >     installed */
> >     +         if (!pkg->auto_installed)
> >     +             queue_push2(&libsolv_solver->solver_jobs,
> SOLVER_SOLVABLE
> >     +@@ -539,7 +549,7 @@ static void
> >     populate_available_repos(libsolv_solver_t *libsolv_solver)
> >     + {
> >     +     int i;
> >     +     Solvable *solvable;
> >     +-    Id solvable_id;
> >     ++    Id solvable_id, what;
> >     +
> >     +     pkg_vec_t *available_pkgs =3D pkg_vec_alloc();
> >     +
> >     +@@ -608,6 +618,15 @@ static void
> >     populate_available_repos(libsolv_solver_t *libsolv_solver)
> >     +         solvable =3D pool_id2solvable(libsolv_solver->pool,
> >     solvable_id);
> >     +         pkg2solvable(pkg, solvable);
> >     +
> >     ++        /* if the package is in ignore-recommends-list, disfavor
> >     installation */
> >     ++        if
> >     (str_list_contains(&opkg_config->ignore_recommends_list, pkg->name)=
)
> {
> >     ++            opkg_message(NOTICE, "Disfavor package: %s\n",
> >     ++                         pkg->name);
> >     ++            what =3D pool_str2id(libsolv_solver->pool, pkg->name,=
 1);
> >     ++            queue_push2(&libsolv_solver->solver_jobs,
> >     SOLVER_SOLVABLE_NAME
> >     ++                        | SOLVER_DISFAVOR, what);
> >     ++        }
> >     ++
> >     +         /* if the --force-depends option is specified make
> >     dependencies weak */
> >     +         if (opkg_config->force_depends)
> >     +             queue_push2(&libsolv_solver->solver_jobs,
> SOLVER_SOLVABLE
> >     +diff --git a/man/opkg.1.in
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&d=3DDwMFa=
Q&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavU=
rJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3D=
8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&e=3D
> >
> >     b/man/opkg.1.in
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&d=3DDwMFa=
Q&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavU=
rJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3D=
8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&e=3D
> >
> >     +index 27fa9c1..f192c3b 100644
> >     +--- a/man/opkg.1.in
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&d=3DDwMFa=
Q&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavU=
rJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3D=
8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&e=3D
> >
> >     ++++ b/man/opkg.1.in
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&d=3DDwMFa=
Q&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavU=
rJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3D=
8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&e=3D
> >
> >     +@@ -162,6 +162,9 @@ priority \fIprio\fP. Lower priorities take
> >     precedence.
> >     + \fB\--add-exclude <\fIname\fP>\fR
> >     + Register package to be excluded from install
> >     + .TP
> >     ++\fB\--add-ignore-recommends <\fIname\fP>\fR
> >     ++Register package to be ignored as a recomendee
> >     ++.TP
> >     + \fB\--prefer-arch-to-version\fR
> >     + Use the architecture priority package rather than the higher
> version
> >     + one if more than one candidate is found.
> >     +diff --git a/src/opkg.c b/src/opkg.c
> >     +index 650e278..3c93a3b 100644
> >     +--- a/src/opkg.c
> >     ++++ b/src/opkg.c
> >     +@@ -51,6 +51,7 @@ enum {
> >     +     ARGS_OPT_ADD_DEST,
> >     +     ARGS_OPT_SIZE,
> >     +     ARGS_OPT_ADD_EXCLUDE,
> >     ++    ARGS_OPT_ADD_IGNORE_RECOMMENDS,
> >     +     ARGS_OPT_NOACTION,
> >     +     ARGS_OPT_DOWNLOAD_ONLY,
> >     +     ARGS_OPT_NODEPS,
> >     +@@ -112,6 +113,7 @@ static struct option long_options[] =3D {
> >     +     {"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
> >     +     {"size", 0, 0, ARGS_OPT_SIZE},
> >     +     {"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
> >     ++    {"add-ignore-recommends", 1, 0,
> ARGS_OPT_ADD_IGNORE_RECOMMENDS},
> >     +     {"test", 0, 0, ARGS_OPT_NOACTION},
> >     +     {"tmp-dir", 1, 0, 't'},
> >     +     {"tmp_dir", 1, 0, 't'},
> >     +@@ -234,6 +236,9 @@ static int args_parse(int argc, char *argv[])
> >     +         case ARGS_OPT_ADD_EXCLUDE:
> >     +             str_list_append(&opkg_config->exclude_list, optarg);
> >     +             break;
> >     ++        case ARGS_OPT_ADD_IGNORE_RECOMMENDS:
> >     ++            str_list_append(&opkg_config->ignore_recommends_list,
> >     optarg);
> >     ++            break;
> >     +         case ARGS_OPT_SIZE:
> >     +             opkg_config->size =3D 1;
> >     +             break;
> >     +@@ -343,6 +348,7 @@ static void usage()
> >     +     printf("\t--add-dest <name>:<path>        Register destinatio=
n
> >     with given path\n");
> >     +     printf("\t--add-arch <arch>:<prio>        Register
> >     architecture with given priority\n");
> >     +     printf("\t--add-exclude <name>            Register package to
> >     be excluded from install\n");
> >     ++    printf("\t--add-ignore-recommends <name>  Register package to
> >     be ignored as a recomendee\n");
> >     +     printf("\t--prefer-arch-to-version        Use the architectur=
e
> >     priority package rather\n");
> >     +     printf("\t                                than the higher
> >     version one if more\n");
> >     +     printf("\t                                than one candidate
> >     is found.\n");
> >     +diff --git a/tests/Makefile b/tests/Makefile
> >     +index 8e5be08..799816d 100644
> >     +--- a/tests/Makefile
> >     ++++ b/tests/Makefile
> >     +@@ -42,6 +42,7 @@ REGRESSION_TESTS :=3D core/01_install.py \
> >     +                   core/40_arch.py \
> >     +                   core/41_info_fields.py \
> >     +                   core/42_info_description.py \
> >     ++                  core/43_add_ignore_recommends.py \
> >     +                   regress/issue26.py \
> >     +                   regress/issue31.py \
> >     +                   regress/issue32.py \
> >     +diff --git a/tests/core/43_add_ignore_recommends.py
> >     b/tests/core/43_add_ignore_recommends.py
> >     +new file mode 100755
> >     +index 0000000..7da0096
> >     +--- /dev/null
> >     ++++ b/tests/core/43_add_ignore_recommends.py
> >     +@@ -0,0 +1,62 @@
> >     ++#! /usr/bin/env python3
> >     ++#
> >     ++# Create package 'a' (1.0) which Recommends 'c'.
> >     ++# Install 'a' with --add-ignore-recommends 'c'.
> >     ++# Check that only 'a' (1.0) is installed.
> >     ++# Create package 'b' which Depends on 'c'.
> >     ++# Install 'a' & 'b', with --add-ignore-recommends 'c'.
> >     ++# Verify that 'a','b' & 'c' are installed.
> >     ++# Uninstall 'b' & 'c'.
> >     ++# Create package 'a' (2.0), which Recommends 'c'.
> >     ++# Upgrade 'a' with --add-ignore-recommends 'c'
> >     ++# Verify that only 'a' (2.0) is installed
> >     ++#
> >     ++
> >     ++import os
> >     ++import opk, cfg, opkgcl
> >     ++
> >     ++opk.regress_init()
> >     ++o =3D opk.OpkGroup()
> >     ++
> >     ++o.add(Package=3D'a', Recommends=3D'c', Version=3D'1.0')
> >     ++o.add(Package=3D'b', Depends=3D'c')
> >     ++o.add(Package=3D'c')
> >     ++o.write_opk()
> >     ++o.write_list()
> >     ++
> >     ++opkgcl.update()
> >     ++
> >     ++opkgcl.install('a', '--add-ignore-recommends c')
> >     ++
> >     ++if not opkgcl.is_installed('a'):
> >     ++      opk.fail("Package 'a' installed but reports as not
> installed.")
> >     ++
> >     ++if opkgcl.is_installed('c'):
> >     ++      opk.xfail("[libsolv<0.7.3] Package 'c' should not have been
> >     installed since it was in --add-ignore-recommends.")
> >     ++
> >     ++opkgcl.remove('a')
> >     ++opkgcl.install('a b', '--add-ignore-recommends c')
> >     ++
> >     ++if not opkgcl.is_installed('a'):
> >     ++      opk.fail("Package 'a' installed but reports as not
> installed.")
> >     ++
> >     ++if not opkgcl.is_installed('b'):
> >     ++      opk.fail("Package 'b' installed but reports as not
> installed.")
> >     ++
> >     ++if not opkgcl.is_installed('c'):
> >     ++      opk.fail("Package 'c' should have been installed since 'b'
> >     depends on it.")
> >     ++
> >     ++opkgcl.remove('b c', '--force-depends')
> >     ++o.add(Package=3D'a', Recommends=3D'c', Version=3D'2.0')
> >     ++o.write_opk()
> >     ++o.write_list()
> >     ++
> >     ++opkgcl.update()
> >     ++
> >     ++opkgcl.upgrade('a', '--add-ignore-recommends c')
> >     ++
> >     ++if not opkgcl.is_installed('a', '2.0'):
> >     ++      opk.fail("Package 'a (2.0)' installed but reports as not
> >     installed.")
> >     ++
> >     ++if opkgcl.is_installed('c'):
> >     ++      opk.fail("Package 'c' should not have been installed since
> >     it was in --add-ignore-recommends.")
> >     +--
> >     +2.20.1
> >     +
> >     diff --git a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&d=
=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv=
5j8&s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&e=3D
> >
> >     b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&d=
=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv=
5j8&s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&e=3D
> >
> >     index 9b7cf3f596..a2329d3e71 100644
> >     --- a/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&d=
=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv=
5j8&s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&e=3D
> >
> >     +++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&d=
=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv=
5j8&s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&e=3D
> >
> >     @@ -14,6 +14,7 @@ PE =3D "1"
> >       SRC_URI =3D
> >     "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz=
&d=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6=
jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Up=
nv5j8&s=3DYLvorPjD5Y4WlqpYdjRMCkzwnh_cz-C6op19u5O23b8&e=3D
> >
> >     \
> >                  file://opkg.conf \
> >
> >
>  file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> >     +
>  file://0001-libopkg-add-add-ignore-recommends-option.patch \
> >       "
> >
> >       SRC_URI[md5sum] =3D "ae51d95fee599bb4dce08453529158f5"
> >     --
> >     2.20.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org_mailman_listinfo_openembedded-2Dcore&d=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6=
YCiE2uzI1jjZZuIPelcSjixA&r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&m=
=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&s=3DUHPegBWeyh1LTyIdp2oai1-E=
cy-s_l8In1Kk14OFS6Q&e=3D
> >
> >
>
> --
> Cheers,
>
> Alejandro
>

--000000000000ff5e84058153c13a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 7, 2019 at 9:44 AM Alejan=
dro Del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com">alejan=
dro.delcastillo@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
<br>
On 2/7/19 11:36 AM, Scott Rifenbark wrote:<br>
&gt; This change looks like it impacts documentation (i.e. <br>
&gt; <a href=3D"https://yoctoproject.org/docs/2.7/ref-manual/ref-manual.htm=
l#var-BAD_RECOMMENDATIONS" rel=3D"noreferrer" target=3D"_blank">https://yoc=
toproject.org/docs/2.7/ref-manual/ref-manual.html#var-BAD_RECOMMENDATIONS</=
a>.=C2=A0 <br>
&gt; When will this change go into effect? <br>
<br>
I believe it doesn&#39;t. It is refactoring the opkg implementation to <br>
leverage a new opkg feature (--add-ignore-recommends), which is a more <br>
robust implementation. Should be transparent to users.<br></blockquote><div=
><br></div><div>Thank you for the clarification... I thought it might be a =
user option.</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; On Thu, Feb 7, 2019 at 7:58 AM Alejandro del Castillo <br>
&gt; &lt;<a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">=
alejandro.delcastillo@ni.com</a> &lt;mailto:<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0To be used for BAD_RECOMMENDATIONS feature.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Alejandro del Castillo &lt;<a href=
=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.delcas=
tillo@ni.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alejandro.delcastillo@=
ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0...pkg-add-add-ignore-recommends-option.patc=
h | 259 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/opkg/<a href=3D"http:/=
/opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zzg=
XQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrk=
eSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&a=
mp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3Dw=
NcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2E=
Fnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp=
;e=3D</a>&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 260 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/opkg/opkg/0001-libopkg-add-ad=
d-ignore-recommends-option.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-=
add-ignore-recommends-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-=
add-ignore-recommends-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..47d1b3c37e<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/opkg/opkg/0001-libopkg-add-=
add-ignore-recommends-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,259 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 64aa98646a17c299bf37af2975b98daf5d7d30b4 Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Alejandro del Castillo &lt;<a href=3D"mailto=
:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alejandro.delcastillo@=
ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 31 Jan 2019 18:16:08 -0600<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] libopkg: add --add-ignore-recomme=
nds option<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Add option to ignore specific recommended packages=
. On the libsolv<br>
&gt;=C2=A0 =C2=A0 =C2=A0+backed, this feature will only work on libsolv ver=
sion &gt; 0.7.2 [1].<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__github.com_openSUSE_libsolv_issues_254&amp;d=3DDwIBaQ&amp;c=
=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKav=
UrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3DGObNHzFJpWpf_PripIrf-K2RhsktYdAUEieAJexXOKw=
&amp;s=3D3G-meChUqClFggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&amp;e=3D" rel=3D"noref=
errer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__github.com_openSUSE_libsolv_issues_254&amp;d=3DDwIBaQ&amp;c=3DI_0YwoKy=
7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMX=
tynjLd8ZzgXQ&amp;m=3DGObNHzFJpWpf_PripIrf-K2RhsktYdAUEieAJexXOKw&amp;s=3D3G=
-meChUqClFggFPqsrAxIZBfLnRKIHm62Uuy1X6nQQ&amp;e=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Alejandro del Castillo &lt;<a href=
=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.delcas=
tillo@ni.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alejandro.delcastillo@=
ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Accepted<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ libopkg/opkg_conf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ libopkg/opkg_conf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ .../solvers/internal/pkg_depends_internal.c=C2=A0=
 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ libopkg/solvers/libsolv/opkg_solver_libsolv.c | 2=
1 ++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ man/<a href=3D"http://opkg.1.in" rel=3D"noreferre=
r" target=3D"_blank">opkg.1.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2=
uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp=
;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVg=
eo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFa=
Q&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2=
Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D</a>&gt=
; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/opkg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ tests/core/43_add_ignore_recommends.py=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 62 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 8 files changed, 97 insertions(+), 2 deletions(-)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ create mode 100755 tests/core/43_add_ignore_recom=
mends.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_co=
nf.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 06880a1..f2330cd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/libopkg/opkg_conf.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/libopkg/opkg_conf.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -597,6 +597,7 @@ int opkg_conf_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_init(&amp;opkg_c=
onfig-&gt;tmp_dest_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0nv_pair_list_init(&amp;opkg_co=
nfig-&gt;arch_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0str_list_init(&amp;opkg_config=
-&gt;exclude_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 str_list_init(&amp;opkg_config-&gt;=
ignore_recommends_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -938,6 +939,7 @@ void opkg_conf_deinit(void)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_deinit(&amp;opkg=
_config-&gt;pkg_dest_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0nv_pair_list_deinit(&amp;opkg_=
config-&gt;arch_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0str_list_deinit(&amp;opkg_conf=
ig-&gt;exclude_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 str_list_deinit(&amp;opkg_config-&g=
t;ignore_recommends_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0if (opkg_config-&gt;verbosity =
&gt;=3D DEBUG) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hash_print_stats=
(&amp;opkg_config-&gt;pkg_hash);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_co=
nf.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index eb56a29..316c500 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/libopkg/opkg_conf.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/libopkg/opkg_conf.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -61,6 +61,7 @@ typedef struct opkg_conf {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_dest_list_t tmp_dest_list;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0nv_pair_list_t arch_list;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0str_list_t exclude_list;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 str_list_t ignore_recommends_list;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0int restrict_to_default_dest;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_dest_t *default_dest;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/libopkg/solvers/internal/pkg_depends_=
internal.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/libopkg/solvers/internal/pkg_depends_internal.c<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+index cd56d84..5deee70 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/libopkg/solvers/internal/pkg_depends_interna=
l.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/libopkg/solvers/internal/pkg_depends_interna=
l.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -228,7 +228,8 @@ int<br>
&gt;=C2=A0 =C2=A0 =C2=A0pkg_hash_fetch_unsatisfied_dependencies(pkg_t *pkg,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| compound_depend-&=
gt;type =3D=3D SUGGEST)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (satisfying_pkg-&gt;sta=
te_want =3D=3D SW_DEINSTALL<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| satisfying_pkg-&g=
t;state_want =3D=3D SW_PURGE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || opkg_config-&gt;no_inst=
all_recommends);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || opkg_config-&gt;no_inst=
all_recommends<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0str_list_contains(&amp;opkg_config-&gt;ignore_recom=
mends_list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0satisfying_pkg-&gt;name));<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (ignore) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_msg(NOTICE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: ignoring =
recommendation for &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/libopkg/solvers/libsolv/opkg_solver_l=
ibsolv.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/libopkg/solvers/libsolv/opkg_solver_libsolv.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 2b27e3a..403e07b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/libopkg/solvers/libsolv/opkg_solver_libsolv.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/libopkg/solvers/libsolv/opkg_solver_libsolv.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -484,6 +484,7 @@ static void pkg2solvable(pkg_t=
 *pkg, Solvable<br>
&gt;=C2=A0 =C2=A0 =C2=A0*solvable_out)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ static void populate_installed_repo(libsolv_solve=
r_t *libsolv_solver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 Id what;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_vec_t *installed_pkgs =3D =
pkg_vec_alloc();<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -507,6 +508,15 @@ static void<br>
&gt;=C2=A0 =C2=A0 =C2=A0populate_installed_repo(libsolv_solver_t *libsolv_s=
olver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set solvable =
attributes */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg2solvable(pkg=
, solvable);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if the package is =
in ignore-recommends-list, disfavor<br>
&gt;=C2=A0 =C2=A0 =C2=A0installation */<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if<br>
&gt;=C2=A0 =C2=A0 =C2=A0(str_list_contains(&amp;opkg_config-&gt;ignore_reco=
mmends_list, pkg-&gt;name)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_me=
ssage(NOTICE, &quot;Disfavor package: %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg-&gt;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what =
=3D pool_str2id(libsolv_solver-&gt;pool, pkg-&gt;name, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_p=
ush2(&amp;libsolv_solver-&gt;solver_jobs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0SOLVER_SOLVABLE_NAME<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | SOLVER_DISFAVOR, what);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the packag=
e is not autoinstalled, mark it as user<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pkg-&gt;aut=
o_installed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qu=
eue_push2(&amp;libsolv_solver-&gt;solver_jobs, SOLVER_SOLVABLE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -539,7 +549,7 @@ static void<br>
&gt;=C2=A0 =C2=A0 =C2=A0populate_available_repos(libsolv_solver_t *libsolv_=
solver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0Solvable *solvable;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 Id solvable_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 Id solvable_id, what;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0pkg_vec_t *available_pkgs =3D =
pkg_vec_alloc();<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -608,6 +618,15 @@ static void<br>
&gt;=C2=A0 =C2=A0 =C2=A0populate_available_repos(libsolv_solver_t *libsolv_=
solver)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0solvable =3D poo=
l_id2solvable(libsolv_solver-&gt;pool,<br>
&gt;=C2=A0 =C2=A0 =C2=A0solvable_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg2solvable(pkg=
, solvable);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if the package is =
in ignore-recommends-list, disfavor<br>
&gt;=C2=A0 =C2=A0 =C2=A0installation */<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if<br>
&gt;=C2=A0 =C2=A0 =C2=A0(str_list_contains(&amp;opkg_config-&gt;ignore_reco=
mmends_list, pkg-&gt;name)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_me=
ssage(NOTICE, &quot;Disfavor package: %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg-&gt;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 what =
=3D pool_str2id(libsolv_solver-&gt;pool, pkg-&gt;name, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_p=
ush2(&amp;libsolv_solver-&gt;solver_jobs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0SOLVER_SOLVABLE_NAME<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | SOLVER_DISFAVOR, what);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the --forc=
e-depends option is specified make<br>
&gt;=C2=A0 =C2=A0 =C2=A0dependencies weak */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opkg_config-=
&gt;force_depends)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qu=
eue_push2(&amp;libsolv_solver-&gt;solver_jobs, SOLVER_SOLVABLE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/man/<a href=3D"http://opkg.1.in" rel=
=3D"noreferrer" target=3D"_blank">opkg.1.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2=
uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp=
;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVg=
eo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFa=
Q&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2=
Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/man/<a href=3D"http://opkg.1.in" rel=3D"noreferre=
r" target=3D"_blank">opkg.1.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2=
uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp=
;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVg=
eo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFa=
Q&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2=
Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 27fa9c1..f192c3b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/man/<a href=3D"http://opkg.1.in" rel=3D"nore=
ferrer" target=3D"_blank">opkg.1.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2=
uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp=
;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVg=
eo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFa=
Q&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2=
Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/man/<a href=3D"http://opkg.1.in" rel=3D"nore=
ferrer" target=3D"_blank">opkg.1.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2=
uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp=
;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVg=
eo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg.1.in&amp;d=3DDwMFa=
Q&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jf=
xhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2=
Upnv5j8&amp;s=3D8yIWRVT6JV0YnkHzVgeo8pAkiFPM4xz8y9APvxobmhY&amp;e=3D</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -162,6 +162,9 @@ priority \fIprio\fP. Lower pri=
orities take<br>
&gt;=C2=A0 =C2=A0 =C2=A0precedence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ \fB\--add-exclude &lt;\fIname\fP&gt;\fR<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Register package to be excluded from install<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ .TP<br>
&gt;=C2=A0 =C2=A0 =C2=A0++\fB\--add-ignore-recommends &lt;\fIname\fP&gt;\fR=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0++Register package to be ignored as a recomendee<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0++.TP<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ \fB\--prefer-arch-to-version\fR<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Use the architecture priority package rather than=
 the higher version<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ one if more than one candidate is found.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/src/opkg.c b/src/opkg.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 650e278..3c93a3b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/src/opkg.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/src/opkg.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -51,6 +51,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_ADD_DEST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_SIZE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_ADD_EXCLUDE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 ARGS_OPT_ADD_IGNORE_RECOMMENDS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_NOACTION,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_DOWNLOAD_ONLY,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0ARGS_OPT_NODEPS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -112,6 +113,7 @@ static struct option long_opti=
ons[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;add-dest&quot;, 1, 0, A=
RGS_OPT_ADD_DEST},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;size&quot;, 0, 0, ARGS_=
OPT_SIZE},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;add-exclude&quot;, 1, 0=
, ARGS_OPT_ADD_EXCLUDE},<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 {&quot;add-ignore-recommends&quot;,=
 1, 0, ARGS_OPT_ADD_IGNORE_RECOMMENDS},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;test&quot;, 0, 0, ARGS_=
OPT_NOACTION},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;tmp-dir&quot;, 1, 0, &#=
39;t&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0{&quot;tmp_dir&quot;, 1, 0, &#=
39;t&#39;},<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -234,6 +236,9 @@ static int args_parse(int argc=
, char *argv[])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ARGS_OPT_AD=
D_EXCLUDE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
r_list_append(&amp;opkg_config-&gt;exclude_list, optarg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case ARGS_OPT_ADD_IGN=
ORE_RECOMMENDS:<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str_lis=
t_append(&amp;opkg_config-&gt;ignore_recommends_list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0optarg);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case ARGS_OPT_SI=
ZE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op=
kg_config-&gt;size =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -343,6 +348,7 @@ static void usage()<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-dest &lt;=
name&gt;:&lt;path&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Register destination<br>
&gt;=C2=A0 =C2=A0 =C2=A0with given path\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-arch &lt;=
arch&gt;:&lt;prio&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Register<br>
&gt;=C2=A0 =C2=A0 =C2=A0architecture with given priority\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--add-exclude &=
lt;name&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Register package to<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0be excluded from install\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 printf(&quot;\t--add-ignore-recomme=
nds &lt;name&gt;=C2=A0 Register package to<br>
&gt;=C2=A0 =C2=A0 =C2=A0be ignored as a recomendee\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t--prefer-arch-t=
o-version=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use the architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0priority package rather\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 than the higher<br>
&gt;=C2=A0 =C2=A0 =C2=A0version one if more\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0printf(&quot;\t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 than one candidate<br>
&gt;=C2=A0 =C2=A0 =C2=A0is found.\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/tests/Makefile b/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 8e5be08..799816d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -42,6 +42,7 @@ REGRESSION_TESTS :=3D core/01_in=
stall.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0core/40_arch.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0core/41_info_fields.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0core/42_info_description.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 core/43_add_ignore_recommends.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0regress/issue26.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0regress/issue31.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0regress/issue32.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/tests/core/43_add_ignore_recommends.p=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/tests/core/43_add_ignore_recommends.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0+new file mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 0000000..7da0096<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/tests/core/43_add_ignore_recommends.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -0,0 +1,62 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0++#! /usr/bin/env python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0++#<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Create package &#39;a&#39; (1.0) which Recommen=
ds &#39;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Install &#39;a&#39; with --add-ignore-recommend=
s &#39;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Check that only &#39;a&#39; (1.0) is installed.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Create package &#39;b&#39; which Depends on &#3=
9;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Install &#39;a&#39; &amp; &#39;b&#39;, with --a=
dd-ignore-recommends &#39;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Verify that &#39;a&#39;,&#39;b&#39; &amp; &#39;=
c&#39; are installed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Uninstall &#39;b&#39; &amp; &#39;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Create package &#39;a&#39; (2.0), which Recomme=
nds &#39;c&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Upgrade &#39;a&#39; with --add-ignore-recommend=
s &#39;c&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++# Verify that only &#39;a&#39; (2.0) is installed=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0++#<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++import os<br>
&gt;=C2=A0 =C2=A0 =C2=A0++import opk, cfg, opkgcl<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opk.regress_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o =3D opk.OpkGroup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.add(Package=3D&#39;a&#39;, Recommends=3D&#39;c&=
#39;, Version=3D&#39;1.0&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.add(Package=3D&#39;b&#39;, Depends=3D&#39;c&#39=
;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.add(Package=3D&#39;c&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.write_opk()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.write_list()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.update()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.install(&#39;a&#39;, &#39;--add-ignore-rec=
ommends c&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if not opkgcl.is_installed(&#39;a&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
a&#39; installed but reports as not installed.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if opkgcl.is_installed(&#39;c&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.xfail(&quot;[libsolv&lt;=
0.7.3] Package &#39;c&#39; should not have been<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed since it was in --add-ignore-recommends.&=
quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.remove(&#39;a&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.install(&#39;a b&#39;, &#39;--add-ignore-r=
ecommends c&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if not opkgcl.is_installed(&#39;a&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
a&#39; installed but reports as not installed.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if not opkgcl.is_installed(&#39;b&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
b&#39; installed but reports as not installed.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if not opkgcl.is_installed(&#39;c&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
c&#39; should have been installed since &#39;b&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0depends on it.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.remove(&#39;b c&#39;, &#39;--force-depends=
&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.add(Package=3D&#39;a&#39;, Recommends=3D&#39;c&=
#39;, Version=3D&#39;2.0&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.write_opk()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++o.write_list()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.update()<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++opkgcl.upgrade(&#39;a&#39;, &#39;--add-ignore-rec=
ommends c&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if not opkgcl.is_installed(&#39;a&#39;, &#39;2.0&=
#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
a (2.0)&#39; installed but reports as not<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++if opkgcl.is_installed(&#39;c&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 opk.fail(&quot;Package &#39;=
c&#39; should not have been installed since<br>
&gt;=C2=A0 =C2=A0 =C2=A0it was in --add-ignore-recommends.&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.20.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-devtools/opkg/<a href=3D"=
http://opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zzg=
XQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrk=
eSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&a=
mp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3Dw=
NcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2E=
Fnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp=
;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/opkg/<a href=3D"http://opkg=
_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zzg=
XQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrk=
eSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&a=
mp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3Dw=
NcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2E=
Fnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp=
;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 9b7cf3f596..a2329d3e71 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devtools/opkg/<a href=3D"http://=
opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zzg=
XQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrk=
eSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&a=
mp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3Dw=
NcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2E=
Fnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp=
;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-devtools/opkg/<a href=3D"http://=
opkg_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.4.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8Zzg=
XQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrk=
eSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp;e=3D" rel=3D"noreferrer" target=3D"_bla=
nk">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.4.0.bb&a=
mp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3Dw=
NcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2E=
Fnc3G2WZ5KA2Upnv5j8&amp;s=3DJvgzuAyAoVrkeSZAdWZUuIsFWQ8okApbCk1iiF13CDc&amp=
;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -14,6 +14,7 @@ PE =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://downloads.yoctoproject.org/=
releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.=
tar.gz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-=
257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMT=
VdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd=
8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DYLvorPjD=
5Y4WlqpYdjRMCkzwnh_cz-C6op19u5O23b8&amp;e=3D" rel=3D"noreferrer" target=3D"=
_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoc=
toproject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.=
tar.gz&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&a=
mp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VI=
v2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DYLvorPjD5Y4WlqpYdjRMCkzwnh_cz-C6op19u5O=
23b8&amp;e=3D</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://o=
pkg.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-opkg_conf-create-opkg.lock-in-run-inste=
ad-of-var-run.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00=
01-libopkg-add-add-ignore-recommends-option.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;ae51d95fee599bb4dc=
e08453529158f5&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.20.1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Dco=
re&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&amp;r=
=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95YIf_VIv2QH=
Nu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DUHPegBWeyh1LTyIdp2oai1-Ecy-s_l8In1Kk14OFS6Q=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttp-3A__lists.openembedded.org_mailman_listinfo_openembe=
dded-2Dcore&amp;d=3DDwMFaQ&amp;c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSj=
ixA&amp;r=3DwNcrL2akRn6jfxhHaKavUrJB_C9JAMXtynjLd8ZzgXQ&amp;m=3D8hd_9vew95Y=
If_VIv2QHNu2EFnc3G2WZ5KA2Upnv5j8&amp;s=3DUHPegBWeyh1LTyIdp2oai1-Ecy-s_l8In1=
Kk14OFS6Q&amp;e=3D</a>&gt;<br>
&gt; <br>
<br>
-- <br>
Cheers,<br>
<br>
Alejandro<br>
</blockquote></div></div>

--000000000000ff5e84058153c13a--
