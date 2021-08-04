Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.7001.1628071961400921669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 03:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qAUllnZx;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id b5so659727uaj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmZmEHNkQBlvvJLc97+2qrlwn5C9zvsNwDxQ4T24Sa4=;
        b=qAUllnZx54TG1b3vskjCfqPZfMGPj6fjF+XlEvYy3gpCEv8EhZRw2rPSGjAfr9Q2X+
         IM0wM5cRw4bpL7vOPZXgNNaIBbY5bAcckZKlBhx0Y8RxMqzz+rfAuA6AVYMjWRNJnxXq
         6p2eTFEx7ZZqNbt1p9shLRiDw79CK4vlHENHNOnzmiRorOXNTB6rcf/KA1ARnPZtsy/D
         spy8NQKeRV6Ht/4qdLuMuGKB496jTzC9JGy0FePzRlCSN734BhH+c0xGlZTuyuMIbEwz
         6rAx8xOl8Y24SPbuVDHy9VkSiztLoslhgLxJaF/EwLOczxkW9hREai7SPuN6muyB2Mbh
         xTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmZmEHNkQBlvvJLc97+2qrlwn5C9zvsNwDxQ4T24Sa4=;
        b=mgHNqTcisR9jJCMH1JWTu2K1aWc5tTGf0J+RGJU6ohEGB20IxlkoCGz4WdTHUQyMsu
         E9A887F2RPuei3Z1YNT4eRG3KDOMG5/G5vUiHBE3aIuu8XynUlojDF/Hsf6vMB9yt9ps
         849eZpDI2wsdekXDxDKvwplkeblIVI/JuFa1DEdTSw7P9EKjlwnKTRz4zbboh7Pub3Ia
         XmW9JajlXRwUsj7yiZjoeMw69MNPJ7D5oVk+oYCeyJkfelNXISX1YMN+kby2doR/0x7e
         et/jzMsEKHCj0aws3x7wWNTieFQtsKBp4d9mC/irlRhtfOgsWFHwWheMvRU9rcy1qHu6
         ODFw==
X-Gm-Message-State: AOAM530mU5ERwjjhXt/EB8JnGybR1HOrHIVzOC6i735x5XnurErGTTC+
	+K2TtpdEzOu/t1vfim+x7syHwo5fOTiId56dtjU=
X-Google-Smtp-Source: ABdhPJyzRCc0fncf84Op2qX8X1sp291RiDg2426sHG9lLlfF5OxQz6CzwXT1fWViOg9SeeclIAa8Qo0wIk4ioXXGiiE=
X-Received: by 2002:ab0:60c9:: with SMTP id g9mr9616222uam.100.1628071960316;
 Wed, 04 Aug 2021 03:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
 <20210730114507.732448-6-alex.kanavin@gmail.com> <29613ec1-ed8d-6fdc-284c-cb6ce31d9dce@windriver.com>
In-Reply-To: <29613ec1-ed8d-6fdc-284c-cb6ce31d9dce@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 4 Aug 2021 12:12:28 +0200
Message-ID: <CANNYZj8ZH5K3Ok2n=xoCGBZ-fQEp9u_HR1prctbZu4RHpBf6Zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/9] shadow: update 4.8.1 -> 4.9
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dd0f3d05c8b90a81"

--000000000000dd0f3d05c8b90a81
Content-Type: text/plain; charset="UTF-8"

Yes, plaintext passwords can no longer be there, which is a good thing I'd
say? The hashed/salted passwords can still be provided through the same
class, but this needs to be documented, and perhaps tested too.

Alex

On Wed, 4 Aug 2021 at 10:39, Yi Zhao <yi.zhao@windriver.com> wrote:

