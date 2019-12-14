Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id A57727F491
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 20:48:38 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id l24so1760704vsr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 12:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R3ewNWw0nxidiS4eUVK71RV03PcwWXa3ImlHn+id9+I=;
	b=TWlblIHscFRMiqHTMHaeHK91avgR2xeke3Q94+Po8hsHg3n2HKBiHtfLb6DLDY/KtK
	HlcPvlaq1LvbzJEbMZc4hG1vizamc+fHl+EFcPnca6Vg3LjnVZ6tipBl+1PeygOC9ppi
	xPFViBRcwjTemR+ofppo+AJSjBVErlVi3m/9ax32pdhkHMHT5EUvR0uZB3OMZV4GQ4C3
	XUvITCnU/0YfR5ibvxZfoqO4RXpIQJwcJ5Y/Cvm0yvvHhmj3kg2OY/yvlWDXWvZxhWmx
	PM3bxuWeO5Y3MlC5ub5G3QhxSPtcoF0sNsLcA/kSGu0zunBHMWsVtxGb+t0dgNDrC8m+
	3ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R3ewNWw0nxidiS4eUVK71RV03PcwWXa3ImlHn+id9+I=;
	b=QZA69euW+O77tRFZFQy2a/Z9l/bQi8i7qyTMw+SyK/3wpPmdL4y33PqANXep+i79xf
	HTSadNPu/Y4+05kBbXX/2P0hHv2GqKgZoiupLuDlm/wqcgiFwfVZWJI0oCdVDCn5rd1K
	XQIoWKj3+x2YSBG4aTiLAMgDI3zEjoLRFJXpXj4cRQlHx7LvXVkzS1tAII3e9Wdz/lhY
	l7tQSY9/pChe9hLLzFfg0oUaXcxQUg/DQCZpVeoHxMEOG/GkMGuIsE1PZhr5h/L2oLQK
	E2zYnDONMXsOgrjkXYp4tbmW0vTvbRGSj/2UiWxOYhnFX7SjGIVWI6Sp6F9JrnpzN3sW
	h6lA==
X-Gm-Message-State: APjAAAXSYtyZNsPngeMYbqjgYWhh21zNNMF72rT+cHffSuhDGddckmzi
	c8tAAHydbV3/y7G3EU0h5XCmimIfpaN6ZV13Jqw=
X-Google-Smtp-Source: APXvYqwtsJhSPE13oUPNHzw32SQXK6uKBEgzUoYLu7eSq+JOzM3bu3nRp8TSJWQtkrEfLDCwDCPXn3tn8CJxNjjhSUw=
X-Received: by 2002:a05:6102:21d8:: with SMTP id
	r24mr16661858vsg.83.1576356518736; 
	Sat, 14 Dec 2019 12:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-19-alex.kanavin@gmail.com>
	<CAMKF1sqnQuQm-Wj1fZ+UrmJNrYBRasVToXv6WQK1pUPV9C1B3w@mail.gmail.com>
In-Reply-To: <CAMKF1sqnQuQm-Wj1fZ+UrmJNrYBRasVToXv6WQK1pUPV9C1B3w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 14 Dec 2019 21:48:26 +0100
Message-ID: <CANNYZj_sXhAhPft1R-LE9qdz3XRrc98cfH-UNM1m0b5TCjU9nw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/30] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Sat, 14 Dec 2019 20:48:39 -0000
Content-Type: multipart/alternative; boundary="00000000000056b6d80599b01ad3"

--00000000000056b6d80599b01ad3
Content-Type: text/plain; charset="UTF-8"

How come I do not see these issues in local testing? :-/

I'll investigate on Monday.

Alex

On Sat, 14 Dec 2019 at 21:25, Khem Raj <raj.khem@gmail.com> wrote:

