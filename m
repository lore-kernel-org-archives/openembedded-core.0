Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D70967FA82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:33:55 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w14so2256106qto.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wDOztx5s6XGm2+rQ5xjkrQdOkuAI4JQg0WuuD0Yxwno=;
	b=ZU/pmu0jy6q0yzg+SbHZg/RAtrVxebaqsLpdcH0O/RQeUQMQ8bLz43qHislwKF3CpU
	a7gYZ8a3oM29xyhX16y9ViRbNp5ucUQr6qPp1wFZvhi/EOOorAxypcXHal+hZ0chFDjf
	dBXWuuIXcC9FMRizmodTkIh6YdwghchqUcqsTWcPc3/tcFRPtmOxLBqrUsY1T6ks/X6H
	+ElPcDR+3Kp/t+kyVIgvfS7+L2w3aJkg1d2BCt6giwB9AIvatv92b3+szd/Zo/sjg+/e
	BKsGGyD798/qk6xywxsrEbcQZRmMKlZ9Fhj8bgWB6w+2yUCnNlswvarhNZbvvO9EL5NI
	rXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wDOztx5s6XGm2+rQ5xjkrQdOkuAI4JQg0WuuD0Yxwno=;
	b=st/Mzzox3nVv+R4fspgfXYa0/9GmFWH5fTzxStYv+hw0FBVwQl3SnBYlscXAvOhfx7
	CzKcFpdvod6tmsUKwmkTuXCBKpeZFmAqxZLn84IcNmhn3JOuDScfIV3C380J9ohl1dfX
	XEt+zFAlRIXTggjU4lXfSumAGhA4dUg500YqnxVdszdV4YsNT+whqAzRFgcR/T6OptSe
	HIrh6Id7zMU4N8C/TCNP4kn1dXrtX1KKV9PxnNA7luGNY2UWvcFIYoR0wjg2kuxXq6dv
	IVmOvcdhcApME0aW5JYI/FhbndDWVy/ZjlkuBT8LBtjKg53A5tyHqvkmREyoISmK7WWp
	Fcmw==
X-Gm-Message-State: APjAAAV5LD80S5wK1Pml+h2hK4swwf/WJ6AaFJBjV5Ue4okA1V0JlVNo
	AsDC7Uq3nBT/LSX2YiNgqKFoG/FvqqweSEnG46Q=
X-Google-Smtp-Source: APXvYqyEwpkO3PzNxjoCNeAh4tVHTDJ5VQxmuqTk4q6fjoppVshjMsYHqJzXHEEOt8d/a2L2rvGMGWmhlmVphRtHkms=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr2080816qtr.378.1571996036443; 
	Fri, 25 Oct 2019 02:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191025010230.6317-1-trevor.gamblin@windriver.com>
In-Reply-To: <20191025010230.6317-1-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 10:33:45 +0100
Message-ID: <CAMKF1soCctUMGv1p7S-K-4VgTC9svkvY8q3NEq1jmeyvuZnnsw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 25 Oct 2019 09:33:56 -0000
Content-Type: multipart/alternative; boundary="0000000000005734700595b8d9d5"

--0000000000005734700595b8d9d5
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 25, 2019 at 2:02 AM Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> Backport upstream fix to zeus.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../binutils/binutils-2.32.inc                |  1 +
>  ...erflow-in-function-find_abstract_ins.patch | 99 +++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc
> b/meta/recipes-devtools/binutils/binutils-2.32.inc
> index 19baf8a883..48940fd3e5 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
> @@ -49,6 +49,7 @@ SRC_URI = "\
>       file://CVE-2019-12972.patch \
>       file://CVE-2019-14250.patch \
>       file://CVE-2019-14444.patch \
> +
>  file://0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch \


Please retain the CVE patch naming convention


