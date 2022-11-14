Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC916C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.760.1668452479860716944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l5sofJe6;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id t4so8140626wmj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBRGrQgZu0sbADm/L6F1oYBolDbjuSJoHZaUxC9NFGY=;
        b=l5sofJe6ezQAzs4B20QY8nZmywXFH3PkxrjIObeKPRnzclmcf6MKrOiYrUH94ggrpN
         Da+E4umb2CEwc0zPdwk1jbY+54ACR52PArXceYVjnNNJlZcOHKWt1ZUEMbnSV7yRflm6
         l9C8yWhiwdhVtQMVRp4Nukv43mO4Hog7wjqNZ60iu+0JXzSstflPrXNv76WYsgsNarS8
         w0GFaCYI48sZgQK6XkURboK7wPz8vbSTKew9h2hlUXDANRke5tAEx/coVcdueP1GhVuC
         5BybiecYR+eHoSmxw86g76D5GhliENssZzKKufEznowDJahWHvqDqx4gE3gQBmtqK7+y
         x0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBRGrQgZu0sbADm/L6F1oYBolDbjuSJoHZaUxC9NFGY=;
        b=49u8CwaYsCCz9wofdtBccFpqDUt/GQwk4xKTTafDU5VapfA2dAqwJFGWKIim6Qipti
         mw4ZJYAOyJuHIjK53PzAv1R6YVm/QYMGcWoZDAKQUddGfgr+XIhhUscK9v9TVZpJmU1F
         qUkuPG3Vdj+/hW6MO4F1rT+R87hFPa+y36oERV4l+zsHHv8FKkDl4c5zyci+Iqqxd/vz
         SHU61bERamwerzeLZC40Xra6gB89eRA9LpB9u0Zt2zje77jVhxnO7ciOqhZ1lOWUsMNo
         nOcduQwOkG+adl+7ThT4sbTXrNz4tPBJZL+tKrKuj+hxZKAMh07LooKFADFsV5HkxOeJ
         /wQg==
X-Gm-Message-State: ANoB5pnV8zfwIwUfArxeWZ7Rtn5Nr+r9BNhWMvcgP9dsSx37L+m9kY+9
	G9eFoLr8YqeW+Esn3lm+Ybi2td6fxXc=
X-Google-Smtp-Source: AA0mqf7PhTPKsDLSFLmdK03os61qRLmrgzMd4b4IypOaSuRxlrR7wf7AywmcOE0YkWsFCkP8jfAGNg==
X-Received: by 2002:a05:600c:3d94:b0:3cf:9b4d:ec4f with SMTP id bi20-20020a05600c3d9400b003cf9b4dec4fmr9191175wmb.114.1668452478031;
        Mon, 14 Nov 2022 11:01:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] bash: update 5.1.16 -> 5.2.9
Date: Mon, 14 Nov 2022 20:00:55 +0100
Message-Id: <20221114190056.2612669-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173260

Remove patches:
execute_cmd.patch
(purpose of patch unclear)
makerace.patch/makerace2.patch
(merged upstream)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bash/bash/execute_cmd.patch               | 28 ------
 .../recipes-extended/bash/bash/makerace.patch | 52 ----------
 .../bash/bash/makerace2.patch                 | 98 -------------------
 .../bash/bash/use_aclocal.patch               | 27 +++--
 .../bash/{bash_5.1.16.bb =3D> bash_5.2.9.bb}    |  5 +-
 5 files changed, 20 insertions(+), 190 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/execute_cmd.patch
 delete mode 100644 meta/recipes-extended/bash/bash/makerace.patch
 delete mode 100644 meta/recipes-extended/bash/bash/makerace2.patch
 rename meta/recipes-extended/bash/{bash_5.1.16.bb =3D> bash_5.2.9.bb} (79%)