>
> On 7/30/21 7:45 PM, Alexander Kanavin wrote:
>
> Add a couple backports to fix builds.
>
> Drop 0002-Allow-for-setting-password-in-clear-text.patch;
> what it adds is horribly insecure and AB testing didn't reveal any
> regressions or use cases for it.
>
> Dropping this patch makes the password setting function in
> extrausers.bbclass unavailable:
> https://docs.yoctoproject.org/singleindex.html#extrausers-bbclass
>
>
> //Yi
>
>
> Drop /etc/default/ tweaks as files are no longer installed there.
>
> Drop manpage alternatives as manpages are no longer installed.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com> <alex.kanavin@gmail.com>
> ---
>  ...01-Disable-use-of-syslog-for-sysroot.patch |  29 +-
>  ...builds-with-respect-to-libsubid-incl.patch | 114 +++++++
>  .../0001-libsubid-link-to-PAM-libraries.patch |  31 ++
>  ...w-for-setting-password-in-clear-text.patch | 301 ------------------
>  ...nexpected-open-failure-in-chroot-env.patch |   6 +-
>  meta/recipes-extended/shadow/shadow.inc       |  21 +-
>  .../shadow/{shadow_4.8.1.bb => shadow_4.9.bb} |   0
>  7 files changed, 167 insertions(+), 335 deletions(-)
>  create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
>  create mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
>  delete mode 100644 meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
>  rename meta/recipes-extended/shadow/{shadow_4.8.1.bb => shadow_4.9.bb} (100%)
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> index ab317b9aa0..95728bcd3f 100644
> --- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> +++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
> @@ -1,4 +1,4 @@
> -From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
> +From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
>  From: Scott Garman <scott.a.garman@intel.com> <scott.a.garman@intel.com>
>  Date: Thu, 14 Apr 2016 12:28:57 +0200
>  Subject: [PATCH] Disable use of syslog for sysroot
> @@ -19,12 +19,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com> <Qi.Chen@windriver.com>
>   src/groupmems.c | 3 +++
>   src/groupmod.c  | 3 +++
>   src/useradd.c   | 3 +++
> - src/userdel.c   | 3 +++
> + src/userdel.c   | 4 ++++
>   src/usermod.c   | 3 +++
> - 7 files changed, 21 insertions(+)
> + 7 files changed, 22 insertions(+)
>
>  diff --git a/src/groupadd.c b/src/groupadd.c
> -index 2dd8eec..e9c4bb7 100644
> +index d7f68b1..5fe5f43 100644
>  --- a/src/groupadd.c
>  +++ b/src/groupadd.c
>  @@ -34,6 +34,9 @@
> @@ -38,7 +38,7 @@ index 2dd8eec..e9c4bb7 100644
>   #include <fcntl.h>
>   #include <getopt.h>
>  diff --git a/src/groupdel.c b/src/groupdel.c
> -index f941a84..5a70056 100644
> +index 5c89312..2aefc5a 100644
>  --- a/src/groupdel.c
>  +++ b/src/groupdel.c
>  @@ -34,6 +34,9 @@
> @@ -52,7 +52,7 @@ index f941a84..5a70056 100644
>   #include <fcntl.h>
>   #include <grp.h>
>  diff --git a/src/groupmems.c b/src/groupmems.c
> -index fc91c8b..2842514 100644
> +index 654a8f3..6b2026b 100644
>  --- a/src/groupmems.c
>  +++ b/src/groupmems.c
>  @@ -32,6 +32,9 @@
> @@ -66,7 +66,7 @@ index fc91c8b..2842514 100644
>   #include <getopt.h>
>   #include <grp.h>
>  diff --git a/src/groupmod.c b/src/groupmod.c
> -index 1dca5fc..bc14438 100644
> +index acd6f35..a2c5247 100644
>  --- a/src/groupmod.c
>  +++ b/src/groupmod.c
>  @@ -34,6 +34,9 @@
> @@ -80,7 +80,7 @@ index 1dca5fc..bc14438 100644
>   #include <fcntl.h>
>   #include <getopt.h>
>  diff --git a/src/useradd.c b/src/useradd.c
> -index 4af0f7c..1b7bf06 100644
> +index 127177e..b80e505 100644
>  --- a/src/useradd.c
>  +++ b/src/useradd.c
>  @@ -34,6 +34,9 @@
> @@ -94,21 +94,22 @@ index 4af0f7c..1b7bf06 100644
>   #include <ctype.h>
>   #include <errno.h>
>  diff --git a/src/userdel.c b/src/userdel.c
> -index cc951e5..153e0be 100644
> +index 79a7c89..c1e010a 100644
>  --- a/src/userdel.c
>  +++ b/src/userdel.c
> -@@ -34,6 +34,9 @@
> -
> - #ident "$Id$"
> +@@ -31,6 +31,10 @@
> +  */
>
> + #include <config.h>
> ++
>  +/* Disable use of syslog since we're running this command against a sysroot */
>  +#undef USE_SYSLOG
>  +
>   #include <assert.h>
> + #include <dirent.h>
>   #include <errno.h>
> - #include <fcntl.h>
>  diff --git a/src/usermod.c b/src/usermod.c
> -index 05b9871..21c6da9 100644
> +index 03bb9b9..e15fdd4 100644
>  --- a/src/usermod.c
>  +++ b/src/usermod.c
>  @@ -34,6 +34,9 @@
> diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
> new file mode 100644
> index 0000000000..c577be6505
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
> @@ -0,0 +1,114 @@
> +From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
> +From: Serge Hallyn <serge@hallyn.com> <serge@hallyn.com>
> +Date: Fri, 23 Jul 2021 17:51:13 -0500
> +Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
> +
> +There's a better way to do this, and I hope to clean that up,
> +but this fixes out of tree builds for me right now.
> +
> +Closes #386
> +
> +Signed-off-by: Serge Hallyn <serge@hallyn.com> <serge@hallyn.com>
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com> <alex.kanavin@gmail.com>
> +---
> + lib/Makefile.am      | 2 ++
> + libmisc/Makefile.am  | 2 +-
> + libsubid/Makefile.am | 4 ++--
> + src/Makefile.am      | 6 ++++++
> + 4 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index ecf3ee25..5ac2e111 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
> + libshadow_la_CPPFLAGS += -DVENDORDIR=\"$(VENDORDIR)\"
> + endif
> +
> ++libshadow_la_CPPFLAGS += -I$(top_srcdir)
> ++
> + libshadow_la_SOURCES = \
> + 	commonio.c \
> + 	commonio.h \
> +diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
> +index 9766a7ec..9f237e0d 100644
> +--- a/libmisc/Makefile.am
> ++++ b/libmisc/Makefile.am
> +@@ -1,7 +1,7 @@
> +
> + EXTRA_DIST = .indent.pro xgetXXbyYY.c
> +
> +-AM_CPPFLAGS = -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
> ++AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
> +
> + noinst_LTLIBRARIES = libmisc.la
> +
> +diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
> +index 189165b0..cdc41fe6 100644
> +--- a/libsubid/Makefile.am
> ++++ b/libsubid/Makefile.am
> +@@ -19,8 +19,8 @@ MISCLIBS = \
> + 	$(LIBTCB)
> +
> + libsubid_la_LIBADD = \
> +-	$(top_srcdir)/lib/libshadow.la \
> +-	$(top_srcdir)/libmisc/libmisc.la \
> ++	$(top_builddir)/lib/libshadow.la \
> ++	$(top_builddir)/libmisc/libmisc.la \
> + 	$(MISCLIBS) -ldl
> +
> + AM_CPPFLAGS = \
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 35027013..7c1a3491 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -10,6 +10,7 @@ sgidperms = 2755
> + AM_CPPFLAGS = \
> + 	-I${top_srcdir}/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-DLOCALEDIR=\"$(datadir)/locale\"
> +
> + # XXX why are login and su in /bin anyway (other than for
> +@@ -183,6 +184,7 @@ list_subid_ranges_LDADD = \
> + list_subid_ranges_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + get_subid_owners_LDADD = \
> +@@ -194,11 +196,13 @@ get_subid_owners_LDADD = \
> + get_subid_owners_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + new_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + new_subid_range_LDADD = \
> +@@ -210,6 +214,7 @@ new_subid_range_LDADD = \
> + free_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> + 	-I$(top_srcdir)/libmisc \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libsubid
> +
> + free_subid_range_LDADD = \
> +@@ -220,6 +225,7 @@ free_subid_range_LDADD = \
> +
> + check_subid_range_CPPFLAGS = \
> + 	-I$(top_srcdir)/lib \
> ++	-I$(top_srcdir) \
> + 	-I$(top_srcdir)/libmisc
> +
> + check_subid_range_LDADD = \
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
> new file mode 100644
> index 0000000000..ea7a99dbf7
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
> @@ -0,0 +1,31 @@
> +From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
> +From: Xi Ruoyao <xry111@mengyan1223.wang> <xry111@mengyan1223.wang>
> +Date: Fri, 23 Jul 2021 14:38:08 +0800
> +Subject: [PATCH] libsubid: link to PAM libraries
> +
> +libsubid.so links to libmisc.a, which contains several routines referring to
> +PAM functions.
> +
> +Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com> <alex.kanavin@gmail.com>
> +---
> + libsubid/Makefile.am | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
> +index cdc41fe6..99308c1f 100644
> +--- a/libsubid/Makefile.am
> ++++ b/libsubid/Makefile.am
> +@@ -16,7 +16,8 @@ MISCLIBS = \
> + 	$(LIBCRYPT) \
> + 	$(LIBACL) \
> + 	$(LIBATTR) \
> +-	$(LIBTCB)
> ++	$(LIBTCB) \
> ++	$(LIBPAM)
> +
> + libsubid_la_LIBADD = \
> + 	$(top_builddir)/lib/libshadow.la \
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> deleted file mode 100644
> index c6332e4f76..0000000000
> --- a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
> +++ /dev/null
> @@ -1,301 +0,0 @@
> -From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com> <Qi.Chen@windriver.com>
> -Date: Sat, 16 Nov 2013 15:27:47 +0800
> -Subject: [PATCH] Allow for setting password in clear text
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com> <Qi.Chen@windriver.com>
> -
> ----
> - src/Makefile.am |  8 ++++----
> - src/groupadd.c  | 20 +++++++++++++++-----
> - src/groupmod.c  | 20 +++++++++++++++-----
> - src/useradd.c   | 21 +++++++++++++++------
> - src/usermod.c   | 20 +++++++++++++++-----
> - 5 files changed, 64 insertions(+), 25 deletions(-)
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index f31fd7a..4a317a3 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
> - chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
> - expiry_LDADD = $(LDADD) $(LIBECONF)
> - gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
> --groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
> - groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> --groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
> - grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> - grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -@@ -127,9 +127,9 @@ su_SOURCES     = \
> - 	suauth.c
> - su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)
> - sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
> --useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> -+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> - userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBECONF)
> --usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
> -+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
> - vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
> -
> - install-am: all-am
> -diff --git a/src/groupadd.c b/src/groupadd.c
> -index e9c4bb7..d572c00 100644
> ---- a/src/groupadd.c
> -+++ b/src/groupadd.c
> -@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
> - 	                "                                (non-unique) GID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD use this clear password for the new group\n"), usageout);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       directory prefix\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       directory prefix\n"), usageout);
> - 	(void) fputs ("\n", usageout);
> - 	exit (status);
> - }
> -@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
> - 		{"key",        required_argument, NULL, 'K'},
> - 		{"non-unique", no_argument,       NULL, 'o'},
> - 		{"password",   required_argument, NULL, 'p'},
> -+		{"clear-password", required_argument, NULL, 'P'},
> - 		{"system",     no_argument,       NULL, 'r'},
> - 		{"root",       required_argument, NULL, 'R'},
> --		{"prefix",     required_argument, NULL, 'P'},
> -+		{"prefix",     required_argument, NULL, 'A'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> -
> --	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:P:",
> -+	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:A:",
> - 		                 long_options, NULL)) != -1) {
> - 		switch (c) {
> - 		case 'f':
> -@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
> - 			pflg = true;
> - 			group_passwd = optarg;
> - 			break;
> -+		case 'P':
> -+			pflg = true;
> -+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+			break;
> - 		case 'r':
> - 			rflg = true;
> - 			break;
> - 		case 'R': /* no-op, handled in process_root_flag () */
> - 			break;
> --		case 'P': /* no-op, handled in process_prefix_flag () */
> -+		case 'A': /* no-op, handled in process_prefix_flag () */
> -+			fprintf (stderr,
> -+				 _("%s: -A is deliberately not supported \n"),
> -+				 Prog);
> -+			exit (E_BAD_ARG);
> - 			break;
> - 		default:
> - 			usage (E_USAGE);
> -@@ -588,7 +598,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("groupadd");
> - #ifdef WITH_AUDIT
> -diff --git a/src/groupmod.c b/src/groupmod.c
> -index bc14438..25ccb44 100644
> ---- a/src/groupmod.c
> -+++ b/src/groupmod.c
> -@@ -138,8 +138,9 @@ static void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
> - 	                "                                PASSWORD\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs ("\n", usageout);
> - 	exit (status);
> - }
> -@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
> - 		{"new-name",   required_argument, NULL, 'n'},
> - 		{"non-unique", no_argument,       NULL, 'o'},
> - 		{"password",   required_argument, NULL, 'p'},
> -+		{"clear-password", required_argument, NULL, 'P'},
> - 		{"root",       required_argument, NULL, 'R'},
> --		{"prefix",     required_argument, NULL, 'P'},
> -+		{"prefix",     required_argument, NULL, 'A'},
> - 		{NULL, 0, NULL, '\0'}
> - 	};
> --	while ((c = getopt_long (argc, argv, "g:hn:op:R:P:",
> -+	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:A:",
> - 		                 long_options, NULL)) != -1) {
> - 		switch (c) {
> - 		case 'g':
> -@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
> - 			group_passwd = optarg;
> - 			pflg = true;
> - 			break;
> -+		case 'P':
> -+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+			pflg = true;
> -+			break;
> - 		case 'R': /* no-op, handled in process_root_flag () */
> - 			break;
> --		case 'P': /* no-op, handled in process_prefix_flag () */
> -+		case 'A': /* no-op, handled in process_prefix_flag () */
> -+			fprintf (stderr,
> -+				 _("%s: -A is deliberately not supported \n"),
> -+				 Prog);
> -+			exit (E_BAD_ARG);
> - 			break;
> - 		default:
> - 			usage (E_USAGE);
> -@@ -761,7 +771,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("groupmod");
> - #ifdef WITH_AUDIT
> -diff --git a/src/useradd.c b/src/useradd.c
> -index 1b7bf06..44f09e2 100644
> ---- a/src/useradd.c
> -+++ b/src/useradd.c
> -@@ -853,9 +853,10 @@ static void usage (int status)
> - 	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
> - 	                "                                (non-unique) UID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD clear password of the new account\n"), usageout);
> - 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
> - 	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), usageout);
> - 	(void) fputs (_("  -U, --user-group              create a group with the same name as the user\n"), usageout);
> -@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
> - 			{"no-user-group",  no_argument,       NULL, 'N'},
> - 			{"non-unique",     no_argument,       NULL, 'o'},
> - 			{"password",       required_argument, NULL, 'p'},
> -+			{"clear-password", required_argument, NULL, 'P'},
> - 			{"system",         no_argument,       NULL, 'r'},
> - 			{"root",           required_argument, NULL, 'R'},
> --			{"prefix",         required_argument, NULL, 'P'},
> -+			{"prefix",         required_argument, NULL, 'A'},
> - 			{"shell",          required_argument, NULL, 's'},
> - 			{"uid",            required_argument, NULL, 'u'},
> - 			{"user-group",     no_argument,       NULL, 'U'},
> -@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> - #ifdef WITH_SELINUX
> --		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:UZ:",
> -+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:UZ:",
> - #else				/* !WITH_SELINUX */
> --		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U",
> -+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:U",
> - #endif				/* !WITH_SELINUX */
> - 		                         long_options, NULL)) != -1) {
> - 			switch (c) {
> -@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
> - 				}
> - 				user_pass = optarg;
> - 				break;
> -+			case 'P': /* set clear text password */
> -+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+				break;
> - 			case 'r':
> - 				rflg = true;
> - 				break;
> - 			case 'R': /* no-op, handled in process_root_flag () */
> - 				break;
> --			case 'P': /* no-op, handled in process_prefix_flag () */
> -+			case 'A': /* no-op, handled in process_prefix_flag () */
> -+				fprintf (stderr,
> -+					 _("%s: -A is deliberately not supported \n"),
> -+					 Prog);
> -+				exit (E_BAD_ARG);
> - 				break;
> - 			case 's':
> - 				if (   ( !VALID (optarg) )
> -@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
> -
> - 	process_root_flag ("-R", argc, argv);
> -
> --	prefix = process_prefix_flag("-P", argc, argv);
> -+	prefix = process_prefix_flag("-A", argc, argv);
> -
> - 	OPENLOG ("useradd");
> - #ifdef WITH_AUDIT
> -diff --git a/src/usermod.c b/src/usermod.c
> -index 21c6da9..cffdb3e 100644
> ---- a/src/usermod.c
> -+++ b/src/usermod.c
> -@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
> - 	                "                                new location (use only with -d)\n"), usageout);
> - 	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
> - 	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
> -+	(void) fputs (_("  -P, --clear-password PASSWORD use clear password for the new password\n"), usageout);
> - 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
> --	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> -+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
> - 	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
> - 	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
> - 	(void) fputs (_("  -U, --unlock                  unlock the user account\n"), usageout);
> -@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
> - 			{"move-home",    no_argument,       NULL, 'm'},
> - 			{"non-unique",   no_argument,       NULL, 'o'},
> - 			{"password",     required_argument, NULL, 'p'},
> -+			{"clear-password", required_argument, NULL, 'P'},
> - 			{"root",         required_argument, NULL, 'R'},
> --			{"prefix",       required_argument, NULL, 'P'},
> -+			{"prefix",       required_argument, NULL, 'A'},
> - 			{"shell",        required_argument, NULL, 's'},
> - 			{"uid",          required_argument, NULL, 'u'},
> - 			{"unlock",       no_argument,       NULL, 'U'},
> -@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
> - 			{NULL, 0, NULL, '\0'}
> - 		};
> - 		while ((c = getopt_long (argc, argv,
> --		                         "abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
> -+		                         "abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
> - #ifdef ENABLE_SUBIDS
> - 		                         "v:w:V:W:"
> - #endif				/* ENABLE_SUBIDS */
> -@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
> - 				user_pass = optarg;
> - 				pflg = true;
> - 				break;
> -+			case 'P':
> -+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
> -+				pflg = true;
> -+				break;
> - 			case 'R': /* no-op, handled in process_root_flag () */
> - 				break;
> --			case 'P': /* no-op, handled in process_prefix_flag () */
> -+			case 'A': /* no-op, handled in process_prefix_flag () */
> -+				fprintf (stderr,
> -+					 _("%s: -A is deliberately not supported \n"),
> -+					 Prog);
> -+				exit (E_BAD_ARG);
> - 				break;
> - 			case 's':
> - 				if (!VALID (optarg)) {
> -@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
> - 	(void) textdomain (PACKAGE);
> -
> - 	process_root_flag ("-R", argc, argv);
> --	prefix = process_prefix_flag ("-P", argc, argv);
> -+	prefix = process_prefix_flag ("-A", argc, argv);
> -
> - 	OPENLOG ("usermod");
> - #ifdef WITH_AUDIT
> diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> index 9825216369..bd24626a26 100644
> --- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> +++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> @@ -1,4 +1,4 @@
> -From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
> +From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com> <Qi.Chen@windriver.com>
>  Date: Thu, 17 Jul 2014 15:53:34 +0800
>  Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
> @@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com> <Qi.Chen@windriver.com>
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
>  diff --git a/lib/commonio.c b/lib/commonio.c
> -index 16fa7e7..d6bc297 100644
> +index cef404b..66908fb 100644
>  --- a/lib/commonio.c
>  +++ b/lib/commonio.c
> -@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode)
> +@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode)
>   	db->cursor = NULL;
>   	db->changed = false;
>
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 2cbdfbc1cf..51d2ca5f16 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
>  DEPENDS = "virtual/crypt"
>
>  UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases" <https://github.com/shadow-maint/shadow/releases>
> -SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
> +SRC_URI = " <https://github.com/shadow-maint/shadow/releases/download/$%7BPV%7D/$%7BBP%7D.tar.gz%5C+SRC_URI=>https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz \
>             file://shadow-4.1.3-dots-in-usernames.patch \
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
>             file://shadow-relaxed-usernames.patch \
> +           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
> +           file://0001-libsubid-link-to-PAM-libraries.patch \
>             "
>
>  SRC_URI_append_class-target = " \
> @@ -23,15 +25,13 @@ SRC_URI_append_class-target = " \
>
>  SRC_URI_append_class-native = " \
>             file://0001-Disable-use-of-syslog-for-sysroot.patch \
> -           file://0002-Allow-for-setting-password-in-clear-text.patch \
>             file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>             "
>  SRC_URI_append_class-nativesdk = " \
>             file://0001-Disable-use-of-syslog-for-sysroot.patch \
>             "
>
> -SRC_URI[md5sum] = "3d97f11e66bfb0b14702b115fa8be480"
> -SRC_URI[sha256sum] = "3ee3081fbbcbcfea5c8916419e46bc724807bab271072104f23e7a29e9668f3a"
> +SRC_URI[sha256sum] = "6c4627ff9c9422b96664517ae753c944f2902e92809d0698b65f5fef11985212"
>
>  # Additional Policy files for PAM
>  PAM_SRC_URI = "file://pam.d/chfn \
> @@ -115,12 +115,6 @@ do_install() {
>  	# Use proper encryption for passwords
>  	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
>
> -	# Now we don't have a mail system. Disable mail creation for now.
> -	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
> -	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
> -
> -	# Use users group by default
> -	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
>  }
>
>  do_install_append() {
> @@ -184,13 +178,6 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
>  ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
>  ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
>
> -ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1 nologin.8"
> -ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
> -ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
> -ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
> -ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
> -ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
> -
>  PACKAGE_WRITE_DEPS += "shadow-native"
>  pkg_postinst_${PN}_class-target () {
>  	if [ "x$D" != "x" ]; then
> diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.9.bb
> similarity index 100%
> rename from meta/recipes-extended/shadow/shadow_4.8.1.bb
> rename to meta/recipes-extended/shadow/shadow_4.9.bb
>
>
> 
>
>
>

--000000000000dd0f3d05c8b90a81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, plaintext passwords can no longer be there, whic=
h is a good thing I&#39;d say? The hashed/salted passwords can still be pro=
vided through the same class, but this needs to be documented, and perhaps =
tested too.<br></div><div><br></div><div>Alex<br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 4 Aug 2021 =
at 10:39, Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">

  
  <div>
    <p><br>
    </p>
    <div>On 7/30/21 7:45 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Add a couple backports to fix builds.

Drop 0002-Allow-for-setting-password-in-clear-text.patch;
what it adds is horribly insecure and AB testing didn&#39;t reveal any
regressions or use cases for it.</pre>
    </blockquote>
    <p>Dropping this patch makes the password setting function in
      extrausers.bbclass unavailable:<br>
      <a href=3D"https://docs.yoctoproject.org/singleindex.html#extrausers=
-bbclass" target=3D"_blank">https://docs.yoctoproject.org/singleindex.html#=
extrausers-bbclass</a><br>
    </p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre>Drop /etc/default/ tweaks as files are no longer installed ther=
e.

Drop manpage alternatives as manpages are no longer installed.

Signed-off-by: Alexander Kanavin <a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">&lt;alex.kanavin@gmail.com&gt;</a>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch |  29 +-
 ...builds-with-respect-to-libsubid-incl.patch | 114 +++++++
 .../0001-libsubid-link-to-PAM-libraries.patch |  31 ++
 ...w-for-setting-password-in-clear-text.patch | 301 ------------------
 ...nexpected-open-failure-in-chroot-env.patch |   6 +-
 meta/recipes-extended/shadow/shadow.inc       |  21 +-
 .../shadow/{<a href=3D"http://shadow_4.8.1.bb" target=3D"_blank">shadow_4=
.8.1.bb</a> =3D&gt; <a href=3D"http://shadow_4.9.bb" target=3D"_blank">shad=
ow_4.9.bb</a>} |   0
 7 files changed, 167 insertions(+), 335 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tre=
e-builds-with-respect-to-libsubid-incl.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-=
to-PAM-libraries.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0002-Allow-for-sett=
ing-password-in-clear-text.patch
 rename meta/recipes-extended/shadow/{<a href=3D"http://shadow_4.8.1.bb" t=
arget=3D"_blank">shadow_4.8.1.bb</a> =3D&gt; <a href=3D"http://shadow_4.9.b=
b" target=3D"_blank">shadow_4.9.bb</a>} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog=
-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of=
-syslog-for-sysroot.patch
index ab317b9aa0..95728bcd3f 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sy=
sroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sy=
sroot.patch
@@ -1,4 +1,4 @@
-From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
+From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
 From: Scott Garman <a href=3D"mailto:scott.a.garman@intel.com" target=3D"=
_blank">&lt;scott.a.garman@intel.com&gt;</a>
 Date: Thu, 14 Apr 2016 12:28:57 +0200
 Subject: [PATCH] Disable use of syslog for sysroot
@@ -19,12 +19,12 @@ Signed-off-by: Chen Qi <a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">&lt;Qi.Chen@windriver.com&gt;</a>
  src/groupmems.c | 3 +++
  src/groupmod.c  | 3 +++
  src/useradd.c   | 3 +++
- src/userdel.c   | 3 +++
+ src/userdel.c   | 4 ++++
  src/usermod.c   | 3 +++
- 7 files changed, 21 insertions(+)
+ 7 files changed, 22 insertions(+)
=20
 diff --git a/src/groupadd.c b/src/groupadd.c
-index 2dd8eec..e9c4bb7 100644
+index d7f68b1..5fe5f43 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
 @@ -34,6 +34,9 @@
@@ -38,7 +38,7 @@ index 2dd8eec..e9c4bb7 100644
  #include &lt;fcntl.h&gt;
  #include &lt;getopt.h&gt;
 diff --git a/src/groupdel.c b/src/groupdel.c
-index f941a84..5a70056 100644
+index 5c89312..2aefc5a 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
 @@ -34,6 +34,9 @@
@@ -52,7 +52,7 @@ index f941a84..5a70056 100644
  #include &lt;fcntl.h&gt;
  #include &lt;grp.h&gt;
 diff --git a/src/groupmems.c b/src/groupmems.c
-index fc91c8b..2842514 100644
+index 654a8f3..6b2026b 100644
 --- a/src/groupmems.c
 +++ b/src/groupmems.c
 @@ -32,6 +32,9 @@
@@ -66,7 +66,7 @@ index fc91c8b..2842514 100644
  #include &lt;getopt.h&gt;
  #include &lt;grp.h&gt;
 diff --git a/src/groupmod.c b/src/groupmod.c
-index 1dca5fc..bc14438 100644
+index acd6f35..a2c5247 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
 @@ -34,6 +34,9 @@
@@ -80,7 +80,7 @@ index 1dca5fc..bc14438 100644
  #include &lt;fcntl.h&gt;
  #include &lt;getopt.h&gt;
 diff --git a/src/useradd.c b/src/useradd.c
-index 4af0f7c..1b7bf06 100644
+index 127177e..b80e505 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -34,6 +34,9 @@
@@ -94,21 +94,22 @@ index 4af0f7c..1b7bf06 100644
  #include &lt;ctype.h&gt;
  #include &lt;errno.h&gt;
 diff --git a/src/userdel.c b/src/userdel.c
-index cc951e5..153e0be 100644
+index 79a7c89..c1e010a 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
-@@ -34,6 +34,9 @@
-=20
- #ident &quot;$Id$&quot;
+@@ -31,6 +31,10 @@
+  */
  
+ #include &lt;config.h&gt;
++
 +/* Disable use of syslog since we&#39;re running this command against a =
sysroot */
 +#undef USE_SYSLOG
 +
  #include &lt;assert.h&gt;
+ #include &lt;dirent.h&gt;
  #include &lt;errno.h&gt;
- #include &lt;fcntl.h&gt;
 diff --git a/src/usermod.c b/src/usermod.c
-index 05b9871..21c6da9 100644
+index 03bb9b9..e15fdd4 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
 @@ -34,6 +34,9 @@
diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-build=
s-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/=
0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
new file mode 100644
index 0000000000..c577be6505
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-=
respect-to-libsubid-incl.patch
@@ -0,0 +1,114 @@
+From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <a href=3D"mailto:serge@hallyn.com" target=3D"_blank">=
&lt;serge@hallyn.com&gt;</a>
+Date: Fri, 23 Jul 2021 17:51:13 -0500
+Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
+
+There&#39;s a better way to do this, and I hope to clean that up,
+but this fixes out of tree builds for me right now.
+
+Closes #386
+
+Signed-off-by: Serge Hallyn <a href=3D"mailto:serge@hallyn.com" target=3D=
"_blank">&lt;serge@hallyn.com&gt;</a>
+Upstream-Status: Backport [<a href=3D"https://github.com/shadow-maint/sha=
dow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1" target=3D"_blank">http=
s://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85=
eb0ebf1</a>]
+Signed-off-by: Alexander Kanavin <a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ lib/Makefile.am      | 2 ++
+ libmisc/Makefile.am  | 2 +-
+ libsubid/Makefile.am | 4 ++--
+ src/Makefile.am      | 6 ++++++
+ 4 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index ecf3ee25..5ac2e111 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
+ libshadow_la_CPPFLAGS +=3D -DVENDORDIR=3D\&quot;$(VENDORDIR)\&quot;
+ endif
+=20
++libshadow_la_CPPFLAGS +=3D -I$(top_srcdir)
++
+ libshadow_la_SOURCES =3D \
+ =09commonio.c \
+ =09commonio.h \
+diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
+index 9766a7ec..9f237e0d 100644
+--- a/libmisc/Makefile.am
++++ b/libmisc/Makefile.am
+@@ -1,7 +1,7 @@
+=20
+ EXTRA_DIST =3D .<a href=3D"http://indent.pro" target=3D"_blank">indent.p=
ro</a> xgetXXbyYY.c
+=20
+-AM_CPPFLAGS =3D -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
++AM_CPPFLAGS =3D -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
+=20
+ noinst_LTLIBRARIES =3D <a href=3D"http://libmisc.la" target=3D"_blank">l=
ibmisc.la</a>
+=20
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index 189165b0..cdc41fe6 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -19,8 +19,8 @@ MISCLIBS =3D \
+ =09$(LIBTCB)
+=20
+ libsubid_la_LIBADD =3D \
+-	$(top_srcdir)/lib/<a href=3D"http://libshadow.la" target=3D"_blank">lib=
shadow.la</a> \
+-	$(top_srcdir)/libmisc/<a href=3D"http://libmisc.la" target=3D"_blank">l=
ibmisc.la</a> \
++	$(top_builddir)/lib/<a href=3D"http://libshadow.la" target=3D"_blank">l=
ibshadow.la</a> \
++	$(top_builddir)/libmisc/<a href=3D"http://libmisc.la" target=3D"_blank"=
>libmisc.la</a> \
+ =09$(MISCLIBS) -ldl
+=20
+ AM_CPPFLAGS =3D \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 35027013..7c1a3491 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -10,6 +10,7 @@ sgidperms =3D 2755
+ AM_CPPFLAGS =3D \
+ =09-I${top_srcdir}/lib \
+ =09-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ =09-DLOCALEDIR=3D\&quot;$(datadir)/locale\&quot;
+=20
+ # XXX why are login and su in /bin anyway (other than for
+@@ -183,6 +184,7 @@ list_subid_ranges_LDADD =3D \
+ list_subid_ranges_CPPFLAGS =3D \
+ =09-I$(top_srcdir)/lib \
+ =09-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ =09-I$(top_srcdir)/libsubid
+=20
+ get_subid_owners_LDADD =3D \
+@@ -194,11 +196,13 @@ get_subid_owners_LDADD =3D \
+ get_subid_owners_CPPFLAGS =3D \
+ =09-I$(top_srcdir)/lib \
+ =09-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ =09-I$(top_srcdir)/libsubid
+=20
+ new_subid_range_CPPFLAGS =3D \
+ =09-I$(top_srcdir)/lib \
+ =09-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ =09-I$(top_srcdir)/libsubid
+=20
+ new_subid_range_LDADD =3D \
+@@ -210,6 +214,7 @@ new_subid_range_LDADD =3D \
+ free_subid_range_CPPFLAGS =3D \
+ =09-I$(top_srcdir)/lib \
+ =09-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ =09-I$(top_srcdir)/libsubid
+=20
+ free_subid_range_LDADD =3D \
+@@ -220,6 +225,7 @@ free_subid_range_LDADD =3D \
+=20
+ check_subid_range_CPPFLAGS =3D \
+ =09-I$(top_srcdir)/lib \
++	-I$(top_srcdir) \
+ =09-I$(top_srcdir)/libmisc
+=20
+ check_subid_range_LDADD =3D \
+--=20
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-=
libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-=
PAM-libraries.patch
new file mode 100644
index 0000000000..ea7a99dbf7
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-librari=
es.patch
@@ -0,0 +1,31 @@
+From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <a href=3D"mailto:xry111@mengyan1223.wang" target=3D"_bla=
nk">&lt;xry111@mengyan1223.wang&gt;</a>
+Date: Fri, 23 Jul 2021 14:38:08 +0800
+Subject: [PATCH] libsubid: link to PAM libraries
+
+libsubid.so links to libmisc.a, which contains several routines referring=
 to
+PAM functions.
+
+Upstream-Status: Backport [<a href=3D"https://github.com/shadow-maint/sha=
dow/commit/f4a84efb468b8be21be124700ce35159c444e9d6" target=3D"_blank">http=
s://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c=
444e9d6</a>]
+Signed-off-by: Alexander Kanavin <a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">&lt;alex.kanavin@gmail.com&gt;</a>
+---
+ libsubid/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index cdc41fe6..99308c1f 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -16,7 +16,8 @@ MISCLIBS =3D \
+ =09$(LIBCRYPT) \
+ =09$(LIBACL) \
+ =09$(LIBATTR) \
+-	$(LIBTCB)
++	$(LIBTCB) \
++	$(LIBPAM)
+=20
+ libsubid_la_LIBADD =3D \
+ =09$(top_builddir)/lib/<a href=3D"http://libshadow.la" target=3D"_blank"=
>libshadow.la</a> \
+--=20
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-pas=
sword-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-f=
or-setting-password-in-clear-text.patch
deleted file mode 100644
index c6332e4f76..0000000000
--- a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-i=
n-clear-text.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
-From: Chen Qi <a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">=
&lt;Qi.Chen@windriver.com&gt;</a>
-Date: Sat, 16 Nov 2013 15:27:47 +0800
-Subject: [PATCH] Allow for setting password in clear text
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank">&lt;Qi.Chen@windriver.com&gt;</a>
-
----
- src/Makefile.am |  8 ++++----
- src/groupadd.c  | 20 +++++++++++++++-----
- src/groupmod.c  | 20 +++++++++++++++-----
- src/useradd.c   | 21 +++++++++++++++------
- src/usermod.c   | 20 +++++++++++++++-----
- 5 files changed, 64 insertions(+), 25 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f31fd7a..4a317a3 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -103,10 +103,10 @@ chsh_LDADD     =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $=
(LIBSELINUX) $(LIBCRYPT_NOPAM)
- chpasswd_LDADD =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRY=
PT) $(LIBECONF)
- expiry_LDADD =3D $(LDADD) $(LIBECONF)
- gpasswd_LDADD  =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBE=
CONF)
--groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF)
-+groupadd_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF) $(LIBCRYPT)
- groupdel_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF)
- groupmems_LDADD =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBEC=
ONF)
--groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF)
-+groupmod_LDADD =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBECONF) $(LIBCRYPT)
- grpck_LDADD    =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpconv_LDADD  =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpunconv_LDADD =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-@@ -127,9 +127,9 @@ su_SOURCES     =3D \
- =09suauth.c
- su_LDADD       =3D $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LI=
BSKEY) $(LIBMD) $(LIBECONF)
- sulogin_LDADD  =3D $(LDADD) $(LIBCRYPT) $(LIBECONF)
--useradd_LDADD  =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+useradd_LDADD  =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- userdel_LDADD  =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBSEMANAGE) $(LIBECONF)
--usermod_LDADD  =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+usermod_LDADD  =3D $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(L=
IBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- vipw_LDADD     =3D $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-=20
- install-am: all-am
-diff --git a/src/groupadd.c b/src/groupadd.c
-index e9c4bb7..d572c00 100644
---- a/src/groupadd.c
-+++ b/src/groupadd.c
-@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
- =09(void) fputs (_(&quot;  -o, --non-unique              allow to create=
 groups with duplicate\n&quot;
- =09                &quot;                                (non-unique) GI=
D\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -p, --password PASSWORD       use this encryp=
ted password for the new group\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD use this clear pa=
ssword for the new group\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -r, --system                  create a system=
 account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to ch=
root into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       directory prefix\=
n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       directory prefix\=
n&quot;), usageout);
- =09(void) fputs (&quot;\n&quot;, usageout);
- =09exit (status);
- }
-@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
- =09	{&quot;key&quot;,        required_argument, NULL, &#39;K&#39;},
- =09	{&quot;non-unique&quot;, no_argument,       NULL, &#39;o&#39;},
- =09	{&quot;password&quot;,   required_argument, NULL, &#39;p&#39;},
-+	=09{&quot;clear-password&quot;, required_argument, NULL, &#39;P&#39;},
- =09	{&quot;system&quot;,     no_argument,       NULL, &#39;r&#39;},
- =09	{&quot;root&quot;,       required_argument, NULL, &#39;R&#39;},
--	=09{&quot;prefix&quot;,     required_argument, NULL, &#39;P&#39;},
-+	=09{&quot;prefix&quot;,     required_argument, NULL, &#39;A&#39;},
- =09	{NULL, 0, NULL, &#39;\0&#39;}
- =09};
-=20
--	while ((c =3D getopt_long (argc, argv, &quot;fg:hK:op:rR:P:&quot;,
-+	while ((c =3D getopt_long (argc, argv, &quot;fg:hK:op:P:rR:A:&quot;,
- =09	                 long_options, NULL)) !=3D -1) {
- =09	switch (c) {
- =09	case &#39;f&#39;:
-@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
- =09	=09pflg =3D true;
- =09	=09group_passwd =3D optarg;
- =09	=09break;
-+	=09case &#39;P&#39;:
-+	=09	pflg =3D true;
-+	=09	group_passwd =3D pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+	=09	break;
- =09	case &#39;r&#39;:
- =09	=09rflg =3D true;
- =09	=09break;
- =09	case &#39;R&#39;: /* no-op, handled in process_root_flag () */
- =09	=09break;
--	=09case &#39;P&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09case &#39;A&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	fprintf (stderr,
-+	=09	=09 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+	=09	=09 Prog);
-+	=09	exit (E_BAD_ARG);
- =09	=09break;
- =09	default:
- =09	=09usage (E_USAGE);
-@@ -588,7 +598,7 @@ int main (int argc, char **argv)
- =09(void) textdomain (PACKAGE);
-=20
- =09process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix =3D process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix =3D process_prefix_flag (&quot;-A&quot;, argc, argv);
-=20
- =09OPENLOG (&quot;groupadd&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/groupmod.c b/src/groupmod.c
-index bc14438..25ccb44 100644
---- a/src/groupmod.c
-+++ b/src/groupmod.c
-@@ -138,8 +138,9 @@ static void usage (int status)
- =09(void) fputs (_(&quot;  -o, --non-unique              allow to use a =
duplicate (non-unique) GID\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -p, --password PASSWORD       change the pass=
word to this (encrypted)\n&quot;
- =09                &quot;                                PASSWORD\n&quot=
;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD change the passwo=
rd to this clear PASSWORD\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to ch=
root into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
- =09(void) fputs (&quot;\n&quot;, usageout);
- =09exit (status);
- }
-@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
- =09	{&quot;new-name&quot;,   required_argument, NULL, &#39;n&#39;},
- =09	{&quot;non-unique&quot;, no_argument,       NULL, &#39;o&#39;},
- =09	{&quot;password&quot;,   required_argument, NULL, &#39;p&#39;},
-+	=09{&quot;clear-password&quot;, required_argument, NULL, &#39;P&#39;},
- =09	{&quot;root&quot;,       required_argument, NULL, &#39;R&#39;},
--	=09{&quot;prefix&quot;,     required_argument, NULL, &#39;P&#39;},
-+	=09{&quot;prefix&quot;,     required_argument, NULL, &#39;A&#39;},
- =09	{NULL, 0, NULL, &#39;\0&#39;}
- =09};
--	while ((c =3D getopt_long (argc, argv, &quot;g:hn:op:R:P:&quot;,
-+	while ((c =3D getopt_long (argc, argv, &quot;g:hn:op:P:R:A:&quot;,
- =09	                 long_options, NULL)) !=3D -1) {
- =09	switch (c) {
- =09	case &#39;g&#39;:
-@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
- =09	=09group_passwd =3D optarg;
- =09	=09pflg =3D true;
- =09	=09break;
-+	=09case &#39;P&#39;:
-+	=09	group_passwd =3D pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+	=09	pflg =3D true;
-+	=09	break;
- =09	case &#39;R&#39;: /* no-op, handled in process_root_flag () */
- =09	=09break;
--	=09case &#39;P&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09case &#39;A&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	fprintf (stderr,
-+	=09	=09 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+	=09	=09 Prog);
-+	=09	exit (E_BAD_ARG);
- =09	=09break;
- =09	default:
- =09	=09usage (E_USAGE);
-@@ -761,7 +771,7 @@ int main (int argc, char **argv)
- =09(void) textdomain (PACKAGE);
-=20
- =09process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix =3D process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix =3D process_prefix_flag (&quot;-A&quot;, argc, argv);
-=20
- =09OPENLOG (&quot;groupmod&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/useradd.c b/src/useradd.c
-index 1b7bf06..44f09e2 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -853,9 +853,10 @@ static void usage (int status)
- =09(void) fputs (_(&quot;  -o, --non-unique              allow to create=
 users with duplicate\n&quot;
- =09                &quot;                                (non-unique) UI=
D\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -p, --password PASSWORD       encrypted passw=
ord of the new account\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD clear password of=
 the new account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -r, --system                  create a system=
 account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to ch=
root into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -s, --shell SHELL             login shell of =
the new account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -u, --uid UID                 user ID of the =
new account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -U, --user-group              create a group =
with the same name as the user\n&quot;), usageout);
-@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
- =09	=09{&quot;no-user-group&quot;,  no_argument,       NULL, &#39;N&#39;=
},
- =09	=09{&quot;non-unique&quot;,     no_argument,       NULL, &#39;o&#39;=
},
- =09	=09{&quot;password&quot;,       required_argument, NULL, &#39;p&#39;=
},
-+	=09	{&quot;clear-password&quot;, required_argument, NULL, &#39;P&#39;},
- =09	=09{&quot;system&quot;,         no_argument,       NULL, &#39;r&#39;=
},
- =09	=09{&quot;root&quot;,           required_argument, NULL, &#39;R&#39;=
},
--	=09	{&quot;prefix&quot;,         required_argument, NULL, &#39;P&#39;},
-+	=09	{&quot;prefix&quot;,         required_argument, NULL, &#39;A&#39;},
- =09	=09{&quot;shell&quot;,          required_argument, NULL, &#39;s&#39;=
},
- =09	=09{&quot;uid&quot;,            required_argument, NULL, &#39;u&#39;=
},
- =09	=09{&quot;user-group&quot;,     no_argument,       NULL, &#39;U&#39;=
},
-@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
- =09	};
- =09	while ((c =3D getopt_long (argc, argv,
- #ifdef WITH_SELINUX
--	=09                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U=
Z:&quot;,
-+	=09                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u=
:UZ:&quot;,
- #else	=09	=09/* !WITH_SELINUX */
--	=09                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U=
&quot;,
-+	=09                         &quot;b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u=
:U&quot;,
- #endif	=09	=09/* !WITH_SELINUX */
- =09	                         long_options, NULL)) !=3D -1) {
- =09	=09switch (c) {
-@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
- =09	=09	}
- =09	=09	user_pass =3D optarg;
- =09	=09	break;
-+	=09	case &#39;P&#39;: /* set clear text password */
-+	=09	=09user_pass =3D pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+	=09	=09break;
- =09	=09case &#39;r&#39;:
- =09	=09	rflg =3D true;
- =09	=09	break;
- =09	=09case &#39;R&#39;: /* no-op, handled in process_root_flag () */
- =09	=09	break;
--	=09	case &#39;P&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	case &#39;A&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	=09fprintf (stderr,
-+	=09	=09	 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+	=09	=09	 Prog);
-+	=09	=09exit (E_BAD_ARG);
- =09	=09	break;
- =09	=09case &#39;s&#39;:
- =09	=09	if (   ( !VALID (optarg) )
-@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
-=20
- =09process_root_flag (&quot;-R&quot;, argc, argv);
-=20
--	prefix =3D process_prefix_flag(&quot;-P&quot;, argc, argv);
-+	prefix =3D process_prefix_flag(&quot;-A&quot;, argc, argv);
-=20
- =09OPENLOG (&quot;useradd&quot;);
- #ifdef WITH_AUDIT
-diff --git a/src/usermod.c b/src/usermod.c
-index 21c6da9..cffdb3e 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
- =09                &quot;                                new location (u=
se only with -d)\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -o, --non-unique              allow using dup=
licate (non-unique) UID\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -p, --password PASSWORD       use encrypted p=
assword for the new password\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -P, --clear-password PASSWORD use clear passwor=
d for the new password\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -R, --root CHROOT_DIR         directory to ch=
root into\n&quot;), usageout);
--	(void) fputs (_(&quot;  -P, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
-+	(void) fputs (_(&quot;  -A, --prefix PREFIX_DIR       prefix directory =
where are located the /etc/* files\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -s, --shell SHELL             new login shell=
 for the user account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -u, --uid UID                 new UID for the=
 user account\n&quot;), usageout);
- =09(void) fputs (_(&quot;  -U, --unlock                  unlock the user=
 account\n&quot;), usageout);
-@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
- =09	=09{&quot;move-home&quot;,    no_argument,       NULL, &#39;m&#39;},
- =09	=09{&quot;non-unique&quot;,   no_argument,       NULL, &#39;o&#39;},
- =09	=09{&quot;password&quot;,     required_argument, NULL, &#39;p&#39;},
-+	=09	{&quot;clear-password&quot;, required_argument, NULL, &#39;P&#39;},
- =09	=09{&quot;root&quot;,         required_argument, NULL, &#39;R&#39;},
--	=09	{&quot;prefix&quot;,       required_argument, NULL, &#39;P&#39;},
-+	=09	{&quot;prefix&quot;,       required_argument, NULL, &#39;A&#39;},
- =09	=09{&quot;shell&quot;,        required_argument, NULL, &#39;s&#39;},
- =09	=09{&quot;uid&quot;,          required_argument, NULL, &#39;u&#39;},
- =09	=09{&quot;unlock&quot;,       no_argument,       NULL, &#39;U&#39;},
-@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
- =09	=09{NULL, 0, NULL, &#39;\0&#39;}
- =09	};
- =09	while ((c =3D getopt_long (argc, argv,
--	=09                         &quot;abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:&quot;
-+	=09                         &quot;abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:&quo=
t;
- #ifdef ENABLE_SUBIDS
- =09	                         &quot;v:w:V:W:&quot;
- #endif	=09	=09/* ENABLE_SUBIDS */
-@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
- =09	=09	user_pass =3D optarg;
- =09	=09	pflg =3D true;
- =09	=09	break;
-+	=09	case &#39;P&#39;:
-+	=09	=09user_pass =3D pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+	=09	=09pflg =3D true;
-+	=09	=09break;
- =09	=09case &#39;R&#39;: /* no-op, handled in process_root_flag () */
- =09	=09	break;
--	=09	case &#39;P&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	case &#39;A&#39;: /* no-op, handled in process_prefix_flag () */
-+	=09	=09fprintf (stderr,
-+	=09	=09	 _(&quot;%s: -A is deliberately not supported \n&quot;),
-+	=09	=09	 Prog);
-+	=09	=09exit (E_BAD_ARG);
- =09	=09	break;
- =09	=09case &#39;s&#39;:
- =09	=09	if (!VALID (optarg)) {
-@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
- =09(void) textdomain (PACKAGE);
-=20
- =09process_root_flag (&quot;-R&quot;, argc, argv);
--	prefix =3D process_prefix_flag (&quot;-P&quot;, argc, argv);
-+	prefix =3D process_prefix_flag (&quot;-A&quot;, argc, argv);
-=20
- =09OPENLOG (&quot;usermod&quot;);
- #ifdef WITH_AUDIT
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-=
open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commo=
nio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 9825216369..bd24626a26 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-fa=
ilure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-fa=
ilure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
+From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
 From: Chen Qi <a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">=
&lt;Qi.Chen@windriver.com&gt;</a>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <a href=3D"mailto:Qi.Chen@windr=
iver.com" target=3D"_blank">&lt;Qi.Chen@windriver.com&gt;</a>
  1 file changed, 12 insertions(+), 4 deletions(-)
=20
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 16fa7e7..d6bc297 100644
+index cef404b..66908fb 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode=
)
+@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode=
)
  	db-&gt;cursor =3D NULL;
  	db-&gt;changed =3D false;
  
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extend=
ed/shadow/shadow.inc
index 2cbdfbc1cf..51d2ca5f16 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM =3D <a>&quot;file://COPYING;md5=3Ded8=
0ff1c2b40843cf5768e5229cf16e5 \
 DEPENDS =3D &quot;</a>virtual/crypt&quot;
=20
 UPSTREAM_CHECK_URI =3D <a href=3D"https://github.com/shadow-maint/shadow/=
releases" target=3D"_blank">&quot;https://github.com/shadow-maint/shadow/re=
leases&quot;</a>
-SRC_URI =3D <a href=3D"https://github.com/shadow-maint/shadow/releases/do=
wnload/$%7BPV%7D/$%7BBP%7D.tar.gz%5C+SRC_URI=3D" target=3D"_blank">&quot;ht=
tps://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
+SRC_URI =3D &quot;</a><a href=3D"https://github.com/shadow-maint/shadow/r=
eleases/download/v$%7BPV%7D/$%7BBP%7D.tar.gz" target=3D"_blank">https://git=
hub.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz</a> \
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pam&#39;, &=
#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \
            file://shadow-relaxed-usernames.patch \
+           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-in=
cl.patch \
+           file://0001-libsubid-link-to-PAM-libraries.patch \
            &quot;
=20
 SRC_URI_append_class-target =3D &quot; \
@@ -23,15 +25,13 @@ SRC_URI_append_class-target =3D &quot; \
=20
 SRC_URI_append_class-native =3D &quot; \
            <a>file://0001-Disable-use-of-syslog-for-sysroot.patch</a> \
-           <a>file://0002-Allow-for-setting-password-in-clear-text.patch<=
/a> \
            <a>file://commonio.c-fix-unexpected-open-failure-in-chroot-env=
.patch</a> \
            &quot;
 SRC_URI_append_class-nativesdk =3D &quot; \
            <a>file://0001-Disable-use-of-syslog-for-sysroot.patch</a> \
            &quot;
=20
-SRC_URI[md5sum] =3D &quot;3d97f11e66bfb0b14702b115fa8be480&quot;
-SRC_URI[sha256sum] =3D &quot;3ee3081fbbcbcfea5c8916419e46bc724807bab27107=
2104f23e7a29e9668f3a&quot;
+SRC_URI[sha256sum] =3D &quot;6c4627ff9c9422b96664517ae753c944f2902e92809d=
0698b65f5fef11985212&quot;
=20
 # Additional Policy files for PAM
 PAM_SRC_URI =3D <a>&quot;file://pam.d/chfn \
@@ -115,12 +115,6 @@ do_install() {
 =09# Use proper encryption for passwords
 =09sed -i &#39;s/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/&#39; ${D}${sy=
sconfdir}/login.defs
=20
-	# Now we don&#39;t have a mail system. Disable mail creation for now.
-	sed -i &#39;s:/bin/bash:/bin/sh:g&#39; ${D}${sysconfdir}/default/useradd
-	sed -i &#39;/^CREATE_MAIL_SPOOL/ s:^:#:&#39; ${D}${sysconfdir}/default/u=
seradd
-
-	# Use users group by default
-	sed -i &#39;s,^GROUP=3D1000,GROUP=3D100,g&#39; ${D}${sysconfdir}/default=
/useradd
 }
=20
 do_install_append() {
@@ -184,13 +178,6 @@ ALTERNATIVE_${PN}-base =3D &quot;</a>newgrp groups lo=
gin su&quot;
 ALTERNATIVE_LINK_NAME[login] =3D &quot;${base_bindir}/login&quot;
 ALTERNATIVE_LINK_NAME[su] =3D &quot;${base_bindir}/su&quot;
=20
-ALTERNATIVE_${PN}-doc =3D &quot;passwd.5 getspnam.3 groups.1 su.1 nologin=
.8&quot;
-ALTERNATIVE_LINK_NAME[passwd.5] =3D &quot;${mandir}/man5/passwd.5&quot;
-ALTERNATIVE_LINK_NAME[getspnam.3] =3D &quot;${mandir}/man3/getspnam.3&quo=
t;
-ALTERNATIVE_LINK_NAME[groups.1] =3D &quot;${mandir}/man1/groups.1&quot;
-ALTERNATIVE_LINK_NAME[su.1] =3D &quot;${mandir}/man1/su.1&quot;
-ALTERNATIVE_LINK_NAME[nologin.8] =3D &quot;${mandir}/man8/nologin.8&quot;
-
 PACKAGE_WRITE_DEPS +=3D &quot;shadow-native&quot;
 pkg_postinst_${PN}_class-target () {
 =09if [ &quot;x$D&quot; !=3D &quot;x&quot; ]; then
diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.8.1.b=
b" target=3D"_blank">shadow_4.8.1.bb</a> b/meta/recipes-extended/shadow/<a =
href=3D"http://shadow_4.9.bb" target=3D"_blank">shadow_4.9.bb</a>
similarity index 100%
rename from meta/recipes-extended/shadow/<a href=3D"http://shadow_4.8.1.bb=
" target=3D"_blank">shadow_4.8.1.bb</a>
rename to meta/recipes-extended/shadow/<a href=3D"http://shadow_4.9.bb" ta=
rget=3D"_blank">shadow_4.9.bb</a>
</pre>
      <br>
      <fieldset></fieldset>
      <pre>

</pre>
    </blockquote>
  </div>

</blockquote></div>

--000000000000dd0f3d05c8b90a81--
