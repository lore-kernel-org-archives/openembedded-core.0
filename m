Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F6DC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:21:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.4715.1648714889217913988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UOqmeLyC;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id k21so40118706lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5sZ5Canz4hEQPHSms4N57EhBTGoyiAIEdF61FzWgHRI=;
        b=UOqmeLyCulnv0ZQS8I6tapr/g9CY2u57t4dkBXyQ/y/esfXsbTYGX1ZUPiYz7yTY7C
         MNQAJYgUBVBf3dzv3yZMu4JtVWO9ztXcHRi2RAUX8jkrtiCjcWrnFUrvnSMGj5ad4BNl
         QHotk2tv+JZr1ELPHyzSJ4dEc69KqZGa5uOCF16ACCJZ9MCOkormqG/B4j1xBsRoN7jJ
         U9sSH86Atn9OAwMrafycjpM4ULQhdm4lu+R8Ts5WvmrxrVQQ2wgHaRTAIuHceNdsmt9t
         9px1lDOMouHEBDbxBG+2KtZnkU6hU4x4hwkaoverhMace9HGf3/gue1O696KdA1+0+SN
         Q57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5sZ5Canz4hEQPHSms4N57EhBTGoyiAIEdF61FzWgHRI=;
        b=QxXIsFLOEhLgilrcBZDEmMqPem8OazGs+OvRVTNZs1Ret308q78TXCxY8zPqgSvyz7
         amCeETU3UvtmCIwjnzWPq5FmoAQ9NicJHTZhpzH/ZESk37JQH0DQos8j9SFD9ZLrnMOk
         rBEARuCbanBpkpILa/hY0YRKCILpr0HpKom2kHYSDqvj0oyII+O8chDYr8jXy919oMU+
         aCqFhVb57A42GGU2YTbzX6tboy9ZvMtQ6kxNyAaFRIuWGhjqSUsxVzaQI6zu69R7WDCm
         CzCLBpZYpUvYa6HkRe2GOYLkMx3wV8cttelROvGid/qHisq1jRnON+RI6/czTypMcUtm
         ZGqg==
X-Gm-Message-State: AOAM531p0MaWa1hi6XCAB/c0JCrzNyBFcn2+2rKUdT7H6C5jD2xS3ehB
	6uwrvItxKsMe9fJZvd/RHm8zB8cCOzzYrtTGHi4=
X-Google-Smtp-Source: 
 ABdhPJx8n9KCujB3Yu40cwzrFFBOEBIrXj1C5H6SvKdVY1iX4hKXUGhTJZnmf+CdwOtwoItU480OOVmqDibX+1lpB9E=
X-Received: by 2002:ac2:41d4:0:b0:44a:cc0b:3eb1 with SMTP id
 d20-20020ac241d4000000b0044acc0b3eb1mr1778977lfi.95.1648714886909; Thu, 31
 Mar 2022 01:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220330221139.54366-1-saul.wold@windriver.com>
In-Reply-To: <20220330221139.54366-1-saul.wold@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 31 Mar 2022 09:21:15 +0100
Message-ID: 
 <CANPvuRm37cGXoS+-nMhmBe1CNUFWwU2e1FpTmw9zW52nqEAtWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] kmod: Add an exclude directive to depmod
To: Saul Wold <Saul.Wold@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002b93ef05db7f594e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 08:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163805

--0000000000002b93ef05db7f594e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Saul Wold <Saul.Wold@windriver.com> escreveu no dia quarta, 30/03/2022 =C3=
=A0(s)
23:12:

