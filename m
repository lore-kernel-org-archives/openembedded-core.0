Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBBWt-0004Va-3i
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:23:57 +0200
Received: by pzd13 with SMTP id 13so2432508pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=bjHKIBPIyFTyPCveTXUsbq5ja/3m/JBRg+JFSIe1JZ4=;
	b=Wkg4Rr/yKWjOluY5fwbJzd8vE4FoG1Ydth+dunUK6gsyFIIiLgPcOf0fp5bPDJ0RQ0
	FP2DjBjp1wNVsrvGYqDSscyVqBtkGeWnx6LDxsS1ykc6u7ysFvErCR091CFM0dTuIQN4
	57QTGuiUNaFUOfFRkzqhSPJBSOGcCP1rR3F5Y=
Received: by 10.68.208.229 with SMTP id mh5mr12093994pbc.124.1317759498810;
	Tue, 04 Oct 2011 13:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 4 Oct 2011 13:17:48 -0700 (PDT)
In-Reply-To: <20111004200537.GA28173@gonzales.palutemo>
References: <1317634209-3154-1-git-send-email-mokml@mnet-online.de>
	<4E8A114C.4050106@gmail.com> <20111004200537.GA28173@gonzales.palutemo>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2011 13:17:48 -0700
Message-ID: <CAMKF1sqgd94K8AiRyZn_+dX1PFig+bUYNP0R84K0AAueebPO9A@mail.gmail.com>
To: Klaus Kurzmann <mok@fluxnetz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-2.14: add patch to fix libdl crash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2011 20:23:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 1:05 PM, Klaus 'mrmoku' Kurzmann
<mokml@mnet-online.de> wrote:
> Hello,
>
> On Mon, 03 Oct 2011, Khem Raj wrote:
>
>> On 10/3/2011 2:30 AM, mokml@mnet-online.de wrote:
>> >From: Klaus Kurzmann<mok@fluxnetz.de>
>> >
>> >* Without this patch programs using alsa-lib crash (alsamixer for examp=
le).
>> >* This patch is taken verbatim from ArchLinux.
>> >
>
>> can you add appropriate header for this?
>
> Sorry, still have to find my way into the new stuff :) Martin pointed
> that out to me - after I sent the mail.
>
> I tried googling to find out about the upstream status for more than an
> hour - without success. And glibc commit messages seem to be not very
> informative mostly ;)
>

the patch is not applied upstream last time I looked quickly.

>> secondly this reverts the license year text
>> from 2011 to 2010 that should not be needed.
>
> yeah, I have seen that. I think that comes from the patch being a revert
> (or partial revert) of some commit. If it is ok to change 'stolen'
> patches I can remove that.\

yes licenses dont change because of a single revert there might be more
changes that were done in that time frame which should have used the
current year.

