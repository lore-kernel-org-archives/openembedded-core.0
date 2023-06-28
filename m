Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F334EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:36:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.19995.1687966569813532353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iYW2cDxF;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso6791773e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687966568; x=1690558568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HWVFBQw+dZ50FMIXEU/EXV4eqcuCMqWwNR8eWt/aZ1Y=;
        b=iYW2cDxF8fFjyvNW1ZnZhtUrlhNdGV8v8FL1f2f6GpZ8Mf1lXgNy0Ph3hD2W3ySfeI
         tS8Et4PJwtrH9eOMQUVJw7RHVcmK2PSXNjMqwylcOXm+tI+9fP42tWhGGTRjgRujfI38
         1YAAjRSvxk+XzvMvxMv1d9WPrLlUXynnCapE4Q8uc+2CBbchbubmk31F/fWjMi0hnEQs
         nwTrhnspKzfTKGCN6yTfgKpwwSEkH6K43aNTSig4Zfdtuvr+QD8X9xwLG0kt0OoUU0BD
         dK5hvvgkEyv/2IOrcKBt/rvDk7zc01Eh4n7SWFMMDta8mGB+a3c1RI9M584Drm438JTE
         hEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687966568; x=1690558568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWVFBQw+dZ50FMIXEU/EXV4eqcuCMqWwNR8eWt/aZ1Y=;
        b=DAJmOzt7LBq0ebtKVgl1CXD6XF8SGuObmLL5FrNG4lqziis0n6fIC15p+C4+Lzl3xL
         Ug6T8pq1S7nwvGp/D4/UW6OrXi2Rw0smGTbXP4HMeoSfqzj7wBMHVA6J4q8ywKTL1ueV
         n9gJZET6XU7IzDaxP/wwD41IbYnx7bPwH8sr8uXGZ+PA6zZt8EuWkl8wRGDvyen+UvH6
         on4Pdt5/A0Q9x0P+Wcz6zh64jJ7E0QW/fZfJ/1jSOv9bv+J0bprkts5IP7JhyVVAI4qN
         ODvp6kxn3S0fEGh2OLI8vBBZ0ft7kSK/C49ysa0OCJygUNceEFP5N+NQzfRdtqimhB48
         iZZg==
X-Gm-Message-State: AC+VfDwNpPiz2zfM6vY5O9iX0SLHfqtz6CQot0hnTsMCeXlupMMWEmcL
	DV6Hn/MkZO9cHGs0Tv9s4EOs0hVWpnR+ZCHMvF0=
X-Google-Smtp-Source: ACHHUZ75QozdqrI+sFMojhqIS+//Cie74sclq19LRuN7vProZEJ3ofSh0imJATJC2HFVE/ohOsyvYE7IDrwpj3Ecl8k=
X-Received: by 2002:ac2:4f12:0:b0:4ed:cc6d:61fe with SMTP id
 k18-20020ac24f12000000b004edcc6d61femr8191323lfr.24.1687966567529; Wed, 28
 Jun 2023 08:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <f9be76642c5464c317ad0aac165a0970ec95da04.1687780832.git.joerg.sommer@navimatix.de>
 <20230628151541240e8c06@mail.local>
In-Reply-To: <20230628151541240e8c06@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Jun 2023 17:35:56 +0200
Message-ID: <CANNYZj8yD--dXMQqwke=cfbSyGMf+nfNsHAU5f2eWuX3gRiqgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bonnie++: New recipe for version 2.0
To: alexandre.belloni@bootlin.com
Cc: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a680f005ff325739"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183594

--000000000000a680f005ff325739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this is actually for meta-oe?

Alex

