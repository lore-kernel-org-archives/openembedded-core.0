Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB8267FAA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:04:11 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p4so2400431qkf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M4dYXL4w/ML6YK/25tCQpYxU04lkXH6qYUs030zZcl4=;
	b=NVUYf2zm6BDzSdyNMF7WFiXR2le5XN2BCysP1jW4mCemd4gJUwuGeoljSS7pQGSceE
	NyASqOfFEKrmZfFBxpg16e9cIkQZio4dLVnYh9y7ptvEmoqkDnuZhdXNk9llXcISdNCo
	bR8/6xHZozjacglyUxt27KD5ZuSAdt/kWfU4SbjUuJdFxpMXSDg+a8c4hriglQlEa+xN
	PzczDsLcgZK3nZjlk+Qi3uqvLynGJ17B1gAG6UFO+crHh9zG81GgVZIWsqSK9wQMexcp
	pB2aMHnBTIK9gKnxVcXpRBWjQNmyq7cJQO2h4Hq40uX7pyeV0E5atom53qRiZKa/1Qt2
	oE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M4dYXL4w/ML6YK/25tCQpYxU04lkXH6qYUs030zZcl4=;
	b=SSivZgVls754Xc9gNkeFoxoak+5D8N5nDW+ybeBoVwRlcAzAUn2rnMMRQCInmVOhKX
	chIvjoxCj0E3VRrYVIa9b4Sozu3WSukLM84OZTjySrXsFGJ7/I5+vzBWklk6WJtSTO08
	zYM2kWr81LTF8VIBzb5ZQm06k9BmrnxAxDhmIiJErAthKN39wlhfqp0mfDM0/4hyxUQJ
	frBfojUTKmzS/FP86sm4L5cfIzRXTiXaBl06gNdTGnEuS463EDhzfmQJTrQWyH5FhCIx
	iTe90NmYcehaD3ZxZJS2kQyTzdFLsZKDPCJ18CojV4AvBQKIOxWCQi4JetlFfYrIB/yh
	/GNw==
X-Gm-Message-State: APjAAAW9nyUhE2zC6j030Vq2ZxI1nxfDSdGNI6LFHFwd6Db6qSM/pHoj
	htMXDcydvkWdOQBsKOZf4kc/LjpF2/V/1SZXw6g=
X-Google-Smtp-Source: APXvYqy0I9HkAgEE+kq9WXJyypmGlRWS6y36HBYYrXFs/peVygJwUNDNMqTbktQz7AtINItugPbR/cxdhGwP1SP88Y0=
X-Received: by 2002:a37:b985:: with SMTP id j127mr3747355qkf.337.1572023052285;
	Fri, 25 Oct 2019 10:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191025122212.25687-1-trevor.gamblin@windriver.com>
	<cf553688-0f48-33ae-8c4c-18c7c34a5971@gmail.com>
	<370152d1-d96f-8863-4746-999422d85721@windriver.com>
In-Reply-To: <370152d1-d96f-8863-4746-999422d85721@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 18:04:01 +0100
Message-ID: <CAMKF1sr2vUagZ9YYCmREKFunFjGOvBS-htPPVh493nnG4m8VZA@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH v3] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 25 Oct 2019 17:04:12 -0000
Content-Type: multipart/alternative; boundary="0000000000009c3d840595bf23c2"