>  "
>  S  = "${WORKDIR}/git"
>
> diff --git
> a/meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch
> b/meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch
> new file mode 100644
> index 0000000000..a6ce0b9a8a
> --- /dev/null
> +++
> b/meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch
> @@ -0,0 +1,99 @@
> +From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 9 Oct 2019 00:07:29 +1030
> +Subject: [PATCH] PR25078, stack overflow in function
> find_abstract_instance
> +
> +Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
> +file. There are newer versions of binutils, but none of them contain the
> +commit fixing CVE-2019-17450, so backport it to master and zeus.
> +
> +Upstream-Status: Backport [
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
> +CVE: CVE-2019-17450
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +       PR 25078
> +       * dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
> +       recur_count.  Error on recur_count reaching 100 rather than
> +       info_ptr matching orig_info_ptr.  Adjust calls.
> +
> +---
> + bfd/dwarf2.c | 35 +++++++++++++++++------------------
> + 1 file changed, 17 insertions(+), 18 deletions(-)
> +
> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> +index 0b4e485582..20ec9e2e56 100644
> +--- a/bfd/dwarf2.c
> ++++ b/bfd/dwarf2.c
> +@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit
> *unit,
> + }
> +
> + static bfd_boolean
> +-find_abstract_instance (struct comp_unit *   unit,
> +-                      bfd_byte *           orig_info_ptr,
> +-                      struct attribute *   attr_ptr,
> +-                      const char **        pname,
> +-                      bfd_boolean *        is_linkage,
> +-                      char **              filename_ptr,
> +-                      int *                linenumber_ptr)
> ++find_abstract_instance (struct comp_unit *unit,
> ++                      struct attribute *attr_ptr,
> ++                      unsigned int recur_count,
> ++                      const char **pname,
> ++                      bfd_boolean *is_linkage,
> ++                      char **filename_ptr,
> ++                      int *linenumber_ptr)
> + {
> +   bfd *abfd = unit->abfd;
> +   bfd_byte *info_ptr;
> +@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
> +   struct attribute attr;
> +   const char *name = NULL;
> +
> ++  if (recur_count == 100)
> ++    {
> ++      _bfd_error_handler
> ++      (_("DWARF error: abstract instance recursion detected"));
> ++      bfd_set_error (bfd_error_bad_value);
> ++      return FALSE;
> ++    }
> ++
> +   /* DW_FORM_ref_addr can reference an entry in a different CU. It
> +      is an offset from the .debug_info section, not the current CU.  */
> +   if (attr_ptr->form == DW_FORM_ref_addr)
> +@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
> +                                        info_ptr, info_ptr_end);
> +             if (info_ptr == NULL)
> +               break;
> +-            /* It doesn't ever make sense for DW_AT_specification to
> +-               refer to the same DIE.  Stop simple recursion.  */
> +-            if (info_ptr == orig_info_ptr)
> +-              {
> +-                _bfd_error_handler
> +-                  (_("DWARF error: abstract instance recursion
> detected"));
> +-                bfd_set_error (bfd_error_bad_value);
> +-                return FALSE;
> +-              }
> +             switch (attr.name)
> +               {
> +               case DW_AT_name:
> +@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
> +                   }
> +                 break;
> +               case DW_AT_specification:
> +-                if (!find_abstract_instance (unit, info_ptr, &attr,
> ++                if (!find_abstract_instance (unit, &attr, recur_count +
> 1,
> +                                              &name, is_linkage,
> +                                              filename_ptr,
> linenumber_ptr))
> +                   return FALSE;
> +@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
> +
> +               case DW_AT_abstract_origin:
> +               case DW_AT_specification:
> +-                if (!find_abstract_instance (unit, info_ptr, &attr,
> ++                if (!find_abstract_instance (unit, &attr, 0,
> +                                              &func->name,
> +                                              &func->is_linkage,
> +                                              &func->file,
> +--
> +2.23.0
> +
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005734700595b8d9d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 25, 2019 at 2:02 AM Trevor Gamblin &lt;<a href=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Backport upstream fix to =
zeus.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../binutils/binutils-2.32.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...erflow-in-function-find_abstract_ins.patch | 99 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 100 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR250=
78-stack-overflow-in-function-find_abstract_ins.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipe=
s-devtools/binutils/binutils-2.32.inc<br>
index 19baf8a883..48940fd3e5 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc<br>
@@ -49,6 +49,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2019-12972.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14250.patch \<br>
=C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14444.patch \<br>
+=C2=A0 =C2=A0 =C2=A0file://0001-PR25078-stack-overflow-in-function-find_ab=
stract_ins.patch \</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Please retain the CVE patch naming convention=C2=A0</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0&quot;<br>
=C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-ove=
rflow-in-function-find_abstract_ins.patch b/meta/recipes-devtools/binutils/=
binutils/0001-PR25078-stack-overflow-in-function-find_abstract_ins.patch<br=
>
new file mode 100644<br>
index 0000000000..a6ce0b9a8a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/0001-PR25078-stack-overflow-i=
n-function-find_abstract_ins.patch<br>
@@ -0,0 +1,99 @@<br>
+From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001<br>
+From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com" target=3D"_blank"=
>amodra@gmail.com</a>&gt;<br>
+Date: Wed, 9 Oct 2019 00:07:29 +1030<br>
+Subject: [PATCH] PR25078, stack overflow in function find_abstract_instanc=
e<br>
+<br>
+Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog<br>
+file. There are newer versions of binutils, but none of them contain the<b=
r>
+commit fixing CVE-2019-17450, so backport it to master and zeus.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/gitweb.cg=
i?p=3Dbinutils-gdb.git;h=3D063c511bd79" rel=3D"noreferrer" target=3D"_blank=
">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D063c511bd7=
9</a>]<br>
+CVE: CVE-2019-17450<br>
+Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR 25078<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* dwarf2.c (find_abstract_instance): Delete ori=
g_info_ptr, add<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0recur_count.=C2=A0 Error on recur_count reachin=
g 100 rather than<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info_ptr matching orig_info_ptr.=C2=A0 Adjust c=
alls.<br>
+<br>
+---<br>
+ bfd/dwarf2.c | 35 +++++++++++++++++------------------<br>
+ 1 file changed, 17 insertions(+), 18 deletions(-)<br>
+<br>
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c<br>
+index 0b4e485582..20ec9e2e56 100644<br>
+--- a/bfd/dwarf2.c<br>
++++ b/bfd/dwarf2.c<br>
+@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit =
*unit,<br>
+ }<br>
+ <br>
+ static bfd_boolean<br>
+-find_abstract_instance (struct comp_unit *=C2=A0 =C2=A0unit,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bfd_byte *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig_info_ptr,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct attribute *=C2=A0 =C2=A0attr_ptr,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char **=C2=A0 =C2=A0 =C2=A0 =C2=A0 pname,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bfd_boolean *=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_linkage,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char **=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename_ptr,<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linenumber=
_ptr)<br>
++find_abstract_instance (struct comp_unit *unit,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct attribute *attr_ptr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned int recur_count,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char **pname,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bfd_boolean *is_linkage,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char **filename_ptr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int *linenumber_ptr)<br>
+ {<br>
+=C2=A0 =C2=A0bfd *abfd =3D unit-&gt;abfd;<br>
+=C2=A0 =C2=A0bfd_byte *info_ptr;<br>
+@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *=C2=A0 =
=C2=A0unit,<br>
+=C2=A0 =C2=A0struct attribute attr;<br>
+=C2=A0 =C2=A0const char *name =3D NULL;<br>
+ <br>
++=C2=A0 if (recur_count =3D=3D 100)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 _bfd_error_handler<br>
++=C2=A0 =C2=A0 =C2=A0 (_(&quot;DWARF error: abstract instance recursion de=
tected&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 bfd_set_error (bfd_error_bad_value);<br>
++=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0/* DW_FORM_ref_addr can reference an entry in a different CU.=
 It<br>
+=C2=A0 =C2=A0 =C2=A0 is an offset from the .debug_info section, not the cu=
rrent CU.=C2=A0 */<br>
+=C2=A0 =C2=A0if (attr_ptr-&gt;form =3D=3D DW_FORM_ref_addr)<br>
+@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *=C2=A0 =
=C2=A0unit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info_ptr=
, info_ptr_end);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info_ptr =3D=3D NULL)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* It doesn&#39;t ever make sen=
se for DW_AT_specification to<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refer to the same =
DIE.=C2=A0 Stop simple recursion.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info_ptr =3D=3D orig_info_p=
tr)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _bfd_error_handle=
r<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_(&quot;D=
WARF error: abstract instance recursion detected&quot;));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bf=
d_error_bad_value);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (<a href=3D"http://=
attr.name" rel=3D"noreferrer" target=3D"_blank">attr.name</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DW_AT_name:<br=
>
+@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *=C2=A0 =C2=
=A0unit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DW_AT_specific=
ation:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!find_abstrac=
t_instance (unit, info_ptr, &amp;attr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!find_abstrac=
t_instance (unit, &amp;attr, recur_count + 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;name, is_linkage,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 filename_ptr, linenumber_ptr))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n FALSE;<br>
+@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DW_AT_abstract=
_origin:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DW_AT_specific=
ation:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!find_abstrac=
t_instance (unit, info_ptr, &amp;attr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!find_abstrac=
t_instance (unit, &amp;attr, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;func-&gt;name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;func-&gt;is_linkage,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;func-&gt;file,<br>
+-- <br>
+2.23.0<br>
+<br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000005734700595b8d9d5--
