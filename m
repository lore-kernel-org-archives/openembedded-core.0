Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCBF78E39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:40 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id g6-v6so1190875plq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E5a8hW3YPYT+NLYVMMh4wPjfEYLUwLUcemZyer1I1qU=;
	b=Prg66GP0gvZ+ENnk2Lyn6C1FMQBPobAX55Rye4h5lTFscqP0sZHjTj3S4nr3nfUa74
	ZIbqliDqZsrFH8c5VxeP3nVBCgYP6LO4ejOBxSzEHg7TRy0zzY2TsVQY6nabYfY4cmLP
	q3AuF4mM5s75LZumeQZq4il5hnnq4EkerYNUHVFjRkgiDu1Jfbvoeme9zvvqUH7YweFg
	7Qv7mBLyF8ZKgPYHEHZ/SgJn+3qt+qS4h40FXc+jFCJIFtCLJOfhDO5Jrg9ITxDcOZbV
	6/AhtDgzEHu2SckvssD2bskmLwFGAhT+RtfShdCYitAlXSxe16EUgQIOv9F5iksQp6tT
	rYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E5a8hW3YPYT+NLYVMMh4wPjfEYLUwLUcemZyer1I1qU=;
	b=S5ajx2k3xr8yVIXmHO2trkP4dYhUozV4m73UfBq8+oJVwYDY5tCb0s4mGsuXSh3ZP0
	lClYL6VLR5tfHD7C6nLD7hji2DWzrB1LxSsyNbauKbs2kHPiPEC2zg6rsOk4pzTiGzca
	9YdFMI7hNbDNXv6/G7+JtVZ9UMpxezSjqW+bQV9Jz82QzOppa5hdS7/GEsSL6a7zu5bA
	uYmfS1K2M7MHq3q7Bz0kBLoW45BQ864FBAyhWkGAg0QoU06gQ5yxNBHTU/sSWUt8n0KJ
	FELbj+j+3+haW97d+Olt3FsGoxXQnLiARmU5iEQVVXsv918nbTq/cegQSTE7ATPv/Dmx
	Hq6g==
X-Gm-Message-State: AOUpUlFowiM3uGPBv/7Qh7/GyeGwVw3nOIjDtZPE8sm+hq3EidicN6bO
	jJIgbXgjBy1e2Uh5hMBZNRU=
X-Google-Smtp-Source: AA+uWPywz+01R8Wp5Vlzq96IPQ8Q4i7hkXzPQtZXWesgkL1JBWw7tfJYs3lZhIKiosqoWTv/aKKJMQ==
X-Received: by 2002:a17:902:8643:: with SMTP id
	y3-v6mr2764518plt.307.1533742541701; 
	Wed, 08 Aug 2018 08:35:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:13 -0700
Message-Id: <1533742522-24357-18-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 18/27] binutls: Security fix for CVE-2017-16827
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:40 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16827.patch         | 95 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16827.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index d75ec50..7d05046 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -53,6 +53,7 @@ SRC_URI = "\
      file://CVE-2017-15939.patch \
      file://CVE-2017-15996.patch \
      file://CVE-2017-16826.patch \
+     file://CVE-2017-16827.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16827.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16827.patch
new file mode 100644
index 0000000..dbc577c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16827.patch
@@ -0,0 +1,95 @@
+From 0301ce1486b1450f219202677f30d0fa97335419 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 17 Oct 2017 16:43:47 +1030
+Subject: [PATCH] PR22306, Invalid free() in slurp_symtab()
+
+	PR 22306
+	* aoutx.h (aout_get_external_symbols): Handle stringsize of zero,
+	and error for any other size that doesn't cover the header word.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16827
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  6 ++++++
+ bfd/aoutx.h   | 45 ++++++++++++++++++++++++++++++---------------
+ 2 files changed, 36 insertions(+), 15 deletions(-)
+
+Index: git/bfd/aoutx.h
+===================================================================
+--- git.orig/bfd/aoutx.h
++++ git/bfd/aoutx.h
+@@ -1352,27 +1352,42 @@ aout_get_external_symbols (bfd *abfd)
+ 	  || bfd_bread ((void *) string_chars, amt, abfd) != amt)
+ 	return FALSE;
+       stringsize = GET_WORD (abfd, string_chars);
++      if (stringsize == 0)
++	stringsize = 1;
++      else if (stringsize < BYTES_IN_WORD
++	       || (size_t) stringsize != stringsize)
++	{
++	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
++	}
+ 
+ #ifdef USE_MMAP
+-      if (! bfd_get_file_window (abfd, obj_str_filepos (abfd), stringsize,
+-				 &obj_aout_string_window (abfd), TRUE))
+-	return FALSE;
+-      strings = (char *) obj_aout_string_window (abfd).data;
+-#else
+-      strings = (char *) bfd_malloc (stringsize + 1);
+-      if (strings == NULL)
+-	return FALSE;
+-
+-      /* Skip space for the string count in the buffer for convenience
+-	 when using indexes.  */
+-      amt = stringsize - BYTES_IN_WORD;
+-      if (bfd_bread (strings + BYTES_IN_WORD, amt, abfd) != amt)
++      if (stringsize >= BYTES_IN_WORD)
+ 	{
+-	  free (strings);
+-	  return FALSE;
++	  if (! bfd_get_file_window (abfd, obj_str_filepos (abfd), stringsize,
++				     &obj_aout_string_window (abfd), TRUE))
++	    return FALSE;
++	  strings = (char *) obj_aout_string_window (abfd).data;
+ 	}
++      else
+ #endif
++	{
++	  strings = (char *) bfd_malloc (stringsize);
++	  if (strings == NULL)
++	    return FALSE;
+ 
++	  if (stringsize >= BYTES_IN_WORD)
++	    {
++	      /* Keep the string count in the buffer for convenience
++		 when indexing with e_strx.  */
++	      amt = stringsize - BYTES_IN_WORD;
++	      if (bfd_bread (strings + BYTES_IN_WORD, amt, abfd) != amt)
++		{
++		  free (strings);
++		  return FALSE;
++		}
++	    }
++	}
+       /* Ensure that a zero index yields an empty string.  */
+       strings[0] = '\0';
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2017-10-17  Alan Modra  <amodra@gmail.com>
++
++       PR 22306
++       * aoutx.h (aout_get_external_symbols): Handle stringsize of zero,
++       and error for any other size that doesn't cover the header word.
++
+ 2017-11-01  Nick Clifton  <nickc@redhat.com>
+  
+        PR 22376
-- 
2.7.4