--0000000000009c3d840595bf23c2
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 25, 2019 at 4:05 PM Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> On 10/25/19 11:02 AM, akuster808 wrote:
>
> >
> > On 10/25/19 5:22 AM, Trevor Gamblin wrote:
> >> Backport upstream fix to zeus.
> >>
> >> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > Does this affect Master?
> >
> > - armin
> >> ---
> >>   .../binutils/binutils-2.32.inc                |  1 +
> >>   .../binutils/binutils/CVE-2019-17450.patch    | 99 +++++++++++++++++++
> >>   2 files changed, 100 insertions(+)
> >>   create mode 100644
> meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> >>
> >> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc
> b/meta/recipes-devtools/binutils/binutils-2.32.inc
> >> index 19baf8a883..1e96cf494d 100644
> >> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
> >> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
> >> @@ -49,6 +49,7 @@ SRC_URI = "\
> >>        file://CVE-2019-12972.patch \
> >>        file://CVE-2019-14250.patch \
> >>        file://CVE-2019-14444.patch \
> >> +     file://CVE-2019-17450.patch \
> >>   "
> >>   S  = "${WORKDIR}/git"
> >>
> >> diff --git
> a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> >> new file mode 100644
> >> index 0000000000..a6ce0b9a8a
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> >> @@ -0,0 +1,99 @@
> >> +From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
> >> +From: Alan Modra <amodra@gmail.com>
> >> +Date: Wed, 9 Oct 2019 00:07:29 +1030
> >> +Subject: [PATCH] PR25078, stack overflow in function
> find_abstract_instance
> >> +
> >> +Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
> >> +file. There are newer versions of binutils, but none of them contain
> the
> >> +commit fixing CVE-2019-17450, so backport it to master and zeus.
> >> +
> >> +Upstream-Status: Backport [
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
> >> +CVE: CVE-2019-17450
> >> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> >> +
> >> +    PR 25078
> >> +    * dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
> >> +    recur_count.  Error on recur_count reaching 100 rather than
> >> +    info_ptr matching orig_info_ptr.  Adjust calls.
> >> +
> >> +---
> >> + bfd/dwarf2.c | 35 +++++++++++++++++------------------
> >> + 1 file changed, 17 insertions(+), 18 deletions(-)
> >> +
> >> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> >> +index 0b4e485582..20ec9e2e56 100644
> >> +--- a/bfd/dwarf2.c
> >> ++++ b/bfd/dwarf2.c
> >> +@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct
> comp_unit *unit,
> >> + }
> >> +
> >> + static bfd_boolean
> >> +-find_abstract_instance (struct comp_unit *   unit,
> >> +-                   bfd_byte *           orig_info_ptr,
> >> +-                   struct attribute *   attr_ptr,
> >> +-                   const char **        pname,
> >> +-                   bfd_boolean *        is_linkage,
> >> +-                   char **              filename_ptr,
> >> +-                   int *                linenumber_ptr)
> >> ++find_abstract_instance (struct comp_unit *unit,
> >> ++                   struct attribute *attr_ptr,
> >> ++                   unsigned int recur_count,
> >> ++                   const char **pname,
> >> ++                   bfd_boolean *is_linkage,
> >> ++                   char **filename_ptr,
> >> ++                   int *linenumber_ptr)
> >> + {
> >> +   bfd *abfd = unit->abfd;
> >> +   bfd_byte *info_ptr;
> >> +@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *
>  unit,
> >> +   struct attribute attr;
> >> +   const char *name = NULL;
> >> +
> >> ++  if (recur_count == 100)
> >> ++    {
> >> ++      _bfd_error_handler
> >> ++   (_("DWARF error: abstract instance recursion detected"));
> >> ++      bfd_set_error (bfd_error_bad_value);
> >> ++      return FALSE;
> >> ++    }
> >> ++
> >> +   /* DW_FORM_ref_addr can reference an entry in a different CU. It
> >> +      is an offset from the .debug_info section, not the current CU.
> */
> >> +   if (attr_ptr->form == DW_FORM_ref_addr)
> >> +@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *
>  unit,
> >> +                                     info_ptr, info_ptr_end);
> >> +          if (info_ptr == NULL)
> >> +            break;
> >> +-         /* It doesn't ever make sense for DW_AT_specification to
> >> +-            refer to the same DIE.  Stop simple recursion.  */
> >> +-         if (info_ptr == orig_info_ptr)
> >> +-           {
> >> +-             _bfd_error_handler
> >> +-               (_("DWARF error: abstract instance recursion
> detected"));
> >> +-             bfd_set_error (bfd_error_bad_value);
> >> +-             return FALSE;
> >> +-           }
> >> +          switch (attr.name)
> >> +            {
> >> +            case DW_AT_name:
> >> +@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *
>  unit,
> >> +                }
> >> +              break;
> >> +            case DW_AT_specification:
> >> +-             if (!find_abstract_instance (unit, info_ptr, &attr,
> >> ++             if (!find_abstract_instance (unit, &attr, recur_count +
> 1,
> >> +                                           &name, is_linkage,
> >> +                                           filename_ptr,
> linenumber_ptr))
> >> +                return FALSE;
> >> +@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
> >> +
> >> +            case DW_AT_abstract_origin:
> >> +            case DW_AT_specification:
> >> +-             if (!find_abstract_instance (unit, info_ptr, &attr,
> >> ++             if (!find_abstract_instance (unit, &attr, 0,
> >> +                                           &func->name,
> >> +                                           &func->is_linkage,
> >> +                                           &func->file,
> >> +--
> >> +2.23.0
> >> +
> It does, but I'm working on an upgrade for binutils to 2.33 for master
> that I'll then apply this (and another CVE patch) on top of.


Then sequence it first so it can be backported to Zeus straightforwardly
then you can do the 2.33 upgrade

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009c3d840595bf23c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 25, 2019 at 4:05 PM Trevor Gamblin &lt;<a href=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On 10/25/19 11:02 AM, aku=
ster808 wrote:<br>
<br>
&gt;<br>
&gt; On 10/25/19 5:22 AM, Trevor Gamblin wrote:<br>
&gt;&gt; Backport upstream fix to zeus.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin=
@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; Does this affect Master?<br>
&gt;<br>
&gt; - armin<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../binutils/binutils-2.32.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 =C2=A0.../binutils/binutils/CVE-2019-17450.patch=C2=A0 =C2=
=A0 | 99 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 100 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/binutils/binu=
tils/CVE-2019-17450.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/me=
ta/recipes-devtools/binutils/binutils-2.32.inc<br>
&gt;&gt; index 19baf8a883..1e96cf494d 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/binutils/binutils-2.32.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc<br>
&gt;&gt; @@ -49,6 +49,7 @@ SRC_URI =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-12972.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14250.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-14444.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0file://CVE-2019-17450.patch \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 =C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-1745=
0.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..a6ce0b9a8a<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch=
<br>
&gt;&gt; @@ -0,0 +1,99 @@<br>
&gt;&gt; +From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com" target=
=3D"_blank">amodra@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 9 Oct 2019 00:07:29 +1030<br>
&gt;&gt; +Subject: [PATCH] PR25078, stack overflow in function find_abstrac=
t_instance<br>
&gt;&gt; +<br>
&gt;&gt; +Selectively backporting fix for bfd/dwarf2.c, but not the ChangeL=
og<br>
&gt;&gt; +file. There are newer versions of binutils, but none of them cont=
ain the<br>
&gt;&gt; +commit fixing CVE-2019-17450, so backport it to master and zeus.<=
br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/=
gitweb.cgi?p=3Dbinutils-gdb.git;h=3D063c511bd79" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D=
063c511bd79</a>]<br>
&gt;&gt; +CVE: CVE-2019-17450<br>
&gt;&gt; +Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gambli=
n@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 PR 25078<br>
&gt;&gt; +=C2=A0 =C2=A0 * dwarf2.c (find_abstract_instance): Delete orig_in=
fo_ptr, add<br>
&gt;&gt; +=C2=A0 =C2=A0 recur_count.=C2=A0 Error on recur_count reaching 10=
0 rather than<br>
&gt;&gt; +=C2=A0 =C2=A0 info_ptr matching orig_info_ptr.=C2=A0 Adjust calls=
.<br>
&gt;&gt; +<br>
&gt;&gt; +---<br>
&gt;&gt; + bfd/dwarf2.c | 35 +++++++++++++++++------------------<br>
&gt;&gt; + 1 file changed, 17 insertions(+), 18 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c<br>
&gt;&gt; +index 0b4e485582..20ec9e2e56 100644<br>
&gt;&gt; +--- a/bfd/dwarf2.c<br>
&gt;&gt; ++++ b/bfd/dwarf2.c<br>
&gt;&gt; +@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct c=
omp_unit *unit,<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + static bfd_boolean<br>
&gt;&gt; +-find_abstract_instance (struct comp_unit *=C2=A0 =C2=A0unit,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bfd_byte *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orig_info_ptr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct attribute *=C2=A0 =C2=A0attr_ptr,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char **=C2=A0 =C2=A0 =C2=A0 =C2=A0 pname,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bfd_boolean *=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_linkage,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0char **=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename_ptr,=
<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linenumb=
er_ptr)<br>
&gt;&gt; ++find_abstract_instance (struct comp_unit *unit,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct attribute *attr_ptr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0unsigned int recur_count,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char **pname,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bfd_boolean *is_linkage,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0char **filename_ptr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int *linenumber_ptr)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0bfd *abfd =3D unit-&gt;abfd;<br>
&gt;&gt; +=C2=A0 =C2=A0bfd_byte *info_ptr;<br>
&gt;&gt; +@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *=
=C2=A0 =C2=A0unit,<br>
&gt;&gt; +=C2=A0 =C2=A0struct attribute attr;<br>
&gt;&gt; +=C2=A0 =C2=A0const char *name =3D NULL;<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 if (recur_count =3D=3D 100)<br>
&gt;&gt; ++=C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _bfd_error_handler<br>
&gt;&gt; ++=C2=A0 =C2=A0(_(&quot;DWARF error: abstract instance recursion d=
etected&quot;));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 bfd_set_error (bfd_error_bad_value);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0/* DW_FORM_ref_addr can reference an entry in a diff=
erent CU. It<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 is an offset from the .debug_info section, n=
ot the current CU.=C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0if (attr_ptr-&gt;form =3D=3D DW_FORM_ref_addr)<br>
&gt;&gt; +@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *=
=C2=A0 =C2=A0unit,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info_p=
tr, info_ptr_end);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info_ptr =3D=3D NULL)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* It doesn&#39;t ever make se=
nse for DW_AT_specification to<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 refer to the same DIE.=
=C2=A0 Stop simple recursion.=C2=A0 */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info_ptr =3D=3D orig_info_=
ptr)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_bfd_error_handl=
er<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_(&quot;=
DWARF error: abstract instance recursion detected&quot;));<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bfd_set_error (b=
fd_error_bad_value);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br=
>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (<a href=3D"http://attr=
.name" rel=3D"noreferrer" target=3D"_blank">attr.name</a>)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case DW_AT_name:<br>
&gt;&gt; +@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *=
=C2=A0 =C2=A0unit,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case DW_AT_specificatio=
n:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!find_abstra=
ct_instance (unit, info_ptr, &amp;attr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!find_abstra=
ct_instance (unit, &amp;attr, recur_count + 1,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;name, is_linkage,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0filename_ptr, linenumber_ptr))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FA=
LSE;<br>
&gt;&gt; +@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *un=
it)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case DW_AT_abstract_ori=
gin:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case DW_AT_specificatio=
n:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!find_abstra=
ct_instance (unit, info_ptr, &amp;attr,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!find_abstra=
ct_instance (unit, &amp;attr, 0,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;func-&gt;name,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;func-&gt;is_linkage,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;func-&gt;file,<br>
&gt;&gt; +--<br>
&gt;&gt; +2.23.0<br>
&gt;&gt; +<br>
It does, but I&#39;m working on an upgrade for binutils to 2.33 for master =
<br>
that I&#39;ll then apply this (and another CVE patch) on top of.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">Then sequence it first so i=
t can be backported to Zeus straightforwardly then you can do the 2.33 upgr=
ade=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000009c3d840595bf23c2--
