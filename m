Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.32528.1620656996716322276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NfJX8koy;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id k25so15968288oic.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/TUsNYu+8nIMYtDiRlfM2RJSEz5ck9mu+2ecSDNpuic=;
        b=NfJX8koy5MzK7zL/0MuaZnquGvX92m5JLd+MkNb5H4yDXLgWyjUEIEf2Za4pN2a/3i
         h+DI0RwOJuQpDGx3A23qH9jn35y3xF53wve+2/edOlkr4EkHc9qnXyoYcjDyfRHB/rc4
         V5Ht1dK6/ww9YBMCIe5vg1iOkwabL6WGA1aixPSI+VuB6GjmNPCgjVpF3J4ZkWBe9SlS
         AM+EIBE2cQ2NYjhyJvp1Nt1NhJofV6Vz6BNzjl6y/Q5O/HXbF/hlaRpHOuDBvB96lHmZ
         VASU7LhotAlRXL1KrM4W6iRhdx+33lUwpnlMD/9FjrVbUPR093LgbSj4VcX4UUm07rEf
         7/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/TUsNYu+8nIMYtDiRlfM2RJSEz5ck9mu+2ecSDNpuic=;
        b=MNDIA+hyrDx4a2ujkT60ZAOjd60DlVn+vhty45qhye/dnuh5D6lD+fNwWjWJbYj+vh
         E3lZARnAJ/hJybz+Twdwug4CWbReiGfu5IfVGa77BQbS3tWbCZP+I99oOquZzFFiWDa5
         BX+q0IOjZTlUO3uqq5zbIag3nEXR1aWeVFlB1vv1HmE+lnFTL3E0UFjG2cUEZmzc+mJT
         YKSLYXrP4m9k9HrBIcu+gVD3Gcopuh5CWs7R3odSS7QLe6TY8Plma32sP/Psjb+znwPx
         vxQKOItGiHKjGs9tGaDfw99FmFkE80gbbxy/p1PEVA5qWQ041Ka/IKRhvvd8pHmDo0j2
         NO/g==
X-Gm-Message-State: AOAM533hLxYJw4+bjnXFOSFHTDrGEQzgSf2IFBj4afGimD3UH6z/+9KB
	dM+Cem/m91PiwYJw+hPve0dCu/vDYMH4/RgUnh0=
X-Google-Smtp-Source: ABdhPJzXyZhDHrAO6apUI/I8tRub0W3fxvb//glzD60hozt6FKHEfF/P6ttsT3Yw2HcaqY+rwnqoGg==
X-Received: by 2002:aca:d8d5:: with SMTP id p204mr8800051oig.151.1620656995565;
        Mon, 10 May 2021 07:29:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:29:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/25] binutils: fix CVE-2021-3487
Date: Mon, 10 May 2021 04:28:44 -1000
Message-Id: <c955d1fc332b8c0a931ffa4a068844981406ae8a.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

drop changes to changelog file in the patch so it can be backport.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2021-3487.patch     | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index a586faf5ab..3e10279b1d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -47,5 +47,6 @@ SRC_URI = "\
      file://CVE-2020-16592.patch \
      file://CVE-2020-16598.patch \
      file://CVE-2021-20197.patch \
+     file://CVE-2021-3487.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch
new file mode 100644
index 0000000000..1502d03f43
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-3487.patch
@@ -0,0 +1,83 @@
+From 647cebce12a6b0a26960220caff96ff38978cf24 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 26 Nov 2020 17:08:33 +0000
+Subject: [PATCH] Prevent a memory allocation failure when parsing corrupt
+ DWARF debug sections.
+
+	PR 26946
+	* dwarf2.c (read_section): Check for debug sections with excessive
+	sizes.
+
+
+Upstream-Status: Backport [
+https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=647cebce12a6b0a26960220caff96ff38978cf24
+]
+CVE: CVE-2021-3487
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ bfd/dwarf2.c  | 25 +++++++++++++++++++------
+ 1 files changed, 25 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 977bf43a6a1..8bbfc81d3e7 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -531,22 +531,24 @@ read_section (bfd *	      abfd,
+ 	      bfd_byte **     section_buffer,
+ 	      bfd_size_type * section_size)
+ {
+-  asection *msec;
+   const char *section_name = sec->uncompressed_name;
+   bfd_byte *contents = *section_buffer;
+-  bfd_size_type amt;
+ 
+   /* The section may have already been read.  */
+   if (contents == NULL)
+     {
++      bfd_size_type amt;
++      asection *msec;
++      ufile_ptr filesize;
++
+       msec = bfd_get_section_by_name (abfd, section_name);
+-      if (! msec)
++      if (msec == NULL)
+ 	{
+ 	  section_name = sec->compressed_name;
+ 	  if (section_name != NULL)
+ 	    msec = bfd_get_section_by_name (abfd, section_name);
+ 	}
+-      if (! msec)
++      if (msec == NULL)
+ 	{
+ 	  _bfd_error_handler (_("DWARF error: can't find %s section."),
+ 			      sec->uncompressed_name);
+@@ -554,12 +556,23 @@ read_section (bfd *	      abfd,
+ 	  return FALSE;
+ 	}
+ 
+-      *section_size = msec->rawsize ? msec->rawsize : msec->size;
++      amt = bfd_get_section_limit_octets (abfd, msec);
++      filesize = bfd_get_file_size (abfd);
++      if (amt >= filesize)
++	{
++	  /* PR 26946 */
++	  _bfd_error_handler (_("DWARF error: section %s is larger than its filesize! (0x%lx vs 0x%lx)"),
++			      section_name, (long) amt, (long) filesize);
++	  bfd_set_error (bfd_error_bad_value);
++	  return FALSE;
++	}
++      *section_size = amt;
+       /* Paranoia - alloc one extra so that we can make sure a string
+ 	 section is NUL terminated.  */
+-      amt = *section_size + 1;
++      amt += 1;
+       if (amt == 0)
+ 	{
++	  /* Paranoia - this should never happen.  */
+ 	  bfd_set_error (bfd_error_no_memory);
+ 	  return FALSE;
+ 	}
+-- 
+2.27.0
+
-- 
2.25.1