>
> Klaus 'mrmoku' Kurzmann
>
>> >Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>
>> >---
>> > =C2=A0.../eglibc-2.14/glibc-2.14-libdl-crash.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0132 ++++++++++++++++++++
>> > =C2=A0meta/recipes-core/eglibc/eglibc_2.14.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
>> > =C2=A02 files changed, 134 insertions(+), 1 deletions(-)
>> > =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/glibc-2.=
14-libdl-crash.patch
>> >
>> >diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-cras=
h.patch b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>> >new file mode 100644
>> >index 0000000..ee29f8c
>> >--- /dev/null
>> >+++ b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
>> >@@ -0,0 +1,132 @@
>> >+diff --git a/elf/dl-close.c b/elf/dl-close.c
>> >+index 73b2a2f..9bd91e3 100644
>> >+--- a/elf/dl-close.c
>> >++++ b/elf/dl-close.c
>> >+@@ -1,5 +1,5 @@
>> >+ /* Close a shared object opened by `_dl_open'.
>> >+- =C2=A0 Copyright (C) 1996-2007, 2009, 2010, 2011 Free Software Found=
ation, Inc.
>> >++ =C2=A0 Copyright (C) 1996-2007, 2009, 2010 Free Software Foundation,=
 Inc.
>> >+ =C2=A0 =C2=A0This file is part of the GNU C Library.
>> >+
>> >+ =C2=A0 =C2=A0The GNU C Library is free software; you can redistribute=
 it and/or
>> >+@@ -119,17 +119,8 @@ _dl_close_worker (struct link_map *map)
>> >+ =C2=A0 if (map->l_direct_opencount> =C2=A00 || map->l_type !=3D lt_lo=
aded
>> >+ =C2=A0 =C2=A0 =C2=A0 || dl_close_state !=3D not_pending)
>> >+ =C2=A0 =C2=A0 {
>> >+- =C2=A0 =C2=A0 =C2=A0if (map->l_direct_opencount =3D=3D 0)
>> >+- =C2=A0 {
>> >+- =C2=A0 =C2=A0 if (map->l_type =3D=3D lt_loaded)
>> >+- =C2=A0 =C2=A0 =C2=A0 dl_close_state =3D rerun;
>> >+- =C2=A0 =C2=A0 else if (map->l_type =3D=3D lt_library)
>> >+- =C2=A0 =C2=A0 =C2=A0 {
>> >+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct link_map **oldp =3D map->l_initfi=
ni;
>> >+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 map->l_initfini =3D map->l_orig_initfini=
;
>> >+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dl_scope_free (oldp);
>> >+- =C2=A0 =C2=A0 =C2=A0 }
>> >+- =C2=A0 }
>> >++ =C2=A0 =C2=A0 =C2=A0if (map->l_direct_opencount =3D=3D 0&& =C2=A0map=
->l_type =3D=3D lt_loaded)
>> >++ =C2=A0 dl_close_state =3D rerun;
>> >+
>> >+ =C2=A0 =C2=A0 =C2=A0 /* There are still references to this object. =
=C2=A0Do nothing more. =C2=A0*/
>> >+ =C2=A0 =C2=A0 =C2=A0 if (__builtin_expect (GLRO(dl_debug_mask)& =C2=
=A0DL_DEBUG_FILES, 0))
>> >+diff --git a/elf/dl-deps.c b/elf/dl-deps.c
>> >+index 9e30594..3890d00 100644
>> >+--- a/elf/dl-deps.c
>> >++++ b/elf/dl-deps.c
>> >+@@ -478,6 +478,7 @@ _dl_map_object_deps (struct link_map *map,
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nneeded * sizeof need=
ed[0]);
>> >+ =C2=A0 =C2=A0 =C2=A0atomic_write_barrier ();
>> >+ =C2=A0 =C2=A0 =C2=A0l->l_initfini =3D l_initfini;
>> >++ =C2=A0 =C2=A0 l->l_free_initfini =3D 1;
>> >+ =C2=A0 =C2=A0}
>> >+
>> >+ =C2=A0 =C2=A0 =C2=A0 /* If we have no auxiliary objects just go on to=
 the next map. =C2=A0*/
