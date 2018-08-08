Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8935A78E21
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:43 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id g6-v6so1190930plq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uJj4HJbqwXkry4344Z2JexkdiY2rmiQ5Qe9x83T1vP4=;
	b=GisUjEFJQhQN2O5alMRhLzk0m+Cjmtv6Cvnvd7O1lT3tfELVruioy8pl9583b9hI6Z
	BC2M5ZNPs9qbEv6Ttfu8fQSvpCphYIGj4H/birRamu+dJxsA2hDNEY6K7quDvOcE6T3T
	txzvFHwhHOqDx9jfDiWVNErO2fVGwePMSotazyKsW86zVKr4BI1alSqX4/pqbqi2JPWP
	8VgYqzp8qkQgl8mAv5tFfr4HhFr4G3jrZX2VNhwcXl8igxYfK6I2Xr4Cse8TYKohbHib
	viE0uvZOIqLPP+t0dpK4d+M1L/s0Eh4jazk9d56ursFfX/3UUz0zsQoVPI65l1UbSfun
	q4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uJj4HJbqwXkry4344Z2JexkdiY2rmiQ5Qe9x83T1vP4=;
	b=kcUckGafloZ5F6Fiqj+d1Aw06YULgQyV+iZHxvVeqsVg03aDEyrGKi8cXlS9f8W1f/
	+wn9uf7EeKKCsT3HlCEwI81+i0jLOIESNs+aaAtCdi5XfofRZwExzOPBYFAe9AsLIt3k
	BfPHY/npXtQXQXipjIfNms7CHl4BRy+H432yYIoDXZHJwc8VQCD5rxGTDjdOjJhFr7MA
	FM/dQ2ocUzFbzu3sBn+PIZElYWVZcGZmhWQbmMjlN3C0n45Hn26Tnxu4q+xtksxhxoPs
	6nSfMedDvqyMTLFQOWB9QfyKuClXU7oZmBKRPP1j7IMjua9obVe/v8rof+JHaIUv7+bW
	6xXw==
X-Gm-Message-State: AOUpUlEfh2Eyj8q9dPaJp6RVb5/z48JbVB48Jca2Ih0iwCZErlD/k7UF
	ykNisDoPNaZEDVQUN+je0kirXp+W
X-Google-Smtp-Source: AA+uWPzPbtAMfmxJjbQON1c3XrP3eMUfRq8yBfPh7QXWw1zFl/sbQ7snTqvxMASlsgzi4JC6VTycMw==
X-Received: by 2002:a17:902:b40c:: with SMTP id
	x12-v6mr3114280plr.163.1533742544653; 
	Wed, 08 Aug 2018 08:35:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:16 -0700
Message-Id: <1533742522-24357-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 21/27] binutls: Security fix for CVE-2017-16830
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:43 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-16830.patch         | 91 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16830.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 1fa3eb7..69ad9b2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
      file://CVE-2017-16828_p1.patch \
      file://CVE-2017-16828_p2.patch \
      file://CVE-2017-16829.patch \
+     file://CVE-2017-16830.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16830.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16830.patch
new file mode 100644
index 0000000..1382c8e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16830.patch
@@ -0,0 +1,91 @@
+From 6ab2c4ed51f9c4243691755e1b1d2149c6a426f4 Mon Sep 17 00:00:00 2001
+From: Mingi Cho <mgcho.minic@gmail.com>
+Date: Thu, 2 Nov 2017 17:01:08 +0000
+Subject: [PATCH] Work around integer overflows when readelf is checking for
+ corrupt ELF notes when run on a 32-bit host.
+
+	PR 22384
+	* readelf.c (print_gnu_property_note): Improve overflow checks so
+	that they will work on a 32-bit host.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16830
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/readelf.c | 33 +++++++++++++++++----------------
+ 2 files changed, 23 insertions(+), 16 deletions(-)
+
+Index: git/binutils/readelf.c
+===================================================================
+--- git.orig/binutils/readelf.c
++++ git/binutils/readelf.c
+@@ -16431,15 +16431,24 @@ print_gnu_property_note (Elf_Internal_No
+       return;
+     }
+ 
+-  while (1)
++  while (ptr < ptr_end)
+     {
+       unsigned int j;
+-      unsigned int type = byte_get (ptr, 4);
+-      unsigned int datasz = byte_get (ptr + 4, 4);
++      unsigned int type;
++      unsigned int datasz;
++
++      if ((size_t) (ptr_end - ptr) < 8)
++	{
++	  printf (_("<corrupt descsz: %#lx>\n"), pnote->descsz);
++	  break;
++	}
++
++      type = byte_get (ptr, 4);
++      datasz = byte_get (ptr + 4, 4);
+ 
+       ptr += 8;
+ 
+-      if ((ptr + datasz) > ptr_end)
++      if (datasz > (size_t) (ptr_end - ptr))
+ 	{
+ 	  printf (_("<corrupt type (%#x) datasz: %#x>\n"),
+ 		  type, datasz);
+@@ -16520,19 +16529,11 @@ next:
+       ptr += ((datasz + (size - 1)) & ~ (size - 1));
+       if (ptr == ptr_end)
+ 	break;
+-      else
+-	{
+-	  if (do_wide)
+-	    printf (", ");
+-	  else
+-	    printf ("\n\t");
+-	}
+ 
+-      if (ptr > (ptr_end - 8))
+-	{
+-	  printf (_("<corrupt descsz: %#lx>\n"), pnote->descsz);
+-	  break;
+-	}
++      if (do_wide)
++	printf (", ");
++      else
++	printf ("\n\t");
+     }
+ 
+   printf ("\n");
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-11-02  Mingi Cho  <mgcho.minic@gmail.com>
++
++       PR 22384
++       * readelf.c (print_gnu_property_note): Improve overflow checks so
++       that they will work on a 32-bit host.
++
+ 2017-10-05  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22239
-- 
2.7.4