On Wed 28. Jun 2023 at 17.16, Alexandre Belloni via lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello,
>
> On 26/06/2023 14:00:32+0200, J=C3=B6rg Sommer via lists.openembedded.org =
wrote:
> > Newer versions of bonnie get published on
> > <https://doc.coker.com.au/projects/bonnie/>. Unfortunately, the new
> version
> > doesn't compile with g++ 11 which requires *fix-csv2html-data.patch* an=
d
> > configure fails due to cross compilation which gets fixed
> > with *fix-configure-lfs.patch*
> >
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  .../bonnie/bonnie++/fix-configure-lfs.patch   |  37 ++++
> >  .../bonnie/bonnie++/fix-csv2html-data.patch   | 181 ++++++++++++++++++
> >  .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
> >  3 files changed, 251 insertions(+)
> >  create mode 100644
> meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> >  create mode 100644
> meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> >  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
>
> You certainly need to add a maintainers.inc entry for this new recipes,
> else oe-selftest is going to complain.
>
> >
> > diff --git
> a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> > new file mode 100644
> > index 0000000000..d28e28658c
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> > @@ -0,0 +1,37 @@
> > +diff --git i/configure.in w/configure.in
> > +index 080e40c..f2a2bbe 100644
> > +--- i/configure.in
> > ++++ w/configure.in
> > +@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }
> > +   , thread_ldflags=3D"-lpthread"
> > +   , thread_ldflags=3D"-pthread")
> > +
> > +-AC_SUBST(large_file)
> > +-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> > ++AC_ARG_ENABLE(lfs,
> > ++      [  --disable-lfs  disable large file support],
> > ++      LFS_CHOICE=3D$enableval, LFS_CHOICE=3Dcheck)
> > ++
> > ++if test "$LFS_CHOICE" =3D yes; then
> > ++   bonniepp_cv_large_file=3Dyes
> > ++elif test "$LFS_CHOICE" =3D check; then
> > ++   AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE],
> bonniepp_cv_large_file,
> > ++      AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> > + #define _LARGEFILE64_SOURCE
> > + #endif
> > + #include <stdio.h>
> > +@@ -118,8 +125,12 @@ int main () {
> > +   }
> > +   close(fd);
> > +   return 0;
> > +-}], large_file=3D"yes")
> > +-if [[ -n "$large_file" ]]; then
> > ++}], bonniepp_cv_large_file=3D"yes"))
> > ++fi
> > ++
> > ++AC_SUBST(large_file)
> > ++
> > ++if [[ -n "$bonniepp_cv_large_file" ]]; then
> > +    large_file=3D"#define _LARGEFILE64_SOURCE"
> > + fi
> > +
> > diff --git
> a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> > new file mode 100644
> > index 0000000000..78ac347aa8
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> > @@ -0,0 +1,181 @@
> > +commit 7e9433a56f22426b11cbc9bd80e0debca67c893b
> > +Author: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > +Date:   Mon Jun 26 12:38:30 2023 +0200
> > +
> > +    csv2html: Explicitly reference data in top level
> > +
> > +    With g++ 11 *data* became ambiguous with [std::data][1]. Therefore
> it's
> > +    needed to explicitly address the variable from the top level scope=
.
> > +
> > +    [1] https://en.cppreference.com/w/cpp/iterator/data
> > +
> > +diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp
> > +index e9d9c50..652e330 100644
> > +--- a/bon_csv2html.cpp
> > ++++ b/bon_csv2html.cpp
> > +@@ -87,8 +87,8 @@ int main(int argc, char **argv)
> > +     read_in(buf);
> > +   }
> > +
> > +-  props =3D new PPCCHAR[data.size()];
> > +-  for(i =3D 0; i < data.size(); i++)
> > ++  props =3D new PPCCHAR[::data.size()];
> > ++  for(i =3D 0; i < ::data.size(); i++)
> > +   {
> > +     props[i] =3D new PCCHAR[MAX_ITEMS];
> > +     props[i][0] =3D NULL;
> > +@@ -109,7 +109,7 @@ int main(int argc, char **argv)
> > +   }
> > +   calc_vals();
> > +   int mid_width =3D header();
> > +-  for(i =3D 0; i < data.size(); i++)
> > ++  for(i =3D 0; i < ::data.size(); i++)
> > +   {
> > + // First print the average speed line
> > +     printf("<tr>");
> > +@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)
> > +
> > + void calc_vals()
> > + {
> > +-  ITEM *arr =3D new ITEM[data.size()];
> > ++  ITEM *arr =3D new ITEM[::data.size()];
> > +   for(unsigned int column_ind =3D 0; column_ind < MAX_ITEMS;
> column_ind++)
> > +   {
> > +     switch(vals[column_ind])
> > +     {
> > +     case eNoCols:
> > +     {
> > +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind+=
+)
> > ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_in=
d++)
> > +       {
> > +         if(column_ind =3D=3D COL_CONCURRENCY)
> > +         {
> > +-          if(data[row_ind][column_ind] && strcmp("1",
> data[row_ind][column_ind]))
> > ++          if(::data[row_ind][column_ind] && strcmp("1",
> ::data[row_ind][column_ind]))
> > +             col_used[column_ind] =3D true;
> > +         }
> > +         else
> > +         {
> > +-          if(data[row_ind][column_ind] &&
> strlen(data[row_ind][column_ind]))
> > ++          if(::data[row_ind][column_ind] &&
> strlen(::data[row_ind][column_ind]))
> > +             col_used[column_ind] =3D true;
> > +         }
> > +       }
> > +@@ -195,22 +195,22 @@ void calc_vals()
> > +     break;
> > +     case eCPU:
> > +     {
> > +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind+=
+)
> > ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_in=
d++)
> > +       {
> > +         double work, cpu;
> > +         arr[row_ind].val =3D 0.0;
> > +-        if(data[row_ind].size() > column_ind
> > +-         && sscanf(data[row_ind][column_ind - 1], "%lf", &work) =3D=
=3D 1
> > +-         && sscanf(data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1)
> > ++        if(::data[row_ind].size() > column_ind
> > ++         && sscanf(::data[row_ind][column_ind - 1], "%lf", &work) =3D=
=3D 1
> > ++         && sscanf(::data[row_ind][column_ind], "%lf", &cpu) =3D=3D 1=
)
> > +         {
> > +           arr[row_ind].val =3D cpu / work;
> > +         }
> > +         arr[row_ind].pos =3D row_ind;
> > +       }
> > +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> > ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> > +       int col_count =3D -1;
> > +       double min_col =3D -1.0, max_col =3D -1.0;
> > +-      for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +       {
> > +         // if item is different from previous or if the first row
> > +         // (sort_ind =3D=3D 0) then increment col count
> > +@@ -239,7 +239,7 @@ void calc_vals()
> > +           min_col /=3D mult;
> > +         }
> > +         double range_col =3D max_col - min_col;
> > +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +         {
> > +           if(arr[sort_ind].col_ind > -1)
> > +           {
> > +@@ -250,7 +250,7 @@ void calc_vals()
> > +       }
> > +       else
> > +       {
> > +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +         {
> > +           if(vals[column_ind] =3D=3D eLatency)
> > +           {
> > +@@ -263,25 +263,25 @@ void calc_vals()
> > +     case eSpeed:
> > +     case eLatency:
> > +     {
> > +-      for(unsigned int row_ind =3D 0; row_ind < data.size(); row_ind+=
+)
> > ++      for(unsigned int row_ind =3D 0; row_ind < ::data.size(); row_in=
d++)
> > +       {
> > +         arr[row_ind].val =3D 0.0;
> > +-        if(data[row_ind].size() <=3D column_ind
> > +-         || sscanf(data[row_ind][column_ind], "%lf",
> &arr[row_ind].val) =3D=3D 0)
> > ++        if(::data[row_ind].size() <=3D column_ind
> > ++         || sscanf(::data[row_ind][column_ind], "%lf",
> &arr[row_ind].val) =3D=3D 0)
> > +           arr[row_ind].val =3D 0.0;
> > +         if(vals[column_ind] =3D=3D eLatency && arr[row_ind].val !=3D =
0.0)
> > +         {
> > +-          if(strstr(data[row_ind][column_ind], "ms"))
> > ++          if(strstr(::data[row_ind][column_ind], "ms"))
> > +             arr[row_ind].val *=3D 1000.0;
> > +-          else if(!strstr(data[row_ind][column_ind], "us"))
> > ++          else if(!strstr(::data[row_ind][column_ind], "us"))
> > +             arr[row_ind].val *=3D 1000000.0; // is !us && !ms then se=
cs!
> > +         }
> > +         arr[row_ind].pos =3D row_ind;
> > +       }
> > +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> > ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> > +       int col_count =3D -1;
> > +       double min_col =3D -1.0, max_col =3D -1.0;
> > +-      for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++      for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +       {
> > +         // if item is different from previous or if the first row
> > +         // (sort_ind =3D=3D 0) then increment col count
> > +@@ -310,7 +310,7 @@ void calc_vals()
> > +           min_col /=3D mult;
> > +         }
> > +         double range_col =3D max_col - min_col;
> > +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +         {
> > +           if(arr[sort_ind].col_ind > -1)
> > +           {
> > +@@ -332,7 +332,7 @@ void calc_vals()
> > +       }
> > +       else
> > +       {
> > +-        for(unsigned int sort_ind =3D 0; sort_ind < data.size();
> sort_ind++)
> > ++        for(unsigned int sort_ind =3D 0; sort_ind < ::data.size();
> sort_ind++)
> > +         {
> > +           if(vals[column_ind] =3D=3D eLatency)
> > +           {
> > +@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)
> > +     free((void *)arr[0]);
> > +     return;
> > +   }
> > +-  data.push_back(arr);
> > ++  ::data.push_back(arr);
> > + }
> > +
> > + void print_item(int num, int item, CPCCHAR extra)
> > + {
> > +   PCCHAR line_data;
> > +   char buf[1024];
> > +-  if(int(data[num].size()) > item)
> > ++  if(int(::data[num].size()) > item)
> > +   {
> > +-    line_data =3D data[num][item];
> > ++    line_data =3D ::data[num][item];
> > +     switch(item)
> > +     {
> > +     case COL_PUT_BLOCK:
> > diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> > new file mode 100644
> > index 0000000000..f31fd09fc4
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> > @@ -0,0 +1,33 @@
> > +SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> > +HOMEPAGE =3D "https://doc.coker.com.au/projects/bonnie/"
> > +SECTION =3D "benchmark/tests"
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D
> "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150ae9cc3ee0"
> > +
> > +SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz
> <http://www.coker.com.au/bonnie++/$%7BBPN%7D-$%7BPV%7D.tgz> \
> > +    file://fix-configure-lfs.patch \
> > +    file://fix-csv2html-data.patch \
> > +"
> > +SRC_URI[md5sum] =3D "3a16b3a91b1d38b6f5561e197f81d870"
> > +SRC_URI[sha256sum] =3D
> "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e58f27257e468f0e"
> > +
> > +SCRIPTS =3D "bon_csv2html bon_csv2txt"
> > +EXES =3D "bonnie++ zcav"
> > +
> > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > +# force lfs to skip configure's check, because we are cross-building
> > +EXTRA_OECONF:append=3D"--enable-lfs"
> > +
> > +do_install () {
> > +    install -d ${D}/${bindir}
> > +    install -d ${D}/${sbindir}
> > +    install -m 0755 ${EXES} ${D}/${sbindir}
> > +    install -m 0755 ${SCRIPTS} ${D}/${bindir}
> > +}
> > +
> > +PACKAGES =3D+ "bonnie-scripts"
> > +
> > +FILES:${PN} =3D "${sbindir}"
> > +FILES:bonnie-scripts =3D "${bindir}"
> > +
> > +RDEPENDS:bonnie-scripts +=3D "perl"
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183592):
> https://lists.openembedded.org/g/openembedded-core/message/183592
> Mute This Topic: https://lists.openembedded.org/mt/99785933/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a680f005ff325739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think this is actually for meta-oe?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 28. Jun 2023 at 17.16, Alex=
andre Belloni via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;alexandre.belloni=3D<a href=3D"mailto:bootlin.com@lists.ope=
nembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)">Hello,<br>
<br>
On 26/06/2023 14:00:32+0200, J=C3=B6rg Sommer via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> wrote:<br>
&gt; Newer versions of bonnie get published on<br>
&gt; &lt;<a href=3D"https://doc.coker.com.au/projects/bonnie/" rel=3D"noref=
errer" target=3D"_blank">https://doc.coker.com.au/projects/bonnie/</a>&gt;.=
 Unfortunately, the new version<br>
&gt; doesn&#39;t compile with g++=C2=A011 which requires *fix-csv2html-data=
.patch* and<br>
&gt; configure fails due to cross compilation which gets fixed<br>
&gt; with *fix-configure-lfs.patch*<br>
&gt; <br>
&gt; Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@nav=
imatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bonnie/bonnie++/fix-configure-lfs.patch=C2=A0 =C2=A0|=C2=A0 =
37 ++++<br>
&gt;=C2=A0 .../bonnie/bonnie++/fix-csv2html-data.patch=C2=A0 =C2=A0| 181 ++=
++++++++++++++++<br>
&gt;=C2=A0 .../bonnie/bonnie++_<a href=3D"http://2.00a.bb" rel=3D"noreferre=
r" target=3D"_blank">2.00a.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++++<br>
&gt;=C2=A0 3 files changed, 251 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix=
-configure-lfs.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix=
-csv2html-data.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_<a =
href=3D"http://2.00a.bb" rel=3D"noreferrer" target=3D"_blank">2.00a.bb</a><=
br>
<br>
You certainly need to add a maintainers.inc entry for this new recipes,<br>
else oe-selftest is going to complain.<br>
<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-l=
fs.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d28e28658c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patc=
h<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +diff --git i/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> w/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
&gt; +index 080e40c..f2a2bbe 100644<br>
&gt; +--- i/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; ++++ w/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
&gt; +@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }<=
br>
&gt; +=C2=A0 =C2=A0, thread_ldflags=3D&quot;-lpthread&quot;<br>
&gt; +=C2=A0 =C2=A0, thread_ldflags=3D&quot;-pthread&quot;)<br>
&gt; + <br>
&gt; +-AC_SUBST(large_file)<br>
&gt; +-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE<br>
&gt; ++AC_ARG_ENABLE(lfs,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --disable-lfs=C2=A0 disable large file =
support],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 LFS_CHOICE=3D$enableval, LFS_CHOICE=3Dcheck)<br=
>
&gt; ++<br>
&gt; ++if test &quot;$LFS_CHOICE&quot; =3D yes; then<br>
&gt; ++=C2=A0 =C2=A0bonniepp_cv_large_file=3Dyes<br>
&gt; ++elif test &quot;$LFS_CHOICE&quot; =3D check; then<br>
&gt; ++=C2=A0 =C2=A0AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE=
], bonniepp_cv_large_file,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE<br>
&gt; + #define _LARGEFILE64_SOURCE<br>
&gt; + #endif<br>
&gt; + #include &lt;stdio.h&gt;<br>
&gt; +@@ -118,8 +125,12 @@ int main () {<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0close(fd);<br>
&gt; +=C2=A0 =C2=A0return 0;<br>
&gt; +-}], large_file=3D&quot;yes&quot;)<br>
&gt; +-if [[ -n &quot;$large_file&quot; ]]; then<br>
&gt; ++}], bonniepp_cv_large_file=3D&quot;yes&quot;))<br>
&gt; ++fi<br>
&gt; ++<br>
&gt; ++AC_SUBST(large_file)<br>
&gt; ++<br>
&gt; ++if [[ -n &quot;$bonniepp_cv_large_file&quot; ]]; then<br>
&gt; +=C2=A0 =C2=A0 large_file=3D&quot;#define _LARGEFILE64_SOURCE&quot;<br=
>
&gt; + fi<br>
&gt; + <br>
&gt; diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-da=
ta.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..78ac347aa8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patc=
h<br>
&gt; @@ -0,0 +1,181 @@<br>
&gt; +commit 7e9433a56f22426b11cbc9bd80e0debca67c893b<br>
&gt; +Author: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix=
.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
&gt; +Date:=C2=A0 =C2=A0Mon Jun 26 12:38:30 2023 +0200<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 csv2html: Explicitly reference data in top level<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 With g++ 11 *data* became ambiguous with [std::data][1]=
. Therefore it&#39;s<br>
&gt; +=C2=A0 =C2=A0 needed to explicitly address the variable from the top =
level scope.<br>
&gt; +=C2=A0 =C2=A0 <br>
&gt; +=C2=A0 =C2=A0 [1]=C2=A0<a href=3D"https://en.cppreference.com/w/cpp/i=
terator/data" rel=3D"noreferrer" target=3D"_blank">https://en.cppreference.=
com/w/cpp/iterator/data</a><br>
&gt; +<br>
&gt; +diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp<br>
&gt; +index e9d9c50..652e330 100644<br>
&gt; +--- a/bon_csv2html.cpp<br>
&gt; ++++ b/bon_csv2html.cpp<br>
&gt; +@@ -87,8 +87,8 @@ int main(int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0read_in(buf);<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; +-=C2=A0 props =3D new PPCCHAR[data.size()];<br>
&gt; +-=C2=A0 for(i =3D 0; i &lt; data.size(); i++)<br>
&gt; ++=C2=A0 props =3D new PPCCHAR[::data.size()];<br>
&gt; ++=C2=A0 for(i =3D 0; i &lt; ::data.size(); i++)<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0props[i] =3D new PCCHAR[MAX_ITEMS];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0props[i][0] =3D NULL;<br>
&gt; +@@ -109,7 +109,7 @@ int main(int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0calc_vals();<br>
&gt; +=C2=A0 =C2=A0int mid_width =3D header();<br>
&gt; +-=C2=A0 for(i =3D 0; i &lt; data.size(); i++)<br>
&gt; ++=C2=A0 for(i =3D 0; i &lt; ::data.size(); i++)<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; + // First print the average speed line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;&lt;tr&gt;&quot;);<br>
&gt; +@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)<br>
&gt; + <br>
&gt; + void calc_vals()<br>
&gt; + {<br>
&gt; +-=C2=A0 ITEM *arr =3D new ITEM[data.size()];<br>
&gt; ++=C2=A0 ITEM *arr =3D new ITEM[::data.size()];<br>
&gt; +=C2=A0 =C2=A0for(unsigned int column_ind =3D 0; column_ind &lt; MAX_I=
TEMS; column_ind++)<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch(vals[column_ind])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case eNoCols:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; da=
ta.size(); row_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; ::=
data.size(); row_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(column_ind =3D=3D COL_CONCURRENC=
Y)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(data[row_ind][column_ind] &amp=
;&amp; strcmp(&quot;1&quot;, data[row_ind][column_ind]))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(::data[row_ind][column_ind] &a=
mp;&amp; strcmp(&quot;1&quot;, ::data[row_ind][column_ind]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0col_used[column_ind] =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(data[row_ind][column_ind] &amp=
;&amp; strlen(data[row_ind][column_ind]))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(::data[row_ind][column_ind] &a=
mp;&amp; strlen(::data[row_ind][column_ind]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0col_used[column_ind] =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -195,22 +195,22 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case eCPU:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; da=
ta.size(); row_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; ::=
data.size(); row_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0double work, cpu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val =3D 0.0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(data[row_ind].size() &gt; column_ind<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; sscanf(data[row_ind][co=
lumn_ind - 1], &quot;%lf&quot;, &amp;work) =3D=3D 1<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; sscanf(data[row_ind][co=
lumn_ind], &quot;%lf&quot;, &amp;cpu) =3D=3D 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(::data[row_ind].size() &gt; column_in=
d<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; sscanf(::data[row_ind][=
column_ind - 1], &quot;%lf&quot;, &amp;work) =3D=3D 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; sscanf(::data[row_ind][=
column_ind], &quot;%lf&quot;, &amp;cpu) =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val =3D cpu / w=
ork;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].pos =3D row_ind;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 qsort(arr, data.size(), sizeof(ITEM), compar);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 qsort(arr, ::data.size(), sizeof(ITEM), compar)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int col_count =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0double min_col =3D -1.0, max_col =3D -1.0;=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_ind &lt; =
data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_ind &lt; =
::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// if item is different from previo=
us or if the first row<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// (sort_ind =3D=3D 0) then increme=
nt col count<br>
&gt; +@@ -239,7 +239,7 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_col /=3D mult;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0double range_col =3D max_col - min_=
col;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; ::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(arr[sort_ind].col_ind &gt=
; -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +@@ -250,7 +250,7 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; ::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(vals[column_ind] =3D=3D e=
Latency)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +@@ -263,25 +263,25 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case eSpeed:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case eLatency:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; da=
ta.size(); row_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for(unsigned int row_ind =3D 0; row_ind &lt; ::=
data.size(); row_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val =3D 0.0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(data[row_ind].size() &lt;=3D column_i=
nd<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| sscanf(data[row_ind][column_ind=
], &quot;%lf&quot;, &amp;arr[row_ind].val) =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(::data[row_ind].size() &lt;=3D column=
_ind<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| sscanf(::data[row_ind][column_i=
nd], &quot;%lf&quot;, &amp;arr[row_ind].val) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val =3D 0.0;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(vals[column_ind] =3D=3D eLatency=
 &amp;&amp; arr[row_ind].val !=3D 0.0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(strstr(data[row_ind][column_in=
d], &quot;ms&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if(strstr(::data[row_ind][column_=
ind], &quot;ms&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val *=3D=
 1000.0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if(!strstr(data[row_ind][col=
umn_ind], &quot;us&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if(!strstr(::data[row_ind][c=
olumn_ind], &quot;us&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].val *=3D=
 1000000.0; // is !us &amp;&amp; !ms then secs!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arr[row_ind].pos =3D row_ind;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 qsort(arr, data.size(), sizeof(ITEM), compar);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 qsort(arr, ::data.size(), sizeof(ITEM), compar)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int col_count =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0double min_col =3D -1.0, max_col =3D -1.0;=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_ind &lt; =
data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_ind &lt; =
::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// if item is different from previo=
us or if the first row<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// (sort_ind =3D=3D 0) then increme=
nt col count<br>
&gt; +@@ -310,7 +310,7 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_col /=3D mult;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0double range_col =3D max_col - min_=
col;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; ::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(arr[sort_ind].col_ind &gt=
; -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +@@ -332,7 +332,7 @@ void calc_vals()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; data.size(); sort_ind++)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(unsigned int sort_ind =3D 0; sort_in=
d &lt; ::data.size(); sort_ind++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(vals[column_ind] =3D=3D e=
Latency)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0free((void *)arr[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 data.push_back(arr);<br>
&gt; ++=C2=A0 ::data.push_back(arr);<br>
&gt; + }<br>
&gt; + <br>
&gt; + void print_item(int num, int item, CPCCHAR extra)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0PCCHAR line_data;<br>
&gt; +=C2=A0 =C2=A0char buf[1024];<br>
&gt; +-=C2=A0 if(int(data[num].size()) &gt; item)<br>
&gt; ++=C2=A0 if(int(::data[num].size()) &gt; item)<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 line_data =3D data[num][item];<br>
&gt; ++=C2=A0 =C2=A0 line_data =3D ::data[num][item];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch(item)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case COL_PUT_BLOCK:<br>
&gt; diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_<a href=3D"http=
://2.00a.bb" rel=3D"noreferrer" target=3D"_blank">2.00a.bb</a> b/meta-oe/re=
cipes-benchmark/bonnie/bonnie++_<a href=3D"http://2.00a.bb" rel=3D"noreferr=
er" target=3D"_blank">2.00a.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f31fd09fc4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_<a href=3D"http://2.00=
a.bb" rel=3D"noreferrer" target=3D"_blank">2.00a.bb</a><br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +SUMMARY =3D &quot;Tests large file IO and creation/deletion of small =
files&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://doc.coker.com.au/projects/bonni=
e/" rel=3D"noreferrer" target=3D"_blank">https://doc.coker.com.au/projects/=
bonnie/</a>&quot;<br>
&gt; +SECTION =3D &quot;benchmark/tests&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://copyright.txt;md5=3Dcd4dde95a6b9d12=
2f0a9150ae9cc3ee0&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://www.coker.com.au/bonnie++/$%7BBPN=
%7D-$%7BPV%7D.tgz" rel=3D"noreferrer" target=3D"_blank">http://www.coker.co=
m.au/bonnie++/${BPN}-${PV}.tgz</a> \<br>
&gt; +=C2=A0 =C2=A0 file://fix-configure-lfs.patch \<br>
&gt; +=C2=A0 =C2=A0 file://fix-csv2html-data.patch \<br>
&gt; +&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;3a16b3a91b1d38b6f5561e197f81d870&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;a8d33bbd81bc7eb559ce5bf6e584b9b53faea39c=
cfb4ae92e58f27257e468f0e&quot;<br>
&gt; +<br>
&gt; +SCRIPTS =3D &quot;bon_csv2html bon_csv2txt&quot;<br>
&gt; +EXES =3D &quot;bonnie++ zcav&quot;<br>
&gt; +<br>
&gt; +TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt; +# force lfs to skip configure&#39;s check, because we are cross-build=
ing<br>
&gt; +EXTRA_OECONF:append=3D&quot;--enable-lfs&quot;<br>
&gt; +<br>
&gt; +do_install () {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}/${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${EXES} ${D}/${sbindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${SCRIPTS} ${D}/${bindir}<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;bonnie-scripts&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} =3D &quot;${sbindir}&quot;<br>
&gt; +FILES:bonnie-scripts =3D &quot;${bindir}&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:bonnie-scripts +=3D &quot;perl&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183592): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183592" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183592</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99785933/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99785933/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a680f005ff325739--

