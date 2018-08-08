Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 29DED78DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id w10-v6so1271800pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Vub3XpAan42zrV7AZNmbaOaLHvNh5nFjVR/yJgnAYeY=;
	b=I4qLssa6DGztjhwvUkDb30czWvu2A+1Ub2VuIJZKzYh+nIw/M2whSCAIgYpWQJZW0l
	A5/WUffPQp/jK+1j0FIULYQ3bWHO1ItZX8fjWKHRUyydtDBevRriTf26d1ikCp14OEQq
	oBgSdKajs1KHfUn1Pth8Kd9tuuh8pu2eHWPOeFgAKoGrbBPicfp3MF59CQiRKITEmhJR
	wLo1MCDRsXh7Vd1LhtSH+JJGDJOW0iE0VYoM5eoj/iRS/1J5NnogBsa0TO4HEt6G5oNB
	51nu+LkZNffXvpLpA8pdNV6lRiXUGUfUWb+YzxcnNTX9RcX6uyr5vVFh/kKPtjU7akCN
	y2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Vub3XpAan42zrV7AZNmbaOaLHvNh5nFjVR/yJgnAYeY=;
	b=jO7GoMKuxmfQw8jd3K3Ej89HC3zRsq+XGr3i3vMVy9FkU8d1iX6v+q2TGaMbI7CDXf
	Js2tDD6xJYW+GiMlCg4VKGjmCeJnel7/ipDMMsKeHJYhgyIgCrW6p+N7ySQkbbW+OtY7
	mrgnoQH6TFqgeD/bewJMB3hkh7qXa5beuDtQaN4r/WzWXfRbdEfOZvS8wxohjEjG4lRB
	fdfuw2CgL0k+gr+1mybOLU8KTOK34MXsGSc9b1ReAG60t60OKY/BDc1EYEbPvH7yCLFr
	6Z+xKbtaH+TvHaYbGSrMwxK0mqGEWjyhIAN1H+3ltEJZTzZvyuzm8lwq/XiYJ3fLtnMv
	gkcA==
X-Gm-Message-State: AOUpUlGBOwEO/Oqr8phlYqIbln2r6hhMIX/9F1taalpE+MfPIhGvn+0K
	3l9go5tBq/I5UbaeD4ZI+3Lil4OU
X-Google-Smtp-Source: AA+uWPxexq4oXy6QX8MNCk2aeWr4jt7FT+3lQt4C6Shh5LDva5RpitCPB9M9hPzJLRlID8Ij61iNGw==
X-Received: by 2002:a63:1015:: with SMTP id
	f21-v6mr3112856pgl.354.1533742549489; 
	Wed, 08 Aug 2018 08:35:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:21 -0700
Message-Id: <1533742522-24357-26-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 26/27] binutls: Security fix for CVE-2017-17122
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:48 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-17122.patch         | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17122.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index c1d5740..577bbf0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -62,6 +62,7 @@ SRC_URI = "\
      file://CVE-2017-16832.patch \
      file://CVE-2017-17080.patch \
      file://CVE-2017-17121.patch \
+     file://CVE-2017-17122.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17122.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17122.patch
new file mode 100644
index 0000000..5ae749b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17122.patch
@@ -0,0 +1,58 @@
+From d785b7d4b877ed465d04072e17ca19d0f47d840f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 29 Nov 2017 12:40:43 +0000
+Subject: [PATCH] Stop objdump from attempting to allocate a huge chunk of
+ memory when parsing relocs in a corrupt file.
+
+	PR 22508
+	* objdump.c (dump_relocs_in_section): Also check the section's
+	relocation count to make sure that it is reasonable before
+	attempting to allocate space for the relocs.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE:  CVE-2017-17122
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  7 +++++++
+ binutils/objdump.c | 11 ++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -3381,7 +3381,16 @@ dump_relocs_in_section (bfd *abfd,
+     }
+ 
+   if ((bfd_get_file_flags (abfd) & (BFD_IN_MEMORY | BFD_LINKER_CREATED)) == 0
+-      && (ufile_ptr) relsize > bfd_get_file_size (abfd))
++      && (((ufile_ptr) relsize > bfd_get_file_size (abfd))
++	  /* Also check the section's reloc count since if this is negative
++	     (or very large) the computation in bfd_get_reloc_upper_bound
++	     may have resulted in returning a small, positive integer.
++	     See PR 22508 for a reproducer.
++
++	     Note - we check against file size rather than section size as
++	     it is possible for there to be more relocs that apply to a
++	     section than there are bytes in that section.  */
++	  || (section->reloc_count > bfd_get_file_size (abfd))))
+     {
+       printf (" (too many: 0x%x)\n", section->reloc_count);
+       bfd_set_error (bfd_error_file_truncated);
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,10 @@
++2017-11-29  Nick Clifton  <nickc@redhat.com>
++
++       PR 22508
++       * objdump.c (dump_relocs_in_section): Also check the section's
++       relocation count to make sure that it is reasonable before
++       attempting to allocate space for the relocs.
++
+ 2017-11-02  Mingi Cho  <mgcho.minic@gmail.com>
+ 
+        PR 22384
-- 
2.7.4