> This adds a new configuration directive to depmod that causes
> depmod to exclude a give path entry like .debug.
>
> kernel-dbg provides the modules .debug/<module>.ko files and
> when installed either directly or when dbg-pkgs are selected
> this can cause depmod to fail.
>
> This patch will be submitted to upstream kmod.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  .../kmod/depmodwrapper-cross_1.0.bb           |   3 +
>  ...dd-support-for-excluding-a-directory.patch | 158 ++++++++++++++++++
>  meta/recipes-kernel/kmod/kmod_29.bb           |   4 +
>  3 files changed, 165 insertions(+)
>  create mode 100644
> meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-dir=
ectory.patch
>
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index 04fc14a6d21..aa23ba41276 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -16,6 +16,9 @@ do_populate_sysroot[depends] =3D ""
>
>  do_install() {
>         install -d ${D}${bindir_crossscripts}/
> +       install -d ${D}${sysconfdir}/depmod.d/
> +
> +       echo "exclude .debug" > ${D}${sysconfdir}/depmod.d/exclude.conf
>
>         cat > ${D}${bindir_crossscripts}/depmodwrapper << EOF
>  #!/bin/sh
> diff --git
> a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-d=
irectory.patch
> b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-d=
irectory.patch
> new file mode 100644
> index 00000000000..3f16cdf0574
> --- /dev/null
> +++
> b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-d=
irectory.patch
> @@ -0,0 +1,158 @@
> +From 8bc07c3ba3a412bd6bb94ad8bad0d76801ec2c9f Mon Sep 17 00:00:00 2001
> +From: Saul Wold <saul.wold@windriver.com>
> +Date: Tue, 22 Mar 2022 12:11:45 -0700
> +Subject: [PATCH] depmod: Add support for excluding a directory
> +
> +This adds support to depmod to enable a new exclude directive in
> +the depmod.d/exclude.conf configuration file. Currently depmod
> +already excludes directories named source or build. This change
> +will allow additional directories like .debug to be excluded also
> +via a new exclude directive.
> +
> +depmod.d/exclude.conf example:
> +exclude        .debug
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +
> +%% original patch: 0001-depmod-Add-support-for-excluding-a-directory.pat=
ch
>

This line comes from devtool but is not needed.

Jose


> +---
> + man/depmod.d.xml | 14 +++++++++++++
> + tools/depmod.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 68 insertions(+)
> +
> +diff --git a/man/depmod.d.xml b/man/depmod.d.xml
> +index b315e93..9ab790a 100644
> +--- a/man/depmod.d.xml
> ++++ b/man/depmod.d.xml
> +@@ -131,6 +131,20 @@
> +           </para>
> +         </listitem>
> +       </varlistentry>
> ++      <varlistentry>
> ++        <term>external <replaceable>excludedir</replaceable>
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++            This specifies the trailing directories that will be exclud=
ed
> ++            during the search for kernel modules.
> ++          </para>
> ++          <para>
> ++          The <replaceable>excludedir</replaceable> the trailing
> directory
> ++          to exclude
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> +     </variablelist>
> +   </refsect1>
> +
> +diff --git a/tools/depmod.c b/tools/depmod.c
> +index eb810b8..8b19ab6 100644
> +--- a/tools/depmod.c
> ++++ b/tools/depmod.c
> +@@ -458,6 +458,12 @@ struct cfg_external {
> +       char path[];
> + };
> +
> ++struct cfg_exclude {
> ++      struct cfg_exclude *next;
> ++      size_t len;
> ++      char exclude_dir[];
> ++};
> ++
> + struct cfg {
> +       const char *kversion;
> +       char dirname[PATH_MAX];
> +@@ -469,6 +475,7 @@ struct cfg {
> +       struct cfg_override *overrides;
> +       struct cfg_search *searches;
> +       struct cfg_external *externals;
> ++      struct cfg_exclude *excludes;
> + };
> +
> + static enum search_type cfg_define_search_type(const char *path)
> +@@ -580,6 +587,31 @@ static void cfg_external_free(struct cfg_external
> *ext)
> +       free(ext);
> + }
> +
> ++static int cfg_exclude_add(struct cfg *cfg, const char *path)
> ++{
> ++      struct cfg_exclude *exc;
> ++      size_t len =3D strlen(path);
> ++
> ++      exc =3D malloc(sizeof(struct cfg_exclude) + len);
> ++      if (exc =3D=3D NULL) {
> ++              ERR("exclude add: out of memory\n");
> ++              return -ENOMEM;
> ++      }
> ++      exc->len =3D len;
> ++      memcpy(exc->exclude_dir, path, len);
> ++
> ++      DBG("exclude add: %s\n", path);
> ++
> ++      exc->next =3D cfg->excludes;
> ++      cfg->excludes =3D exc;
> ++      return 0;
> ++}
> ++
> ++static void cfg_exclude_free(struct cfg_exclude *exc)
> ++{
> ++      free(exc);
> ++}
> ++
> + static int cfg_kernel_matches(const struct cfg *cfg, const char *patter=
n)
> + {
> +       regex_t re;
> +@@ -657,6 +689,11 @@ static int cfg_file_parse(struct cfg *cfg, const
> char *filename)
> +                       }
> +
> +                       cfg_external_add(cfg, dir);
> ++              } else if (streq(cmd, "exclude")) {
> ++                      const char *sp;
> ++                      while ((sp =3D strtok_r(NULL, "\t ", &saveptr)) !=
=3D
> NULL) {
> ++                              cfg_exclude_add(cfg, sp);
> ++                      }
> +               } else if (streq(cmd, "include")
> +                               || streq(cmd, "make_map_files")) {
> +                       INF("%s:%u: command %s not implemented yet\n",
> +@@ -857,6 +894,12 @@ static void cfg_free(struct cfg *cfg)
> +               cfg->externals =3D cfg->externals->next;
> +               cfg_external_free(tmp);
> +       }
> ++
> ++      while (cfg->excludes) {
> ++              struct cfg_exclude *tmp =3D cfg->excludes;
> ++              cfg->excludes =3D cfg->excludes->next;
> ++              cfg_exclude_free(tmp);
> ++      }
> + }
> +
> +
> +@@ -1239,12 +1282,23 @@ static int depmod_modules_search_dir(struct
> depmod *depmod, DIR *d, size_t basel
> +               const char *name =3D de->d_name;
> +               size_t namelen;
> +               uint8_t is_dir;
> ++              struct cfg_exclude *exc;
> ++              int exclude =3D 0;
> +
> +               if (name[0] =3D=3D '.' && (name[1] =3D=3D '\0' ||
> +                                      (name[1] =3D=3D '.' && name[2] =3D=
=3D
> '\0')))
> +                       continue;
> +               if (streq(name, "build") || streq(name, "source"))
> +                       continue;
> ++
> ++              for (exc =3D depmod->cfg->excludes; exc !=3D NULL; exc =
=3D
> exc->next) {
> ++                      if (streq(name, exc->exclude_dir)) {
> ++                              exclude =3D 1;
> ++                      }
> ++              }
> ++              if (exclude)
> ++                      continue;
> ++
> +               namelen =3D strlen(name);
> +               if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) =
{
> +                       err =3D -ENOMEM;
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-kernel/kmod/kmod_29.bb
> b/meta/recipes-kernel/kmod/kmod_29.bb
> index 91951edde16..9b663490666 100644
> --- a/meta/recipes-kernel/kmod/kmod_29.bb
> +++ b/meta/recipes-kernel/kmod/kmod_29.bb
> @@ -20,6 +20,7 @@ SRCREV =3D "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
>  SRC_URI =3D "git://
> git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=3Dmaster \
>             file://depmod-search.conf \
>             file://avoid_parallel_tests.patch \
> +           file://0001-depmod-Add-support-for-excluding-a-directory.patc=
h
> \
>             "
>
>  S =3D "${WORKDIR}/git"
> @@ -64,6 +65,9 @@ do_install:append () {
>
>          # install depmod.d file for search/ dir
>          install -Dm644 "${WORKDIR}/depmod-search.conf"
> "${D}${nonarch_base_libdir}/depmod.d/search.conf"
> +
> +        # Add .debug to the exclude path for depmod
> +        echo "exclude .debug" >
> ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
>  }
>
>  ALTERNATIVE_PRIORITY =3D "70"
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163795):
> https://lists.openembedded.org/g/openembedded-core/message/163795
> Mute This Topic: https://lists.openembedded.org/mt/90143170/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002b93ef05db7f594e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Saul,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Saul Wold &lt;<a href=3D"mailto:Saul.Wold@win=
driver.com">Saul.Wold@windriver.com</a>&gt; escreveu no dia quarta, 30/03/2=
022 =C3=A0(s) 23:12:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This adds a new configuration directive to depmod that causes<br>
depmod to exclude a give path entry like .debug.<br>
<br>
kernel-dbg provides the modules .debug/&lt;module&gt;.ko files and<br>
when installed either directly or when dbg-pkgs are selected<br>
this can cause depmod to fail.<br>
<br>
This patch will be submitted to upstream kmod.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver.com" tar=
get=3D"_blank">saul.wold@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">depmodwrapper-cross_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0...dd-support-for-excluding-a-directory.patch | 158 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-kernel/kmod/<a href=3D"http://kmod_29.bb" rel=3D"norefer=
rer" target=3D"_blank">kmod_29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +<br>
=C2=A03 files changed, 165 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-supp=
ort-for-excluding-a-directory.patch<br>
<br>
diff --git a/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross=
_1.0.bb" rel=3D"noreferrer" target=3D"_blank">depmodwrapper-cross_1.0.bb</a=
> b/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">depmodwrapper-cross_1.0.bb</a><br>
index 04fc14a6d21..aa23ba41276 100644<br>
--- a/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">depmodwrapper-cross_1.0.bb</a><br>
+++ b/meta/recipes-kernel/kmod/<a href=3D"http://depmodwrapper-cross_1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">depmodwrapper-cross_1.0.bb</a><br>
@@ -16,6 +16,9 @@ do_populate_sysroot[depends] =3D &quot;&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir_crossscripts}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/depmod.d/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;exclude .debug&quot; &gt; ${D}${sysc=
onfdir}/depmod.d/exclude.conf<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; ${D}${bindir_crossscripts}/depmodwrapp=
er &lt;&lt; EOF<br>
=C2=A0#!/bin/sh<br>
diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excl=
uding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-sup=
port-for-excluding-a-directory.patch<br>
new file mode 100644<br>
index 00000000000..3f16cdf0574<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a=
-directory.patch<br>
@@ -0,0 +1,158 @@<br>
+From 8bc07c3ba3a412bd6bb94ad8bad0d76801ec2c9f Mon Sep 17 00:00:00 2001<br>
+From: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver.com" target=3D"_=
blank">saul.wold@windriver.com</a>&gt;<br>
+Date: Tue, 22 Mar 2022 12:11:45 -0700<br>
+Subject: [PATCH] depmod: Add support for excluding a directory<br>
+<br>
+This adds support to depmod to enable a new exclude directive in<br>
+the depmod.d/exclude.conf configuration file. Currently depmod<br>
+already excludes directories named source or build. This change<br>
+will allow additional directories like .debug to be excluded also<br>
+via a new exclude directive.<br>
+<br>
+depmod.d/exclude.conf example:<br>
+exclude=C2=A0 =C2=A0 =C2=A0 =C2=A0 .debug<br>
+<br>
+Upstream-Status: Submitted<br>
+<br>
+Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver.com" ta=
rget=3D"_blank">saul.wold@windriver.com</a>&gt;<br>
+<br>
+%% original patch: 0001-depmod-Add-support-for-excluding-a-directory.patch=
<br></blockquote><div><br></div><div>This line comes from devtool but is no=
t needed.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+---<br>
+ man/depmod.d.xml | 14 +++++++++++++<br>
+ tools/depmod.c=C2=A0 =C2=A0| 54 +++++++++++++++++++++++++++++++++++++++++=
+++++++<br>
+ 2 files changed, 68 insertions(+)<br>
+<br>
+diff --git a/man/depmod.d.xml b/man/depmod.d.xml<br>
+index b315e93..9ab790a 100644<br>
+--- a/man/depmod.d.xml<br>
++++ b/man/depmod.d.xml<br>
+@@ -131,6 +131,20 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/listitem&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/varlistentry&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;varlistentry&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;term&gt;external &lt;replaceable&gt;exclu=
dedir&lt;/replaceable&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/term&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;listitem&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This specifies the trailing dir=
ectories that will be excluded<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 during the search for kernel mo=
dules.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The &lt;replaceable&gt;excludedir&lt;/=
replaceable&gt; the trailing directory<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to exclude<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/listitem&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 &lt;/varlistentry&gt;<br>
+=C2=A0 =C2=A0 =C2=A0&lt;/variablelist&gt;<br>
+=C2=A0 =C2=A0&lt;/refsect1&gt;<br>
+ <br>
+diff --git a/tools/depmod.c b/tools/depmod.c<br>
+index eb810b8..8b19ab6 100644<br>
+--- a/tools/depmod.c<br>
++++ b/tools/depmod.c<br>
+@@ -458,6 +458,12 @@ struct cfg_external {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char path[];<br>
+ };<br>
+ <br>
++struct cfg_exclude {<br>
++=C2=A0 =C2=A0 =C2=A0 struct cfg_exclude *next;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t len;<br>
++=C2=A0 =C2=A0 =C2=A0 char exclude_dir[];<br>
++};<br>
++<br>
+ struct cfg {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *kversion;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char dirname[PATH_MAX];<br>
+@@ -469,6 +475,7 @@ struct cfg {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cfg_override *overrides;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cfg_search *searches;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cfg_external *externals;<br>
++=C2=A0 =C2=A0 =C2=A0 struct cfg_exclude *excludes;<br>
+ };<br>
+ <br>
+ static enum search_type cfg_define_search_type(const char *path)<br>
+@@ -580,6 +587,31 @@ static void cfg_external_free(struct cfg_external *ex=
t)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(ext);<br>
+ }<br>
+ <br>
++static int cfg_exclude_add(struct cfg *cfg, const char *path)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct cfg_exclude *exc;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(path);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 exc =3D malloc(sizeof(struct cfg_exclude) + len);<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (exc =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR(&quot;exclude add: o=
ut of memory\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 exc-&gt;len =3D len;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(exc-&gt;exclude_dir, path, len);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 DBG(&quot;exclude add: %s\n&quot;, path);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 exc-&gt;next =3D cfg-&gt;excludes;<br>
++=C2=A0 =C2=A0 =C2=A0 cfg-&gt;excludes =3D exc;<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static void cfg_exclude_free(struct cfg_exclude *exc)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 free(exc);<br>
++}<br>
++<br>
+ static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)=
<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regex_t re;<br>
+@@ -657,6 +689,11 @@ static int cfg_file_parse(struct cfg *cfg, const char=
 *filename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cfg_external_add(cfg, dir);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (streq(cmd, &q=
uot;exclude&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *sp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while ((sp =3D strtok_r(NULL, &quot;\t &quot;, &amp;saveptr)) !=3D NULL=
) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg_exclude_add(cfg, sp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (streq(cm=
d, &quot;include&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| streq(cmd, &quot;make_map_files&qu=
ot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0INF(&quot;%s:%u: command %s not implemented yet\n&quot;,<br>
+@@ -857,6 +894,12 @@ static void cfg_free(struct cfg *cfg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg-&gt;externals =
=3D cfg-&gt;externals-&gt;next;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_external_free(t=
mp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 while (cfg-&gt;excludes) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct cfg_exclude *tmp =
=3D cfg-&gt;excludes;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg-&gt;excludes =3D cfg=
-&gt;excludes-&gt;next;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg_exclude_free(tmp);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
+ <br>
+@@ -1239,12 +1282,23 @@ static int depmod_modules_search_dir(struct depmod=
 *depmod, DIR *d, size_t basel<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name =
=3D de-&gt;d_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t namelen;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t is_dir;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct cfg_exclude *exc;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int exclude =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (name[0] =3D=3D =
&#39;.&#39; &amp;&amp; (name[1] =3D=3D &#39;\0&#39; ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (name[1] =3D=3D=
 &#39;.&#39; &amp;&amp; name[2] =3D=3D &#39;\0&#39;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (streq(name, &qu=
ot;build&quot;) || streq(name, &quot;source&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (exc =3D depmod-&gt;=
cfg-&gt;excludes; exc !=3D NULL; exc =3D exc-&gt;next) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (streq(name, exc-&gt;exclude_dir)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exclude =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exclude)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namelen =3D strlen(=
name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (scratchbuf_allo=
c(s_path, baselen + namelen + 2) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0err =3D -ENOMEM;<br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/meta/recipes-kernel/kmod/<a href=3D"http://kmod_29.bb" rel=3D"=
noreferrer" target=3D"_blank">kmod_29.bb</a> b/meta/recipes-kernel/kmod/<a =
href=3D"http://kmod_29.bb" rel=3D"noreferrer" target=3D"_blank">kmod_29.bb<=
/a><br>
index 91951edde16..9b663490666 100644<br>
--- a/meta/recipes-kernel/kmod/<a href=3D"http://kmod_29.bb" rel=3D"norefer=
rer" target=3D"_blank">kmod_29.bb</a><br>
+++ b/meta/recipes-kernel/kmod/<a href=3D"http://kmod_29.bb" rel=3D"norefer=
rer" target=3D"_blank">kmod_29.bb</a><br>
@@ -20,6 +20,7 @@ SRCREV =3D &quot;b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1=
&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/util=
s/kernel/kmod/kmod.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank=
">git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=3Dmaster</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://depmod-search.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid_parallel_tests.patch=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-depmod-Add-support-fo=
r-excluding-a-directory.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -64,6 +65,9 @@ do_install:append () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# install depmod.d file for search/ dir<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm644 &quot;${WORKDIR}/depmod-se=
arch.conf&quot; &quot;${D}${nonarch_base_libdir}/depmod.d/search.conf&quot;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add .debug to the exclude path for depmod<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;exclude .debug&quot; &gt; ${D}${non=
arch_base_libdir}/depmod.d/exclude.conf<br>
=C2=A0}<br>
<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;70&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163795): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163795" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163795</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90143170/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90143170/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000002b93ef05db7f594e--

