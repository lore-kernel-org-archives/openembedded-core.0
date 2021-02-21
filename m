Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.17802.1613894459282699302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 00:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5jiSp1v;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id z190so9808689qka.9
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 00:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nu5G6Vtz9sqA12yLo0WcVl6LtOhG+rg6ZEFG/On3Gt0=;
        b=t5jiSp1vuvhDSz298Ye8PjAg/yGfnqrhkKU6AUYUJK/RPZPETkFIGcZ7X70sq0OIW/
         Efuxcpj+aeo6bRV6V5wYyZDgrMQ4rQBTyhvAaUOpn7mctp9cadvi5LnbCKAj2sSH1vzd
         vDwuzkC8IWV30vlhfFNRT9vBeEvQf0RJ6XC9KOH+fGseoPJEl132LDZXX4WxK12EAvb2
         lLkyeuHSuO7JmyPP2nDZQ0B9/AaLnQyoN1Ufl+MD2HFh2hka/SPK+V0aBTOdYF4LDCBD
         dr1y1Sb6c2w/xtmRUszTIgsPF9AT7MJnuoSjE8wFwTYSfTAFo+8zGbMADfkae8MGRkf6
         o/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nu5G6Vtz9sqA12yLo0WcVl6LtOhG+rg6ZEFG/On3Gt0=;
        b=fHP+39dhyMxPUFAM0vgmJx3h0TAIhkCra7xy9/sORawBesmv4kEbBBZ5Ixlx0faYGF
         b5k9pxzAWlqo8Zk0CkET05X3GvshH97D8s0w2M7FJU35c9Jet1FQca/7RE2R53xL0XiF
         54G8nbumyY/pi8w+VUz9WZp9C7aQ0rIMBzHFTotDDYqAHiPfI1a9rbJ4HNCsKGzJk4OG
         BO5csfSgDlYsUS/Y1MUCf2jWaqLAJbqn1VzvL3xrdvHa/dGIV6/3ucCXvCgeA+zhX8hf
         cZU9C/6S/Zoj6sScJj8BFOFnRnJv484pZpmRlucv2n3Qss3TGPsJeQtHO812FvC7bv3v
         nrfw==
X-Gm-Message-State: AOAM531H8V0KFRAw/0Yq8pMNaWoVNBv+Yzz7vFab7emCK4NGOxax8oXA
	sgxuE2j/LnvUOjBLsvIw+t7p3FjQG2xIEf6PpZI=
X-Google-Smtp-Source: ABdhPJxrKDFFoDMH+RncE3dYPLFMjHKdUz0l4oNd1CZr1F6EJlatYn4auQcjGEPqCUYY50yqjIHankZQmbuIP3yurfc=
X-Received: by 2002:a37:27c8:: with SMTP id n191mr15991848qkn.146.1613894458218;
 Sun, 21 Feb 2021 00:00:58 -0800 (PST)
MIME-Version: 1.0
References: <1598534184-115749-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1598534184-115749-2-git-send-email-zangrc.fnst@cn.fujitsu.com> <CAMKF1soedwQWkahytDeorwa1w4CnAcP-PwKAMf_2K5Wi83+kbA@mail.gmail.com>
In-Reply-To: <CAMKF1soedwQWkahytDeorwa1w4CnAcP-PwKAMf_2K5Wi83+kbA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 21 Feb 2021 00:00:32 -0800
Message-ID: <CAMKF1srf5c-2OLrn16Q5miRqkAK0Brc0QGmRuWpWQkL8Z0DA=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libcap-ng:upgrade 0.7.10 -> 0.7.11
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think this is wrong thread, I replied to