> breaks pseudo-native
>
> http://errors.yoctoproject.org/Errors/Details/297280/
>
> On Thu, Dec 12, 2019 at 10:18 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > The latest release use standard autotools, so drop all
> > the build system related hacks and patches.
> >
> > Ptests have been rewritten, with 100% pass rate for both.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../0001-test-patch-out-failing-bits.patch    |  63 ++
> >  ...dcode-the-build-path-into-a-helper-l.patch |  24 +
> >  ...file-libacl-should-depend-on-include.patch |  51 --
> >  ...-order-of-expected-output-of-getfacl.patch | 198 ------
> >  meta/recipes-support/attr/acl/configure.ac    |  49 --
> >  meta/recipes-support/attr/acl/run-ptest       |  60 +-
> >  .../acl/test-fix-directory-permissions.patch  |  37 -
> >  .../test-fix-insufficient-quoting-of.patch    | 100 ---
> >  ...-SELinux-machines-for-root-testcases.patch |  84 ---
> >  meta/recipes-support/attr/acl_2.2.52.bb       |  52 --
> >  meta/recipes-support/attr/acl_2.2.53.bb       |  60 ++
> >  meta/recipes-support/attr/attr.inc            |  41 +-
> >  .../0001-Use-stdint-types-consistently.patch  |  69 --
> >  .../attr/attr/attr-Missing-configure.ac.patch |  63 --
> >  .../attr/attr/dont-use-decl-macros.patch      |  56 --
> >  meta/recipes-support/attr/attr/run-ptest      |   3 +
> >  meta/recipes-support/attr/attr_2.4.47.bb      |  15 -
> >  meta/recipes-support/attr/attr_2.4.48.bb      |   6 +
> >  meta/recipes-support/attr/ea-acl.inc          |  52 --
> >  ...option-to-enable-disable-static-libr.patch |  70 --
> >  ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------
> >  .../Remove-the-section-2-man-pages.patch      | 666 ------------------
> >  .../attr/files/relative-libdir.patch          |  25 -
> >  meta/recipes-support/attr/files/run-ptest     |   5 -
> >  24 files changed, 182 insertions(+), 1907 deletions(-)
> >  create mode 100644
> meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
> >  create mode 100644
> meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
> >  delete mode 100644
> meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
> >  delete mode 100644
> meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
> >  delete mode 100644 meta/recipes-support/attr/acl/configure.ac
> >  delete mode 100644
> meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
> >  delete mode 100644
> meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
> >  delete mode 100644
> meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
> >  delete mode 100644 meta/recipes-support/attr/acl_2.2.52.bb
> >  create mode 100644 meta/recipes-support/attr/acl_2.2.53.bb
> >  delete mode 100644
> meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
> >  delete mode 100644
> meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
> >  delete mode 100644
> meta/recipes-support/attr/attr/dont-use-decl-macros.patch
> >  create mode 100644 meta/recipes-support/attr/attr/run-ptest
> >  delete mode 100644 meta/recipes-support/attr/attr_2.4.47.bb
> >  create mode 100644 meta/recipes-support/attr/attr_2.4.48.bb
> >  delete mode 100644 meta/recipes-support/attr/ea-acl.inc
> >  delete mode 100644
> meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
> >  delete mode 100644
> meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
> >  delete mode 100644
> meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
> >  delete mode 100644 meta/recipes-support/attr/files/relative-libdir.patch
> >  delete mode 100644 meta/recipes-support/attr/files/run-ptest
> >
> > diff --git
> a/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
> b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
> > new file mode 100644
> > index 00000000000..ba2ffee5d27
> > --- /dev/null
> > +++
> b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.patch
> > @@ -0,0 +1,63 @@
> > +From 9e08219e0e99ee2589cf35fa8d52cef3515accce Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Thu, 12 Dec 2019 15:47:49 +0100
> > +Subject: [PATCH] test: patch out failing bits
> > +
> > +I have confirmed on the host distro (Ubuntu 18.04) that they
> > +fail as well; upstream probably haven't noticed because the
> > +test is only executed under sudo.
> > +
> > +Upstream-Status: Inappropriate [disabling tests instead of fixing them
> properly]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + test/root/permissions.test | 13 -------------
> > + 1 file changed, 13 deletions(-)
> > +
> > +diff --git a/test/root/permissions.test b/test/root/permissions.test
> > +index 8f8f825..21e8a95 100644
> > +--- a/test/root/permissions.test
> > ++++ b/test/root/permissions.test
> > +@@ -50,10 +50,6 @@ User daemon is a member in the owning group, which
> has only read access.
> > + Verify this.
> > +
> > +       $ su daemon
> > +-      $ cat f
> > +-      > root
> > +-      > bin
> > +-
> > +       $ echo daemon >> f
> > +       >~ .*f: Permission denied$
> > +
> > +@@ -146,8 +142,6 @@ the owning group, he should still have no write
> access.
> > +       $ setfacl -x g:daemon f
> > +
> > +       $ su daemon
> > +-      $ echo daemon4 >> f
> > +-      >~ .*f: Permission denied$
> > +
> > +
> > + Change the owning group. The other permissions should now grant user
> > +@@ -158,12 +152,6 @@ daemon write access.
> > +
> > +       $ su daemon
> > +       $ echo daemon5 >> f
> > +-      $ cat f
> > +-      > root
> > +-      > bin
> > +-      > daemon
> > +-      > daemon2
> > +-      > daemon5
> > +
> > +
> > + Verify that permissions in separate matching ACL entries do not
> > +@@ -173,7 +161,6 @@ accumulate.
> > +       $ setfacl -m g:bin:r,g:daemon:w f
> > +
> > +       $ su daemon
> > +-      $ : < f
> > +       $ : > f
> > +       $ : <> f
> > +       >~ .*f: Permission denied$
> > +--
> > +2.17.1
> > +
> > diff --git
> a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
> b/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
> > new file mode 100644
> > index 00000000000..57ef0bb728c
> > --- /dev/null
> > +++
> b/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch
> > @@ -0,0 +1,24 @@
> > +From 39d332a8801de5d9ef09dacb3dba85c208b7b2ad Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Thu, 12 Dec 2019 13:45:52 +0100
> > +Subject: [PATCH] tests: do not hardcode the build path into a helper
> library
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + test/Makemodule.am | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/test/Makemodule.am b/test/Makemodule.am
> > +index 17d4927..015de7f 100644
> > +--- a/test/Makemodule.am
> > ++++ b/test/Makemodule.am
> > +@@ -30,7 +30,7 @@ EXTRA_DIST += \
> > + check_LTLIBRARIES = libtestlookup.la
> > +
> > + libtestlookup_la_SOURCES = test/test_passwd.c test/test_group.c
> > +-libtestlookup_la_CFLAGS = -DBASEDIR=\"$(abs_srcdir)\"
> > ++libtestlookup_la_CFLAGS = -DBASEDIR=\"/tmp/acl-ptest\"
> > + libtestlookup_la_LDFLAGS = -rpath $(abs_builddir)
> > +
> > + AM_TESTS_ENVIRONMENT = PATH="$(abs_top_builddir):$$PATH";
> > diff --git
> a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
> b/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
> > deleted file mode 100644
> > index 4c7cba3b88d..00000000000
> > ---
> a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -From d82457ce5ca7455e336da5e244d95f90e52aaef8 Mon Sep 17 00:00:00 2001
> > -From: Robert Yang <liezhi.yang@windriver.com>
> > -Date: Tue, 18 Apr 2017 01:17:26 -0700
> > -Subject: [PATCH] Makefile: libacl should depend on include
> > -
> > -Fixed race issue:
> > - In file included from acl_copy_entry.c:22:0:
> > - libacl.h:19:21: fatal error: sys/acl.h: No such file or directory
> > -  #include <sys/acl.h>
> > -
> > -[snip]
> > -
> > - compilation terminated.
> > - acl_get_file.c:27:24: fatal error: acl/libacl.h: No such file or
> directory
> > -  #include <acl/libacl.h>
> > -                         ^
> > -
> > -The acl.h is in "include" directory, and include/Makefile creates
> > -symlink "sys" and "acl" poinst to current dirctory:
> > -$ ls include/ -l
> > -acl -> .
> > -sys -> .
> > -
> > -So if "libacl" target runs before "include", the error would happen
> > -since no "acl" or "sys" directory.
> > -
> > -Let libacl depend on include can fix the problem.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ----
> > - Makefile | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/Makefile b/Makefile
> > -index dce32d3..8a79379 100644
> > ---- a/Makefile
> > -+++ b/Makefile
> > -@@ -48,7 +48,7 @@ else
> > - endif
> > -
> > - # tool/lib dependencies
> > --libacl: libmisc
> > -+libacl: include libmisc
> > - getfacl setfacl chacl: libacl
> > -
> > - ifeq ($(HAVE_BUILDDEFS), yes)
> > ---
> > -2.10.2
> > -
> > diff --git
> a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
> b/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
> > deleted file mode 100644
> > index cf765fdbb89..00000000000
> > ---
> a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
> > +++ /dev/null
> > @@ -1,198 +0,0 @@
> > -acl: fix the order of expected output of getfacl
> > -
> > -The result of getfacl is sorted by user id.
> > -In Centos or RHEL, bin user id is 1 and daemon user id is 2.
> > -But in our image, bin user id is 2 and daemon user id is 1.
> > -The patch fixes this issue to make ptest pass.
> > -
> > -Upstream-Status: Inappropriate [embedded specific]
> > -
> > -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> > ----
> > - test/misc.test |   38 +++++++++++++++++++-------------------
> > - 1 file changed, 19 insertions(+), 19 deletions(-)
> > -
> > -diff --git a/test/misc.test b/test/misc.test
> > -index 6e98053..53ae5b0 100644
> > ---- a/test/misc.test
> > -+++ b/test/misc.test
> > -@@ -79,8 +79,8 @@ Multiple users
> > -
> > -       $ getfacl --omit-header f
> > -       > user::rw-
> > --      > user:bin:rw-
> > -       > user:daemon:r--
> > -+      > user:bin:rw-
> > -       > group::r--
> > -       > mask::rw-
> > -       > other::r--
> > -@@ -94,8 +94,8 @@ Multiple groups
> > -
> > -       $ getfacl --omit-header f
> > -       > user::rw-
> > --      > user:bin:rw-
> > -       > user:daemon:r--
> > -+      > user:bin:rw-
> > -       > group::r--
> > -       > group:daemon:r--
> > -       > group:users:rw-
> > -@@ -111,8 +111,8 @@ Remove one group
> > -
> > -       $ getfacl --omit-header f
> > -       > user::rw-
> > --      > user:bin:rw-
> > -       > user:daemon:r--
> > -+      > user:bin:rw-
> > -       > group::r--
> > -       > group:daemon:r--
> > -       > mask::rw-
> > -@@ -146,8 +146,8 @@ Default ACL
> > -
> > -       $ getfacl --omit-header d
> > -       > user::rwx
> > --      > user:bin:rwx
> > -       > user:daemon:rw-
> > -+      > user:bin:rwx
> > -       > group::r-x
> > -       > mask::rwx
> > -       > other::---
> > -@@ -236,16 +236,16 @@ Add some users and groups
> > -
> > -       $ getfacl --omit-header d/d
> > -       > user::rwx
> > --      > user:bin:rwx  #effective:r-x
> > -       > user:daemon:r-x
> > -+      > user:bin:rwx  #effective:r-x
> > -       > group::r-x
> > -       > group:daemon:rwx      #effective:r-x
> > -       > group:users:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:rwx  #effective:r-x
> > -       > default:user:daemon:r-x
> > -+      > default:user:bin:rwx  #effective:r-x
> > -       > default:group::r-x
> > -       > default:mask::r-x
> > -       > default:other::---
> > -@@ -262,16 +262,16 @@ Symlink in directory with default ACL?
> > -
> > -       $ getfacl --omit-header d/l
> > -       > user::rwx
> > --      > user:bin:rwx  #effective:r-x
> > -       > user:daemon:r-x
> > -+      > user:bin:rwx  #effective:r-x
> > -       > group::r-x
> > -       > group:daemon:rwx      #effective:r-x
> > -       > group:users:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:rwx  #effective:r-x
> > -       > default:user:daemon:r-x
> > -+      > default:user:bin:rwx  #effective:r-x
> > -       > default:group::r-x
> > -       > default:mask::r-x
> > -       > default:other::---
> > -@@ -287,16 +287,16 @@ Does mask manipulation work?
> > -
> > -       $ getfacl --omit-header d/d
> > -       > user::rwx
> > --      > user:bin:r-x
> > -       > user:daemon:r-x
> > -+      > user:bin:r-x
> > -       > group::r-x
> > -       > group:daemon:r-x
> > -       > group:users:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:rwx  #effective:r-x
> > -       > default:user:daemon:r-x
> > -+      > default:user:bin:rwx  #effective:r-x
> > -       > default:group::r-x
> > -       > default:mask::r-x
> > -       > default:other::---
> > -@@ -308,16 +308,16 @@ Does mask manipulation work?
> > -
> > -       $ getfacl --omit-header d/d
> > -       > user::rwx
> > --      > user:bin:r-x
> > -       > user:daemon:r-x
> > -+      > user:bin:r-x
> > -       > group::r-x
> > -       > group:daemon:r-x
> > -       > group:users:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:rwx
> > -       > default:user:daemon:r-x
> > -+      > default:user:bin:rwx
> > -       > default:group::r-x
> > -       > default:mask::rwx
> > -       > default:other::---
> > -@@ -333,8 +333,8 @@ Remove the default ACL
> > -
> > -       $ getfacl --omit-header d
> > -       > user::rwx
> > --      > user:bin:rwx
> > -       > user:daemon:rw-
> > -+      > user:bin:rwx
> > -       > group::r-x
> > -       > mask::rwx
> > -       > other::---
> > -@@ -373,14 +373,14 @@ Now, chmod should change the group_obj entry
> > -
> > -       $ getfacl --omit-header d
> > -       > user::rwx
> > --      > user:bin:r-x
> > -       > user:daemon:rwx
> > -+      > user:bin:r-x
> > -       > group::rwx
> > -       > mask::rwx
> > -       > other::r-x
> > -       > default:user::rwx
> > --      > default:user:bin:r-x
> > -       > default:user:daemon:rwx
> > -+      > default:user:bin:r-x
> > -       > default:group::rwx
> > -       > default:mask::rwx
> > -       > default:other::r-x
> > -@@ -392,14 +392,14 @@ Now, chmod should change the group_obj entry
> > -
> > -       $ getfacl --omit-header d
> > -       > user::rwx
> > --      > user:bin:r-x
> > -       > user:daemon:rwx       #effective:r-x
> > -+      > user:bin:r-x
> > -       > group::rwx    #effective:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:r-x
> > -       > default:user:daemon:rwx
> > -+      > default:user:bin:r-x
> > -       > default:group::rwx
> > -       > default:mask::rwx
> > -       > default:other::r-x
> > -@@ -411,14 +411,14 @@ Now, chmod should change the group_obj entry
> > -
> > -       $ getfacl --omit-header d
> > -       > user::rwx
> > --      > user:bin:r-x
> > -       > user:daemon:rwx       #effective:r-x
> > -+      > user:bin:r-x
> > -       > group::rwx    #effective:r-x
> > -       > mask::r-x
> > -       > other::---
> > -       > default:user::rwx
> > --      > default:user:bin:r-x
> > -       > default:user:daemon:rwx
> > -+      > default:user:bin:r-x
> > -       > default:group::rwx
> > -       > default:mask::rwx
> > -       > default:other::r-x
> > ---
> > -1.7.9.5
> > -
> > diff --git a/meta/recipes-support/attr/acl/configure.ac
> b/meta/recipes-support/attr/acl/configure.ac
> > deleted file mode 100644
> > index 7af2e8d886e..00000000000
> > --- a/meta/recipes-support/attr/acl/configure.ac
> > +++ /dev/null
> > @@ -1,49 +0,0 @@
> > -# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
> > -#
> > -# This program is free software: you can redistribute it and/or modify
> it
> > -# under the terms of the GNU General Public License as published by
> > -# the Free Software Foundation, either version 2 of the License, or
> > -# (at your option) any later version.
> > -#
> > -# This program is distributed in the hope that it will be useful,
> > -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > -# GNU General Public License for more details.
> > -#
> > -# You should have received a copy of the GNU General Public License
> > -# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > -#
> > -AC_INIT(include/acl.h)
> > -AC_CONFIG_AUX_DIR([.])
> > -AC_CONFIG_MACRO_DIR([m4])
> > -AC_CONFIG_HEADER(include/config.h)
> > -AC_PREFIX_DEFAULT(/usr)
> > -
> > -AC_PROG_LIBTOOL
> > -
> > -AC_ARG_ENABLE(shared,
> > -[ --enable-shared=[yes/no] Enable use of shared libraries
> [default=yes]],,
> > -       enable_shared=yes)
> > -AC_SUBST(enable_shared)
> > -
> > -AC_ARG_ENABLE(gettext,
> > -[ --enable-gettext=[yes/no] Enable alternate language support
> [default=yes]],,
> > -       enable_gettext=yes)
> > -AC_SUBST(enable_gettext)
> > -
> > -AC_ARG_ENABLE(lib64,
> > -[ --enable-lib64=[yes/no] Enable lib64 support [default=no]],,
> > -       enable_lib64=no)
> > -AC_SUBST(enable_lib64)
> > -
> > -AC_PACKAGE_GLOBALS(acl)
> > -AC_PACKAGE_UTILITIES(acl)
> > -AC_PACKAGE_NEED_ATTR_XATTR_H
> > -AC_PACKAGE_NEED_ATTR_ERROR_H
> > -AC_MULTILIB($enable_lib64)
> > -AC_PACKAGE_NEED_GETXATTR_LIBATTR
> > -AC_MANUAL_FORMAT
> > -
> > -AC_FUNC_GCC_VISIBILITY
> > -
> > -AC_OUTPUT(include/builddefs)
> > diff --git a/meta/recipes-support/attr/acl/run-ptest
> b/meta/recipes-support/attr/acl/run-ptest
> > index a56946d8e6f..43128233654 100644
> > --- a/meta/recipes-support/attr/acl/run-ptest
> > +++ b/meta/recipes-support/attr/acl/run-ptest
> > @@ -4,61 +4,7 @@
> >
> >  #umask 077
> >
> > -EXT3_IMAGE=ext3.img
> > -EXT3_MOUNT_POINT=/mnt/ext3
> > +mkdir -p /tmp/acl-ptest/test
> > +cp test/test.* /tmp/acl-ptest/test
> >
> > -trap 'rm -f ${EXT3_IMAGE}' EXIT
> > -
> > -dd if=/dev/zero of=${EXT3_IMAGE} bs=1M count=1
> > -if [ "$?" -eq 0 ]; then
> > -       echo "PASS: dump ext3.img"
> > -else
> > -       echo "FAIL: dump ext3.img"
> > -       exit 1
> > -fi
> > -
> > -mkfs.ext3 -F ${EXT3_IMAGE}
> > -if [ "$?" -eq 0 ]; then
> > -       echo "PASS: mkfs.ext3 -F ext3.img"
> > -else
> > -       echo "FAIL: mkfs.ext3 -F ext3.img"
> > -       exit 1
> > -fi
> > -
> > -if [ -d $EXT3_MOUNT_POINT ]; then
> > -       echo "mount point exist"
> > -else
> > -       mkdir -p $EXT3_MOUNT_POINT
> > -fi
> > -
> > -
> > -mount -o loop,rw,acl  ${EXT3_IMAGE} $EXT3_MOUNT_POINT
> > -if [ "$?" -eq 0 ]; then
> > -       echo "PASS: mount ext3.img"
> > -else
> > -       echo "FAIL: mount ext3.img"
> > -       exit 1
> > -fi
> > -
> > -cp -rf ./test/ $EXT3_MOUNT_POINT
> > -
> > -cd $EXT3_MOUNT_POINT/test/
> > -
> > -if     sed -e 's!^bin:x:2:$!bin:x:2:daemon!' < /etc/group > gtmp
> > -then   if      cp /etc/group group.orig;
> > -       then    cp gtmp /etc/group
> > -               make  -k tests root-tests | sed \
> > -                       -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
> > -                       -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
> > -               cp group.orig /etc/group
> > -       else    echo "FAIL: couldn't save original group file."
> > -               exit 1
> > -       fi
> > -else   echo "FAIL: couldn't create modified group file."
> > -       exit 1
> > -fi
> > -
> > -cd -
> > -umount $EXT3_MOUNT_POINT
> > -rm -rf $EXT3_MOUNT_POINT
> > -rm $EXT3_IMAGE
> > +make test-suite.log
> > diff --git
> a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
> b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
> > deleted file mode 100644
> > index e64990ad5b9..00000000000
> > --- a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -From 311589fedf196168382d8f0db303ab328bcf9d83 Mon Sep 17 00:00:00 2001
> > -From: Peter Seebach <peter.seebach@windriver.com>
> > -Date: Wed, 11 May 2016 15:16:06 -0500
> > -Subject: [PATCH] acl.inc, run-ptest: improve ptest functionality on
> limited
> > -
> > -commit c45bae84817a70fef6c2b661a07a492a0d23ae85
> > -
> > -    Fix permissions on temporary directory
> > -
> > -    The temporary directory's permissions have to allow other users to
> > -    view the directory. A default umask of 022 is common, but not
> mandatory,
> > -    and secure systems may have more restrictive defaults.
> > -
> > -    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> > -
> > -Upstream-Status: Backport [
> http://git.savannah.gnu.org/cgit/acl.git/commit/?id=c6772a958800de064482634f77c20a0faafc5af6
> ]
> > -
> > -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > ----
> > - test/root/permissions.test | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/test/root/permissions.test b/test/root/permissions.test
> > -index 42615f5..098b52a 100644
> > ---- a/test/root/permissions.test
> > -+++ b/test/root/permissions.test
> > -@@ -16,6 +16,7 @@ Cry immediately if we are not running as root.
> > - First, set up a temporary directory and create a regular file with
> > - defined permissions.
> > -
> > -+      $ umask 022
> > -       $ mkdir d
> > -       $ cd d
> > -       $ umask 027
> > ---
> > -2.8.1
> > -
> > diff --git
> a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
> b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
> > deleted file mode 100644
> > index f392465b58e..00000000000
> > ---
> a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
> > +++ /dev/null
> > @@ -1,100 +0,0 @@
> > -From e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d Mon Sep 17 00:00:00 2001
> > -From: Kamil Dudka <kdudka@redhat.com>
> > -Date: Mon, 20 May 2013 16:38:06 +0200
> > -Subject: [PATCH] test: fix insufficient quoting of '\'
> > -
> > -This is a follow-up to 7f2c91b8369242a8dbc2b304a5b71b2a85f5b855, which
> > -caused sbits-restore.test to fail in the following way in case SELinux
> > -was disabled:
> > -
> > -*** sbits-restore.test ***
> > -[3] $ umask 022 -- ok
> > -[4] $ mkdir d -- ok
> > -[5] $ touch d/g -- ok
> > -[6] $ touch d/u -- ok
> > -[7] $ chmod u+s d/u -- ok
> > -[8] $ chmod g+s d/g -- ok
> > -[9] $ chmod +t d -- ok
> > -[10] $ getfacl -R d > d.acl -- ok
> > -[11] $ rm -R d -- ok
> > -[12] $ mkdir d -- ok
> > -[13] $ touch d/g -- ok
> > -[14] $ touch d/u -- ok
> > -[15] $ setfacl --restore d.acl -- ok
> > -[16] $ ls -dl d | awk '{print $1}' | sed 's/.$//g' -- failed
> > -drwxr-xr-                             != drwxr-xr-t
> > -[18] $ ls -dl d/u | awk '{print $1}' | sed 's/.$//g' -- failed
> > --rwSr--r-                             != -rwSr--r--
> > -[20] $ ls -dl d/g | awk '{print $1}' | sed 's/.$//g' -- failed
> > --rw-r-Sr-                             != -rw-r-Sr--
> > -[22] $ rm -Rf d -- ok
> > -17 commands (14 passed, 3 failed)
> > -
> > -Upstream-Status: Backport
> > -
> http://git.savannah.gnu.org/cgit/acl.git/commit/?id=e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d
> > -
> > -Signed-off-by: Kamil Dudka <kdudka@redhat.com>
> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
> > -
> > -Index: acl-2.2.52/test/cp.test
> > -===================================================================
> > ---- acl-2.2.52.orig/test/cp.test
> > -+++ acl-2.2.52/test/cp.test
> > -@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if
> > -       > -rw-rw-r--+
> > -
> > -       $ cp f g
> > --      $ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
> > -+      $ ls -l g | awk -- '{ print $1 }' | sed 's/\\.$//g'
> > -       > -rw-r--r--
> > -
> > -       $ rm g
> > -Index: acl-2.2.52/test/misc.test
> > -===================================================================
> > ---- acl-2.2.52.orig/test/misc.test
> > -+++ acl-2.2.52/test/misc.test
> > -@@ -254,7 +254,7 @@ Add some users and groups
> > - Symlink in directory with default ACL?
> > -
> > -       $ ln -s d d/l
> > --      $ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d/l | awk '{print $1}' | sed 's/\\.$//g'
> > -       > lrwxrwxrwx
> > -
> > -       $ ls -dl -L d/l | awk '{print $1}'
> > -@@ -343,7 +343,7 @@ Remove the default ACL
> > - Reset to base entries
> > -
> > -       $ setfacl -b d
> > --      $ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
> > -       > drwxr-x---
> > -
> > -       $ getfacl --omit-header d
> > -@@ -355,7 +355,7 @@ Reset to base entries
> > - Now, chmod should change the group_obj entry
> > -
> > -       $ chmod 775 d
> > --      $ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
> > -       > drwxrwxr-x
> > -
> > -       $ getfacl --omit-header d
> > -Index: acl-2.2.52/test/sbits-restore.test
> > -===================================================================
> > ---- acl-2.2.52.orig/test/sbits-restore.test
> > -+++ acl-2.2.52/test/sbits-restore.test
> > -@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via -
> > -       $ touch d/g
> > -       $ touch d/u
> > -       $ setfacl --restore d.acl
> > --      $ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
> > -       > drwxr-xr-t
> > --      $ ls -dl d/u | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d/u | awk '{print $1}' | sed 's/\\.$//g'
> > -       > -rwSr--r--
> > --      $ ls -dl d/g | awk '{print $1}' | sed 's/\.$//g'
> > -+      $ ls -dl d/g | awk '{print $1}' | sed 's/\\.$//g'
> > -       > -rw-r-Sr--
> > -       $ rm -Rf d
> > diff --git
> a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
> b/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
> > deleted file mode 100644
> > index 8cc11a63e12..00000000000
> > ---
> a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
> > +++ /dev/null
> > @@ -1,84 +0,0 @@
> > -From d2f49ee6fe4850b8dda5b08676b36201d3c43710 Mon Sep 17 00:00:00 2001
> > -From: He Zhe <zhe.he@windriver.com>
> > -Date: Wed, 2 Mar 2016 15:46:57 +0800
> > -Subject: [PATCH] test: fixups on SELinux machines for root testcases
> > -
> > -ls adds a '.' at the end of the permission field list on SELinux
> > -machines, filter this out so root tests work on SELinux machines.
> > -
> > -Upstream-Status: Accepted
> > -
> http://git.savannah.gnu.org/cgit/acl.git/commit/?id=26a87d36f80d5e98bccb5878834d9e69dadfe3e9
> > -
> > -Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ----
> > - test/root/permissions.test | 8 ++++----
> > - test/root/restore.test     | 2 +-
> > - test/root/setfacl.test     | 2 +-
> > - 3 files changed, 6 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/test/root/permissions.test b/test/root/permissions.test
> > -index 9b9e3de..665339a 100644
> > ---- a/test/root/permissions.test
> > -+++ b/test/root/permissions.test
> > -@@ -19,7 +19,7 @@ defined permissions.
> > -       $ cd d
> > -       $ umask 027
> > -       $ touch f
> > --      $ ls -l f | awk -- '{ print $1, $3, $4 }'
> > -+      $ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
> > -       > -rw-r----- root root
> > -
> > -
> > -@@ -39,7 +39,7 @@ Now, change the ownership of the file to bin:bin and
> verify that this
> > - gives user bin write access.
> > -
> > -       $ chown bin:bin f
> > --      $ ls -l f | awk -- '{ print $1, $3, $4 }'
> > -+      $ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
> > -       > -rw-r----- bin bin
> > -       $ su bin
> > -       $ echo bin >> f
> > -@@ -256,12 +256,12 @@ directories if the file has an ACL and only
> CAP_FOWNER would grant them.
> > -       $ mkdir -m 600 x
> > -       $ chown daemon:daemon x
> > -       $ echo j > x/j
> > --      $ ls -l x/j | awk -- '{ print $1, $3, $4 }'
> > -+      $ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
> > -       > -rw-r----- root root
> > -
> > -       $ setfacl -m u:daemon:r x
> > -
> > --      $ ls -l x/j | awk -- '{ print $1, $3, $4 }'
> > -+      $ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
> > -       > -rw-r----- root root
> > -       (With the bug this gives: `ls: x/j: Permission denied'.)
> > -
> > -diff --git a/test/root/restore.test b/test/root/restore.test
> > -index 63a9d01..c85097c 100644
> > ---- a/test/root/restore.test
> > -+++ b/test/root/restore.test
> > -@@ -21,7 +21,7 @@ Cry immediately if we are not running as root.
> > -       $ chown bin passwd
> > -       $ chmod u+s passwd
> > -       $ setfacl --restore passwd.acl
> > --      $ ls -dl passwd | awk '{print $1 " " $3 " " $4}'
> > -+      $ ls -dl passwd | awk '{print $1 " " $3 " " $4}' | sed 's/\\.//g'
> > -       > -rwsr-xr-x root root
> > -
> > -       $ rm passwd passwd.acl
> > -diff --git a/test/root/setfacl.test b/test/root/setfacl.test
> > -index a46a9f4..7efbad7 100644
> > ---- a/test/root/setfacl.test
> > -+++ b/test/root/setfacl.test
> > -@@ -12,7 +12,7 @@ Cry immediately if we are not running as root.
> > -       $ sg bin
> > -       $ umask 027
> > -       $ touch g
> > --      $ ls -dl g | awk '{print $1}'
> > -+      $ ls -dl g | awk '{print $1}' | sed 's/\\.//g'
> > -       > -rw-r-----
> > -
> > -       $ setfacl -m m:- g
> > ---
> > -1.9.1
> > -
> > diff --git a/meta/recipes-support/attr/acl_2.2.52.bb
> b/meta/recipes-support/attr/acl_2.2.52.bb
> > deleted file mode 100644
> > index 6bc77d868d5..00000000000
> > --- a/meta/recipes-support/attr/acl_2.2.52.bb
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
> > -SUMMARY = "Utilities for managing POSIX Access Control Lists"
> > -HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
> > -SECTION = "libs"
> > -
> > -LICENSE = "LGPLv2.1+ & GPLv2+"
> > -LICENSE_${PN} = "GPLv2+"
> > -LICENSE_lib${BPN} = "LGPLv2.1+"
> > -LIC_FILES_CHKSUM =
> "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
> > -
> file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
> > -
> > -DEPENDS = "attr"
> > -
> > -SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
> > -           file://configure.ac;subdir=${BP} \
> > -           file://run-ptest \
> > -           file://acl-fix-the-order-of-expected-output-of-getfacl.patch
> \
> > -           file://test-fix-insufficient-quoting-of.patch \
> > -
>  file://test-fixups-on-SELinux-machines-for-root-testcases.patch \
> > -           file://test-fix-directory-permissions.patch \
> > -           file://Makefile-libacl-should-depend-on-include.patch \
> > -"
> > -
> > -SRC_URI[md5sum] = "a61415312426e9c2212bd7dc7929abda"
> > -SRC_URI[sha256sum] =
> "179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23"
> > -
> > -require ea-acl.inc
> > -
> > -# avoid RPATH hardcode to staging dir
> > -do_configure_append() {
> > -       sed -i ${S}/config.status -e
> s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
> > -       ${S}/config.status
> > -}
> > -
> > -# libdir should point to .la
> > -do_install_append() {
> > -       sed -i ${D}${libdir}/libacl.la -e \
> > -           s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
> > -}
> > -
> > -inherit ptest
> > -
> > -PTEST_BUILD_HOST_FILES = "builddefs"
> > -PTEST_BUILD_HOST_PATTERN = "^RPM"
> > -do_install_ptest() {
> > -       tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf -
> )
> > -       install -d ${D}${PTEST_PATH}/include
> > -       install -m 644 ${S}/include/builddefs ${S}/include/buildmacros
> ${S}/include/buildrules ${D}${PTEST_PATH}/include/
> > -}
> > -
> > -RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle
> perl-module-getopt-std perl-module-posix shadow"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/attr/acl_2.2.53.bb
> b/meta/recipes-support/attr/acl_2.2.53.bb
> > new file mode 100644
> > index 00000000000..c95e0524eb4
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/acl_2.2.53.bb
> > @@ -0,0 +1,60 @@
> > +SUMMARY = "Utilities for managing POSIX Access Control Lists"
> > +HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
> > +SECTION = "libs"
> > +
> > +LICENSE = "LGPLv2.1+ & GPLv2+"
> > +LICENSE_${PN} = "GPLv2+"
> > +LICENSE_lib${BPN} = "LGPLv2.1+"
> > +LIC_FILES_CHKSUM =
> "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
> > +
> file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
> > +
> > +DEPENDS = "attr"
> > +
> > +SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
> > +           file://run-ptest \
> > +
>  file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
> > +           file://0001-test-patch-out-failing-bits.patch \
> > +           "
> > +
> > +SRC_URI[md5sum] = "007aabf1dbb550bcddde52a244cd1070"
> > +SRC_URI[sha256sum] =
> "06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7"
> > +
> > +inherit autotools gettext ptest
> > +
> > +PTEST_BUILD_HOST_FILES = "builddefs"
> > +PTEST_BUILD_HOST_PATTERN = "^RPM"
> > +
> > +do_compile_ptest() {
> > +        oe_runmake libtestlookup.la
> > +}
> > +
> > +do_install_ptest() {
> > +       cp -rf ${S}/test/ ${D}${PTEST_PATH}
> > +       cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
> > +        mkdir -p ${D}${PTEST_PATH}/.libs
> > +       cp -rf ${B}/.libs/libtestlookup* ${D}${PTEST_PATH}/.libs
> > +        cp ${B}/Makefile ${D}${PTEST_PATH}
> > +        sed -i "s|^srcdir =.*|srcdir = \.|g" ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g"
> ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g"
> ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^Makefile:.*|Makefile:|g" ${D}${PTEST_PATH}/Makefile
> > +}
> > +
> > +RDEPENDS_${PN}-ptest = "acl \
> > +                        bash \
> > +                        coreutils \
> > +                        perl \
> > +                        perl-module-filehandle \
> > +                        perl-module-getopt-std \
> > +                        perl-module-posix \
> > +                        shadow \
> > +                        make \
> > +                        gawk \
> > +                        e2fsprogs-mke2fs \
> > +                        perl-module-cwd \
> > +                        perl-module-file-basename \
> > +                        perl-module-file-path \
> > +                        perl-module-file-spec \
> > +                       "
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/attr/attr.inc
> b/meta/recipes-support/attr/attr.inc
> > index 3503d66b9e1..5661301c15a 100644
> > --- a/meta/recipes-support/attr/attr.inc
> > +++ b/meta/recipes-support/attr/attr.inc
> > @@ -8,22 +8,14 @@ LICENSE = "LGPLv2.1+ & GPLv2+"
> >  LICENSE_${PN} = "GPLv2+"
> >  LICENSE_lib${BPN} = "LGPLv2.1+"
> >  LIC_FILES_CHKSUM =
> "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
> > -
> file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
> > +
> file://tools/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
> >
> file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
> >
> > -SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.src.tar.gz \
> > +SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
> >             file://run-ptest \
> >  "
> >
> > -require ea-acl.inc
> > -
> > -# libdir should point to .la
> > -do_install_append() {
> > -       sed -i ${D}${libdir}/libattr.la -e \
> > -           s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
> > -}
> > -
> > -inherit ptest update-alternatives
> > +inherit ptest update-alternatives autotools gettext
> >
> >  ALTERNATIVE_PRIORITY = "100"
> >  ALTERNATIVE_${PN} = "setfattr"
> > @@ -33,14 +25,27 @@ PTEST_BUILD_HOST_FILES = "builddefs"
> >  PTEST_BUILD_HOST_PATTERN = "^RPM"
> >
> >  do_install_ptest() {
> > -       tar -c --exclude=ext test/ | ( cd ${D}${PTEST_PATH} && tar -xf -
> )
> > -       mkdir ${D}${PTEST_PATH}/include
> > -       for i in builddefs buildmacros buildrules; \
> > -         do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
> > -       done
> > -       sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
> > +        cp ${B}/Makefile ${D}${PTEST_PATH}
> > +        sed -i "s|^srcdir =.*|srcdir = \.|g" ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g"
> ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g"
> ${D}${PTEST_PATH}/Makefile
> > +        sed -i "s|^Makefile:.*|Makefile:|g" ${D}${PTEST_PATH}/Makefile
> > +       cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
> > +       cp -rf ${S}/test/ ${D}${PTEST_PATH}
> >  }
> >
> > -RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle
> perl-module-getopt-std perl-module-posix make perl"
> > +RDEPENDS_${PN}-ptest = "attr \
> > +                        coreutils \
> > +                        perl-module-filehandle \
> > +                        perl-module-getopt-std \
> > +                        perl-module-posix \
> > +                        make \
> > +                        perl \
> > +                        gawk \
> > +                        perl-module-cwd \
> > +                        perl-module-file-basename \
> > +                        perl-module-file-path \
> > +                        perl-module-file-spec \
> > +                        "
> >
> >  BBCLASSEXTEND = "native nativesdk"
> > diff --git
> a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
> b/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
> > deleted file mode 100644
> > index dcd6507bcc5..00000000000
> > ---
> a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
> > +++ /dev/null
> > @@ -1,69 +0,0 @@
> > -From 37a27b6fd09ecb37097b85e5db74e4f77b80fe0a Mon Sep 17 00:00:00 2001
> > -From: Felix Janda <felix.janda@posteo.de>
> > -Date: Tue, 12 Jan 2016 22:20:33 +0100
> > -Subject: [PATCH] Use stdint types consistently
> > -
> > ----
> > -Upstream-Status: Backport
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > - include/attributes.h | 6 ++++--
> > - man/man3/attr_list.3 | 8 ++++----
> > - 2 files changed, 8 insertions(+), 6 deletions(-)
> > -
> > -Index: attr-2.4.47/include/attributes.h
> > -===================================================================
> > ---- attr-2.4.47.orig/include/attributes.h
> > -+++ attr-2.4.47/include/attributes.h
> > -@@ -22,6 +22,7 @@
> > - extern "C" {
> > - #endif
> > -
> > -+#include <stdint.h>
> > - /*
> > -  *    An almost-IRIX-compatible extended attributes API
> > -  *    (the IRIX attribute "list" operation is missing, added
> ATTR_SECURE).
> > -@@ -69,7 +70,7 @@ typedef struct attrlist {
> > -  * al_offset[i] entry points to.
> > -  */
> > - typedef struct attrlist_ent { /* data from attr_list() */
> > --      u_int32_t       a_valuelen;     /* number bytes in value of attr
> */
> > -+      uint32_t        a_valuelen;     /* number bytes in value of attr
> */
> > -       char            a_name[1];      /* attr name (NULL terminated) */
> > - } attrlist_ent_t;
> > -
> > -@@ -90,7 +91,7 @@ typedef struct attrlist_ent {        /* data fr
> > -  * operation on a cursor is to bzero() it.
> > -  */
> > - typedef struct attrlist_cursor {
> > --      u_int32_t       opaque[4];      /* an opaque cookie */
> > -+      uint32_t        opaque[4];      /* an opaque cookie */
> > - } attrlist_cursor_t;
> > -
> > - /*
> > -Index: attr-2.4.47/man/man3/attr_list.3
> > -===================================================================
> > ---- attr-2.4.47.orig/man/man3/attr_list.3
> > -+++ attr-2.4.47/man/man3/attr_list.3
> > -@@ -72,9 +72,9 @@ The contents of an \f4attrlist_t\fP stru
> > - .nf
> > - .ft 4
> > - .ta 9n 22n
> > --__int32_t al_count; /\(** number of entries in attrlist \(**/
> > --__int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
> > --__int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
> > -+int32_t al_count; /\(** number of entries in attrlist \(**/
> > -+int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
> > -+int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
> > - .ft 1
> > - .fi
> > - .RE
> > -@@ -113,7 +113,7 @@ include the following members:
> > - .nf
> > - .ft 4
> > - .ta 9n 22n
> > --u_int32_t a_valuelen; /\(** number bytes in value of attr \(**/
> > -+uint32_t a_valuelen; /\(** number bytes in value of attr \(**/
> > - char a_name[]; /\(** attr name (NULL terminated) \(**/
> > - .ft 1
> > - .fi
> > diff --git
> a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
> b/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
> > deleted file mode 100644
> > index 20fcc3cee7b..00000000000
> > --- a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
> > +++ /dev/null
> > @@ -1,63 +0,0 @@
> > -Subject: [PATCH] attr: Missing configure.ac
> > -
> > -Upstream-Status: Backport [Upstream released tarball missing this file]
> > -Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> > ----
> > - configure.ac |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > - 1 file changed, 48 insertions(+)
> > - create mode 100644 configure.ac
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -new file mode 100644
> > -index 0000000..b966d0e
> > ---- /dev/null
> > -+++ b/configure.ac
> > -@@ -0,0 +1,48 @@
> > -+# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
> > -+#
> > -+# This program is free software: you can redistribute it and/or modify
> it
> > -+# under the terms of the GNU General Public License as published by
> > -+# the Free Software Foundation, either version 2 of the License, or
> > -+# (at your option) any later version.
> > -+#
> > -+# This program is distributed in the hope that it will be useful,
> > -+# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > -+# GNU General Public License for more details.
> > -+#
> > -+# You should have received a copy of the GNU General Public License
> > -+# along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > -+#
> > -+AC_INIT(include/attributes.h)
> > -+AC_CONFIG_AUX_DIR([.])
> > -+AC_CONFIG_MACRO_DIR([m4])
> > -+AC_CONFIG_HEADER(include/config.h)
> > -+AC_PREFIX_DEFAULT(/usr)
> > -+
> > -+AC_PROG_LIBTOOL
> > -+
> > -+AC_ARG_ENABLE(shared,
> > -+[ --enable-shared=[yes/no] Enable use of shared libraries
> [default=yes]],,
> > -+      enable_shared=yes)
> > -+AC_SUBST(enable_shared)
> > -+
> > -+AC_ARG_ENABLE(gettext,
> > -+[ --enable-gettext=[yes/no] Enable alternate language support
> [default=yes]],,
> > -+      enable_gettext=yes)
> > -+AC_SUBST(enable_gettext)
> > -+
> > -+AC_ARG_ENABLE(lib64,
> > -+[ --enable-lib64=[yes/no] Enable lib64 support [default=no]],,
> > -+      enable_lib64=no)
> > -+AC_SUBST(enable_lib64)
> > -+
> > -+AC_PACKAGE_GLOBALS(attr)
> > -+AC_PACKAGE_UTILITIES(attr)
> > -+AC_MANUAL_FORMAT
> > -+AC_MULTILIB($enable_lib64)
> > -+
> > -+AC_C_CONST
> > -+AC_TYPE_MODE_T
> > -+AC_FUNC_ALLOCA
> > -+
> > -+AC_OUTPUT(include/builddefs)
> > diff --git a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch
> b/meta/recipes-support/attr/attr/dont-use-decl-macros.patch
> > deleted file mode 100644
> > index 9d4b8929e89..00000000000
> > --- a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch
> > +++ /dev/null
> > @@ -1,56 +0,0 @@
> > -Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
> > -these macros are defined in sys/cdefs.h for glibc and this header is
> not available on all libc
> > -
> > -anyway they defined like below
> > -
> > -#ifdef __cplusplus
> > -# define __BEGIN_DECLS extern "C" {
> > -# define __END_DECLS }
> > -#else
> > -# define __BEGIN_DECLS /* empty */
> > -# define __END_DECLS /* empty */
> > -#endif
> > -
> > -__THROW macro is also not available on musl, defined thusly
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > -Index: attr-2.4.47/include/xattr.h
> > -===================================================================
> > ---- attr-2.4.47.orig/include/xattr.h   2014-04-02 00:01:30.252091280
> -0700
> > -+++ attr-2.4.47/include/xattr.h        2014-04-02 00:12:57.985428099
> -0700
> > -@@ -30,8 +30,20 @@
> > - #define XATTR_CREATE  0x1       /* set value, fail if attr already
> exists */
> > - #define XATTR_REPLACE 0x2       /* set value, fail if attr does not
> exist */
> > -
> > --
> > --__BEGIN_DECLS
> > -+#ifndef __THROW
> > -+# ifndef __GNUC_PREREQ
> > -+#  define __GNUC_PREREQ(maj, min) (0)
> > -+# endif
> > -+# if defined __cplusplus && __GNUC_PREREQ (2,8)
> > -+#  define __THROW       throw ()
> > -+# else
> > -+#  define __THROW
> > -+# endif
> > -+#endif
> > -+
> > -+#ifdef __cplusplus
> > -+extern "C" {
> > -+#endif
> > -
> > - extern int setxattr (const char *__path, const char *__name,
> > -                     const void *__value, size_t __size, int __flags)
> __THROW;
> > -@@ -58,6 +70,8 @@
> > - extern int lremovexattr (const char *__path, const char *__name)
> __THROW;
> > - extern int fremovexattr (int __filedes,   const char *__name) __THROW;
> > -
> > --__END_DECLS
> > -+#ifdef __cplusplus
> > -+}
> > -+#endif
> > -
> > - #endif        /* __XATTR_H__ */
> > diff --git a/meta/recipes-support/attr/attr/run-ptest
> b/meta/recipes-support/attr/attr/run-ptest
> > new file mode 100644
> > index 00000000000..f64244f2393
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/attr/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +make test-suite.log
> > diff --git a/meta/recipes-support/attr/attr_2.4.47.bb
> b/meta/recipes-support/attr/attr_2.4.47.bb
> > deleted file mode 100644
> > index fc88bef830b..00000000000
> > --- a/meta/recipes-support/attr/attr_2.4.47.bb
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -require attr.inc
> > -
> > -# configure.ac was missing from the release tarball. This should be
> fixed in
> > -# future releases of attr, remove this when updating the recipe.
> > -SRC_URI += "file://attr-Missing-configure.ac.patch \
> > -            file://dont-use-decl-macros.patch \
> > -            file://Remove-the-section-2-man-pages.patch \
> > -            file://Remove-the-attr.5-man-page-moved-to-man-pages.patch \
> > -            file://0001-Use-stdint-types-consistently.patch \
> > -           "
> > -
> > -SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
> > -SRC_URI[sha256sum] =
> "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/attr/attr_2.4.48.bb
> b/meta/recipes-support/attr/attr_2.4.48.bb
> > new file mode 100644
> > index 00000000000..530d4e48833
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/attr_2.4.48.bb
> > @@ -0,0 +1,6 @@
> > +require attr.inc
> > +
> > +SRC_URI[md5sum] = "bc1e5cb5c96d99b24886f1f527d3bb3d"
> > +SRC_URI[sha256sum] =
> "5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta/recipes-support/attr/ea-acl.inc
> b/meta/recipes-support/attr/ea-acl.inc
> > deleted file mode 100644
> > index 9336ffc9389..00000000000
> > --- a/meta/recipes-support/attr/ea-acl.inc
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
> > -# this build system is mostly shared by attr and acl
> > -
> > -SRC_URI += "file://relative-libdir.patch;striplevel=0 \
> > -           "
> > -# This patch should be applied after
> '(attr\|acl)-Missing-configure.ac.patch'
> > -SRC_URI_append = "
> file://0001-Added-configure-option-to-enable-disable-static-libr.patch"
> > -
> > -inherit autotools-brokensep gettext
> > -
> > -# When upstream is using automake properly, this can be removed
> > -CLEANBROKEN = "1"
> > -
> > -# the package comes with a custom config.h.in, it cannot be
> > -# overwritten by autoheader
> > -EXTRA_AUTORECONF += "--exclude=autoheader"
> > -EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
> > -EXTRA_OECONF_append_class-native = " --enable-gettext=no"
> > -EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext
> '][(d.getVar('USE_NLS') == 'no')]}"
> > -
> > -EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
> > -
> > -do_install () {
> > -       oe_runmake install install-lib install-dev DIST_ROOT="${D}"
> ZIP="gzip -n"
> > -}
> > -
> > -do_install_append_class-native () {
> > -       if test "${libdir}" = "${base_libdir}" ; then
> > -               return
> > -       fi
> > -       librelpath=${@os.path.relpath(d.getVar('libdir'),
> d.getVar('base_libdir'))}
> > -       baselibrelpath=${@os.path.relpath(d.getVar('base_libdir'),
> d.getVar('libdir'))}
> > -
> > -       # Remove bad symlinks & create the correct symlinks
> > -       if test -L ${D}${libdir}/lib${BPN}.so ; then
> > -               rm -rf ${D}${libdir}/lib${BPN}.so
> > -               ln -sf $baselibrelpath/lib${BPN}.so
> ${D}${libdir}/lib${BPN}.so
> > -       fi
> > -       if test -L ${D}${base_libdir}/lib${BPN}.a ; then
> > -               rm -rf ${D}${base_libdir}/lib${BPN}.a
> > -               ln -sf $librelpath/lib${BPN}.a
> ${D}${base_libdir}/lib${BPN}.a
> > -       fi
> > -       if test -L  ${D}${base_libdir}/lib${BPN}.la ; then
> > -               rm -rf ${D}${base_libdir}/lib${BPN}.la
> > -               ln -sf $librelpath/lib${BPN}.la
> ${D}${base_libdir}/lib${BPN}.la
> > -       fi
> > -}
> > -
> > -PACKAGES =+ "lib${BPN}"
> > -
> > -FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
> > -
> > -BBCLASSEXTEND = "native"
> > diff --git
> a/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
> b/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
> > deleted file mode 100644
> > index 1c1159f2c90..00000000000
> > ---
> a/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
> > +++ /dev/null
> > @@ -1,70 +0,0 @@
> > -From 01256c61ba126449c46dd4ab5d5e145488b981fa Mon Sep 17 00:00:00 2001
> > -From: Amarnath Valluri <amarnath.valluri@intel.com>
> > -Date: Mon, 23 Jan 2017 13:25:13 +0200
> > -Subject: [PATCH] Added configure option to enable/disable static library
> > -
> > -Create static library archive only in case of --enable-static.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> > ----
> > - configure.ac         | 6 ++++++
> > - include/builddefs.in | 1 +
> > - include/buildmacros  | 3 +++
> > - 3 files changed, 10 insertions(+)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index b966d0e..e48268b 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -26,6 +26,12 @@ AC_ARG_ENABLE(shared,
> > -       enable_shared=yes)
> > - AC_SUBST(enable_shared)
> > -
> > -+AC_ARG_ENABLE(static,
> > -+[ --enable-static=[yes/no] Enable use of static libraries
> [default=yes]],,
> > -+      enable_static=yes)
> > -+AC_SUBST(enable_static)
> > -+
> > -+
> > - AC_ARG_ENABLE(gettext,
> > - [ --enable-gettext=[yes/no] Enable alternate language support
> [default=yes]],,
> > -       enable_gettext=yes)
> > -diff --git a/include/builddefs.in b/include/builddefs.in
> > -index d9931db..3b3dbd2 100644
> > ---- a/include/builddefs.in
> > -+++ b/include/builddefs.in
> > -@@ -71,6 +71,7 @@ RPMBUILD     = @rpmbuild@
> > - RPM_VERSION   = @rpm_version@
> > -
> > - ENABLE_SHARED = @enable_shared@
> > -+ENABLE_STATIC         = @enable_static@
> > - ENABLE_GETTEXT        = @enable_gettext@
> > -
> > - HAVE_ZIPPED_MANPAGES = @have_zipped_manpages@
> > -diff --git a/include/buildmacros b/include/buildmacros
> > -index 39fa7e2..b0f25c5 100644
> > ---- a/include/buildmacros
> > -+++ b/include/buildmacros
> > -@@ -80,6 +80,7 @@ endif
> > - # /usr/lib.
> > - ifeq ($(ENABLE_SHARED),yes)
> > - INSTALL_LTLIB_DEV = \
> > -+      set -x; \
> > -       cd $(TOPDIR)/$(LIBNAME)/.libs; \
> > -       ../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
> > -       ../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai
> $(PKG_DEVLIB_DIR); \
> > -@@ -88,7 +89,9 @@ INSTALL_LTLIB_DEV = \
> > -       ../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
> > -       if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
> > -       rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed
> 's,\(^/\|\)[^/][^/]*,..,g'); \
> > -+      if test "$(ENABLE_STATIC)" = "yes" ; then \
> > -       ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a
> $(PKG_LIB_DIR)/$(LIBNAME).a; \
> > -+      fi ;\
> > -       ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la
> $(PKG_LIB_DIR)/$(LIBNAME).la; \
> > -       rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed
> 's,\(^/\|\)[^/][^/]*,..,g'); \
> > -       ../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so
> $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
> b/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
> > deleted file mode 100644
> > index d5ab83d7c68..00000000000
> > ---
> a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
> > +++ /dev/null
> > @@ -1,240 +0,0 @@
> > -From 6047c8522b91235ad1e835f44f5e36472d9d49b2 Mon Sep 17 00:00:00 2001
> > -From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
> > -Date: Wed, 22 Apr 2015 11:46:59 +0200
> > -Subject: [PATCH 2/2] Remove the attr.5 man page (moved to man-pages)
> > -
> > -Commit dce9b4448c7f2b22bd206cd068fb05cb2f3255b9 from
> > -https://git.savannah.nongnu.org/git/attr.git
> > -
> > -The attr.5 page is part of the extended attribute system call
> documentation,
> > -which has been moved into the man-pages package. Move the attr.5 page
> there
> > -as well.
> > -
> > -Upstream-Status: Backport
> > -
> > -[MA: updated to apply directly to v2.4.47]
> > -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ----
> > - man/Makefile      |   2 +-
> > - man/man5/Makefile |  35 -------------
> > - man/man5/attr.5   | 153
> ------------------------------------------------------
> > - 3 files changed, 1 insertion(+), 189 deletions(-)
> > - delete mode 100644 man/man5/Makefile
> > - delete mode 100644 man/man5/attr.5
> > -
> > -diff --git a/man/Makefile b/man/Makefile
> > -index 755daed..9301f09 100644
> > ---- a/man/Makefile
> > -+++ b/man/Makefile
> > -@@ -19,7 +19,7 @@
> > - TOPDIR = ..
> > - include $(TOPDIR)/include/builddefs
> > -
> > --SUBDIRS = man1 man3 man5
> > -+SUBDIRS = man1 man3
> > -
> > - default : $(SUBDIRS)
> > -
> > -diff --git a/man/man5/Makefile b/man/man5/Makefile
> > -deleted file mode 100644
> > -index 6b70d3d..0000000
> > ---- a/man/man5/Makefile
> > -+++ /dev/null
> > -@@ -1,35 +0,0 @@
> > --#
> > --# Copyright (c) 2000, 2002 Silicon Graphics, Inc.  All Rights Reserved.
> > --# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
> > --#
> > --# This program is free software: you can redistribute it and/or modify
> it
> > --# under the terms of the GNU General Public License as published by
> > --# the Free Software Foundation, either version 2 of the License, or
> > --# (at your option) any later version.
> > --#
> > --# This program is distributed in the hope that it will be useful,
> > --# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --# GNU General Public License for more details.
> > --#
> > --# You should have received a copy of the GNU General Public License
> > --# along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > --#
> > --
> > --TOPDIR = ../..
> > --include $(TOPDIR)/include/builddefs
> > --
> > --MAN_SECTION   = 5
> > --
> > --MAN_PAGES     = $(shell echo *.$(MAN_SECTION))
> > --MAN_DEST      = $(PKG_MAN_DIR)/man$(MAN_SECTION)
> > --LSRCFILES     = $(MAN_PAGES)
> > --
> > --default : $(MAN_PAGES)
> > --
> > --include $(BUILDRULES)
> > --
> > --install : default
> > --      $(INSTALL) -m 755 -d $(MAN_DEST)
> > --      $(INSTALL_MAN)
> > --install-dev install-lib:
> > -diff --git a/man/man5/attr.5 b/man/man5/attr.5
> > -deleted file mode 100644
> > -index a02757d..0000000
> > ---- a/man/man5/attr.5
> > -+++ /dev/null
> > -@@ -1,153 +0,0 @@
> > --.\" Extended attributes manual page
> > --.\"
> > --.\" Copyright (C) 2000, 2002, 2007  Andreas Gruenbacher <
> agruen@suse.de>
> > --.\" Copyright (C) 2001, 2002, 2004, 2007 Silicon Graphics, Inc.
> > --.\" All rights reserved.
> > --.\"
> > --.\" This is free documentation; you can redistribute it and/or
> > --.\" modify it under the terms of the GNU General Public License as
> > --.\" published by the Free Software Foundation; either version 2 of
> > --.\" the License, or (at your option) any later version.
> > --.\"
> > --.\" The GNU General Public License's references to "object code"
> > --.\" and "executables" are to be interpreted as the output of any
> > --.\" document formatting or typesetting system, including
> > --.\" intermediate and printed output.
> > --.\"
> > --.\" This manual is distributed in the hope that it will be useful,
> > --.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --.\" GNU General Public License for more details.
> > --.\"
> > --.\" You should have received a copy of the GNU General Public
> > --.\" License along with this manual.  If not, see
> > --.\" <http://www.gnu.org/licenses/>.
> > --.\"
> > --.TH ATTR 5
> > --.SH NAME
> > --attr - Extended attributes
> > --.SH DESCRIPTION
> > --Extended attributes are name:value pairs associated permanently with
> > --files and directories, similar to the environment strings associated
> > --with a process.
> > --An attribute may be defined or undefined.
> > --If it is defined, its value may be empty or non-empty.
> > --.PP
> > --Extended attributes are extensions to the normal attributes which are
> > --associated with all inodes in the system (i.e. the
> > --.BR stat (2)
> > --data).
> > --They are often used to provide additional functionality
> > --to a filesystem \- for example, additional security features such as
> > --Access Control Lists (ACLs) may be implemented using extended
> attributes.
> > --.PP
> > --Users with search access to a file or directory may retrieve a list of
> > --attribute names defined for that file or directory.
> > --.PP
> > --Extended attributes are accessed as atomic objects.
> > --Reading retrieves the whole value of an attribute and stores it in a
> buffer.
> > --Writing replaces any previous value with the new value.
> > --.PP
> > --Space consumed for extended attributes is counted towards the disk
> quotas
> > --of the file owner and file group.
> > --.PP
> > --Currently, support for extended attributes is implemented on Linux by
> the
> > --ext2, ext3, ext4, XFS, JFS and reiserfs filesystems.
> > --.SH EXTENDED ATTRIBUTE NAMESPACES
> > --Attribute names are zero-terminated strings.
> > --The attribute name is always specified in the fully qualified
> > --.IR namespace.attribute
> > --form, eg.
> > --.IR user.mime_type ,
> > --.IR trusted.md5sum ,
> > --.IR system.posix_acl_access ,
> > --or
> > --.IR security.selinux .
> > --.PP
> > --The namespace mechanism is used to define different classes of extended
> > --attributes.
> > --These different classes exist for several reasons, e.g. the permissions
> > --and capabilities required for manipulating extended attributes of one
> > --namespace may differ to another.
> > --.PP
> > --Currently the
> > --.IR security ,
> > --.IR system ,
> > --.IR trusted ,
> > --and
> > --.IR user
> > --extended attribute classes are defined as described below. Additional
> > --classes may be added in the future.
> > --.SS Extended security attributes
> > --The security attribute namespace is used by kernel security modules,
> > --such as Security Enhanced Linux.
> > --Read and write access permissions to security attributes depend on the
> > --policy implemented for each security attribute by the security module.
> > --When no security module is loaded, all processes have read access to
> > --extended security attributes, and write access is limited to processes
> > --that have the CAP_SYS_ADMIN capability.
> > --.SS Extended system attributes
> > --Extended system attributes are used by the kernel to store system
> > --objects such as Access Control Lists and Capabilities.  Read and write
> > --access permissions to system attributes depend on the policy
> implemented
> > --for each system attribute implemented by filesystems in the kernel.
> > --.SS Trusted extended attributes
> > --Trusted extended attributes are visible and accessible only to
> processes that
> > --have the CAP_SYS_ADMIN capability (the super user usually has this
> > --capability).
> > --Attributes in this class are used to implement mechanisms in user
> > --space (i.e., outside the kernel) which keep information in extended
> attributes
> > --to which ordinary processes should not have access.
> > --.SS Extended user attributes
> > --Extended user attributes may be assigned to files and directories for
> > --storing arbitrary additional information such as the mime type,
> > --character set or encoding of a file. The access permissions for user
> > --attributes are defined by the file permission bits.
> > --.PP
> > --The file permission bits of regular files and directories are
> > --interpreted differently from the file permission bits of special files
> > --and symbolic links. For regular files and directories the file
> > --permission bits define access to the file's contents, while for device
> special
> > --files they define access to the device described by the special file.
> > --The file permissions of symbolic links are not used in access
> > --checks. These differences would allow users to consume filesystem
> resources in
> > --a way not controllable by disk quotas for group or world writable
> special files and directories.
> > --.PP
> > --For this reason, extended user attributes are only allowed for regular
> files and directories, and access to extended user attributes is restricted
> to the
> > --owner and to users with appropriate capabilities for directories with
> the
> > --sticky bit set (see the
> > --.BR chmod (1)
> > --manual page for an explanation of Sticky Directories).
> > --.SH FILESYSTEM DIFFERENCES
> > --The kernel and the filesystem may place limits on the maximum number
> > --and size of extended attributes that can be associated with a file.
> > --Some file systems, such as ext2/3 and reiserfs, require the filesystem
> > --to be mounted with the
> > --.B user_xattr
> > --mount option in order for extended user attributes to be used.
> > --.PP
> > --In the current ext2, ext3 and ext4 filesystem implementations, each
> > --extended attribute must fit on a single filesystem block (1024, 2048
> > --or 4096 bytes, depending on the block size specified when the
> > --filesystem was created).
> > --.PP
> > --In the XFS and reiserfs filesystem implementations, there is no
> > --practical limit on the number or size of extended attributes
> > --associated with a file, and the algorithms used to store extended
> > --attribute information on disk are scalable.
> > --.PP
> > --In the JFS filesystem implementation, names can be up to 255 bytes and
> > --values up to 65,535 bytes.
> > --.SH ADDITIONAL NOTES
> > --Since the filesystems on which extended attributes are stored might
> also
> > --be used on architectures with a different byte order and machine word
> > --size, care should be taken to store attribute values in an architecture
> > --independent format.
> > --.SH AUTHORS
> > --Andreas Gruenbacher,
> > --.RI < a.gruenbacher@bestbits.at >
> > --and the SGI XFS development team,
> > --.RI < linux-xfs@oss.sgi.com >.
> > --.SH SEE ALSO
> > --getfattr(1),
> > --setfattr(1).
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
> b/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
> > deleted file mode 100644
> > index 044c5a037c8..00000000000
> > ---
> a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
> > +++ /dev/null
> > @@ -1,666 +0,0 @@
> > -From b972600a26f3a930e53e2fce2625266a5d29813e Mon Sep 17 00:00:00 2001
> > -From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
> > -Date: Tue, 14 Apr 2015 23:53:11 +0200
> > -Subject: [PATCH 1/2] Remove the section 2 man pages
> > -
> > -Commit 8d1263bca95722d66a6f8e83450f49d0956ea534 from upstream
> > -https://git.savannah.nongnu.org/git/attr.git/
> > -
> > -The section 2 man pages have long since been added to the man-pages
> package
> > -which documents all system calls; they were disabled in attr by default
> since
> > -January 2014.  Get rid of them here.
> > -
> > -Upstream-Status: Backport
> > -
> > -[MA: modified to apply directly to v2.4.47]
> > -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ----
> > - man/Makefile           |   2 +-
> > - man/man2/Makefile      |  35 -----------
> > - man/man2/getxattr.2    | 143
> --------------------------------------------
> > - man/man2/listxattr.2   | 158
> -------------------------------------------------
> > - man/man2/removexattr.2 | 111 ----------------------------------
> > - man/man2/setxattr.2    | 143
> --------------------------------------------
> > - 6 files changed, 1 insertion(+), 591 deletions(-)
> > - delete mode 100644 man/man2/Makefile
> > - delete mode 100644 man/man2/getxattr.2
> > - delete mode 100644 man/man2/listxattr.2
> > - delete mode 100644 man/man2/removexattr.2
> > - delete mode 100644 man/man2/setxattr.2
> > -
> > -diff --git a/man/Makefile b/man/Makefile
> > -index 9535426..755daed 100644
> > ---- a/man/Makefile
> > -+++ b/man/Makefile
> > -@@ -19,7 +19,7 @@
> > - TOPDIR = ..
> > - include $(TOPDIR)/include/builddefs
> > -
> > --SUBDIRS = man1 man2 man3 man5
> > -+SUBDIRS = man1 man3 man5
> > -
> > - default : $(SUBDIRS)
> > -
> > -diff --git a/man/man2/Makefile b/man/man2/Makefile
> > -deleted file mode 100644
> > -index d77309d..0000000
> > ---- a/man/man2/Makefile
> > -+++ /dev/null
> > -@@ -1,35 +0,0 @@
> > --#
> > --# Copyright (c) 2000-2002 Silicon Graphics, Inc.  All Rights Reserved.
> > --# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
> > --#
> > --# This program is free software: you can redistribute it and/or modify
> it
> > --# under the terms of the GNU General Public License as published by
> > --# the Free Software Foundation, either version 2 of the License, or
> > --# (at your option) any later version.
> > --#
> > --# This program is distributed in the hope that it will be useful,
> > --# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --# GNU General Public License for more details.
> > --#
> > --# You should have received a copy of the GNU General Public License
> > --# along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > --#
> > --
> > --TOPDIR = ../..
> > --include $(TOPDIR)/include/builddefs
> > --
> > --MAN_SECTION   = 2
> > --
> > --MAN_PAGES     = $(shell echo *.$(MAN_SECTION))
> > --MAN_DEST      = $(PKG_MAN_DIR)/man$(MAN_SECTION)
> > --LSRCFILES     = $(MAN_PAGES)
> > --
> > --default install : $(MAN_PAGES)
> > --
> > --include $(BUILDRULES)
> > --
> > --install-dev : default
> > --      $(INSTALL) -m 755 -d $(MAN_DEST)
> > --      $(INSTALL_MAN)
> > --install-lib:
> > -diff --git a/man/man2/getxattr.2 b/man/man2/getxattr.2
> > -deleted file mode 100644
> > -index 405ad89..0000000
> > ---- a/man/man2/getxattr.2
> > -+++ /dev/null
> > -@@ -1,143 +0,0 @@
> > --.\"
> > --.\" Extended attributes system calls manual pages
> > --.\"
> > --.\" (C) Andreas Gruenbacher, February 2001
> > --.\" (C) Silicon Graphics Inc, September 2001
> > --.\"
> > --.\" This is free documentation; you can redistribute it and/or
> > --.\" modify it under the terms of the GNU General Public License as
> > --.\" published by the Free Software Foundation; either version 2 of
> > --.\" the License, or (at your option) any later version.
> > --.\"
> > --.\" The GNU General Public License's references to "object code"
> > --.\" and "executables" are to be interpreted as the output of any
> > --.\" document formatting or typesetting system, including
> > --.\" intermediate and printed output.
> > --.\"
> > --.\" This manual is distributed in the hope that it will be useful,
> > --.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --.\" GNU General Public License for more details.
> > --.\"
> > --.\" You should have received a copy of the GNU General Public
> > --.\" License along with this manual.  If not, see
> > --.\" <http://www.gnu.org/licenses/>.
> > --.\"
> > --.TH GETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
> > --.SH NAME
> > --getxattr, lgetxattr, fgetxattr \- retrieve an extended attribute value
> > --.SH SYNOPSIS
> > --.fam C
> > --.nf
> > --.B #include <sys/types.h>
> > --.B #include <attr/xattr.h>
> > --.sp
> > --.BI "ssize_t getxattr (const char\ *" path ", const char\ *" name ",
> > --.BI "\t\t\t\t void\ *" value ", size_t " size );
> > --.BI "ssize_t lgetxattr (const char\ *" path ", const char\ *" name ",
> > --.BI "\t\t\t\t void\ *" value ", size_t " size );
> > --.BI "ssize_t fgetxattr (int " filedes ", const char\ *" name ",
> > --.BI "\t\t\t\t void\ *" value ", size_t " size );
> > --.fi
> > --.fam T
> > --.SH DESCRIPTION
> > --Extended attributes are
> > --.IR name :\c
> > --.I value
> > --pairs associated with inodes (files, directories, symlinks, etc).
> > --They are extensions to the normal attributes which are associated
> > --with all inodes in the system (i.e. the
> > --.BR stat (2)
> > --data).
> > --A complete overview of extended attributes concepts can be found in
> > --.BR attr (5).
> > --.PP
> > --.B getxattr
> > --retrieves the
> > --.I value
> > --of the extended attribute identified by
> > --.I name
> > --and associated with the given
> > --.I path
> > --in the filesystem.
> > --The length of the attribute
> > --.I value
> > --is returned.
> > --.PP
> > --.B lgetxattr
> > --is identical to
> > --.BR getxattr ,
> > --except in the case of a symbolic link, where the link itself is
> > --interrogated, not the file that it refers to.
> > --.PP
> > --.B fgetxattr
> > --is identical to
> > --.BR getxattr ,
> > --only the open file pointed to by
> > --.I filedes
> > --(as returned by
> > --.BR open (2))
> > --is interrogated in place of
> > --.IR path .
> > --.PP
> > --An extended attribute
> > --.I name
> > --is a simple NULL-terminated string.
> > --The name includes a namespace prefix \- there may be several, disjoint
> > --namespaces associated with an individual inode.
> > --The value of an extended attribute is a chunk of arbitrary textual or
> > --binary data of specified length.
> > --.PP
> > --An empty buffer of
> > --.I size
> > --zero can be passed into these calls to return the current size of the
> > --named extended attribute, which can be used to estimate the size of a
> > --buffer which is sufficiently large to hold the value associated with
> > --the extended attribute.
> > --.PP
> > --The interface is designed to allow guessing of initial buffer
> > --sizes, and to enlarge buffers when the return value indicates
> > --that the buffer provided was too small.
> > --.SH RETURN VALUE
> > --On success, a positive number is returned indicating the size of the
> > --extended attribute value.
> > --On failure, \-1 is returned and
> > --.I errno
> > --is set appropriately.
> > --.PP
> > --If the named attribute does not exist, or the process has no access to
> > --this attribute,
> > --.I errno
> > --is set to ENOATTR.
> > --.PP
> > --If the
> > --.I size
> > --of the
> > --.I value
> > --buffer is too small to hold the result,
> > --.I errno
> > --is set to ERANGE.
> > --.PP
> > --If extended attributes are not supported by the filesystem, or are
> disabled,
> > --.I errno
> > --is set to ENOTSUP.
> > --.PP
> > --The errors documented for the
> > --.BR stat (2)
> > --system call are also applicable here.
> > --.SH AUTHORS
> > --Andreas Gruenbacher,
> > --.RI < a.gruenbacher@bestbits.at >
> > --and the SGI XFS development team,
> > --.RI < linux-xfs@oss.sgi.com >.
> > --Please send any bug reports or comments to these addresses.
> > --.SH SEE ALSO
> > --.BR getfattr (1),
> > --.BR setfattr (1),
> > --.BR open (2),
> > --.BR stat (2),
> > --.BR setxattr (2),
> > --.BR listxattr (2),
> > --.BR removexattr (2),
> > --and
> > --.BR attr (5).
> > -diff --git a/man/man2/listxattr.2 b/man/man2/listxattr.2
> > -deleted file mode 100644
> > -index 8b4371c..0000000
> > ---- a/man/man2/listxattr.2
> > -+++ /dev/null
> > -@@ -1,158 +0,0 @@
> > --.\"
> > --.\" Extended attributes system calls manual pages
> > --.\"
> > --.\" (C) Andreas Gruenbacher, February 2001
> > --.\" (C) Silicon Graphics Inc, September 2001
> > --.\"
> > --.\" This is free documentation; you can redistribute it and/or
> > --.\" modify it under the terms of the GNU General Public License as
> > --.\" published by the Free Software Foundation; either version 2 of
> > --.\" the License, or (at your option) any later version.
> > --.\"
> > --.\" The GNU General Public License's references to "object code"
> > --.\" and "executables" are to be interpreted as the output of any
> > --.\" document formatting or typesetting system, including
> > --.\" intermediate and printed output.
> > --.\"
> > --.\" This manual is distributed in the hope that it will be useful,
> > --.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --.\" GNU General Public License for more details.
> > --.\"
> > --.\" You should have received a copy of the GNU General Public
> > --.\" License along with this manual.  If not, see
> > --.\" <http://www.gnu.org/licenses/>.
> > --.\"
> > --.TH LISTXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
> > --.SH NAME
> > --listxattr, llistxattr, flistxattr \- list extended attribute names
> > --.SH SYNOPSIS
> > --.fam C
> > --.nf
> > --.B #include <sys/types.h>
> > --.B #include <attr/xattr.h>
> > --.sp
> > --.BI "ssize_t listxattr (const char\ *" path ",
> > --.BI "\t\t\t\t char\ *" list ", size_t " size );
> > --.BI "ssize_t llistxattr (const char\ *" path ",
> > --.BI "\t\t\t\t char\ *" list ", size_t " size );
> > --.BI "ssize_t flistxattr (int " filedes ",
> > --.BI "\t\t\t\t char\ *" list ", size_t " size );
> > --.fi
> > --.fam T
> > --.SH DESCRIPTION
> > --Extended attributes are name:value
> > --pairs associated with inodes (files, directories, symlinks, etc).
> > --They are extensions to the normal attributes which are associated
> > --with all inodes in the system (i.e. the
> > --.BR stat (2)
> > --data).
> > --A complete overview of extended attributes concepts can be found in
> > --.BR attr (5).
> > --.PP
> > --.B listxattr
> > --retrieves the
> > --.I list
> > --of extended attribute names associated with the given
> > --.I path
> > --in the filesystem.
> > --The list is the set of (NULL-terminated) names, one after the other.
> > --Names of extended attributes to which the calling process does not
> > --have access may be omitted from the list.
> > --The length of the attribute name
> > --.I list
> > --is returned.
> > --.PP
> > --.B llistxattr
> > --is identical to
> > --.BR listxattr ,
> > --except in the case of a symbolic link, where the list of names of
> > --extended attributes associated with the link itself is retrieved,
> > --not the file that it refers to.
> > --.I list
> > --is a caller-allocated buffer of size
> > --.IR size .
> > --.PP
> > --.B flistxattr
> > --is identical to
> > --.BR listxattr ,
> > --only the open file pointed to by
> > --.I filedes
> > --(as returned by
> > --.BR open (2))
> > --is interrogated in place of
> > --.IR path .
> > --.PP
> > --A single extended attribute
> > --.I name
> > --is a simple NULL-terminated string.
> > --The name includes a namespace prefix \- there may be several, disjoint
> > --namespaces associated with an individual inode.
> > --.PP
> > --An empty buffer of
> > --.I size
> > --zero can be passed into these calls to return the current size of the
> > --list of extended attribute names, which can be used to estimate the
> > --size of a buffer which is sufficiently large to hold the list of names.
> > --.SH EXAMPLES
> > --The
> > --.I list
> > --of names is returned as an unordered array of NULL-terminated character
> > --strings (attribute names are separated by NULL characters), like this:
> > --.fam C
> > --.RS
> > --.nf
> > --user.name1\\0system.name1\\0user.name2\\0
> > --.fi
> > --.RE
> > --.fam T
> > --.P
> > --Filesystems like ext2, ext3 and XFS which implement POSIX ACLs using
> > --extended attributes, might return a
> > --.I list
> > --like this:
> > --.fam C
> > --.RS
> > --.nf
> > --system.posix_acl_access\\0system.posix_acl_default\\0
> > --.fi
> > --.RE
> > --.fam T
> > --.SH RETURN VALUE
> > --On success, a positive number is returned indicating the size of the
> > --extended attribute name list.
> > --On failure, \-1 is returned and
> > --.I errno
> > --is set appropriately.
> > --.PP
> > --If the
> > --.I size
> > --of the
> > --.I list
> > --buffer is too small to hold the result,
> > --.I errno
> > --is set to ERANGE.
> > --.PP
> > --If extended attributes are not supported by the filesystem, or are
> disabled,
> > --.I errno
> > --is set to ENOTSUP.
> > --.PP
> > --The errors documented for the
> > --.BR stat (2)
> > --system call are also applicable here.
> > --.SH AUTHORS
> > --Andreas Gruenbacher,
> > --.RI < a.gruenbacher@bestbits.at >
> > --and the SGI XFS development team,
> > --.RI < linux-xfs@oss.sgi.com >.
> > --Please send any bug reports or comments to these addresses.
> > --.SH SEE ALSO
> > --.BR getfattr (1),
> > --.BR setfattr (1),
> > --.BR open (2),
> > --.BR stat (2),
> > --.BR getxattr (2),
> > --.BR setxattr (2),
> > --.BR removexattr (2),
> > --and
> > --.BR attr (5).
> > -diff --git a/man/man2/removexattr.2 b/man/man2/removexattr.2
> > -deleted file mode 100644
> > -index 2c7d934..0000000
> > ---- a/man/man2/removexattr.2
> > -+++ /dev/null
> > -@@ -1,111 +0,0 @@
> > --.\"
> > --.\" Extended attributes system calls manual pages
> > --.\"
> > --.\" (C) Andreas Gruenbacher, February 2001
> > --.\" (C) Silicon Graphics Inc, September 2001
> > --.\"
> > --.\" This is free documentation; you can redistribute it and/or
> > --.\" modify it under the terms of the GNU General Public License as
> > --.\" published by the Free Software Foundation; either version 2 of
> > --.\" the License, or (at your option) any later version.
> > --.\"
> > --.\" The GNU General Public License's references to "object code"
> > --.\" and "executables" are to be interpreted as the output of any
> > --.\" document formatting or typesetting system, including
> > --.\" intermediate and printed output.
> > --.\"
> > --.\" This manual is distributed in the hope that it will be useful,
> > --.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --.\" GNU General Public License for more details.
> > --.\"
> > --.\" You should have received a copy of the GNU General Public
> > --.\" License along with this manual.  If not, see
> > --.\" <http://www.gnu.org/licenses/>.
> > --.\"
> > --.TH REMOVEXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
> > --.SH NAME
> > --removexattr, lremovexattr, fremovexattr \- remove an extended attribute
> > --.SH SYNOPSIS
> > --.fam C
> > --.nf
> > --.B #include <sys/types.h>
> > --.B #include <attr/xattr.h>
> > --.sp
> > --.BI "int removexattr (const char\ *" path ", const char\ *" name );
> > --.BI "int lremovexattr (const char\ *" path ", const char\ *" name );
> > --.BI "int fremovexattr (int " filedes ", const char\ *" name );
> > --.fi
> > --.fam T
> > --.SH DESCRIPTION
> > --Extended attributes are
> > --.IR name :\c
> > --value pairs associated with inodes (files, directories, symlinks, etc).
> > --They are extensions to the normal attributes which are associated
> > --with all inodes in the system (i.e. the
> > --.BR stat (2)
> > --data).
> > --A complete overview of extended attributes concepts can be found in
> > --.BR attr (5).
> > --.PP
> > --.B removexattr
> > --removes the extended attribute identified by
> > --.I name
> > --and associated with the given
> > --.I path
> > --in the filesystem.
> > --.PP
> > --.B lremovexattr
> > --is identical to
> > --.BR removexattr ,
> > --except in the case of a symbolic link, where the extended attribute is
> > --removed from the link itself, not the file that it refers to.
> > --.PP
> > --.B fremovexattr
> > --is identical to
> > --.BR removexattr ,
> > --only the extended attribute is removed from the open file pointed to by
> > --.I filedes
> > --(as returned by
> > --.BR open (2))
> > --in place of
> > --.IR path .
> > --.PP
> > --An extended attribute name is a simple NULL-terminated string.
> > --The
> > --.I name
> > --includes a namespace prefix \- there may be several, disjoint
> > --namespaces associated with an individual inode.
> > --.SH RETURN VALUE
> > --On success, zero is returned.
> > --On failure, \-1 is returned and
> > --.I errno
> > --is set appropriately.
> > --.PP
> > --If the named attribute does not exist,
> > --.I errno
> > --is set to ENOATTR.
> > --.PP
> > --If extended attributes are not supported by the filesystem, or are
> disabled,
> > --.I errno
> > --is set to ENOTSUP.
> > --.PP
> > --The errors documented for the
> > --.BR stat (2)
> > --system call are also applicable here.
> > --.SH AUTHORS
> > --Andreas Gruenbacher,
> > --.RI < a.gruenbacher@bestbits.at >
> > --and the SGI XFS development team,
> > --.RI < linux-xfs@oss.sgi.com >.
> > --Please send any bug reports or comments to these addresses.
> > --.SH SEE ALSO
> > --.BR getfattr (1),
> > --.BR setfattr (1),
> > --.BR open (2),
> > --.BR stat (2),
> > --.BR setxattr (2),
> > --.BR getxattr (2),
> > --.BR listxattr (2),
> > --and
> > --.BR attr (5).
> > -diff --git a/man/man2/setxattr.2 b/man/man2/setxattr.2
> > -deleted file mode 100644
> > -index b20dc9f..0000000
> > ---- a/man/man2/setxattr.2
> > -+++ /dev/null
> > -@@ -1,143 +0,0 @@
> > --.\"
> > --.\" Extended attributes system calls manual pages
> > --.\"
> > --.\" (C) Andreas Gruenbacher, February 2001
> > --.\" (C) Silicon Graphics Inc, September 2001
> > --.\"
> > --.\" This is free documentation; you can redistribute it and/or
> > --.\" modify it under the terms of the GNU General Public License as
> > --.\" published by the Free Software Foundation; either version 2 of
> > --.\" the License, or (at your option) any later version.
> > --.\"
> > --.\" The GNU General Public License's references to "object code"
> > --.\" and "executables" are to be interpreted as the output of any
> > --.\" document formatting or typesetting system, including
> > --.\" intermediate and printed output.
> > --.\"
> > --.\" This manual is distributed in the hope that it will be useful,
> > --.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> > --.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > --.\" GNU General Public License for more details.
> > --.\"
> > --.\" You should have received a copy of the GNU General Public
> > --.\" License along with this manual.  If not, see
> > --.\" <http://www.gnu.org/licenses/>.
> > --.\"
> > --.TH SETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
> > --.SH NAME
> > --setxattr, lsetxattr, fsetxattr \- set an extended attribute value
> > --.SH SYNOPSIS
> > --.fam C
> > --.nf
> > --.B #include <sys/types.h>
> > --.B #include <attr/xattr.h>
> > --.sp
> > --.BI "int setxattr (const char\ *" path ", const char\ *" name ",
> > --.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
> > --.BI "int lsetxattr (const char\ *" path ", const char\ *" name ",
> > --.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
> > --.BI "int fsetxattr (int " filedes ", const char\ *" name ",
> > --.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
> > --.fi
> > --.fam T
> > --.SH DESCRIPTION
> > --Extended attributes are
> > --.IR name :\c
> > --.I value
> > --pairs associated with inodes (files, directories, symlinks, etc).
> > --They are extensions to the normal attributes which are associated
> > --with all inodes in the system (i.e. the
> > --.BR stat (2)
> > --data).
> > --A complete overview of extended attributes concepts can be found in
> > --.BR attr (5).
> > --.PP
> > --.B setxattr
> > --sets the
> > --.I value
> > --of the extended attribute identified by
> > --.I name
> > --and associated with the given
> > --.I path
> > --in the filesystem.
> > --The
> > --.I size
> > --of the
> > --.I value
> > --must be specified.
> > --.PP
> > --.B lsetxattr
> > --is identical to
> > --.BR setxattr ,
> > --except in the case of a symbolic link, where the extended attribute is
> > --set on the link itself, not the file that it refers to.
> > --.PP
> > --.B fsetxattr
> > --is identical to
> > --.BR setxattr ,
> > --only the extended attribute is set on the open file pointed to by
> > --.I filedes
> > --(as returned by
> > --.BR open (2))
> > --in place of
> > --.IR path .
> > --.PP
> > --An extended attribute name is a simple NULL-terminated string.
> > --The
> > --.I name
> > --includes a namespace prefix \- there may be several, disjoint
> > --namespaces associated with an individual inode.
> > --The
> > --.I value
> > --of an extended attribute is a chunk of arbitrary textual or
> > --binary data of specified length.
> > --.PP
> > --The
> > --.I flags
> > --parameter can be used to refine the semantics of the operation.
> > --XATTR_CREATE specifies a pure create, which fails if the named
> > --attribute exists already.
> > --XATTR_REPLACE specifies a pure replace operation, which fails if the
> > --named attribute does not already exist.
> > --By default (no flags), the extended attribute will be created if
> > --need be, or will simply replace the value if the attribute exists.
> > --.SH RETURN VALUE
> > --On success, zero is returned.
> > --On failure, \-1 is returned and
> > --.I errno
> > --is set appropriately.
> > --.PP
> > --If XATTR_CREATE is specified, and the attribute exists already,
> > --.I errno
> > --is set to EEXIST.
> > --If XATTR_REPLACE is specified, and the attribute does not exist,
> > --.I errno
> > --is set to ENOATTR.
> > --.PP
> > --If there is insufficient space remaining to store the extended
> attribute,
> > --.I errno
> > --is set to either ENOSPC, or EDQUOT if quota enforcement was the cause.
> > --.PP
> > --If extended attributes are not supported by the filesystem, or are
> disabled,
> > --.I errno
> > --is set to ENOTSUP.
> > --.PP
> > --The errors documented for the
> > --.BR stat (2)
> > --system call are also applicable here.
> > --.SH AUTHORS
> > --Andreas Gruenbacher,
> > --.RI < a.gruenbacher@bestbits.at >
> > --and the SGI XFS development team,
> > --.RI < linux-xfs@oss.sgi.com >.
> > --Please send any bug reports or comments to these addresses.
> > --.SH SEE ALSO
> > --.BR getfattr (1),
> > --.BR setfattr (1),
> > --.BR open (2),
> > --.BR stat (2),
> > --.BR getxattr (2),
> > --.BR listxattr (2),
> > --.BR removexattr (2),
> > --and
> > --.BR attr (5).
> > ---
> > -2.7.4
> > -
> > diff --git a/meta/recipes-support/attr/files/relative-libdir.patch
> b/meta/recipes-support/attr/files/relative-libdir.patch
> > deleted file mode 100644
> > index b72bf184d6f..00000000000
> > --- a/meta/recipes-support/attr/files/relative-libdir.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -Upstream-Status: Pending
> > -
> > -use relative path in symbolic links, or it fails in staging
> > -sed expression from udev
> > -
> > -7/29/2010 - created by Qing He <qing.he@intel.com>
> > -
> > -diff -u include.orig/buildmacros include/buildmacros
> > ---- include.orig/buildmacros   2010-07-29 17:39:48.000000000 +0800
> > -+++ include/buildmacros        2010-07-29 18:20:34.000000000 +0800
> > -@@ -88,9 +88,11 @@
> > -       ../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
> > -       ../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
> > -       if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
> > --      ../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a
> $(PKG_LIB_DIR)/$(LIBNAME).a; \
> > --      ../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la
> $(PKG_LIB_DIR)/$(LIBNAME).la; \
> > --      ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).so
> $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
> > -+      rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed
> 's,\(^/\|\)[^/][^/]*,..,g'); \
> > -+      ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a
> $(PKG_LIB_DIR)/$(LIBNAME).a; \
> > -+      ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la
> $(PKG_LIB_DIR)/$(LIBNAME).la; \
> > -+      rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed
> 's,\(^/\|\)[^/][^/]*,..,g'); \
> > -+      ../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so
> $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
> > -       fi
> > - else
> > - INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
> > diff --git a/meta/recipes-support/attr/files/run-ptest
> b/meta/recipes-support/attr/files/run-ptest
> > deleted file mode 100644
> > index a6c6867f2d9..00000000000
> > --- a/meta/recipes-support/attr/files/run-ptest
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -#!/bin/sh
> > -
> > -make -C test -k tests root-tests |sed \
> > - -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
> > - -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000056b6d80599b01ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How come I do not see these issues in local testing? =
:-/</div><div><br></div><div>I&#39;ll investigate on Monday. <br></div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 14 Dec 2019 at 21:25, Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">breaks pseudo-native<=
br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/297280/" rel=3D"no=
referrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/2=
97280/</a><br>
<br>
On Thu, Dec 12, 2019 at 10:18 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The latest release use standard autotools, so drop all<br>
&gt; the build system related hacks and patches.<br>
&gt;<br>
&gt; Ptests have been rewritten, with 100% pass rate for both.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-test-patch-out-failing-bits.patch=C2=A0 =C2=A0 |=C2=A0 =
63 ++<br>
&gt;=C2=A0 ...dcode-the-build-path-into-a-helper-l.patch |=C2=A0 24 +<br>
&gt;=C2=A0 ...file-libacl-should-depend-on-include.patch |=C2=A0 51 --<br>
&gt;=C2=A0 ...-order-of-expected-output-of-getfacl.patch | 198 ------<br>
&gt;=C2=A0 meta/recipes-support/attr/acl/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 |=C2=A0 49=
 --<br>
&gt;=C2=A0 meta/recipes-support/attr/acl/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 60 +-<br>
&gt;=C2=A0 .../acl/test-fix-directory-permissions.patch=C2=A0 |=C2=A0 37 -<=
br>
&gt;=C2=A0 .../test-fix-insufficient-quoting-of.patch=C2=A0 =C2=A0 | 100 --=
-<br>
&gt;=C2=A0 ...-SELinux-machines-for-root-testcases.patch |=C2=A0 84 ---<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://acl_2.2.52.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.52.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 52 --<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://acl_2.2.53.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.53.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 60 ++<br>
&gt;=C2=A0 meta/recipes-support/attr/attr.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 41 +-<br>
&gt;=C2=A0 .../0001-Use-stdint-types-consistently.patch=C2=A0 |=C2=A0 69 --=
<br>
&gt;=C2=A0 .../attr/attr/attr-Missing-configure.ac.patch |=C2=A0 63 --<br>
&gt;=C2=A0 .../attr/attr/dont-use-decl-macros.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 56 --<br>
&gt;=C2=A0 meta/recipes-support/attr/attr/run-ptest=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://attr_2.4.47.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.47.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 15 -<br>
&gt;=C2=A0 meta/recipes-support/attr/<a href=3D"http://attr_2.4.48.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.48.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 meta/recipes-support/attr/ea-acl.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 52 --<br>
&gt;=C2=A0 ...option-to-enable-disable-static-libr.patch |=C2=A0 70 --<br>
&gt;=C2=A0 ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------<br>
&gt;=C2=A0 .../Remove-the-section-2-man-pages.patch=C2=A0 =C2=A0 =C2=A0 | 6=
66 ------------------<br>
&gt;=C2=A0 .../attr/files/relative-libdir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 25 -<br>
&gt;=C2=A0 meta/recipes-support/attr/files/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 24 files changed, 182 insertions(+), 1907 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/attr/acl/0001-test-patch=
-out-failing-bits.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/attr/acl/0001-tests-do-n=
ot-hardcode-the-build-path-into-a-helper-l.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/Makefile-libacl=
-should-depend-on-include.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/acl-fix-the-ord=
er-of-expected-output-of-getfacl.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/<a href=3D"http=
://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/test-fix-direct=
ory-permissions.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/test-fix-insuff=
icient-quoting-of.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/acl/test-fixups-on-=
SELinux-machines-for-root-testcases.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/<a href=3D"http://a=
cl_2.2.52.bb" rel=3D"noreferrer" target=3D"_blank">acl_2.2.52.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/attr/<a href=3D"http://a=
cl_2.2.53.bb" rel=3D"noreferrer" target=3D"_blank">acl_2.2.53.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/attr/0001-Use-stdin=
t-types-consistently.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/attr/attr-Missing-c=
onfigure.ac.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/attr/dont-use-decl-=
macros.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/attr/attr/run-ptest<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/<a href=3D"http://a=
ttr_2.4.47.bb" rel=3D"noreferrer" target=3D"_blank">attr_2.4.47.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/attr/<a href=3D"http://a=
ttr_2.4.48.bb" rel=3D"noreferrer" target=3D"_blank">attr_2.4.48.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/ea-acl.inc<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/files/0001-Added-co=
nfigure-option-to-enable-disable-static-libr.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/files/Remove-the-at=
tr.5-man-page-moved-to-man-pages.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/files/Remove-the-se=
ction-2-man-pages.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/files/relative-libd=
ir.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/attr/files/run-ptest<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/attr/acl/0001-test-patch-out-failing=
-bits.patch b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bit=
s.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..ba2ffee5d27<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/attr/acl/0001-test-patch-out-failing-bits.p=
atch<br>
&gt; @@ -0,0 +1,63 @@<br>
&gt; +From 9e08219e0e99ee2589cf35fa8d52cef3515accce Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 12 Dec 2019 15:47:49 +0100<br>
&gt; +Subject: [PATCH] test: patch out failing bits<br>
&gt; +<br>
&gt; +I have confirmed on the host distro (Ubuntu 18.04) that they<br>
&gt; +fail as well; upstream probably haven&#39;t noticed because the<br>
&gt; +test is only executed under sudo.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [disabling tests instead of fixing the=
m properly]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + test/root/permissions.test | 13 -------------<br>
&gt; + 1 file changed, 13 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/test/root/permissions.test b/test/root/permissions.test<=
br>
&gt; +index 8f8f825..21e8a95 100644<br>
&gt; +--- a/test/root/permissions.test<br>
&gt; ++++ b/test/root/permissions.test<br>
&gt; +@@ -50,10 +50,6 @@ User daemon is a member in the owning group, which=
 has only read access.<br>
&gt; + Verify this.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su daemon<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat f<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; root<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; bin<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ echo daemon &gt;&gt; f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;~ .*f: Permission denied$<br>
&gt; +<br>
&gt; +@@ -146,8 +142,6 @@ the owning group, he should still have no write a=
ccess.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -x g:daemon f<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su daemon<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $ echo daemon4 &gt;&gt; f<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt;~ .*f: Permission denied$<br>
&gt; +<br>
&gt; +<br>
&gt; + Change the owning group. The other permissions should now grant user=
<br>
&gt; +@@ -158,12 +152,6 @@ daemon write access.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su daemon<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ echo daemon5 &gt;&gt; f<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat f<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; root<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; bin<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; daemon<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; daemon2<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &gt; daemon5<br>
&gt; +<br>
&gt; +<br>
&gt; + Verify that permissions in separate matching ACL entries do not<br>
&gt; +@@ -173,7 +161,6 @@ accumulate.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -m g:bin:r,g:daemon:w f<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su daemon<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $ : &lt; f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ : &gt; f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ : &lt;&gt; f<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;~ .*f: Permission denied$<br>
&gt; +--<br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-=
the-build-path-into-a-helper-l.patch b/meta/recipes-support/attr/acl/0001-t=
ests-do-not-hardcode-the-build-path-into-a-helper-l.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..57ef0bb728c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/attr/acl/0001-tests-do-not-hardcode-the-bui=
ld-path-into-a-helper-l.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 39d332a8801de5d9ef09dacb3dba85c208b7b2ad Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 12 Dec 2019 13:45:52 +0100<br>
&gt; +Subject: [PATCH] tests: do not hardcode the build path into a helper =
library<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + test/Makemodule.am | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/test/Makemodule.am b/test/Makemodule.am<br>
&gt; +index 17d4927..015de7f 100644<br>
&gt; +--- a/test/Makemodule.am<br>
&gt; ++++ b/test/Makemodule.am<br>
&gt; +@@ -30,7 +30,7 @@ EXTRA_DIST +=3D \<br>
&gt; + check_LTLIBRARIES =3D <a href=3D"http://libtestlookup.la" rel=3D"nor=
eferrer" target=3D"_blank">libtestlookup.la</a><br>
&gt; +<br>
&gt; + libtestlookup_la_SOURCES =3D test/test_passwd.c test/test_group.c<br=
>
&gt; +-libtestlookup_la_CFLAGS =3D -DBASEDIR=3D\&quot;$(abs_srcdir)\&quot;<=
br>
&gt; ++libtestlookup_la_CFLAGS =3D -DBASEDIR=3D\&quot;/tmp/acl-ptest\&quot;=
<br>
&gt; + libtestlookup_la_LDFLAGS =3D -rpath $(abs_builddir)<br>
&gt; +<br>
&gt; + AM_TESTS_ENVIRONMENT =3D PATH=3D&quot;$(abs_top_builddir):$$PATH&quo=
t;;<br>
&gt; diff --git a/meta/recipes-support/attr/acl/Makefile-libacl-should-depe=
nd-on-include.patch b/meta/recipes-support/attr/acl/Makefile-libacl-should-=
depend-on-include.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4c7cba3b88d..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-i=
nclude.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,51 +0,0 @@<br>
&gt; -From d82457ce5ca7455e336da5e244d95f90e52aaef8 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" ta=
rget=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; -Date: Tue, 18 Apr 2017 01:17:26 -0700<br>
&gt; -Subject: [PATCH] Makefile: libacl should depend on include<br>
&gt; -<br>
&gt; -Fixed race issue:<br>
&gt; - In file included from acl_copy_entry.c:22:0:<br>
&gt; - libacl.h:19:21: fatal error: sys/acl.h: No such file or directory<br=
>
&gt; -=C2=A0 #include &lt;sys/acl.h&gt;<br>
&gt; -<br>
&gt; -[snip]<br>
&gt; -<br>
&gt; - compilation terminated.<br>
&gt; - acl_get_file.c:27:24: fatal error: acl/libacl.h: No such file or dir=
ectory<br>
&gt; -=C2=A0 #include &lt;acl/libacl.h&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; -<br>
&gt; -The acl.h is in &quot;include&quot; directory, and include/Makefile c=
reates<br>
&gt; -symlink &quot;sys&quot; and &quot;acl&quot; poinst to current dirctor=
y:<br>
&gt; -$ ls include/ -l<br>
&gt; -acl -&gt; .<br>
&gt; -sys -&gt; .<br>
&gt; -<br>
&gt; -So if &quot;libacl&quot; target runs before &quot;include&quot;, the =
error would happen<br>
&gt; -since no &quot;acl&quot; or &quot;sys&quot; directory.<br>
&gt; -<br>
&gt; -Let libacl depend on include can fix the problem.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - Makefile | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/Makefile b/Makefile<br>
&gt; -index dce32d3..8a79379 100644<br>
&gt; ---- a/Makefile<br>
&gt; -+++ b/Makefile<br>
&gt; -@@ -48,7 +48,7 @@ else<br>
&gt; - endif<br>
&gt; -<br>
&gt; - # tool/lib dependencies<br>
&gt; --libacl: libmisc<br>
&gt; -+libacl: include libmisc<br>
&gt; - getfacl setfacl chacl: libacl<br>
&gt; -<br>
&gt; - ifeq ($(HAVE_BUILDDEFS), yes)<br>
&gt; ---<br>
&gt; -2.10.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expect=
ed-output-of-getfacl.patch b/meta/recipes-support/attr/acl/acl-fix-the-orde=
r-of-expected-output-of-getfacl.patch<br>
&gt; deleted file mode 100644<br>
&gt; index cf765fdbb89..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-outp=
ut-of-getfacl.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,198 +0,0 @@<br>
&gt; -acl: fix the order of expected output of getfacl<br>
&gt; -<br>
&gt; -The result of getfacl is sorted by user id.<br>
&gt; -In Centos or RHEL, bin user id is 1 and daemon user id is 2.<br>
&gt; -But in our image, bin user id is 2 and daemon user id is 1.<br>
&gt; -The patch fixes this issue to make ptest pass.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [embedded specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com"=
 target=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - test/misc.test |=C2=A0 =C2=A038 +++++++++++++++++++-----------------=
--<br>
&gt; - 1 file changed, 19 insertions(+), 19 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/test/misc.test b/test/misc.test<br>
&gt; -index 6e98053..53ae5b0 100644<br>
&gt; ---- a/test/misc.test<br>
&gt; -+++ b/test/misc.test<br>
&gt; -@@ -79,8 +79,8 @@ Multiple users<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header f<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rw-<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r--<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::r--<br>
&gt; -@@ -94,8 +94,8 @@ Multiple groups<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header f<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rw-<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r--<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:r--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:users:rw-<br>
&gt; -@@ -111,8 +111,8 @@ Remove one group<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header f<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rw-<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r--<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rw-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:r--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::rw-<br>
&gt; -@@ -146,8 +146,8 @@ Default ACL<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:rw-<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -@@ -236,16 +236,16 @@ Add some users and groups<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d/d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx=C2=A0 #effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx=C2=A0 #effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:rwx=C2=A0 =C2=A0 =C2=A0 =
#effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:users:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::---<br>
&gt; -@@ -262,16 +262,16 @@ Symlink in directory with default ACL?<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d/l<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx=C2=A0 #effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx=C2=A0 #effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:rwx=C2=A0 =C2=A0 =C2=A0 =
#effective:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:users:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::---<br>
&gt; -@@ -287,16 +287,16 @@ Does mask manipulation work?<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d/d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:users:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx=C2=A0 #effective:r-x<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::---<br>
&gt; -@@ -308,16 +308,16 @@ Does mask manipulation work?<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d/d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:daemon:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group:users:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::---<br>
&gt; -@@ -333,8 +333,8 @@ Remove the default ACL<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:rw-<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -@@ -373,14 +373,14 @@ Now, chmod should change the group_obj entry<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:rwx<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:rwx<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::r-x<br>
&gt; -@@ -392,14 +392,14 @@ Now, chmod should change the group_obj entry<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:rwx=C2=A0 =C2=A0 =C2=A0 =
=C2=A0#effective:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::rwx=C2=A0 =C2=A0 #effective:r-=
x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:rwx<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::r-x<br>
&gt; -@@ -411,14 +411,14 @@ Now, chmod should change the group_obj entry<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; user:daemon:rwx=C2=A0 =C2=A0 =C2=A0 =
=C2=A0#effective:r-x<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; group::rwx=C2=A0 =C2=A0 #effective:r-=
x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mask::r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other::---<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user::rwx<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:user:daemon:rwx<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &gt; default:user:bin:r-x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:group::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:mask::rwx<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; default:other::r-x<br>
&gt; ---<br>
&gt; -1.7.9.5<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/acl/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> b/meta/recipes-s=
upport/attr/acl/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; deleted file mode 100644<br>
&gt; index 7af2e8d886e..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,49 +0,0 @@<br>
&gt; -# Copyright (C) 2009=C2=A0 Andreas Gruenbacher &lt;<a href=3D"mailto:=
agruen@suse.de" target=3D"_blank">agruen@suse.de</a>&gt;<br>
&gt; -#<br>
&gt; -# This program is free software: you can redistribute it and/or modif=
y it<br>
&gt; -# under the terms of the GNU General Public License as published by<b=
r>
&gt; -# the Free Software Foundation, either version 2 of the License, or<b=
r>
&gt; -# (at your option) any later version.<br>
&gt; -#<br>
&gt; -# This program is distributed in the hope that it will be useful,<br>
&gt; -# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<=
br>
&gt; -# GNU General Public License for more details.<br>
&gt; -#<br>
&gt; -# You should have received a copy of the GNU General Public License<b=
r>
&gt; -# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://ww=
w.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.or=
g/licenses/</a>&gt;.<br>
&gt; -#<br>
&gt; -AC_INIT(include/acl.h)<br>
&gt; -AC_CONFIG_AUX_DIR([.])<br>
&gt; -AC_CONFIG_MACRO_DIR([m4])<br>
&gt; -AC_CONFIG_HEADER(include/config.h)<br>
&gt; -AC_PREFIX_DEFAULT(/usr)<br>
&gt; -<br>
&gt; -AC_PROG_LIBTOOL<br>
&gt; -<br>
&gt; -AC_ARG_ENABLE(shared,<br>
&gt; -[ --enable-shared=3D[yes/no] Enable use of shared libraries [default=
=3Dyes]],,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_shared=3Dyes)<br>
&gt; -AC_SUBST(enable_shared)<br>
&gt; -<br>
&gt; -AC_ARG_ENABLE(gettext,<br>
&gt; -[ --enable-gettext=3D[yes/no] Enable alternate language support [defa=
ult=3Dyes]],,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_gettext=3Dyes)<br>
&gt; -AC_SUBST(enable_gettext)<br>
&gt; -<br>
&gt; -AC_ARG_ENABLE(lib64,<br>
&gt; -[ --enable-lib64=3D[yes/no] Enable lib64 support [default=3Dno]],,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_lib64=3Dno)<br>
&gt; -AC_SUBST(enable_lib64)<br>
&gt; -<br>
&gt; -AC_PACKAGE_GLOBALS(acl)<br>
&gt; -AC_PACKAGE_UTILITIES(acl)<br>
&gt; -AC_PACKAGE_NEED_ATTR_XATTR_H<br>
&gt; -AC_PACKAGE_NEED_ATTR_ERROR_H<br>
&gt; -AC_MULTILIB($enable_lib64)<br>
&gt; -AC_PACKAGE_NEED_GETXATTR_LIBATTR<br>
&gt; -AC_MANUAL_FORMAT<br>
&gt; -<br>
&gt; -AC_FUNC_GCC_VISIBILITY<br>
&gt; -<br>
&gt; -AC_OUTPUT(include/builddefs)<br>
&gt; diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-su=
pport/attr/acl/run-ptest<br>
&gt; index a56946d8e6f..43128233654 100644<br>
&gt; --- a/meta/recipes-support/attr/acl/run-ptest<br>
&gt; +++ b/meta/recipes-support/attr/acl/run-ptest<br>
&gt; @@ -4,61 +4,7 @@<br>
&gt;<br>
&gt;=C2=A0 #umask 077<br>
&gt;<br>
&gt; -EXT3_IMAGE=3Dext3.img<br>
&gt; -EXT3_MOUNT_POINT=3D/mnt/ext3<br>
&gt; +mkdir -p /tmp/acl-ptest/test<br>
&gt; +cp test/test.* /tmp/acl-ptest/test<br>
&gt;<br>
&gt; -trap &#39;rm -f ${EXT3_IMAGE}&#39; EXIT<br>
&gt; -<br>
&gt; -dd if=3D/dev/zero of=3D${EXT3_IMAGE} bs=3D1M count=3D1<br>
&gt; -if [ &quot;$?&quot; -eq 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: dump ext3.img&quot;<br>
&gt; -else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: dump ext3.img&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -fi<br>
&gt; -<br>
&gt; -mkfs.ext3 -F ${EXT3_IMAGE}<br>
&gt; -if [ &quot;$?&quot; -eq 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: mkfs.ext3 -F ext3.img&quo=
t;<br>
&gt; -else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: mkfs.ext3 -F ext3.img&quo=
t;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -fi<br>
&gt; -<br>
&gt; -if [ -d $EXT3_MOUNT_POINT ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;mount point exist&quot;<br>
&gt; -else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $EXT3_MOUNT_POINT<br>
&gt; -fi<br>
&gt; -<br>
&gt; -<br>
&gt; -mount -o loop,rw,acl=C2=A0 ${EXT3_IMAGE} $EXT3_MOUNT_POINT<br>
&gt; -if [ &quot;$?&quot; -eq 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: mount ext3.img&quot;<br>
&gt; -else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: mount ext3.img&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -fi<br>
&gt; -<br>
&gt; -cp -rf ./test/ $EXT3_MOUNT_POINT<br>
&gt; -<br>
&gt; -cd $EXT3_MOUNT_POINT/test/<br>
&gt; -<br>
&gt; -if=C2=A0 =C2=A0 =C2=A0sed -e &#39;s!^bin:x:2:$!bin:x:2:daemon!&#39; &=
lt; /etc/group &gt; gtmp<br>
&gt; -then=C2=A0 =C2=A0if=C2=A0 =C2=A0 =C2=A0 cp /etc/group group.orig;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0then=C2=A0 =C2=A0 cp gtmp /etc/group<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make=C2=A0 -k =
tests root-tests | sed \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-e &#39;s|^\[.*\] \(.*\) -- ok$|PASS: \1|&#39; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0-e &#39;s|^\[.*\] \(.*\) -- failed|FAIL: \1|&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp group.orig =
/etc/group<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else=C2=A0 =C2=A0 echo &quot;FAIL: couldn&=
#39;t save original group file.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -else=C2=A0 =C2=A0echo &quot;FAIL: couldn&#39;t create modified group =
file.&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; -fi<br>
&gt; -<br>
&gt; -cd -<br>
&gt; -umount $EXT3_MOUNT_POINT<br>
&gt; -rm -rf $EXT3_MOUNT_POINT<br>
&gt; -rm $EXT3_IMAGE<br>
&gt; +make test-suite.log<br>
&gt; diff --git a/meta/recipes-support/attr/acl/test-fix-directory-permissi=
ons.patch b/meta/recipes-support/attr/acl/test-fix-directory-permissions.pa=
tch<br>
&gt; deleted file mode 100644<br>
&gt; index e64990ad5b9..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/test-fix-directory-permissions.pat=
ch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,37 +0,0 @@<br>
&gt; -From 311589fedf196168382d8f0db303ab328bcf9d83 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Peter Seebach &lt;<a href=3D"mailto:peter.seebach@windriver.com=
" target=3D"_blank">peter.seebach@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 11 May 2016 15:16:06 -0500<br>
&gt; -Subject: [PATCH] acl.inc, run-ptest: improve ptest functionality on l=
imited<br>
&gt; -<br>
&gt; -commit c45bae84817a70fef6c2b661a07a492a0d23ae85<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Fix permissions on temporary directory<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 The temporary directory&#39;s permissions have to allow=
 other users to<br>
&gt; -=C2=A0 =C2=A0 view the directory. A default umask of 022 is common, b=
ut not mandatory,<br>
&gt; -=C2=A0 =C2=A0 and secure systems may have more restrictive defaults.<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Signed-off-by: Peter Seebach &lt;<a href=3D"mailto:pete=
r.seebach@windriver.com" target=3D"_blank">peter.seebach@windriver.com</a>&=
gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [ <a href=3D"http://git.savannah.gnu.org/cg=
it/acl.git/commit/?id=3Dc6772a958800de064482634f77c20a0faafc5af6" rel=3D"no=
referrer" target=3D"_blank">http://git.savannah.gnu.org/cgit/acl.git/commit=
/?id=3Dc6772a958800de064482634f77c20a0faafc5af6</a> ]<br>
&gt; -<br>
&gt; -Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.co=
m" target=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - test/root/permissions.test | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/test/root/permissions.test b/test/root/permissions.test<=
br>
&gt; -index 42615f5..098b52a 100644<br>
&gt; ---- a/test/root/permissions.test<br>
&gt; -+++ b/test/root/permissions.test<br>
&gt; -@@ -16,6 +16,7 @@ Cry immediately if we are not running as root.<br>
&gt; - First, set up a temporary directory and create a regular file with<b=
r>
&gt; - defined permissions.<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ umask 022<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ mkdir d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cd d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ umask 027<br>
&gt; ---<br>
&gt; -2.8.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/acl/test-fix-insufficient-quoti=
ng-of.patch b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-o=
f.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f392465b58e..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.p=
atch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,100 +0,0 @@<br>
&gt; -From e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Kamil Dudka &lt;<a href=3D"mailto:kdudka@redhat.com" target=3D"=
_blank">kdudka@redhat.com</a>&gt;<br>
&gt; -Date: Mon, 20 May 2013 16:38:06 +0200<br>
&gt; -Subject: [PATCH] test: fix insufficient quoting of &#39;\&#39;<br>
&gt; -<br>
&gt; -This is a follow-up to 7f2c91b8369242a8dbc2b304a5b71b2a85f5b855, whic=
h<br>
&gt; -caused sbits-restore.test to fail in the following way in case SELinu=
x<br>
&gt; -was disabled:<br>
&gt; -<br>
&gt; -*** sbits-restore.test ***<br>
&gt; -[3] $ umask 022 -- ok<br>
&gt; -[4] $ mkdir d -- ok<br>
&gt; -[5] $ touch d/g -- ok<br>
&gt; -[6] $ touch d/u -- ok<br>
&gt; -[7] $ chmod u+s d/u -- ok<br>
&gt; -[8] $ chmod g+s d/g -- ok<br>
&gt; -[9] $ chmod +t d -- ok<br>
&gt; -[10] $ getfacl -R d &gt; d.acl -- ok<br>
&gt; -[11] $ rm -R d -- ok<br>
&gt; -[12] $ mkdir d -- ok<br>
&gt; -[13] $ touch d/g -- ok<br>
&gt; -[14] $ touch d/u -- ok<br>
&gt; -[15] $ setfacl --restore d.acl -- ok<br>
&gt; -[16] $ ls -dl d | awk &#39;{print $1}&#39; | sed &#39;s/.$//g&#39; --=
 failed<br>
&gt; -drwxr-xr-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D drwxr-xr-t<br>
&gt; -[18] $ ls -dl d/u | awk &#39;{print $1}&#39; | sed &#39;s/.$//g&#39; =
-- failed<br>
&gt; --rwSr--r-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D -rwSr--r--<br>
&gt; -[20] $ ls -dl d/g | awk &#39;{print $1}&#39; | sed &#39;s/.$//g&#39; =
-- failed<br>
&gt; --rw-r-Sr-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D -rw-r-Sr--<br>
&gt; -[22] $ rm -Rf d -- ok<br>
&gt; -17 commands (14 passed, 3 failed)<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<a href=3D"http://git.savannah.gnu.org/cgit/acl.git/commit/?id=3De98c=
e8acf84d12ea67a3ac76bf63c6d87d9af86d" rel=3D"noreferrer" target=3D"_blank">=
http://git.savannah.gnu.org/cgit/acl.git/commit/?id=3De98ce8acf84d12ea67a3a=
c76bf63c6d87d9af86d</a><br>
&gt; -<br>
&gt; -Signed-off-by: Kamil Dudka &lt;<a href=3D"mailto:kdudka@redhat.com" t=
arget=3D"_blank">kdudka@redhat.com</a>&gt;<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; -Index: acl-2.2.52/test/cp.test<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- acl-2.2.52.orig/test/cp.test<br>
&gt; -+++ acl-2.2.52/test/cp.test<br>
&gt; -@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-rw-r--+<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cp f g<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -l g | awk -- &#39;{ print $1 }&#39; | sed=
 &#39;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -l g | awk -- &#39;{ print $1 }&#39; | sed=
 &#39;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r--r--<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ rm g<br>
&gt; -Index: acl-2.2.52/test/misc.test<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- acl-2.2.52.orig/test/misc.test<br>
&gt; -+++ acl-2.2.52/test/misc.test<br>
&gt; -@@ -254,7 +254,7 @@ Add some users and groups<br>
&gt; - Symlink in directory with default ACL?<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ ln -s d d/l<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/l | awk &#39;{print $1}&#39; | sed &=
#39;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/l | awk &#39;{print $1}&#39; | sed &=
#39;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lrwxrwxrwx<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ ls -dl -L d/l | awk &#39;{print $1}&#39;=
<br>
&gt; -@@ -343,7 +343,7 @@ Remove the default ACL<br>
&gt; - Reset to base entries<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -b d<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxr-x---<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -@@ -355,7 +355,7 @@ Reset to base entries<br>
&gt; - Now, chmod should change the group_obj entry<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ chmod 775 d<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxrwxr-x<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ getfacl --omit-header d<br>
&gt; -Index: acl-2.2.52/test/sbits-restore.test<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- acl-2.2.52.orig/test/sbits-restore.test<br>
&gt; -+++ acl-2.2.52/test/sbits-restore.test<br>
&gt; -@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ touch d/g<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ touch d/u<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl --restore d.acl<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d | awk &#39;{print $1}&#39; | sed &#3=
9;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxr-xr-t<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/u | awk &#39;{print $1}&#39; | sed &=
#39;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/u | awk &#39;{print $1}&#39; | sed &=
#39;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rwSr--r--<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/g | awk &#39;{print $1}&#39; | sed &=
#39;s/\.$//g&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl d/g | awk &#39;{print $1}&#39; | sed &=
#39;s/\\.$//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r-Sr--<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ rm -Rf d<br>
&gt; diff --git a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-mach=
ines-for-root-testcases.patch b/meta/recipes-support/attr/acl/test-fixups-o=
n-SELinux-machines-for-root-testcases.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 8cc11a63e12..00000000000<br>
&gt; --- a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-fo=
r-root-testcases.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,84 +0,0 @@<br>
&gt; -From d2f49ee6fe4850b8dda5b08676b36201d3c43710 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_b=
lank">zhe.he@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 2 Mar 2016 15:46:57 +0800<br>
&gt; -Subject: [PATCH] test: fixups on SELinux machines for root testcases<=
br>
&gt; -<br>
&gt; -ls adds a &#39;.&#39; at the end of the permission field list on SELi=
nux<br>
&gt; -machines, filter this out so root tests work on SELinux machines.<br>
&gt; -<br>
&gt; -Upstream-Status: Accepted<br>
&gt; -<a href=3D"http://git.savannah.gnu.org/cgit/acl.git/commit/?id=3D26a8=
7d36f80d5e98bccb5878834d9e69dadfe3e9" rel=3D"noreferrer" target=3D"_blank">=
http://git.savannah.gnu.org/cgit/acl.git/commit/?id=3D26a87d36f80d5e98bccb5=
878834d9e69dadfe3e9</a><br>
&gt; -<br>
&gt; -Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - test/root/permissions.test | 8 ++++----<br>
&gt; - test/root/restore.test=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - test/root/setfacl.test=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - 3 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/test/root/permissions.test b/test/root/permissions.test<=
br>
&gt; -index 9b9e3de..665339a 100644<br>
&gt; ---- a/test/root/permissions.test<br>
&gt; -+++ b/test/root/permissions.test<br>
&gt; -@@ -19,7 +19,7 @@ defined permissions.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cd d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ umask 027<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ touch f<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -l f | awk -- &#39;{ print $1, $3, $4 }&#3=
9;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -l f | awk -- &#39;{ print $1, $3, $4 }&#3=
9; | sed &#39;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r----- root root<br>
&gt; -<br>
&gt; -<br>
&gt; -@@ -39,7 +39,7 @@ Now, change the ownership of the file to bin:bin an=
d verify that this<br>
&gt; - gives user bin write access.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ chown bin:bin f<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -l f | awk -- &#39;{ print $1, $3, $4 }&#3=
9;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -l f | awk -- &#39;{ print $1, $3, $4 }&#3=
9; | sed &#39;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r----- bin bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ echo bin &gt;&gt; f<br>
&gt; -@@ -256,12 +256,12 @@ directories if the file has an ACL and only CAP=
_FOWNER would grant them.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ mkdir -m 600 x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ chown daemon:daemon x<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ echo j &gt; x/j<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -l x/j | awk -- &#39;{ print $1, $3, $4 }&=
#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -l x/j | awk -- &#39;{ print $1, $3, $4 }&=
#39; | sed &#39;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r----- root root<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -m u:daemon:r x<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -l x/j | awk -- &#39;{ print $1, $3, $4 }&=
#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -l x/j | awk -- &#39;{ print $1, $3, $4 }&=
#39; | sed &#39;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r----- root root<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(With the bug this gives: `ls: x/j: Permis=
sion denied&#39;.)<br>
&gt; -<br>
&gt; -diff --git a/test/root/restore.test b/test/root/restore.test<br>
&gt; -index 63a9d01..c85097c 100644<br>
&gt; ---- a/test/root/restore.test<br>
&gt; -+++ b/test/root/restore.test<br>
&gt; -@@ -21,7 +21,7 @@ Cry immediately if we are not running as root.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ chown bin passwd<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ chmod u+s passwd<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl --restore passwd.acl<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl passwd | awk &#39;{print $1 &quot; &qu=
ot; $3 &quot; &quot; $4}&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl passwd | awk &#39;{print $1 &quot; &qu=
ot; $3 &quot; &quot; $4}&#39; | sed &#39;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rwsr-xr-x root root<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ rm passwd passwd.acl<br>
&gt; -diff --git a/test/root/setfacl.test b/test/root/setfacl.test<br>
&gt; -index a46a9f4..7efbad7 100644<br>
&gt; ---- a/test/root/setfacl.test<br>
&gt; -+++ b/test/root/setfacl.test<br>
&gt; -@@ -12,7 +12,7 @@ Cry immediately if we are not running as root.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sg bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ umask 027<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ touch g<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $ ls -dl g | awk &#39;{print $1}&#39;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $ ls -dl g | awk &#39;{print $1}&#39; | sed &#3=
9;s/\\.//g&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r-----<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -m m:- g<br>
&gt; ---<br>
&gt; -1.9.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/<a href=3D"http://acl_2.2.52.bb=
" rel=3D"noreferrer" target=3D"_blank">acl_2.2.52.bb</a> b/meta/recipes-sup=
port/attr/<a href=3D"http://acl_2.2.52.bb" rel=3D"noreferrer" target=3D"_bl=
ank">acl_2.2.52.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 6bc77d868d5..00000000000<br>
&gt; --- a/meta/recipes-support/attr/<a href=3D"http://acl_2.2.52.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.52.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,52 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Utilities for managing POSIX Access Control Lists&q=
uot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://savannah.nongnu.org/projects/acl=
/" rel=3D"noreferrer" target=3D"_blank">http://savannah.nongnu.org/projects=
/acl/</a>&quot;<br>
&gt; -SECTION =3D &quot;libs&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;LGPLv2.1+ &amp; GPLv2+&quot;<br>
&gt; -LICENSE_${PN} =3D &quot;GPLv2+&quot;<br>
&gt; -LICENSE_lib${BPN} =3D &quot;LGPLv2.1+&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=3Dc781d70ed2b4d4899=
5b790403217a249 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://doc/COPYING.LGPL;md5=3D9e9a206917f8af112da634ce3ab41764&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;attr&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://con=
figure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>;subdir=3D$=
{BP} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://acl-fix-the-order-of-=
expected-output-of-getfacl.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://test-fix-insufficient=
-quoting-of.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://test-fixups-on-SELinu=
x-machines-for-root-testcases.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://test-fix-directory-pe=
rmissions.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile-libacl-shoul=
d-depend-on-include.patch \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;a61415312426e9c2212bd7dc7929abda&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;179074bb0580c06c4b4137be4c5a92a701583277=
967acdb5546043c7874e0d23&quot;<br>
&gt; -<br>
&gt; -require ea-acl.inc<br>
&gt; -<br>
&gt; -# avoid RPATH hardcode to staging dir<br>
&gt; -do_configure_append() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/config.status -e s,^\\\(hardco=
de_into_libs=3D\\\).*$,\\1\&#39;no\&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/config.status<br>
&gt; -}<br>
&gt; -<br>
&gt; -# libdir should point to .la<br>
&gt; -do_install_append() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${D}${libdir}/<a href=3D"http://lib=
acl.la" rel=3D"noreferrer" target=3D"_blank">libacl.la</a> -e \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s,^libdir=3D\&#39;${base_lib=
dir}\&#39;$,libdir=3D\&#39;${libdir}\&#39;,<br>
&gt; -}<br>
&gt; -<br>
&gt; -inherit ptest<br>
&gt; -<br>
&gt; -PTEST_BUILD_HOST_FILES =3D &quot;builddefs&quot;<br>
&gt; -PTEST_BUILD_HOST_PATTERN =3D &quot;^RPM&quot;<br>
&gt; -do_install_ptest() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -c --exclude=3Dnfs test/ | ( cd ${D}${=
PTEST_PATH} &amp;&amp; tar -xf - )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/include<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/include/builddefs ${S}=
/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/<br>
&gt; -}<br>
&gt; -<br>
&gt; -RDEPENDS_${PN}-ptest =3D &quot;acl bash coreutils perl perl-module-fi=
lehandle perl-module-getopt-std perl-module-posix shadow&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/<a href=3D"http://acl_2.2.53.bb=
" rel=3D"noreferrer" target=3D"_blank">acl_2.2.53.bb</a> b/meta/recipes-sup=
port/attr/<a href=3D"http://acl_2.2.53.bb" rel=3D"noreferrer" target=3D"_bl=
ank">acl_2.2.53.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000000..c95e0524eb4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/attr/<a href=3D"http://acl_2.2.53.bb" rel=
=3D"noreferrer" target=3D"_blank">acl_2.2.53.bb</a><br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +SUMMARY =3D &quot;Utilities for managing POSIX Access Control Lists&q=
uot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://savannah.nongnu.org/projects/acl=
/" rel=3D"noreferrer" target=3D"_blank">http://savannah.nongnu.org/projects=
/acl/</a>&quot;<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;LGPLv2.1+ &amp; GPLv2+&quot;<br>
&gt; +LICENSE_${PN} =3D &quot;GPLv2+&quot;<br>
&gt; +LICENSE_lib${BPN} =3D &quot;LGPLv2.1+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=3Dc781d70ed2b4d4899=
5b790403217a249 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://doc/COPYING.LGPL;md5=3D9e9a206917f8af112da634ce3ab41764&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;attr&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-do-not-har=
dcode-the-build-path-into-a-helper-l.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-patch-out-f=
ailing-bits.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;007aabf1dbb550bcddde52a244cd1070&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;06be9865c6f418d851ff4494e12406568353b891=
ffe1f596b34693c387af26c7&quot;<br>
&gt; +<br>
&gt; +inherit autotools gettext ptest<br>
&gt; +<br>
&gt; +PTEST_BUILD_HOST_FILES =3D &quot;builddefs&quot;<br>
&gt; +PTEST_BUILD_HOST_PATTERN =3D &quot;^RPM&quot;<br>
&gt; +<br>
&gt; +do_compile_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake <a href=3D"http://libtestlooku=
p.la" rel=3D"noreferrer" target=3D"_blank">libtestlookup.la</a><br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/test/ ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/.libs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${B}/.libs/libtestlookup* ${D}${PTE=
ST_PATH}/.libs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/Makefile ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^srcdir =3D.*|srcdir =3D \=
.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^abs_srcdir =3D.*|abs_srcd=
ir =3D \.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^abs_top_srcdir =3D.*|abs_=
top_srcdir =3D \.\.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^Makefile:.*|Makefile:|g&q=
uot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +}<br>
&gt; +<br>
&gt; +RDEPENDS_${PN}-ptest =3D &quot;acl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bash \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 coreutils \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-filehandle \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-getopt-std \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-posix \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 shadow \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 make \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 gawk \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 e2fsprogs-mke2fs \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-cwd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-basename \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-path \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-spec \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support=
/attr/attr.inc<br>
&gt; index 3503d66b9e1..5661301c15a 100644<br>
&gt; --- a/meta/recipes-support/attr/attr.inc<br>
&gt; +++ b/meta/recipes-support/attr/attr.inc<br>
&gt; @@ -8,22 +8,14 @@ LICENSE =3D &quot;LGPLv2.1+ &amp; GPLv2+&quot;<br>
&gt;=C2=A0 LICENSE_${PN} =3D &quot;GPLv2+&quot;<br>
&gt;=C2=A0 LICENSE_lib${BPN} =3D &quot;LGPLv2.1+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=3D2d0aa14b3fce=
4694e4f615e30186335f \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://attr/attr.c;endline=3D17;md5=3Dbe0403261f0847e5f43ed5b08d19593c \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://tools/attr.c;endline=3D17;md5=3Dbe0403261f0847e5f43ed5b08d19593c \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://libattr/libattr.c;endline=3D17;md5=3D7970f77049f8fa1199fff62a=
7ab724fb&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;${SAVANNAH_GNU_MIRROR}/attr/${BP}.src.tar.gz \<br>
&gt; +SRC_URI =3D &quot;${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -require ea-acl.inc<br>
&gt; -<br>
&gt; -# libdir should point to .la<br>
&gt; -do_install_append() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${D}${libdir}/<a href=3D"http://lib=
attr.la" rel=3D"noreferrer" target=3D"_blank">libattr.la</a> -e \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s,^libdir=3D\&#39;${base_lib=
dir}\&#39;$,libdir=3D\&#39;${libdir}\&#39;,<br>
&gt; -}<br>
&gt; -<br>
&gt; -inherit ptest update-alternatives<br>
&gt; +inherit ptest update-alternatives autotools gettext<br>
&gt;<br>
&gt;=C2=A0 ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
&gt;=C2=A0 ALTERNATIVE_${PN} =3D &quot;setfattr&quot;<br>
&gt; @@ -33,14 +25,27 @@ PTEST_BUILD_HOST_FILES =3D &quot;builddefs&quot;<b=
r>
&gt;=C2=A0 PTEST_BUILD_HOST_PATTERN =3D &quot;^RPM&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install_ptest() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -c --exclude=3Dext test/ | ( cd ${D}${=
PTEST_PATH} &amp;&amp; tar -xf - )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir ${D}${PTEST_PATH}/include<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in builddefs buildmacros buildrules;=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do cp ${S}/include/$i ${D}${PTEST_P=
ATH}/include/; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|; @echo|; echo|&#39; -i ${D}=
${PTEST_PATH}/test/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/Makefile ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^srcdir =3D.*|srcdir =3D \=
.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^abs_srcdir =3D.*|abs_srcd=
ir =3D \.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^abs_top_srcdir =3D.*|abs_=
top_srcdir =3D \.\.|g&quot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|^Makefile:.*|Makefile:|g&q=
uot; ${D}${PTEST_PATH}/Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/test/ ${D}${PTEST_PATH}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -RDEPENDS_${PN}-ptest =3D &quot;attr coreutils perl-module-filehandle =
perl-module-getopt-std perl-module-posix make perl&quot;<br>
&gt; +RDEPENDS_${PN}-ptest =3D &quot;attr \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 coreutils \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-filehandle \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-getopt-std \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-posix \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 make \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 gawk \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-cwd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-basename \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-path \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 perl-module-file-spec \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/attr/0001-Use-stdint-types-cons=
istently.patch b/meta/recipes-support/attr/attr/0001-Use-stdint-types-consi=
stently.patch<br>
&gt; deleted file mode 100644<br>
&gt; index dcd6507bcc5..00000000000<br>
&gt; --- a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistentl=
y.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,69 +0,0 @@<br>
&gt; -From 37a27b6fd09ecb37097b85e5db74e4f77b80fe0a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Felix Janda &lt;<a href=3D"mailto:felix.janda@posteo.de" target=
=3D"_blank">felix.janda@posteo.de</a>&gt;<br>
&gt; -Date: Tue, 12 Jan 2016 22:20:33 +0100<br>
&gt; -Subject: [PATCH] Use stdint types consistently<br>
&gt; -<br>
&gt; ----<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; - include/attributes.h | 6 ++++--<br>
&gt; - man/man3/attr_list.3 | 8 ++++----<br>
&gt; - 2 files changed, 8 insertions(+), 6 deletions(-)<br>
&gt; -<br>
&gt; -Index: attr-2.4.47/include/attributes.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- attr-2.4.47.orig/include/attributes.h<br>
&gt; -+++ attr-2.4.47/include/attributes.h<br>
&gt; -@@ -22,6 +22,7 @@<br>
&gt; - extern &quot;C&quot; {<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -+#include &lt;stdint.h&gt;<br>
&gt; - /*<br>
&gt; -=C2=A0 *=C2=A0 =C2=A0 An almost-IRIX-compatible extended attributes A=
PI<br>
&gt; -=C2=A0 *=C2=A0 =C2=A0 (the IRIX attribute &quot;list&quot; operation =
is missing, added ATTR_SECURE).<br>
&gt; -@@ -69,7 +70,7 @@ typedef struct attrlist {<br>
&gt; -=C2=A0 * al_offset[i] entry points to.<br>
&gt; -=C2=A0 */<br>
&gt; - typedef struct attrlist_ent { /* data from attr_list() */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 u_int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0a_valuelen;=
=C2=A0 =C2=A0 =C2=A0/* number bytes in value of attr */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 a_valuelen;=
=C2=A0 =C2=A0 =C2=A0/* number bytes in value of attr */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a_name[1];=C2=A0 =C2=A0 =C2=A0 /* attr name (NULL terminated) */<br>
&gt; - } attrlist_ent_t;<br>
&gt; -<br>
&gt; -@@ -90,7 +91,7 @@ typedef struct attrlist_ent {=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* data fr<br>
&gt; -=C2=A0 * operation on a cursor is to bzero() it.<br>
&gt; -=C2=A0 */<br>
&gt; - typedef struct attrlist_cursor {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 u_int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0opaque[4];=
=C2=A0 =C2=A0 =C2=A0 /* an opaque cookie */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 opaque[4];=
=C2=A0 =C2=A0 =C2=A0 /* an opaque cookie */<br>
&gt; - } attrlist_cursor_t;<br>
&gt; -<br>
&gt; - /*<br>
&gt; -Index: attr-2.4.47/man/man3/attr_list.3<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- attr-2.4.47.orig/man/man3/attr_list.3<br>
&gt; -+++ attr-2.4.47/man/man3/attr_list.3<br>
&gt; -@@ -72,9 +72,9 @@ The contents of an \f4attrlist_t\fP stru<br>
&gt; - .nf<br>
&gt; - .ft 4<br>
&gt; - .ta 9n 22n<br>
&gt; --__int32_t al_count; /\(** number of entries in attrlist \(**/<br>
&gt; --__int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/<br=
>
&gt; --__int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**=
/<br>
&gt; -+int32_t al_count; /\(** number of entries in attrlist \(**/<br>
&gt; -+int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/<br>
&gt; -+int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/<=
br>
&gt; - .ft 1<br>
&gt; - .fi<br>
&gt; - .RE<br>
&gt; -@@ -113,7 +113,7 @@ include the following members:<br>
&gt; - .nf<br>
&gt; - .ft 4<br>
&gt; - .ta 9n 22n<br>
&gt; --u_int32_t a_valuelen; /\(** number bytes in value of attr \(**/<br>
&gt; -+uint32_t a_valuelen; /\(** number bytes in value of attr \(**/<br>
&gt; - char a_name[]; /\(** attr name (NULL terminated) \(**/<br>
&gt; - .ft 1<br>
&gt; - .fi<br>
&gt; diff --git a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.=
patch b/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 20fcc3cee7b..00000000000<br>
&gt; --- a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,63 +0,0 @@<br>
&gt; -Subject: [PATCH] attr: Missing <a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport [Upstream released tarball missing this fil=
e]<br>
&gt; -Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan.rossi@xilinx=
.com" target=3D"_blank">nathan.rossi@xilinx.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> |=C2=A0 =C2=A048 ++++++++++++++++++++++++++++++++++++++++=
++++++++<br>
&gt; - 1 file changed, 48 insertions(+)<br>
&gt; - create mode 100644 <a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -new file mode 100644<br>
&gt; -index 0000000..b966d0e<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -0,0 +1,48 @@<br>
&gt; -+# Copyright (C) 2009=C2=A0 Andreas Gruenbacher &lt;<a href=3D"mailto=
:agruen@suse.de" target=3D"_blank">agruen@suse.de</a>&gt;<br>
&gt; -+#<br>
&gt; -+# This program is free software: you can redistribute it and/or modi=
fy it<br>
&gt; -+# under the terms of the GNU General Public License as published by<=
br>
&gt; -+# the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; -+# (at your option) any later version.<br>
&gt; -+#<br>
&gt; -+# This program is distributed in the hope that it will be useful,<br=
>
&gt; -+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; -+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; -+# GNU General Public License for more details.<br>
&gt; -+#<br>
&gt; -+# You should have received a copy of the GNU General Public License<=
br>
&gt; -+# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; -+#<br>
&gt; -+AC_INIT(include/attributes.h)<br>
&gt; -+AC_CONFIG_AUX_DIR([.])<br>
&gt; -+AC_CONFIG_MACRO_DIR([m4])<br>
&gt; -+AC_CONFIG_HEADER(include/config.h)<br>
&gt; -+AC_PREFIX_DEFAULT(/usr)<br>
&gt; -+<br>
&gt; -+AC_PROG_LIBTOOL<br>
&gt; -+<br>
&gt; -+AC_ARG_ENABLE(shared,<br>
&gt; -+[ --enable-shared=3D[yes/no] Enable use of shared libraries [default=
=3Dyes]],,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 enable_shared=3Dyes)<br>
&gt; -+AC_SUBST(enable_shared)<br>
&gt; -+<br>
&gt; -+AC_ARG_ENABLE(gettext,<br>
&gt; -+[ --enable-gettext=3D[yes/no] Enable alternate language support [def=
ault=3Dyes]],,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 enable_gettext=3Dyes)<br>
&gt; -+AC_SUBST(enable_gettext)<br>
&gt; -+<br>
&gt; -+AC_ARG_ENABLE(lib64,<br>
&gt; -+[ --enable-lib64=3D[yes/no] Enable lib64 support [default=3Dno]],,<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 enable_lib64=3Dno)<br>
&gt; -+AC_SUBST(enable_lib64)<br>
&gt; -+<br>
&gt; -+AC_PACKAGE_GLOBALS(attr)<br>
&gt; -+AC_PACKAGE_UTILITIES(attr)<br>
&gt; -+AC_MANUAL_FORMAT<br>
&gt; -+AC_MULTILIB($enable_lib64)<br>
&gt; -+<br>
&gt; -+AC_C_CONST<br>
&gt; -+AC_TYPE_MODE_T<br>
&gt; -+AC_FUNC_ALLOCA<br>
&gt; -+<br>
&gt; -+AC_OUTPUT(include/builddefs)<br>
&gt; diff --git a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch=
 b/meta/recipes-support/attr/attr/dont-use-decl-macros.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9d4b8929e89..00000000000<br>
&gt; --- a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,56 +0,0 @@<br>
&gt; -Use extern &quot;C&quot; instead of __BEGIN_DECL/__END_DECL macros<br=
>
&gt; -these macros are defined in sys/cdefs.h for glibc and this header is =
not available on all libc<br>
&gt; -<br>
&gt; -anyway they defined like below<br>
&gt; -<br>
&gt; -#ifdef __cplusplus<br>
&gt; -# define __BEGIN_DECLS extern &quot;C&quot; {<br>
&gt; -# define __END_DECLS }<br>
&gt; -#else<br>
&gt; -# define __BEGIN_DECLS /* empty */<br>
&gt; -# define __END_DECLS /* empty */<br>
&gt; -#endif<br>
&gt; -<br>
&gt; -__THROW macro is also not available on musl, defined thusly<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; -Index: attr-2.4.47/include/xattr.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- attr-2.4.47.orig/include/xattr.h=C2=A0 =C2=A02014-04-02 00:01:30.=
252091280 -0700<br>
&gt; -+++ attr-2.4.47/include/xattr.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 2014-04-02=
 00:12:57.985428099 -0700<br>
&gt; -@@ -30,8 +30,20 @@<br>
&gt; - #define XATTR_CREATE=C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set valu=
e, fail if attr already exists */<br>
&gt; - #define XATTR_REPLACE 0x2=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set value, fa=
il if attr does not exist */<br>
&gt; -<br>
&gt; --<br>
&gt; --__BEGIN_DECLS<br>
&gt; -+#ifndef __THROW<br>
&gt; -+# ifndef __GNUC_PREREQ<br>
&gt; -+#=C2=A0 define __GNUC_PREREQ(maj, min) (0)<br>
&gt; -+# endif<br>
&gt; -+# if defined __cplusplus &amp;&amp; __GNUC_PREREQ (2,8)<br>
&gt; -+#=C2=A0 define __THROW=C2=A0 =C2=A0 =C2=A0 =C2=A0throw ()<br>
&gt; -+# else<br>
&gt; -+#=C2=A0 define __THROW<br>
&gt; -+# endif<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+#ifdef __cplusplus<br>
&gt; -+extern &quot;C&quot; {<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - extern int setxattr (const char *__path, const char *__name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const void *__value, size_t __size, int __flags) __THROW;<br>
&gt; -@@ -58,6 +70,8 @@<br>
&gt; - extern int lremovexattr (const char *__path, const char *__name) __T=
HROW;<br>
&gt; - extern int fremovexattr (int __filedes,=C2=A0 =C2=A0const char *__na=
me) __THROW;<br>
&gt; -<br>
&gt; --__END_DECLS<br>
&gt; -+#ifdef __cplusplus<br>
&gt; -+}<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* __XATTR_H__ */<br>
&gt; diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-s=
upport/attr/attr/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..f64244f2393<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/attr/attr/run-ptest<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +make test-suite.log<br>
&gt; diff --git a/meta/recipes-support/attr/<a href=3D"http://attr_2.4.47.b=
b" rel=3D"noreferrer" target=3D"_blank">attr_2.4.47.bb</a> b/meta/recipes-s=
upport/attr/<a href=3D"http://attr_2.4.47.bb" rel=3D"noreferrer" target=3D"=
_blank">attr_2.4.47.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index fc88bef830b..00000000000<br>
&gt; --- a/meta/recipes-support/attr/<a href=3D"http://attr_2.4.47.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.47.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,15 +0,0 @@<br>
&gt; -require attr.inc<br>
&gt; -<br>
&gt; -# <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> was missing from the release tarball. This should be fix=
ed in<br>
&gt; -# future releases of attr, remove this when updating the recipe.<br>
&gt; -SRC_URI +=3D &quot;file://attr-Missing-configure.ac.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dont-use-decl-macros=
.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Remove-the-section-2=
-man-pages.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Remove-the-attr.5-ma=
n-page-moved-to-man-pages.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-stdint-type=
s-consistently.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;84f58dec00b60f2dc8fd1c9709291cc7&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;25772f653ac5b2e3ceeb89df50e4688891e21f72=
3c460636548971652af0a859&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/<a href=3D"http://attr_2.4.48.b=
b" rel=3D"noreferrer" target=3D"_blank">attr_2.4.48.bb</a> b/meta/recipes-s=
upport/attr/<a href=3D"http://attr_2.4.48.bb" rel=3D"noreferrer" target=3D"=
_blank">attr_2.4.48.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000000..530d4e48833<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/attr/<a href=3D"http://attr_2.4.48.bb" rel=
=3D"noreferrer" target=3D"_blank">attr_2.4.48.bb</a><br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +require attr.inc<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;bc1e5cb5c96d99b24886f1f527d3bb3d&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;5ead72b358ec709ed00bbf7a9eaef1654baad937=
c001c044fe8b74c57f5324e7&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-suppo=
rt/attr/ea-acl.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 9336ffc9389..00000000000<br>
&gt; --- a/meta/recipes-support/attr/ea-acl.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,52 +0,0 @@<br>
&gt; -# this build system is mostly shared by attr and acl<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://relative-libdir.patch;striplevel=3D0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -# This patch should be applied after &#39;(attr\|acl)-Missing-configu=
re.ac.patch&#39;<br>
&gt; -SRC_URI_append =3D &quot; file://0001-Added-configure-option-to-enabl=
e-disable-static-libr.patch&quot;<br>
&gt; -<br>
&gt; -inherit autotools-brokensep gettext<br>
&gt; -<br>
&gt; -# When upstream is using automake properly, this can be removed<br>
&gt; -CLEANBROKEN =3D &quot;1&quot;<br>
&gt; -<br>
&gt; -# the package comes with a custom <a href=3D"http://config.h.in" rel=
=3D"noreferrer" target=3D"_blank">config.h.in</a>, it cannot be<br>
&gt; -# overwritten by autoheader<br>
&gt; -EXTRA_AUTORECONF +=3D &quot;--exclude=3Dautoheader&quot;<br>
&gt; -EXTRA_OECONF =3D &quot;INSTALL_USER=3Droot INSTALL_GROUP=3Droot&quot;=
<br>
&gt; -EXTRA_OECONF_append_class-native =3D &quot; --enable-gettext=3Dno&quo=
t;<br>
&gt; -EXTRA_OECONF_append_class-target =3D &quot;${@[&#39;&#39;, &#39; --di=
sable-gettext &#39;][(d.getVar(&#39;USE_NLS&#39;) =3D=3D &#39;no&#39;)]}&qu=
ot;<br>
&gt; -<br>
&gt; -EXTRA_OEMAKE =3D &quot;PKG_LIB_DIR=3D${base_libdir} PKG_DEVLIB_DIR=3D=
${libdir}&quot;<br>
&gt; -<br>
&gt; -do_install () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install install-lib install-dev=
 DIST_ROOT=3D&quot;${D}&quot; ZIP=3D&quot;gzip -n&quot;<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install_append_class-native () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;${libdir}&quot; =3D &quot;${=
base_libdir}&quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0librelpath=3D${@os.path.relpath(d.getVar(&=
#39;libdir&#39;), d.getVar(&#39;base_libdir&#39;))}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0baselibrelpath=3D${@os.path.relpath(d.getV=
ar(&#39;base_libdir&#39;), d.getVar(&#39;libdir&#39;))}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove bad symlinks &amp; create the cor=
rect symlinks<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -L ${D}${libdir}/lib${BPN}.so ; th=
en<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${l=
ibdir}/lib${BPN}.so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $baseli=
brelpath/lib${BPN}.so ${D}${libdir}/lib${BPN}.so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -L ${D}${base_libdir}/lib${BPN}.a =
; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${b=
ase_libdir}/lib${BPN}.a<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $librel=
path/lib${BPN}.a ${D}${base_libdir}/lib${BPN}.a<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -L=C2=A0 ${D}${base_libdir}/lib${B=
PN}.la ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${b=
ase_libdir}/lib${BPN}.la<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $librel=
path/lib${BPN}.la ${D}${base_libdir}/lib${BPN}.la<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -}<br>
&gt; -<br>
&gt; -PACKAGES =3D+ &quot;lib${BPN}&quot;<br>
&gt; -<br>
&gt; -FILES_lib${BPN} =3D &quot;${base_libdir}/lib*${SOLIBS}&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; diff --git a/meta/recipes-support/attr/files/0001-Added-configure-opti=
on-to-enable-disable-static-libr.patch b/meta/recipes-support/attr/files/00=
01-Added-configure-option-to-enable-disable-static-libr.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 1c1159f2c90..00000000000<br>
&gt; --- a/meta/recipes-support/attr/files/0001-Added-configure-option-to-e=
nable-disable-static-libr.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,70 +0,0 @@<br>
&gt; -From 01256c61ba126449c46dd4ab5d5e145488b981fa Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Amarnath Valluri &lt;<a href=3D"mailto:amarnath.valluri@intel.c=
om" target=3D"_blank">amarnath.valluri@intel.com</a>&gt;<br>
&gt; -Date: Mon, 23 Jan 2017 13:25:13 +0200<br>
&gt; -Subject: [PATCH] Added configure option to enable/disable static libr=
ary<br>
&gt; -<br>
&gt; -Create static library archive only in case of --enable-static.<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Amarnath Valluri &lt;<a href=3D"mailto:amarnath.vallur=
i@intel.com" target=3D"_blank">amarnath.valluri@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt; - include/<a href=3D"http://builddefs.in" rel=3D"noreferrer" target=3D=
"_blank">builddefs.in</a> | 1 +<br>
&gt; - include/buildmacros=C2=A0 | 3 +++<br>
&gt; - 3 files changed, 10 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index b966d0e..e48268b 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -26,6 +26,12 @@ AC_ARG_ENABLE(shared,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_shared=3Dyes)<br>
&gt; - AC_SUBST(enable_shared)<br>
&gt; -<br>
&gt; -+AC_ARG_ENABLE(static,<br>
&gt; -+[ --enable-static=3D[yes/no] Enable use of static libraries [default=
=3Dyes]],,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 enable_static=3Dyes)<br>
&gt; -+AC_SUBST(enable_static)<br>
&gt; -+<br>
&gt; -+<br>
&gt; - AC_ARG_ENABLE(gettext,<br>
&gt; - [ --enable-gettext=3D[yes/no] Enable alternate language support [def=
ault=3Dyes]],,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_gettext=3Dyes)<br>
&gt; -diff --git a/include/<a href=3D"http://builddefs.in" rel=3D"noreferre=
r" target=3D"_blank">builddefs.in</a> b/include/<a href=3D"http://builddefs=
.in" rel=3D"noreferrer" target=3D"_blank">builddefs.in</a><br>
&gt; -index d9931db..3b3dbd2 100644<br>
&gt; ---- a/include/<a href=3D"http://builddefs.in" rel=3D"noreferrer" targ=
et=3D"_blank">builddefs.in</a><br>
&gt; -+++ b/include/<a href=3D"http://builddefs.in" rel=3D"noreferrer" targ=
et=3D"_blank">builddefs.in</a><br>
&gt; -@@ -71,6 +71,7 @@ RPMBUILD=C2=A0 =C2=A0 =C2=A0=3D @rpmbuild@<br>
&gt; - RPM_VERSION=C2=A0 =C2=A0=3D @rpm_version@<br>
&gt; -<br>
&gt; - ENABLE_SHARED =3D @enable_shared@<br>
&gt; -+ENABLE_STATIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D @enable_static@<b=
r>
&gt; - ENABLE_GETTEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D @enable_gettext@<br>
&gt; -<br>
&gt; - HAVE_ZIPPED_MANPAGES =3D @have_zipped_manpages@<br>
&gt; -diff --git a/include/buildmacros b/include/buildmacros<br>
&gt; -index 39fa7e2..b0f25c5 100644<br>
&gt; ---- a/include/buildmacros<br>
&gt; -+++ b/include/buildmacros<br>
&gt; -@@ -80,6 +80,7 @@ endif<br>
&gt; - # /usr/lib.<br>
&gt; - ifeq ($(ENABLE_SHARED),yes)<br>
&gt; - INSTALL_LTLIB_DEV =3D \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 set -x; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(TOPDIR)/$(LIBNAME)/.libs; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -m 644 -T old_lib $(LIBNAME)=
.lai $(PKG_DEVLIB_DIR); \<br>
&gt; -@@ -88,7 +89,9 @@ INSTALL_LTLIB_DEV =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -T so_base $(LIBNAME).lai $(=
PKG_LIB_DIR); \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$(PKG_DEVLIB_DIR)&quot; !=
=3D &quot;x$(PKG_LIB_DIR)&quot; ; then \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rel_lib_prefix=3D$$(echo $(PKG_LIB_DIR) | =
sed &#39;s,\(^/\|\)[^/][^/]*,..,g&#39;); \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if test &quot;$(ENABLE_STATIC)&quot; =3D &quot;=
yes&quot; ; then \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEV=
LIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fi ;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEV=
LIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rel_devlib_prefix=3D$$(echo $(PKG_DEVLIB_D=
IR) | sed &#39;s,\(^/\|\)[^/][^/]*,..,g&#39;); \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -S $$rel_devlib_prefix$(PKG_=
LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/files/Remove-the-attr.5-man-pag=
e-moved-to-man-pages.patch b/meta/recipes-support/attr/files/Remove-the-att=
r.5-man-page-moved-to-man-pages.patch<br>
&gt; deleted file mode 100644<br>
&gt; index d5ab83d7c68..00000000000<br>
&gt; --- a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved=
-to-man-pages.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,240 +0,0 @@<br>
&gt; -From 6047c8522b91235ad1e835f44f5e36472d9d49b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Andreas Gruenbacher &lt;<a href=3D"mailto:andreas.gruenbacher@g=
mail.com" target=3D"_blank">andreas.gruenbacher@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 22 Apr 2015 11:46:59 +0200<br>
&gt; -Subject: [PATCH 2/2] Remove the attr.5 man page (moved to man-pages)<=
br>
&gt; -<br>
&gt; -Commit dce9b4448c7f2b22bd206cd068fb05cb2f3255b9 from<br>
&gt; -<a href=3D"https://git.savannah.nongnu.org/git/attr.git" rel=3D"noref=
errer" target=3D"_blank">https://git.savannah.nongnu.org/git/attr.git</a><b=
r>
&gt; -<br>
&gt; -The attr.5 page is part of the extended attribute system call documen=
tation,<br>
&gt; -which has been moved into the man-pages package. Move the attr.5 page=
 there<br>
&gt; -as well.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -[MA: updated to apply directly to v2.4.47]<br>
&gt; -Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - man/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; - man/man5/Makefile |=C2=A0 35 -------------<br>
&gt; - man/man5/attr.5=C2=A0 =C2=A0| 153 ----------------------------------=
--------------------<br>
&gt; - 3 files changed, 1 insertion(+), 189 deletions(-)<br>
&gt; - delete mode 100644 man/man5/Makefile<br>
&gt; - delete mode 100644 man/man5/attr.5<br>
&gt; -<br>
&gt; -diff --git a/man/Makefile b/man/Makefile<br>
&gt; -index 755daed..9301f09 100644<br>
&gt; ---- a/man/Makefile<br>
&gt; -+++ b/man/Makefile<br>
&gt; -@@ -19,7 +19,7 @@<br>
&gt; - TOPDIR =3D ..<br>
&gt; - include $(TOPDIR)/include/builddefs<br>
&gt; -<br>
&gt; --SUBDIRS =3D man1 man3 man5<br>
&gt; -+SUBDIRS =3D man1 man3<br>
&gt; -<br>
&gt; - default : $(SUBDIRS)<br>
&gt; -<br>
&gt; -diff --git a/man/man5/Makefile b/man/man5/Makefile<br>
&gt; -deleted file mode 100644<br>
&gt; -index 6b70d3d..0000000<br>
&gt; ---- a/man/man5/Makefile<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,35 +0,0 @@<br>
&gt; --#<br>
&gt; --# Copyright (c) 2000, 2002 Silicon Graphics, Inc.=C2=A0 All Rights R=
eserved.<br>
&gt; --# Copyright (C) 2009=C2=A0 Andreas Gruenbacher &lt;<a href=3D"mailto=
:agruen@suse.de" target=3D"_blank">agruen@suse.de</a>&gt;<br>
&gt; --#<br>
&gt; --# This program is free software: you can redistribute it and/or modi=
fy it<br>
&gt; --# under the terms of the GNU General Public License as published by<=
br>
&gt; --# the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; --# (at your option) any later version.<br>
&gt; --#<br>
&gt; --# This program is distributed in the hope that it will be useful,<br=
>
&gt; --# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; --# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; --# GNU General Public License for more details.<br>
&gt; --#<br>
&gt; --# You should have received a copy of the GNU General Public License<=
br>
&gt; --# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; --#<br>
&gt; --<br>
&gt; --TOPDIR =3D ../..<br>
&gt; --include $(TOPDIR)/include/builddefs<br>
&gt; --<br>
&gt; --MAN_SECTION=C2=A0 =C2=A0=3D 5<br>
&gt; --<br>
&gt; --MAN_PAGES=C2=A0 =C2=A0 =C2=A0=3D $(shell echo *.$(MAN_SECTION))<br>
&gt; --MAN_DEST=C2=A0 =C2=A0 =C2=A0 =3D $(PKG_MAN_DIR)/man$(MAN_SECTION)<br=
>
&gt; --LSRCFILES=C2=A0 =C2=A0 =C2=A0=3D $(MAN_PAGES)<br>
&gt; --<br>
&gt; --default : $(MAN_PAGES)<br>
&gt; --<br>
&gt; --include $(BUILDRULES)<br>
&gt; --<br>
&gt; --install : default<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 755 -d $(MAN_DEST)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(INSTALL_MAN)<br>
&gt; --install-dev install-lib:<br>
&gt; -diff --git a/man/man5/attr.5 b/man/man5/attr.5<br>
&gt; -deleted file mode 100644<br>
&gt; -index a02757d..0000000<br>
&gt; ---- a/man/man5/attr.5<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,153 +0,0 @@<br>
&gt; --.\&quot; Extended attributes manual page<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; Copyright (C) 2000, 2002, 2007=C2=A0 Andreas Gruenbacher &l=
t;<a href=3D"mailto:agruen@suse.de" target=3D"_blank">agruen@suse.de</a>&gt=
;<br>
&gt; --.\&quot; Copyright (C) 2001, 2002, 2004, 2007 Silicon Graphics, Inc.=
<br>
&gt; --.\&quot; All rights reserved.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This is free documentation; you can redistribute it and/or<=
br>
&gt; --.\&quot; modify it under the terms of the GNU General Public License=
 as<br>
&gt; --.\&quot; published by the Free Software Foundation; either version 2=
 of<br>
&gt; --.\&quot; the License, or (at your option) any later version.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; The GNU General Public License&#39;s references to &quot;ob=
ject code&quot;<br>
&gt; --.\&quot; and &quot;executables&quot; are to be interpreted as the ou=
tput of any<br>
&gt; --.\&quot; document formatting or typesetting system, including<br>
&gt; --.\&quot; intermediate and printed output.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This manual is distributed in the hope that it will be usef=
ul,<br>
&gt; --.\&quot; but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; --.\&quot; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
&gt; --.\&quot; GNU General Public License for more details.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; You should have received a copy of the GNU General Public<b=
r>
&gt; --.\&quot; License along with this manual.=C2=A0 If not, see<br>
&gt; --.\&quot; &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; --.\&quot;<br>
&gt; --.TH ATTR 5<br>
&gt; --.SH NAME<br>
&gt; --attr - Extended attributes<br>
&gt; --.SH DESCRIPTION<br>
&gt; --Extended attributes are name:value pairs associated permanently with=
<br>
&gt; --files and directories, similar to the environment strings associated=
<br>
&gt; --with a process.<br>
&gt; --An attribute may be defined or undefined.<br>
&gt; --If it is defined, its value may be empty or non-empty.<br>
&gt; --.PP<br>
&gt; --Extended attributes are extensions to the normal attributes which ar=
e<br>
&gt; --associated with all inodes in the system (i.e. the<br>
&gt; --.BR stat (2)<br>
&gt; --data).<br>
&gt; --They are often used to provide additional functionality<br>
&gt; --to a filesystem \- for example, additional security features such as=
<br>
&gt; --Access Control Lists (ACLs) may be implemented using extended attrib=
utes.<br>
&gt; --.PP<br>
&gt; --Users with search access to a file or directory may retrieve a list =
of<br>
&gt; --attribute names defined for that file or directory.<br>
&gt; --.PP<br>
&gt; --Extended attributes are accessed as atomic objects.<br>
&gt; --Reading retrieves the whole value of an attribute and stores it in a=
 buffer.<br>
&gt; --Writing replaces any previous value with the new value.<br>
&gt; --.PP<br>
&gt; --Space consumed for extended attributes is counted towards the disk q=
uotas<br>
&gt; --of the file owner and file group.<br>
&gt; --.PP<br>
&gt; --Currently, support for extended attributes is implemented on Linux b=
y the<br>
&gt; --ext2, ext3, ext4, XFS, JFS and reiserfs filesystems.<br>
&gt; --.SH EXTENDED ATTRIBUTE NAMESPACES<br>
&gt; --Attribute names are zero-terminated strings.<br>
&gt; --The attribute name is always specified in the fully qualified<br>
&gt; --.IR namespace.attribute<br>
&gt; --form, eg.<br>
&gt; --.IR user.mime_type ,<br>
&gt; --.IR trusted.md5sum ,<br>
&gt; --.IR system.posix_acl_access ,<br>
&gt; --or<br>
&gt; --.IR security.selinux .<br>
&gt; --.PP<br>
&gt; --The namespace mechanism is used to define different classes of exten=
ded<br>
&gt; --attributes.<br>
&gt; --These different classes exist for several reasons, e.g. the permissi=
ons<br>
&gt; --and capabilities required for manipulating extended attributes of on=
e<br>
&gt; --namespace may differ to another.<br>
&gt; --.PP<br>
&gt; --Currently the<br>
&gt; --.IR security ,<br>
&gt; --.IR system ,<br>
&gt; --.IR trusted ,<br>
&gt; --and<br>
&gt; --.IR user<br>
&gt; --extended attribute classes are defined as described below. Additiona=
l<br>
&gt; --classes may be added in the future.<br>
&gt; --.SS Extended security attributes<br>
&gt; --The security attribute namespace is used by kernel security modules,=
<br>
&gt; --such as Security Enhanced Linux.<br>
&gt; --Read and write access permissions to security attributes depend on t=
he<br>
&gt; --policy implemented for each security attribute by the security modul=
e.<br>
&gt; --When no security module is loaded, all processes have read access to=
<br>
&gt; --extended security attributes, and write access is limited to process=
es<br>
&gt; --that have the CAP_SYS_ADMIN capability.<br>
&gt; --.SS Extended system attributes<br>
&gt; --Extended system attributes are used by the kernel to store system<br=
>
&gt; --objects such as Access Control Lists and Capabilities.=C2=A0 Read an=
d write<br>
&gt; --access permissions to system attributes depend on the policy impleme=
nted<br>
&gt; --for each system attribute implemented by filesystems in the kernel.<=
br>
&gt; --.SS Trusted extended attributes<br>
&gt; --Trusted extended attributes are visible and accessible only to proce=
sses that<br>
&gt; --have the CAP_SYS_ADMIN capability (the super user usually has this<b=
r>
&gt; --capability).<br>
&gt; --Attributes in this class are used to implement mechanisms in user<br=
>
&gt; --space (i.e., outside the kernel) which keep information in extended =
attributes<br>
&gt; --to which ordinary processes should not have access.<br>
&gt; --.SS Extended user attributes<br>
&gt; --Extended user attributes may be assigned to files and directories fo=
r<br>
&gt; --storing arbitrary additional information such as the mime type,<br>
&gt; --character set or encoding of a file. The access permissions for user=
<br>
&gt; --attributes are defined by the file permission bits.<br>
&gt; --.PP<br>
&gt; --The file permission bits of regular files and directories are<br>
&gt; --interpreted differently from the file permission bits of special fil=
es<br>
&gt; --and symbolic links. For regular files and directories the file<br>
&gt; --permission bits define access to the file&#39;s contents, while for =
device special<br>
&gt; --files they define access to the device described by the special file=
.<br>
&gt; --The file permissions of symbolic links are not used in access<br>
&gt; --checks. These differences would allow users to consume filesystem re=
sources in<br>
&gt; --a way not controllable by disk quotas for group or world writable sp=
ecial files and directories.<br>
&gt; --.PP<br>
&gt; --For this reason, extended user attributes are only allowed for regul=
ar files and directories, and access to extended user attributes is restric=
ted to the<br>
&gt; --owner and to users with appropriate capabilities for directories wit=
h the<br>
&gt; --sticky bit set (see the<br>
&gt; --.BR chmod (1)<br>
&gt; --manual page for an explanation of Sticky Directories).<br>
&gt; --.SH FILESYSTEM DIFFERENCES<br>
&gt; --The kernel and the filesystem may place limits on the maximum number=
<br>
&gt; --and size of extended attributes that can be associated with a file.<=
br>
&gt; --Some file systems, such as ext2/3 and reiserfs, require the filesyst=
em<br>
&gt; --to be mounted with the<br>
&gt; --.B user_xattr<br>
&gt; --mount option in order for extended user attributes to be used.<br>
&gt; --.PP<br>
&gt; --In the current ext2, ext3 and ext4 filesystem implementations, each<=
br>
&gt; --extended attribute must fit on a single filesystem block (1024, 2048=
<br>
&gt; --or 4096 bytes, depending on the block size specified when the<br>
&gt; --filesystem was created).<br>
&gt; --.PP<br>
&gt; --In the XFS and reiserfs filesystem implementations, there is no<br>
&gt; --practical limit on the number or size of extended attributes<br>
&gt; --associated with a file, and the algorithms used to store extended<br=
>
&gt; --attribute information on disk are scalable.<br>
&gt; --.PP<br>
&gt; --In the JFS filesystem implementation, names can be up to 255 bytes a=
nd<br>
&gt; --values up to 65,535 bytes.<br>
&gt; --.SH ADDITIONAL NOTES<br>
&gt; --Since the filesystems on which extended attributes are stored might =
also<br>
&gt; --be used on architectures with a different byte order and machine wor=
d<br>
&gt; --size, care should be taken to store attribute values in an architect=
ure<br>
&gt; --independent format.<br>
&gt; --.SH AUTHORS<br>
&gt; --Andreas Gruenbacher,<br>
&gt; --.RI &lt; <a href=3D"mailto:a.gruenbacher@bestbits.at" target=3D"_bla=
nk">a.gruenbacher@bestbits.at</a> &gt;<br>
&gt; --and the SGI XFS development team,<br>
&gt; --.RI &lt; <a href=3D"mailto:linux-xfs@oss.sgi.com" target=3D"_blank">=
linux-xfs@oss.sgi.com</a> &gt;.<br>
&gt; --.SH SEE ALSO<br>
&gt; --getfattr(1),<br>
&gt; --setfattr(1).<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/files/Remove-the-section-2-man-=
pages.patch b/meta/recipes-support/attr/files/Remove-the-section-2-man-page=
s.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 044c5a037c8..00000000000<br>
&gt; --- a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.p=
atch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,666 +0,0 @@<br>
&gt; -From b972600a26f3a930e53e2fce2625266a5d29813e Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Andreas Gruenbacher &lt;<a href=3D"mailto:andreas.gruenbacher@g=
mail.com" target=3D"_blank">andreas.gruenbacher@gmail.com</a>&gt;<br>
&gt; -Date: Tue, 14 Apr 2015 23:53:11 +0200<br>
&gt; -Subject: [PATCH 1/2] Remove the section 2 man pages<br>
&gt; -<br>
&gt; -Commit 8d1263bca95722d66a6f8e83450f49d0956ea534 from upstream<br>
&gt; -<a href=3D"https://git.savannah.nongnu.org/git/attr.git/" rel=3D"nore=
ferrer" target=3D"_blank">https://git.savannah.nongnu.org/git/attr.git/</a>=
<br>
&gt; -<br>
&gt; -The section 2 man pages have long since been added to the man-pages p=
ackage<br>
&gt; -which documents all system calls; they were disabled in attr by defau=
lt since<br>
&gt; -January 2014.=C2=A0 Get rid of them here.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -[MA: modified to apply directly to v2.4.47]<br>
&gt; -Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - man/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +-<br>
&gt; - man/man2/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 -----------<br>
&gt; - man/man2/getxattr.2=C2=A0 =C2=A0 | 143 -----------------------------=
---------------<br>
&gt; - man/man2/listxattr.2=C2=A0 =C2=A0| 158 -----------------------------=
--------------------<br>
&gt; - man/man2/removexattr.2 | 111 ----------------------------------<br>
&gt; - man/man2/setxattr.2=C2=A0 =C2=A0 | 143 -----------------------------=
---------------<br>
&gt; - 6 files changed, 1 insertion(+), 591 deletions(-)<br>
&gt; - delete mode 100644 man/man2/Makefile<br>
&gt; - delete mode 100644 man/man2/getxattr.2<br>
&gt; - delete mode 100644 man/man2/listxattr.2<br>
&gt; - delete mode 100644 man/man2/removexattr.2<br>
&gt; - delete mode 100644 man/man2/setxattr.2<br>
&gt; -<br>
&gt; -diff --git a/man/Makefile b/man/Makefile<br>
&gt; -index 9535426..755daed 100644<br>
&gt; ---- a/man/Makefile<br>
&gt; -+++ b/man/Makefile<br>
&gt; -@@ -19,7 +19,7 @@<br>
&gt; - TOPDIR =3D ..<br>
&gt; - include $(TOPDIR)/include/builddefs<br>
&gt; -<br>
&gt; --SUBDIRS =3D man1 man2 man3 man5<br>
&gt; -+SUBDIRS =3D man1 man3 man5<br>
&gt; -<br>
&gt; - default : $(SUBDIRS)<br>
&gt; -<br>
&gt; -diff --git a/man/man2/Makefile b/man/man2/Makefile<br>
&gt; -deleted file mode 100644<br>
&gt; -index d77309d..0000000<br>
&gt; ---- a/man/man2/Makefile<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,35 +0,0 @@<br>
&gt; --#<br>
&gt; --# Copyright (c) 2000-2002 Silicon Graphics, Inc.=C2=A0 All Rights Re=
served.<br>
&gt; --# Copyright (C) 2009=C2=A0 Andreas Gruenbacher &lt;<a href=3D"mailto=
:agruen@suse.de" target=3D"_blank">agruen@suse.de</a>&gt;<br>
&gt; --#<br>
&gt; --# This program is free software: you can redistribute it and/or modi=
fy it<br>
&gt; --# under the terms of the GNU General Public License as published by<=
br>
&gt; --# the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; --# (at your option) any later version.<br>
&gt; --#<br>
&gt; --# This program is distributed in the hope that it will be useful,<br=
>
&gt; --# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; --# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; --# GNU General Public License for more details.<br>
&gt; --#<br>
&gt; --# You should have received a copy of the GNU General Public License<=
br>
&gt; --# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; --#<br>
&gt; --<br>
&gt; --TOPDIR =3D ../..<br>
&gt; --include $(TOPDIR)/include/builddefs<br>
&gt; --<br>
&gt; --MAN_SECTION=C2=A0 =C2=A0=3D 2<br>
&gt; --<br>
&gt; --MAN_PAGES=C2=A0 =C2=A0 =C2=A0=3D $(shell echo *.$(MAN_SECTION))<br>
&gt; --MAN_DEST=C2=A0 =C2=A0 =C2=A0 =3D $(PKG_MAN_DIR)/man$(MAN_SECTION)<br=
>
&gt; --LSRCFILES=C2=A0 =C2=A0 =C2=A0=3D $(MAN_PAGES)<br>
&gt; --<br>
&gt; --default install : $(MAN_PAGES)<br>
&gt; --<br>
&gt; --include $(BUILDRULES)<br>
&gt; --<br>
&gt; --install-dev : default<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(INSTALL) -m 755 -d $(MAN_DEST)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(INSTALL_MAN)<br>
&gt; --install-lib:<br>
&gt; -diff --git a/man/man2/getxattr.2 b/man/man2/getxattr.2<br>
&gt; -deleted file mode 100644<br>
&gt; -index 405ad89..0000000<br>
&gt; ---- a/man/man2/getxattr.2<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,143 +0,0 @@<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; Extended attributes system calls manual pages<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; (C) Andreas Gruenbacher, February 2001<br>
&gt; --.\&quot; (C) Silicon Graphics Inc, September 2001<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This is free documentation; you can redistribute it and/or<=
br>
&gt; --.\&quot; modify it under the terms of the GNU General Public License=
 as<br>
&gt; --.\&quot; published by the Free Software Foundation; either version 2=
 of<br>
&gt; --.\&quot; the License, or (at your option) any later version.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; The GNU General Public License&#39;s references to &quot;ob=
ject code&quot;<br>
&gt; --.\&quot; and &quot;executables&quot; are to be interpreted as the ou=
tput of any<br>
&gt; --.\&quot; document formatting or typesetting system, including<br>
&gt; --.\&quot; intermediate and printed output.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This manual is distributed in the hope that it will be usef=
ul,<br>
&gt; --.\&quot; but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; --.\&quot; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
&gt; --.\&quot; GNU General Public License for more details.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; You should have received a copy of the GNU General Public<b=
r>
&gt; --.\&quot; License along with this manual.=C2=A0 If not, see<br>
&gt; --.\&quot; &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; --.\&quot;<br>
&gt; --.TH GETXATTR 2 &quot;Extended Attributes&quot; &quot;Dec 2001&quot; =
&quot;System calls&quot;<br>
&gt; --.SH NAME<br>
&gt; --getxattr, lgetxattr, fgetxattr \- retrieve an extended attribute val=
ue<br>
&gt; --.SH SYNOPSIS<br>
&gt; --.fam C<br>
&gt; --.nf<br>
&gt; --.B #include &lt;sys/types.h&gt;<br>
&gt; --.B #include &lt;attr/xattr.h&gt;<br>
&gt; --.sp<br>
&gt; --.BI &quot;ssize_t getxattr (const char\ *&quot; path &quot;, const c=
har\ *&quot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t\t void\ *&quot; value &quot;, size_t &quot; size );=
<br>
&gt; --.BI &quot;ssize_t lgetxattr (const char\ *&quot; path &quot;, const =
char\ *&quot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t\t void\ *&quot; value &quot;, size_t &quot; size );=
<br>
&gt; --.BI &quot;ssize_t fgetxattr (int &quot; filedes &quot;, const char\ =
*&quot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t\t void\ *&quot; value &quot;, size_t &quot; size );=
<br>
&gt; --.fi<br>
&gt; --.fam T<br>
&gt; --.SH DESCRIPTION<br>
&gt; --Extended attributes are<br>
&gt; --.IR name :\c<br>
&gt; --.I value<br>
&gt; --pairs associated with inodes (files, directories, symlinks, etc).<br=
>
&gt; --They are extensions to the normal attributes which are associated<br=
>
&gt; --with all inodes in the system (i.e. the<br>
&gt; --.BR stat (2)<br>
&gt; --data).<br>
&gt; --A complete overview of extended attributes concepts can be found in<=
br>
&gt; --.BR attr (5).<br>
&gt; --.PP<br>
&gt; --.B getxattr<br>
&gt; --retrieves the<br>
&gt; --.I value<br>
&gt; --of the extended attribute identified by<br>
&gt; --.I name<br>
&gt; --and associated with the given<br>
&gt; --.I path<br>
&gt; --in the filesystem.<br>
&gt; --The length of the attribute<br>
&gt; --.I value<br>
&gt; --is returned.<br>
&gt; --.PP<br>
&gt; --.B lgetxattr<br>
&gt; --is identical to<br>
&gt; --.BR getxattr ,<br>
&gt; --except in the case of a symbolic link, where the link itself is<br>
&gt; --interrogated, not the file that it refers to.<br>
&gt; --.PP<br>
&gt; --.B fgetxattr<br>
&gt; --is identical to<br>
&gt; --.BR getxattr ,<br>
&gt; --only the open file pointed to by<br>
&gt; --.I filedes<br>
&gt; --(as returned by<br>
&gt; --.BR open (2))<br>
&gt; --is interrogated in place of<br>
&gt; --.IR path .<br>
&gt; --.PP<br>
&gt; --An extended attribute<br>
&gt; --.I name<br>
&gt; --is a simple NULL-terminated string.<br>
&gt; --The name includes a namespace prefix \- there may be several, disjoi=
nt<br>
&gt; --namespaces associated with an individual inode.<br>
&gt; --The value of an extended attribute is a chunk of arbitrary textual o=
r<br>
&gt; --binary data of specified length.<br>
&gt; --.PP<br>
&gt; --An empty buffer of<br>
&gt; --.I size<br>
&gt; --zero can be passed into these calls to return the current size of th=
e<br>
&gt; --named extended attribute, which can be used to estimate the size of =
a<br>
&gt; --buffer which is sufficiently large to hold the value associated with=
<br>
&gt; --the extended attribute.<br>
&gt; --.PP<br>
&gt; --The interface is designed to allow guessing of initial buffer<br>
&gt; --sizes, and to enlarge buffers when the return value indicates<br>
&gt; --that the buffer provided was too small.<br>
&gt; --.SH RETURN VALUE<br>
&gt; --On success, a positive number is returned indicating the size of the=
<br>
&gt; --extended attribute value.<br>
&gt; --On failure, \-1 is returned and<br>
&gt; --.I errno<br>
&gt; --is set appropriately.<br>
&gt; --.PP<br>
&gt; --If the named attribute does not exist, or the process has no access =
to<br>
&gt; --this attribute,<br>
&gt; --.I errno<br>
&gt; --is set to ENOATTR.<br>
&gt; --.PP<br>
&gt; --If the<br>
&gt; --.I size<br>
&gt; --of the<br>
&gt; --.I value<br>
&gt; --buffer is too small to hold the result,<br>
&gt; --.I errno<br>
&gt; --is set to ERANGE.<br>
&gt; --.PP<br>
&gt; --If extended attributes are not supported by the filesystem, or are d=
isabled,<br>
&gt; --.I errno<br>
&gt; --is set to ENOTSUP.<br>
&gt; --.PP<br>
&gt; --The errors documented for the<br>
&gt; --.BR stat (2)<br>
&gt; --system call are also applicable here.<br>
&gt; --.SH AUTHORS<br>
&gt; --Andreas Gruenbacher,<br>
&gt; --.RI &lt; <a href=3D"mailto:a.gruenbacher@bestbits.at" target=3D"_bla=
nk">a.gruenbacher@bestbits.at</a> &gt;<br>
&gt; --and the SGI XFS development team,<br>
&gt; --.RI &lt; <a href=3D"mailto:linux-xfs@oss.sgi.com" target=3D"_blank">=
linux-xfs@oss.sgi.com</a> &gt;.<br>
&gt; --Please send any bug reports or comments to these addresses.<br>
&gt; --.SH SEE ALSO<br>
&gt; --.BR getfattr (1),<br>
&gt; --.BR setfattr (1),<br>
&gt; --.BR open (2),<br>
&gt; --.BR stat (2),<br>
&gt; --.BR setxattr (2),<br>
&gt; --.BR listxattr (2),<br>
&gt; --.BR removexattr (2),<br>
&gt; --and<br>
&gt; --.BR attr (5).<br>
&gt; -diff --git a/man/man2/listxattr.2 b/man/man2/listxattr.2<br>
&gt; -deleted file mode 100644<br>
&gt; -index 8b4371c..0000000<br>
&gt; ---- a/man/man2/listxattr.2<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,158 +0,0 @@<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; Extended attributes system calls manual pages<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; (C) Andreas Gruenbacher, February 2001<br>
&gt; --.\&quot; (C) Silicon Graphics Inc, September 2001<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This is free documentation; you can redistribute it and/or<=
br>
&gt; --.\&quot; modify it under the terms of the GNU General Public License=
 as<br>
&gt; --.\&quot; published by the Free Software Foundation; either version 2=
 of<br>
&gt; --.\&quot; the License, or (at your option) any later version.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; The GNU General Public License&#39;s references to &quot;ob=
ject code&quot;<br>
&gt; --.\&quot; and &quot;executables&quot; are to be interpreted as the ou=
tput of any<br>
&gt; --.\&quot; document formatting or typesetting system, including<br>
&gt; --.\&quot; intermediate and printed output.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This manual is distributed in the hope that it will be usef=
ul,<br>
&gt; --.\&quot; but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; --.\&quot; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
&gt; --.\&quot; GNU General Public License for more details.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; You should have received a copy of the GNU General Public<b=
r>
&gt; --.\&quot; License along with this manual.=C2=A0 If not, see<br>
&gt; --.\&quot; &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; --.\&quot;<br>
&gt; --.TH LISTXATTR 2 &quot;Extended Attributes&quot; &quot;Dec 2001&quot;=
 &quot;System calls&quot;<br>
&gt; --.SH NAME<br>
&gt; --listxattr, llistxattr, flistxattr \- list extended attribute names<b=
r>
&gt; --.SH SYNOPSIS<br>
&gt; --.fam C<br>
&gt; --.nf<br>
&gt; --.B #include &lt;sys/types.h&gt;<br>
&gt; --.B #include &lt;attr/xattr.h&gt;<br>
&gt; --.sp<br>
&gt; --.BI &quot;ssize_t listxattr (const char\ *&quot; path &quot;,<br>
&gt; --.BI &quot;\t\t\t\t char\ *&quot; list &quot;, size_t &quot; size );<=
br>
&gt; --.BI &quot;ssize_t llistxattr (const char\ *&quot; path &quot;,<br>
&gt; --.BI &quot;\t\t\t\t char\ *&quot; list &quot;, size_t &quot; size );<=
br>
&gt; --.BI &quot;ssize_t flistxattr (int &quot; filedes &quot;,<br>
&gt; --.BI &quot;\t\t\t\t char\ *&quot; list &quot;, size_t &quot; size );<=
br>
&gt; --.fi<br>
&gt; --.fam T<br>
&gt; --.SH DESCRIPTION<br>
&gt; --Extended attributes are name:value<br>
&gt; --pairs associated with inodes (files, directories, symlinks, etc).<br=
>
&gt; --They are extensions to the normal attributes which are associated<br=
>
&gt; --with all inodes in the system (i.e. the<br>
&gt; --.BR stat (2)<br>
&gt; --data).<br>
&gt; --A complete overview of extended attributes concepts can be found in<=
br>
&gt; --.BR attr (5).<br>
&gt; --.PP<br>
&gt; --.B listxattr<br>
&gt; --retrieves the<br>
&gt; --.I list<br>
&gt; --of extended attribute names associated with the given<br>
&gt; --.I path<br>
&gt; --in the filesystem.<br>
&gt; --The list is the set of (NULL-terminated) names, one after the other.=
<br>
&gt; --Names of extended attributes to which the calling process does not<b=
r>
&gt; --have access may be omitted from the list.<br>
&gt; --The length of the attribute name<br>
&gt; --.I list<br>
&gt; --is returned.<br>
&gt; --.PP<br>
&gt; --.B llistxattr<br>
&gt; --is identical to<br>
&gt; --.BR listxattr ,<br>
&gt; --except in the case of a symbolic link, where the list of names of<br=
>
&gt; --extended attributes associated with the link itself is retrieved,<br=
>
&gt; --not the file that it refers to.<br>
&gt; --.I list<br>
&gt; --is a caller-allocated buffer of size<br>
&gt; --.IR size .<br>
&gt; --.PP<br>
&gt; --.B flistxattr<br>
&gt; --is identical to<br>
&gt; --.BR listxattr ,<br>
&gt; --only the open file pointed to by<br>
&gt; --.I filedes<br>
&gt; --(as returned by<br>
&gt; --.BR open (2))<br>
&gt; --is interrogated in place of<br>
&gt; --.IR path .<br>
&gt; --.PP<br>
&gt; --A single extended attribute<br>
&gt; --.I name<br>
&gt; --is a simple NULL-terminated string.<br>
&gt; --The name includes a namespace prefix \- there may be several, disjoi=
nt<br>
&gt; --namespaces associated with an individual inode.<br>
&gt; --.PP<br>
&gt; --An empty buffer of<br>
&gt; --.I size<br>
&gt; --zero can be passed into these calls to return the current size of th=
e<br>
&gt; --list of extended attribute names, which can be used to estimate the<=
br>
&gt; --size of a buffer which is sufficiently large to hold the list of nam=
es.<br>
&gt; --.SH EXAMPLES<br>
&gt; --The<br>
&gt; --.I list<br>
&gt; --of names is returned as an unordered array of NULL-terminated charac=
ter<br>
&gt; --strings (attribute names are separated by NULL characters), like thi=
s:<br>
&gt; --.fam C<br>
&gt; --.RS<br>
&gt; --.nf<br>
&gt; --user.name1\\0system.name1\\0user.name2\\0<br>
&gt; --.fi<br>
&gt; --.RE<br>
&gt; --.fam T<br>
&gt; --.P<br>
&gt; --Filesystems like ext2, ext3 and XFS which implement POSIX ACLs using=
<br>
&gt; --extended attributes, might return a<br>
&gt; --.I list<br>
&gt; --like this:<br>
&gt; --.fam C<br>
&gt; --.RS<br>
&gt; --.nf<br>
&gt; --system.posix_acl_access\\0system.posix_acl_default\\0<br>
&gt; --.fi<br>
&gt; --.RE<br>
&gt; --.fam T<br>
&gt; --.SH RETURN VALUE<br>
&gt; --On success, a positive number is returned indicating the size of the=
<br>
&gt; --extended attribute name list.<br>
&gt; --On failure, \-1 is returned and<br>
&gt; --.I errno<br>
&gt; --is set appropriately.<br>
&gt; --.PP<br>
&gt; --If the<br>
&gt; --.I size<br>
&gt; --of the<br>
&gt; --.I list<br>
&gt; --buffer is too small to hold the result,<br>
&gt; --.I errno<br>
&gt; --is set to ERANGE.<br>
&gt; --.PP<br>
&gt; --If extended attributes are not supported by the filesystem, or are d=
isabled,<br>
&gt; --.I errno<br>
&gt; --is set to ENOTSUP.<br>
&gt; --.PP<br>
&gt; --The errors documented for the<br>
&gt; --.BR stat (2)<br>
&gt; --system call are also applicable here.<br>
&gt; --.SH AUTHORS<br>
&gt; --Andreas Gruenbacher,<br>
&gt; --.RI &lt; <a href=3D"mailto:a.gruenbacher@bestbits.at" target=3D"_bla=
nk">a.gruenbacher@bestbits.at</a> &gt;<br>
&gt; --and the SGI XFS development team,<br>
&gt; --.RI &lt; <a href=3D"mailto:linux-xfs@oss.sgi.com" target=3D"_blank">=
linux-xfs@oss.sgi.com</a> &gt;.<br>
&gt; --Please send any bug reports or comments to these addresses.<br>
&gt; --.SH SEE ALSO<br>
&gt; --.BR getfattr (1),<br>
&gt; --.BR setfattr (1),<br>
&gt; --.BR open (2),<br>
&gt; --.BR stat (2),<br>
&gt; --.BR getxattr (2),<br>
&gt; --.BR setxattr (2),<br>
&gt; --.BR removexattr (2),<br>
&gt; --and<br>
&gt; --.BR attr (5).<br>
&gt; -diff --git a/man/man2/removexattr.2 b/man/man2/removexattr.2<br>
&gt; -deleted file mode 100644<br>
&gt; -index 2c7d934..0000000<br>
&gt; ---- a/man/man2/removexattr.2<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,111 +0,0 @@<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; Extended attributes system calls manual pages<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; (C) Andreas Gruenbacher, February 2001<br>
&gt; --.\&quot; (C) Silicon Graphics Inc, September 2001<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This is free documentation; you can redistribute it and/or<=
br>
&gt; --.\&quot; modify it under the terms of the GNU General Public License=
 as<br>
&gt; --.\&quot; published by the Free Software Foundation; either version 2=
 of<br>
&gt; --.\&quot; the License, or (at your option) any later version.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; The GNU General Public License&#39;s references to &quot;ob=
ject code&quot;<br>
&gt; --.\&quot; and &quot;executables&quot; are to be interpreted as the ou=
tput of any<br>
&gt; --.\&quot; document formatting or typesetting system, including<br>
&gt; --.\&quot; intermediate and printed output.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This manual is distributed in the hope that it will be usef=
ul,<br>
&gt; --.\&quot; but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; --.\&quot; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
&gt; --.\&quot; GNU General Public License for more details.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; You should have received a copy of the GNU General Public<b=
r>
&gt; --.\&quot; License along with this manual.=C2=A0 If not, see<br>
&gt; --.\&quot; &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; --.\&quot;<br>
&gt; --.TH REMOVEXATTR 2 &quot;Extended Attributes&quot; &quot;Dec 2001&quo=
t; &quot;System calls&quot;<br>
&gt; --.SH NAME<br>
&gt; --removexattr, lremovexattr, fremovexattr \- remove an extended attrib=
ute<br>
&gt; --.SH SYNOPSIS<br>
&gt; --.fam C<br>
&gt; --.nf<br>
&gt; --.B #include &lt;sys/types.h&gt;<br>
&gt; --.B #include &lt;attr/xattr.h&gt;<br>
&gt; --.sp<br>
&gt; --.BI &quot;int removexattr (const char\ *&quot; path &quot;, const ch=
ar\ *&quot; name );<br>
&gt; --.BI &quot;int lremovexattr (const char\ *&quot; path &quot;, const c=
har\ *&quot; name );<br>
&gt; --.BI &quot;int fremovexattr (int &quot; filedes &quot;, const char\ *=
&quot; name );<br>
&gt; --.fi<br>
&gt; --.fam T<br>
&gt; --.SH DESCRIPTION<br>
&gt; --Extended attributes are<br>
&gt; --.IR name :\c<br>
&gt; --value pairs associated with inodes (files, directories, symlinks, et=
c).<br>
&gt; --They are extensions to the normal attributes which are associated<br=
>
&gt; --with all inodes in the system (i.e. the<br>
&gt; --.BR stat (2)<br>
&gt; --data).<br>
&gt; --A complete overview of extended attributes concepts can be found in<=
br>
&gt; --.BR attr (5).<br>
&gt; --.PP<br>
&gt; --.B removexattr<br>
&gt; --removes the extended attribute identified by<br>
&gt; --.I name<br>
&gt; --and associated with the given<br>
&gt; --.I path<br>
&gt; --in the filesystem.<br>
&gt; --.PP<br>
&gt; --.B lremovexattr<br>
&gt; --is identical to<br>
&gt; --.BR removexattr ,<br>
&gt; --except in the case of a symbolic link, where the extended attribute =
is<br>
&gt; --removed from the link itself, not the file that it refers to.<br>
&gt; --.PP<br>
&gt; --.B fremovexattr<br>
&gt; --is identical to<br>
&gt; --.BR removexattr ,<br>
&gt; --only the extended attribute is removed from the open file pointed to=
 by<br>
&gt; --.I filedes<br>
&gt; --(as returned by<br>
&gt; --.BR open (2))<br>
&gt; --in place of<br>
&gt; --.IR path .<br>
&gt; --.PP<br>
&gt; --An extended attribute name is a simple NULL-terminated string.<br>
&gt; --The<br>
&gt; --.I name<br>
&gt; --includes a namespace prefix \- there may be several, disjoint<br>
&gt; --namespaces associated with an individual inode.<br>
&gt; --.SH RETURN VALUE<br>
&gt; --On success, zero is returned.<br>
&gt; --On failure, \-1 is returned and<br>
&gt; --.I errno<br>
&gt; --is set appropriately.<br>
&gt; --.PP<br>
&gt; --If the named attribute does not exist,<br>
&gt; --.I errno<br>
&gt; --is set to ENOATTR.<br>
&gt; --.PP<br>
&gt; --If extended attributes are not supported by the filesystem, or are d=
isabled,<br>
&gt; --.I errno<br>
&gt; --is set to ENOTSUP.<br>
&gt; --.PP<br>
&gt; --The errors documented for the<br>
&gt; --.BR stat (2)<br>
&gt; --system call are also applicable here.<br>
&gt; --.SH AUTHORS<br>
&gt; --Andreas Gruenbacher,<br>
&gt; --.RI &lt; <a href=3D"mailto:a.gruenbacher@bestbits.at" target=3D"_bla=
nk">a.gruenbacher@bestbits.at</a> &gt;<br>
&gt; --and the SGI XFS development team,<br>
&gt; --.RI &lt; <a href=3D"mailto:linux-xfs@oss.sgi.com" target=3D"_blank">=
linux-xfs@oss.sgi.com</a> &gt;.<br>
&gt; --Please send any bug reports or comments to these addresses.<br>
&gt; --.SH SEE ALSO<br>
&gt; --.BR getfattr (1),<br>
&gt; --.BR setfattr (1),<br>
&gt; --.BR open (2),<br>
&gt; --.BR stat (2),<br>
&gt; --.BR setxattr (2),<br>
&gt; --.BR getxattr (2),<br>
&gt; --.BR listxattr (2),<br>
&gt; --and<br>
&gt; --.BR attr (5).<br>
&gt; -diff --git a/man/man2/setxattr.2 b/man/man2/setxattr.2<br>
&gt; -deleted file mode 100644<br>
&gt; -index b20dc9f..0000000<br>
&gt; ---- a/man/man2/setxattr.2<br>
&gt; -+++ /dev/null<br>
&gt; -@@ -1,143 +0,0 @@<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; Extended attributes system calls manual pages<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; (C) Andreas Gruenbacher, February 2001<br>
&gt; --.\&quot; (C) Silicon Graphics Inc, September 2001<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This is free documentation; you can redistribute it and/or<=
br>
&gt; --.\&quot; modify it under the terms of the GNU General Public License=
 as<br>
&gt; --.\&quot; published by the Free Software Foundation; either version 2=
 of<br>
&gt; --.\&quot; the License, or (at your option) any later version.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; The GNU General Public License&#39;s references to &quot;ob=
ject code&quot;<br>
&gt; --.\&quot; and &quot;executables&quot; are to be interpreted as the ou=
tput of any<br>
&gt; --.\&quot; document formatting or typesetting system, including<br>
&gt; --.\&quot; intermediate and printed output.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; This manual is distributed in the hope that it will be usef=
ul,<br>
&gt; --.\&quot; but WITHOUT ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; --.\&quot; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 =
See the<br>
&gt; --.\&quot; GNU General Public License for more details.<br>
&gt; --.\&quot;<br>
&gt; --.\&quot; You should have received a copy of the GNU General Public<b=
r>
&gt; --.\&quot; License along with this manual.=C2=A0 If not, see<br>
&gt; --.\&quot; &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
&gt; --.\&quot;<br>
&gt; --.TH SETXATTR 2 &quot;Extended Attributes&quot; &quot;Dec 2001&quot; =
&quot;System calls&quot;<br>
&gt; --.SH NAME<br>
&gt; --setxattr, lsetxattr, fsetxattr \- set an extended attribute value<br=
>
&gt; --.SH SYNOPSIS<br>
&gt; --.fam C<br>
&gt; --.nf<br>
&gt; --.B #include &lt;sys/types.h&gt;<br>
&gt; --.B #include &lt;attr/xattr.h&gt;<br>
&gt; --.sp<br>
&gt; --.BI &quot;int setxattr (const char\ *&quot; path &quot;, const char\=
 *&quot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t const void\ *&quot; value &quot;, size_t &quot; siz=
e &quot;, int &quot; flags );<br>
&gt; --.BI &quot;int lsetxattr (const char\ *&quot; path &quot;, const char=
\ *&quot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t const void\ *&quot; value &quot;, size_t &quot; siz=
e &quot;, int &quot; flags );<br>
&gt; --.BI &quot;int fsetxattr (int &quot; filedes &quot;, const char\ *&qu=
ot; name &quot;,<br>
&gt; --.BI &quot;\t\t\t const void\ *&quot; value &quot;, size_t &quot; siz=
e &quot;, int &quot; flags );<br>
&gt; --.fi<br>
&gt; --.fam T<br>
&gt; --.SH DESCRIPTION<br>
&gt; --Extended attributes are<br>
&gt; --.IR name :\c<br>
&gt; --.I value<br>
&gt; --pairs associated with inodes (files, directories, symlinks, etc).<br=
>
&gt; --They are extensions to the normal attributes which are associated<br=
>
&gt; --with all inodes in the system (i.e. the<br>
&gt; --.BR stat (2)<br>
&gt; --data).<br>
&gt; --A complete overview of extended attributes concepts can be found in<=
br>
&gt; --.BR attr (5).<br>
&gt; --.PP<br>
&gt; --.B setxattr<br>
&gt; --sets the<br>
&gt; --.I value<br>
&gt; --of the extended attribute identified by<br>
&gt; --.I name<br>
&gt; --and associated with the given<br>
&gt; --.I path<br>
&gt; --in the filesystem.<br>
&gt; --The<br>
&gt; --.I size<br>
&gt; --of the<br>
&gt; --.I value<br>
&gt; --must be specified.<br>
&gt; --.PP<br>
&gt; --.B lsetxattr<br>
&gt; --is identical to<br>
&gt; --.BR setxattr ,<br>
&gt; --except in the case of a symbolic link, where the extended attribute =
is<br>
&gt; --set on the link itself, not the file that it refers to.<br>
&gt; --.PP<br>
&gt; --.B fsetxattr<br>
&gt; --is identical to<br>
&gt; --.BR setxattr ,<br>
&gt; --only the extended attribute is set on the open file pointed to by<br=
>
&gt; --.I filedes<br>
&gt; --(as returned by<br>
&gt; --.BR open (2))<br>
&gt; --in place of<br>
&gt; --.IR path .<br>
&gt; --.PP<br>
&gt; --An extended attribute name is a simple NULL-terminated string.<br>
&gt; --The<br>
&gt; --.I name<br>
&gt; --includes a namespace prefix \- there may be several, disjoint<br>
&gt; --namespaces associated with an individual inode.<br>
&gt; --The<br>
&gt; --.I value<br>
&gt; --of an extended attribute is a chunk of arbitrary textual or<br>
&gt; --binary data of specified length.<br>
&gt; --.PP<br>
&gt; --The<br>
&gt; --.I flags<br>
&gt; --parameter can be used to refine the semantics of the operation.<br>
&gt; --XATTR_CREATE specifies a pure create, which fails if the named<br>
&gt; --attribute exists already.<br>
&gt; --XATTR_REPLACE specifies a pure replace operation, which fails if the=
<br>
&gt; --named attribute does not already exist.<br>
&gt; --By default (no flags), the extended attribute will be created if<br>
&gt; --need be, or will simply replace the value if the attribute exists.<b=
r>
&gt; --.SH RETURN VALUE<br>
&gt; --On success, zero is returned.<br>
&gt; --On failure, \-1 is returned and<br>
&gt; --.I errno<br>
&gt; --is set appropriately.<br>
&gt; --.PP<br>
&gt; --If XATTR_CREATE is specified, and the attribute exists already,<br>
&gt; --.I errno<br>
&gt; --is set to EEXIST.<br>
&gt; --If XATTR_REPLACE is specified, and the attribute does not exist,<br>
&gt; --.I errno<br>
&gt; --is set to ENOATTR.<br>
&gt; --.PP<br>
&gt; --If there is insufficient space remaining to store the extended attri=
bute,<br>
&gt; --.I errno<br>
&gt; --is set to either ENOSPC, or EDQUOT if quota enforcement was the caus=
e.<br>
&gt; --.PP<br>
&gt; --If extended attributes are not supported by the filesystem, or are d=
isabled,<br>
&gt; --.I errno<br>
&gt; --is set to ENOTSUP.<br>
&gt; --.PP<br>
&gt; --The errors documented for the<br>
&gt; --.BR stat (2)<br>
&gt; --system call are also applicable here.<br>
&gt; --.SH AUTHORS<br>
&gt; --Andreas Gruenbacher,<br>
&gt; --.RI &lt; <a href=3D"mailto:a.gruenbacher@bestbits.at" target=3D"_bla=
nk">a.gruenbacher@bestbits.at</a> &gt;<br>
&gt; --and the SGI XFS development team,<br>
&gt; --.RI &lt; <a href=3D"mailto:linux-xfs@oss.sgi.com" target=3D"_blank">=
linux-xfs@oss.sgi.com</a> &gt;.<br>
&gt; --Please send any bug reports or comments to these addresses.<br>
&gt; --.SH SEE ALSO<br>
&gt; --.BR getfattr (1),<br>
&gt; --.BR setfattr (1),<br>
&gt; --.BR open (2),<br>
&gt; --.BR stat (2),<br>
&gt; --.BR getxattr (2),<br>
&gt; --.BR listxattr (2),<br>
&gt; --.BR removexattr (2),<br>
&gt; --and<br>
&gt; --.BR attr (5).<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/attr/files/relative-libdir.patch b/m=
eta/recipes-support/attr/files/relative-libdir.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b72bf184d6f..00000000000<br>
&gt; --- a/meta/recipes-support/attr/files/relative-libdir.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -use relative path in symbolic links, or it fails in staging<br>
&gt; -sed expression from udev<br>
&gt; -<br>
&gt; -7/29/2010 - created by Qing He &lt;<a href=3D"mailto:qing.he@intel.co=
m" target=3D"_blank">qing.he@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff -u include.orig/buildmacros include/buildmacros<br>
&gt; ---- include.orig/buildmacros=C2=A0 =C2=A02010-07-29 17:39:48.00000000=
0 +0800<br>
&gt; -+++ include/buildmacros=C2=A0 =C2=A0 =C2=A0 =C2=A0 2010-07-29 18:20:3=
4.000000000 +0800<br>
&gt; -@@ -88,9 +88,11 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0../$(INSTALL) -T so_base $(LIBNAME).lai $(=
PKG_LIB_DIR); \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$(PKG_DEVLIB_DIR)&quot; !=
=3D &quot;x$(PKG_LIB_DIR)&quot; ; then \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a=
 $(PKG_LIB_DIR)/$(LIBNAME).a; \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).l=
a $(PKG_LIB_DIR)/$(LIBNAME).la; \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).so $=
(PKG_DEVLIB_DIR)/$(LIBNAME).so; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 rel_lib_prefix=3D$$(echo $(PKG_LIB_DIR) | sed &=
#39;s,\(^/\|\)[^/][^/]*,..,g&#39;); \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_D=
IR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_D=
IR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 rel_devlib_prefix=3D$$(echo $(PKG_DEVLIB_DIR) |=
 sed &#39;s,\(^/\|\)[^/][^/]*,..,g&#39;); \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_D=
IR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; - else<br>
&gt; - INSTALL_LTLIB_DEV =3D $(INSTALL_LTLIB_STATIC)<br>
&gt; diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-=
support/attr/files/run-ptest<br>
&gt; deleted file mode 100644<br>
&gt; index a6c6867f2d9..00000000000<br>
&gt; --- a/meta/recipes-support/attr/files/run-ptest<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,5 +0,0 @@<br>
&gt; -#!/bin/sh<br>
&gt; -<br>
&gt; -make -C test -k tests root-tests |sed \<br>
&gt; - -e &#39;s|^\[.*\] \(.*\) -- ok$|PASS: \1|&#39; \<br>
&gt; - -e &#39;s|^\[.*\] \(.*\) -- failed|FAIL: \1|&#39;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000056b6d80599b01ad3--