>> >+@@ -681,6 +682,7 @@ Filters not supported with LD_TRACE_PRELINKING"));
>> >+ =C2=A0 l_initfini[nlist] =3D NULL;
>> >+ =C2=A0 atomic_write_barrier ();
>> >+ =C2=A0 map->l_initfini =3D l_initfini;
>> >++ =C2=A0map->l_free_initfini =3D 1;
>> >+ =C2=A0 if (l_reldeps !=3D NULL)
>> >+ =C2=A0 =C2=A0 {
>> >+ =C2=A0 =C2=A0 =C2=A0 atomic_write_barrier ();
>> >+@@ -689,5 +691,5 @@ Filters not supported with LD_TRACE_PRELINKING"));
>> >+ =C2=A0 =C2=A0 =C2=A0 _dl_scope_free (old_l_reldeps);
>> >+ =C2=A0 =C2=A0 }
>> >+ =C2=A0 if (old_l_initfini !=3D NULL)
>> >+- =C2=A0 =C2=A0 =C2=A0map->l_orig_initfini =3D old_l_initfini;
>> >++ =C2=A0 =C2=A0_dl_scope_free (old_l_initfini);
>> >+ }
>> >+diff --git a/elf/dl-libc.c b/elf/dl-libc.c
>> >+index 7be9483..a13fce3 100644
>> >+--- a/elf/dl-libc.c
>> >++++ b/elf/dl-libc.c
>> >+@@ -265,13 +265,13 @@ libc_freeres_fn (free_mem)
>> >+
>> >+ =C2=A0 for (Lmid_t ns =3D 0; ns< =C2=A0GL(dl_nns); ++ns)
>> >+ =C2=A0 =C2=A0 {
>> >+- =C2=A0 =C2=A0 =C2=A0/* Remove all additional names added to the obje=
cts. =C2=A0*/
>> >+ =C2=A0 =C2=A0 =C2=A0 for (l =3D GL(dl_ns)[ns]._ns_loaded; l !=3D NULL=
; l =3D l->l_next)
>> >+ =C2=A0 =C2=A0{
>> >+ =C2=A0 =C2=A0 =C2=A0struct libname_list *lnp =3D l->l_libname->next;
>> >+
>> >+ =C2=A0 =C2=A0 =C2=A0l->l_libname->next =3D NULL;
>> >+
>> >++ =C2=A0 =C2=A0 /* Remove all additional names added to the objects. =
=C2=A0*/
>> >+ =C2=A0 =C2=A0 =C2=A0while (lnp !=3D NULL)
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct libname_list *old =3D lnp;
>> >+@@ -279,6 +279,10 @@ libc_freeres_fn (free_mem)
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! old->dont_free)
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (old);
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> >++
>> >++ =C2=A0 =C2=A0 /* Free the initfini dependency list. =C2=A0*/
>> >++ =C2=A0 =C2=A0 if (l->l_free_initfini)
>> >++ =C2=A0 =C2=A0 =C2=A0 free (l->l_initfini);
>> >+ =C2=A0 =C2=A0}
>> >+
>> >+ =C2=A0 =C2=A0 =C2=A0 if (__builtin_expect (GL(dl_ns)[ns]._ns_global_s=
cope_alloc, 0) !=3D 0
>> >+diff --git a/elf/rtld.c b/elf/rtld.c
>> >+index 4a9109e..617e30e 100644
>> >+--- a/elf/rtld.c
>> >++++ b/elf/rtld.c
>> >+@@ -2251,6 +2251,7 @@ ERROR: ld.so: object '%s' cannot be loaded as au=
dit interface: %s; ignored.\n",
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lnp->dont_free =3D 1;
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lnp =3D lnp->next;
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> >++ =C2=A0 =C2=A0 l->l_free_initfini =3D 0;
>> >+
>> >+ =C2=A0 =C2=A0 =C2=A0if (l !=3D&GL(dl_rtld_map))
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0_dl_relocate_object (l, l->l_scope, GLRO(d=
l_lazy) ? RTLD_LAZY : 0,
>> >+diff --git a/include/link.h b/include/link.h
>> >+index e877104..051b99a 100644
>> >+--- a/include/link.h
>> >++++ b/include/link.h
>> >+@@ -1,6 +1,6 @@
>> >+ /* Data structure for communication from the run-time dynamic linker =
for
>> >+ =C2=A0 =C2=A0loaded ELF shared objects.
>> >+- =C2=A0 Copyright (C) 1995-2006, 2007, 2009, 2010, 2011 Free Software=
 Foundation, Inc.
>> >++ =C2=A0 Copyright (C) 1995-2006, 2007, 2009, 2010 Free Software Found=
ation, Inc.
>> >+ =C2=A0 =C2=A0This file is part of the GNU C Library.
>> >+
>> >+ =C2=A0 =C2=A0The GNU C Library is free software; you can redistribute=
 it and/or
>> >+@@ -192,6 +192,9 @@ struct link_map
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 during LD_TRACE_PRELINKING=3D1
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 contains any DT_SYMBOLIC
>> >+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libraries. =C2=A0*/
>> >++ =C2=A0 =C2=A0unsigned int l_free_initfini:1; /* Nonzero if l_initfin=
i can be
>> >++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freed, ie. not allocate=
d with
>> >++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the dummy malloc in ld.=
so. =C2=A0*/
>> >+
>> >+ =C2=A0 =C2=A0 /* Collected information about own RPATH directories. =
=C2=A0*/
>> >+ =C2=A0 =C2=A0 struct r_search_path_struct l_rpath_dirs;
>> >+@@ -240,9 +243,6 @@ struct link_map
>> >+
>> >+ =C2=A0 =C2=A0 /* List of object in order of the init and fini calls. =
=C2=A0*/
>> >+ =C2=A0 =C2=A0 struct link_map **l_initfini;
>> >+- =C2=A0 =C2=A0/* The init and fini list generated at startup, saved w=
hen the
>> >+- =C2=A0 =C2=A0 =C2=A0 object is also loaded dynamically. =C2=A0*/
>> >+- =C2=A0 =C2=A0struct link_map **l_orig_initfini;
>> >+
>> >+ =C2=A0 =C2=A0 /* List of the dependencies introduced through symbol b=
inding. =C2=A0*/
>> >+ =C2=A0 =C2=A0 struct link_map_reldeps
>> >diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-cor=
e/eglibc/eglibc_2.14.bb
>> >index b2821db..4129947 100644
>> >--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
>> >+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
>> >@@ -3,7 +3,7 @@ require eglibc.inc
>> > =C2=A0SRCREV =3D "15225"
>> >
>> > =C2=A0DEPENDS +=3D "gperf-native"
>> >-PR =3D "r0"
>> >+PR =3D "r1"
>> > =C2=A0PR_append =3D "+svnr${SRCPV}"
>> >
>> > =C2=A0EGLIBC_BRANCH=3D"eglibc-2_14"
>> >@@ -19,6 +19,7 @@ SRC_URI =3D "svn://www.eglibc.org/svn/branches/;modul=
e=3D${EGLIBC_BRANCH};proto=3Dhttp
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ppc-sqrt.patch \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://multilib_readlib.patc=
h \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://eglibc-rpc-export-aga=
in.patch \
>> >+ =C2=A0 =C2=A0 =C2=A0 file://glibc-2.14-libdl-crash.patch \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>> > =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3D98a1128c4b58120182cb=
ea3b1752d8b9 \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D393a5ca445f6965873eca0=
259a17f833 \
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