On Sat, Feb 20, 2021 at 9:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this failure
>
> https://errors.yoctoproject.org/Errors/Details/571958/
> https://errors.yoctoproject.org/Errors/Details/571954/
>
> On Wed, Aug 26, 2020 at 6:16 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
> >
> > 0001-configure.ac-add-library-if-header-found.patch
> > 0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
> > Removed since these are included in 0.7.11
> >
> > Refresh the following patch:
> > python.patch
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  ...n_0.7.10.bb => libcap-ng-python_0.7.11.bb} |  0
> >  meta/recipes-support/libcap-ng/libcap-ng.inc  |  6 ++--
> >  ...igure.ac-add-library-if-header-found.patch | 31 -------------------
> >  ...hread_atfork-usage-in-HAVE_PTHREAD_H.patch | 25 ---------------
> >  .../libcap-ng/libcap-ng/python.patch          | 18 +++++------
> >  ...ibcap-ng_0.7.10.bb => libcap-ng_0.7.11.bb} |  0
> >  6 files changed, 10 insertions(+), 70 deletions(-)
> >  rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.7.10.bb => libcap-ng-python_0.7.11.bb} (100%)
> >  delete mode 100644 meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
> >  delete mode 100644 meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
> >  rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.10.bb => libcap-ng_0.7.11.bb} (100%)
> >
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.11.bb
> > similarity index 100%
> > rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.7.10.bb
> > rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.7.11.bb
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
> > index 002915ad48..6d6fa644aa 100644
> > --- a/meta/recipes-support/libcap-ng/libcap-ng.inc
> > +++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
> > @@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> >
> >  SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
> >             file://python.patch \
> > -           file://0001-configure.ac-add-library-if-header-found.patch \
> > -           file://0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "57dc267e2949cdecb651a929f9206572"
> > -SRC_URI[sha256sum] = "a84ca7b4e0444283ed269b7a29f5b6187f647c82e2b876636b49b9a744f0ffbf"
> > +SRC_URI[md5sum] = "5883ed10b621c87e29a05cff36d2928e"
> > +SRC_URI[sha256sum] = "85815c711862d01a440db471f12fba462c9949e923966f5859607e652d9c0ae9"
> >
> >  BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch b/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
> > deleted file mode 100644
> > index 6b155ccea8..0000000000
> > --- a/meta/recipes-support/libcap-ng/libcap-ng/0001-configure.ac-add-library-if-header-found.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From 0230e2e374bb71aed0181ccd9ebd13c0c5125a5d Mon Sep 17 00:00:00 2001
> > -From: Trevor Woerner <twoerner@gmail.com>
> > -Date: Fri, 25 Oct 2019 17:01:20 -0400
> > -Subject: [PATCH] configure.ac: add library if header found
> > -
> > -If the pthread.h header is found, make sure library containing
> > -"pthread_atfork" is added to the list of libraries against which to link.
> > -On some hosts (e.g. openSUSE 15.1) "-lpthread" needs to be explicitly added
> > -in order for the code to compile correctly.
> > -
> > -Upstream-Status: Submitted [https://github.com/stevegrubb/libcap-ng/pull/10]
> > -Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ----
> > - configure.ac | 4 +++-
> > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 63088f4..639b464 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -56,7 +56,9 @@ AC_CHECK_HEADERS(sys/xattr.h, [], [
> > -       AC_CHECK_HEADERS(attr/xattr.h, [], [AC_MSG_WARN(attr/xattr.h not found, disabling file system capabilities.)])
> > -       ])
> > - AC_CHECK_HEADERS(linux/securebits.h, [], [])
> > --AC_CHECK_HEADERS(pthread.h, [], [AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
> > -+AC_CHECK_HEADERS(pthread.h,
> > -+      [AC_SEARCH_LIBS(pthread_atfork, pthread)],
> > -+      [AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
> > -
> > - AC_C_CONST
> > - AC_C_INLINE
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch b/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
> > deleted file mode 100644
> > index c68254ff3d..0000000000
> > --- a/meta/recipes-support/libcap-ng/libcap-ng/0002-Wrap-pthread_atfork-usage-in-HAVE_PTHREAD_H.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -From d95c4018ad57c37f6272dbedfa5217776567c329 Mon Sep 17 00:00:00 2001
> > -From: Christopher Larson <chris_larson@mentor.com>
> > -Date: Tue, 26 Nov 2019 22:34:34 +0500
> > -Subject: [PATCH] Wrap pthread_atfork usage in HAVE_PTHREAD_H
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ----
> > - src/cap-ng.c | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/src/cap-ng.c b/src/cap-ng.c
> > -index 35fcd7a..97a3dbd 100644
> > ---- a/src/cap-ng.c
> > -+++ b/src/cap-ng.c
> > -@@ -166,7 +166,9 @@ static void deinit(void)
> > - static void init_lib(void) __attribute__ ((constructor));
> > - static void init_lib(void)
> > - {
> > -+#ifdef HAVE_PTHREAD_H
> > -       pthread_atfork(NULL, NULL, deinit);
> > -+#endif
> > - }
> > -
> > - static void init(void)
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
> > index d60a0a39b6..fcd6f9cd33 100644
> > --- a/meta/recipes-support/libcap-ng/libcap-ng/python.patch
> > +++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
> > @@ -1,6 +1,3 @@
> > -From b4a354ae8d4f7c2ec3ec421c7d8a790cc57e77a9 Mon Sep 17 00:00:00 2001
> > -From: Li xin <lixin.fnst@cn.fujitsu.com>
> > -Date: Sat, 18 Jul 2015 23:03:30 +0900
> >  Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
> >   Makefile.am - avoid hard coded host include paths.
> >
> > @@ -9,6 +6,8 @@ Upstream-Status: pending
> >  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >  Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> >  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +
> >  ---
> >   bindings/python/Makefile.am |  4 +++-
> >   configure.ac                | 17 ++---------------
> > @@ -30,12 +29,12 @@ index 999b184..c8e49db 100644
> >   SWIG_INCLUDES = ${AM_CPPFLAGS}
> >   pyexec_PYTHON = capng.py
> >  diff --git a/configure.ac b/configure.ac
> > -index 7f66179..079d026 100644
> > +index 8b46f51..2d7e00c 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -123,21 +123,8 @@ if test x$use_python = xno ; then
> > - else
> > - AC_MSG_RESULT(testing)
> > +@@ -141,21 +141,8 @@ fi
> > +
> > + # Setup Python2 with the interpreter found previously.
> >   AM_PATH_PYTHON
> >  -PYINCLUDEDIR=`python${am_cv_python_version} -c "from distutils import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
> >  -if test -f ${PYINCLUDEDIR}/Python.h ; then
> > @@ -46,7 +45,7 @@ index 7f66179..079d026 100644
> >  -      AC_MSG_NOTICE(Python bindings will be built)
> >  -else
> >  -      python_found="no"
> > --      if test x$use_python = xyes ; then
> > +-      if test "x$use_python" = xyes ; then
> >  -              AC_MSG_ERROR([Python explicitly requested and python headers were not found])
> >  -      else
> >  -              AC_MSG_WARN("Python headers not found - python bindings will not be made")
> > @@ -58,5 +57,4 @@ index 7f66179..079d026 100644
> >   AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
> >
> >  --
> > -2.7.4
> > -
> > +2.25.1
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb
> > similarity index 100%
> > rename from meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
> > rename to meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb
> > --
> > 2.25.1
> >
> >
> >
> > 