diff --git a/meta/recipes-extended/bash/bash/execute_cmd.patch b/meta/recip=
es-extended/bash/bash/execute_cmd.patch
deleted file mode 100644
index 7a9e9a902f..0000000000
--- a/meta/recipes-extended/bash/bash/execute_cmd.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Rebase to 5.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- execute_cmd.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/execute_cmd.c b/execute_cmd.c
-index f1d74bf..31674b4 100644
---- a/execute_cmd.c
-+++ b/execute_cmd.c
-@@ -2567,7 +2567,11 @@ execute_pipeline (command, asynchronous, pipe_in, p=
ipe_out, fds_to_close)
-   /* If the `lastpipe' option is set with shopt, and job control is not
-      enabled, execute the last element of non-async pipelines in the
-      current shell environment. */
--  if (lastpipe_opt && job_control =3D=3D 0 && asynchronous =3D=3D 0 && pi=
pe_out =3D=3D NO_PIPE && prev > 0)
-+  if (lastpipe_opt &&=20
-+#if defined(JOB_CONTROL)
-+		job_control =3D=3D 0 &&=20
-+#endif
-+		asynchronous =3D=3D 0 && pipe_out =3D=3D NO_PIPE && prev > 0)
-     {
-       lstdin =3D move_to_high_fd (0, 1, -1);
-       if (lstdin > 0)
---=20
-2.7.4
-
diff --git a/meta/recipes-extended/bash/bash/makerace.patch b/meta/recipes-=
extended/bash/bash/makerace.patch
deleted file mode 100644
index 9bd7c280fe..0000000000
--- a/meta/recipes-extended/bash/bash/makerace.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-We're seeing pipesize.h being created in parallel:
-
-/bin/sh ../../bash-5.1/builtins/psize.sh > pipesize.h
-/bin/sh ../../bash-5.1/builtins/psize.sh > pipesize.h
-
-./mkbuiltins -D ../../bash-5.1/builtins ../../bash-5.1/builtins/ulimit.def
-x86_64-pokysdk-linux-gcc  --sysroot=3D/home/pokybuild/yocto-worker/multili=
b/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0=
/recipe-sysroot -c   -DHAVE_CONFIG_H -DSHELL  -I. -I..  -I../../bash-5.1 -I=
../../bash-5.1/include -I../../bash-5.1/lib -I../../bash-5.1/builtins    -O=
2 -pipe -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/multilib/build/bu=
ild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0=3D/usr/sr=
c/debug/nativesdk-bash/5.1-r0                      -fdebug-prefix-map=3D/ho=
me/pokybuild/yocto-worker/multilib/build/build/tmp/work/x86_64-nativesdk-po=
kysdk-linux/nativesdk-bash/5.1-r0=3D/usr/src/debug/nativesdk-bash/5.1-r0   =
                   -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/multil=
ib/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r=
0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/home/pokybui=
ld/yocto-worker/multilib/build/build/tmp/work/x86_64-nativesdk-pokysdk-linu=
x/nativesdk-bash/5.1-r0/recipe-sysroot-native=3D   ulimit.c || ( rm -f ulim=
it.c ; exit 1 )
-make[1]: Leaving directory '/home/pokybuild/yocto-worker/multilib/build/bu=
ild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0/build/bui=
ltins'
-rm -f redir.o
-x86_64-pokysdk-linux-gcc  --sysroot=3D/home/pokybuild/yocto-worker/multili=
b/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0=
/recipe-sysroot  -DPROGRAM=3D'"bash"' -DCONF_HOSTTYPE=3D'"x86_64"' -DCONF_O=
STYPE=3D'"linux-gnu"' -DCONF_MACHTYPE=3D'"x86_64-pokysdk-linux-gnu"' -DCONF=
_VENDOR=3D'"pokysdk"' -DLOCALEDIR=3D'"/opt/poky/3.2+snapshot/sysroots/x86_6=
4-pokysdk-linux/usr/share/locale"' -DPACKAGE=3D'"bash"' -DSHELL -DHAVE_CONF=
IG_H   -I.  -I../bash-5.1 -I../bash-5.1/include -I../bash-5.1/lib    -O2 -p=
ipe -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/multilib/build/build/=
tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0=3D/usr/src/de=
bug/nativesdk-bash/5.1-r0                      -fdebug-prefix-map=3D/home/p=
okybuild/yocto-worker/multilib/build/build/tmp/work/x86_64-nativesdk-pokysd=
k-linux/nativesdk-bash/5.1-r0=3D/usr/src/debug/nativesdk-bash/5.1-r0       =
               -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/multilib/b=
uild/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0/re=
cipe-sysroot=3D                      -fdebug-prefix-map=3D/home/pokybuild/y=
octo-worker/multilib/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/na=
tivesdk-bash/5.1-r0/recipe-sysroot-native=3D   -c ../bash-5.1/redir.c
-In file included from ../../bash-5.1/builtins/../../bash-5.1/builtins/ulim=
it.def:95:
-pipesize.h:9:5: error: expected '=3D', ',', ';', 'asm' or '__attribute__' =
before '-' token
-    9 | bash-5.1/builtins/psize.sh: 37: ../../bash-5.1/builtins/psize.sh: =
./psize.aux: Text file busy
-      |     ^
-make[1]: *** [Makefile:119: ulimit.o] Error 1
-make[1]: Leaving directory '/home/pokybuild/yocto-worker/multilib/build/bu=
ild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-bash/5.1-r0/build/bui=
ltins'
-make: *** [Makefile:737: builtins/libbuiltins.a] Error 1
-make: *** Waiting for unfinished jobs....
-In file included from ../bash-5.1/redir.c:61:
-./builtins/pipesize.h:9:5: error: expected '=3D', ',', ';', 'asm' or '__at=
tribute__' before '-' token
-    9 | bash-5.1/builtins/psize.sh: 37: ../../bash-5.1/builtins/psize.sh: =
./psize.aux: Text file busy
-      |     ^
-make: *** [Makefile:101: redir.o] Error 1
-WARNING: exit code 1 from a shell command.
-
-which happens since builtins/ulimit.o depends on pipesize.h as well as a t=
op=20
-level dependency. This means:
-
-    @(cd $(DEFDIR) && $(MAKE) $(MFLAGS) pipesize.h ) || exit 1
-
-races with:
-
-    @(cd $(DEFDIR) && $(MAKE) $(MFLAGS) DEBUG=3D${DEBUG} targets ) || exit=
 1
-
-Hack around this by forcing BUILTINS_LIBRARY onto pipesize.h as a dependen=
cy.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-bash/20=
21-01/msg00152.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: bash-5.1/Makefile.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- bash-5.1.orig/Makefile.in
-+++ bash-5.1/Makefile.in
-@@ -746,7 +746,7 @@ ${DEFDIR}/bashgetopt.o:	$(BUILTIN_SRCDIR
- ${DEFDIR}/builtext.h: $(BUILTIN_DEFS)
- 	@(cd $(DEFDIR) && $(MAKE) $(MFLAGS) builtext.h ) || exit 1
-=20
--${DEFDIR}/pipesize.h:
-+${DEFDIR}/pipesize.h: $(BUILTINS_LIBRARY)
- 	@(cd $(DEFDIR) && $(MAKE) $(MFLAGS) pipesize.h ) || exit 1
-=20
- $(SDIR)/man2html$(EXEEXT):	${SUPPORT_SRC}/man2html.c
diff --git a/meta/recipes-extended/bash/bash/makerace2.patch b/meta/recipes=
-extended/bash/bash/makerace2.patch
deleted file mode 100644
index abb51a5086..0000000000
--- a/meta/recipes-extended/bash/bash/makerace2.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-The main makefile can call mkbuiltins from multiple different codepaths in=
 parallel.
-When called, it moves the existing files out the way and creates new ones,=
 then
-compares which will break the build if timing is unlucky.
-
-The root of the problem is mkbuiltins.c creating a file but also referenci=
ng that
-file under the same name. By modifing it to allow the final name and the t=
emp name
-to be specified, we can avoid the original reason for the moving of files =
around.
-This allows them to be created under a new name and then replaced if chang=
ed,
-removing any race windows around accessing the files whilst they've been
-moved or are being rewritten.
-
-See [YOCTO #14227]
-
-Upstream-Status: Submitted [https://savannah.gnu.org/patch/index.php?10210]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: bash-5.1.8/builtins/Makefile.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- bash-5.1.8.orig/builtins/Makefile.in
-+++ bash-5.1.8/builtins/Makefile.in
-@@ -185,19 +185,17 @@ gen-helpfiles:	tmpbuiltins.o gen-helpfil
- 	$(CC_FOR_BUILD) ${CCFLAGS_FOR_BUILD} $(LDFLAGS_FOR_BUILD) -o $@ gen-help=
files.o tmpbuiltins.o $(LIBS_FOR_BUILD)
-=20
- builtext.h builtins.c: $(MKBUILTINS) $(DEFSRC)
--	@-if test -f builtins.c; then mv -f builtins.c old-builtins.c; fi
--	@-if test -f builtext.h; then mv -f builtext.h old-builtext.h; fi
--	./$(MKBUILTINS) -externfile builtext.h -structfile builtins.c \
-+	./$(MKBUILTINS) -externfile builtext-new.h -externfinalfile builtext.h -=
structfile builtins-new.c \
- 	    -noproduction $(DIRECTDEFINE) $(HELPDIRDEFINE) $(HELPSTRINGS) $(DEFS=
RC)
--	@-if cmp -s old-builtext.h builtext.h 2>/dev/null; then \
--		mv old-builtext.h builtext.h; \
-+	@-if ! cmp -s builtext.h builtext-new.h 2>/dev/null; then \
-+		mv builtext-new.h builtext.h; \
- 	 else \
--		$(RM) old-builtext.h; \
-+		$(RM) builtext-new.h; \
- 	 fi
--	@-if cmp -s old-builtins.c builtins.c 2>/dev/null; then \
--		mv old-builtins.c builtins.c; \
-+	@-if ! cmp -s builtins.c builtins-new.c 2>/dev/null; then \
-+		mv builtins-new.c builtins.c; \
- 	 else \
--		$(RM) old-builtins.c; \
-+		$(RM) builtins-new.c; \
- 	 fi
-=20
- helpdoc:	gen-helpfiles
-Index: bash-5.1.8/builtins/mkbuiltins.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- bash-5.1.8.orig/builtins/mkbuiltins.c
-+++ bash-5.1.8/builtins/mkbuiltins.c
-@@ -113,6 +113,9 @@ char *struct_filename =3D (char *)NULL;
- /* The name of the external declaration file. */
- char *extern_filename =3D (char *)NULL;
-=20
-+/* The final name of the external declaration file. */
-+char *extern_final_filename =3D (char *)NULL;
-+
- /* Here is a structure for manipulating arrays of data. */
- typedef struct {
-   int size;		/* Number of slots allocated to array. */
-@@ -230,6 +233,8 @@ main (argc, argv)
-=20
-       if (strcmp (arg, "-externfile") =3D=3D 0)
- 	extern_filename =3D argv[arg_index++];
-+      else if (strcmp (arg, "-externfinalfile") =3D=3D 0)
-+	extern_final_filename =3D argv[arg_index++];
-       else if (strcmp (arg, "-structfile") =3D=3D 0)
- 	struct_filename =3D argv[arg_index++];
-       else if (strcmp (arg, "-noproduction") =3D=3D 0)
-@@ -273,6 +278,9 @@ main (argc, argv)
- 	}
-     }
-=20
-+  if (!extern_final_filename)
-+    extern_final_filename =3D extern_filename;
-+
-   /* If there are no files to process, just quit now. */
-   if (arg_index =3D=3D argc)
-     exit (0);
-@@ -1174,7 +1182,7 @@ write_file_headers (structfile, externfi
- 	fprintf (structfile, "%s\n", structfile_header[i]);
-=20
-       fprintf (structfile, "#include \"%s\"\n",
--	       extern_filename ? extern_filename : "builtext.h");
-+	       extern_final_filename ? extern_final_filename : "builtext.h");
-=20
-       fprintf (structfile, "#include \"bashintl.h\"\n");
-=20
-@@ -1184,7 +1192,7 @@ write_file_headers (structfile, externfi
-   if (externfile)
-     fprintf (externfile,
- 	     "/* %s - The list of builtins found in libbuiltins.a. */\n",
--	     extern_filename ? extern_filename : "builtext.h");
-+	     extern_final_filename ? extern_final_filename : "builtext.h");
- }
-=20
- /* Write out any necessary closing information for
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recip=
es-extended/bash/bash/use_aclocal.patch
index bebaa08bfe..bd6870b386 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,3 +1,8 @@
+From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 28 Dec 2020 21:04:27 +0100
+Subject: [PATCH] bash: update 5.0 -> 5.1
+
 Including m4 files directly like this confuses autotools.bbclass, remove
 the references and rely upon aclocal to collect the m4 files together
 as needed instead making it work like other autotools based projects.
@@ -5,17 +10,23 @@ as needed instead making it work like other autotools ba=
sed projects.
 Upstream-Status: Inappropriate [OE configuration specific]
 RP 2021/1/20
=20
-Index: bash-5.1/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- bash-5.1.orig/configure.ac
-+++ bash-5.1/configure.ac
-@@ -688,47 +688,6 @@ if test x$SIZE =3D x; then
+---
+ configure.ac | 43 -------------------------------------------
+ 1 file changed, 43 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 50a6e20..a3b5bd7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -710,49 +710,6 @@ if test x$SIZE =3D x; then
  fi
  AC_SUBST(SIZE)
=20=20
 -m4_include([m4/stat-time.m4])
 -m4_include([m4/timespec.m4])
 -
+-m4_include([m4/strtoimax.m4])
+-
 -dnl include files for gettext
 -
 -m4_include([m4/codeset.m4])
@@ -54,6 +65,6 @@ Index: bash-5.1/configure.ac
 -m4_include([m4/wint_t.m4])
 -m4_include([m4/xsize.m4])
 -
- dnl Turn on any extensions available in the GNU C library.
- AC_DEFINE(_GNU_SOURCE, 1)
-=20
+ dnl C compiler characteristics
+ AC_C_CONST
+ AC_C_INLINE
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-exten=
ded/bash/bash_5.2.9.bb
similarity index 79%
rename from meta/recipes-extended/bash/bash_5.1.16.bb
rename to meta/recipes-extended/bash/bash_5.2.9.bb
index d046faa4e5..39a5d3de86 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.2.9.bb
@@ -5,7 +5,6 @@ LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
=20
 SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtarball \
-           file://execute_cmd.patch \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
@@ -13,11 +12,9 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtarb=
all \
            file://run-bash-ptests \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
-           file://makerace.patch \
-           file://makerace2.patch \
            "
=20
-SRC_URI[tarball.sha256sum] =3D "5bac17218d3911834520dad13cd1f85ab944e1c09a=
e1aba55906be1f8192f558"
+SRC_URI[tarball.sha256sum] =3D "68d978264253bc933d692f1de195e2e5b463a3984d=
fb4e5504b076865f16b6dd"
=20
 DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS', =
'-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS', =
'-mthumb', '-fomit-frame-pointer', '', d)}"
--=20
2.30.2


