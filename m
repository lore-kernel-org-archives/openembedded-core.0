Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A96FC77E44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:17 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s23so2314943plk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XBv2OrU9XLLuMBSZXKWYS4dgV9rvcAYlKIMiIAZPP/Q=;
	b=ONrR9iJRVm1IUOBzsP3oVPl62nRJmcL0wYol66gcOJKolNwHDwKYeoA4ilPjD6Nvpp
	Wn/I5q/ybI62g+62SmzMZpVPsSJJ7T+5tc87EvbVWxUcx5jF+8I1n3sd0EC7flfkUHfo
	hmNWw4W08FPbY1l+KKbLmBtk8hjOeRA2JoOfAcDAWnl1VJt+nQBX/F0uprCVeGewqKBC
	9Wo/szVk23hw+edbWIDpKsM4L0GleZhZolxZ8IArZJ9oaSVqyAZykbGdoxWtXpDK6R5f
	JZvS3lfRE71m0jO9Gpz1g+N3tVor1QEuPau1eZ+KNJkqzCkUAVHBHVjZq34TJAHSxk5z
	qj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XBv2OrU9XLLuMBSZXKWYS4dgV9rvcAYlKIMiIAZPP/Q=;
	b=m1cFCgHh1upNwsGUuXh+1VozjxbOD2jjdYXAeHYI/2P+uGjvw+xnyibA8fE73loDOx
	f5n0A8NBFNOVmHQDu7GbqmTtfOWkIk44Wn3MDZLgj6LodLnvbdPR+/q7C0oPEpTyZidf
	zu9GhoL8N1FZUzGQt8J7DUoficYoImt6KrMw0AN8eMhd3T8vp+TyoLrSSwtZO9zlW8e9
	YCNOWs6xY5rusUfhCUqdMYl7nVipvjzG/U61Qp3ccdF4QyrXtxk2XoaUQ/rizm/pv0E8
	h7KNjvXdwzZDPYS3j4PpMiqTFum3rVQyld1WMKy8O0RxZnGb51dUx64WnIEQexJswuhC
	BQ7Q==
X-Gm-Message-State: AJaThX7o7trdTXsHXjLQJi4jEZEiSGNMSc9r5LxoCszf58S2OpYuUg5A
	DIv/hD6Qf6DuAjpXpM83WGo=
X-Google-Smtp-Source: AGs4zMaUC05gmrVZllKk7Eo5ovytOaTkRZ5Cvgp2lfoXHcEZD8mC+8nSIeq5VDxsEbxaoMZe117tMg==
X-Received: by 10.84.232.138 with SMTP id i10mr37933240plk.104.1511750119298; 
	Sun, 26 Nov 2017 18:35:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:52 -0800
Message-Id: <1511750112-2263-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 06/26] binutils: Secuirty fix CVE-2017-8396 and CVE-2017-8397
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:17 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-8396_8397.patch     | 102 +++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8396_8397.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 8c91f4c..ca78a30 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -48,6 +48,7 @@ SRC_URI = "\
      file://CVE-2017-8393.patch \
      file://CVE-2017-8394.patch \
      file://CVE-2017-8395.patch \
+     file://CVE-2017-8396_8397.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8396_8397.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8396_8397.patch
new file mode 100644
index 0000000..14f4282
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8396_8397.patch
@@ -0,0 +1,102 @@
+From a941291cab71b9ac356e1c03968c177c03e602ab Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 29 Apr 2017 14:48:16 +0930
+Subject: [PATCH] PR21432, buffer overflow in perform_relocation
+
+The existing reloc offset range tests didn't catch small negative
+offsets less than the size of the reloc field.
+
+	PR 21432
+	* reloc.c (reloc_offset_in_range): New function.
+	(bfd_perform_relocation, bfd_install_relocation): Use it.
+	(_bfd_final_link_relocate): Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2017-8396
+CVE: CVE-2017-8397
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/reloc.c   | 32 ++++++++++++++++++++------------
+ 2 files changed, 27 insertions(+), 12 deletions(-)
+
+Index: git/bfd/reloc.c
+===================================================================
+--- git.orig/bfd/reloc.c
++++ git/bfd/reloc.c
+@@ -538,6 +538,22 @@ bfd_check_overflow (enum complain_overfl
+   return flag;
+ }
+ 
++/* HOWTO describes a relocation, at offset OCTET.  Return whether the
++   relocation field is within SECTION of ABFD.  */
++
++static bfd_boolean
++reloc_offset_in_range (reloc_howto_type *howto, bfd *abfd,
++		       asection *section, bfd_size_type octet)
++{
++  bfd_size_type octet_end = bfd_get_section_limit_octets (abfd, section);
++  bfd_size_type reloc_size = bfd_get_reloc_size (howto);
++
++  /* The reloc field must be contained entirely within the section.
++     Allow zero length fields (marker relocs or NONE relocs where no
++     relocation will be performed) at the end of the section.  */
++  return octet <= octet_end && octet + reloc_size <= octet_end;
++}
++
+ /*
+ FUNCTION
+ 	bfd_perform_relocation
+@@ -618,13 +634,10 @@ bfd_perform_relocation (bfd *abfd,
+   /* PR 17512: file: 0f67f69d.  */
+   if (howto == NULL)
+     return bfd_reloc_undefined;
+-
+-  /* Is the address of the relocation really within the section?
+-     Include the size of the reloc in the test for out of range addresses.
+-     PR 17512: file: c146ab8b, 46dff27f, 38e53ebf.  */
++  
++  /* Is the address of the relocation really within the section?  */
+   octets = reloc_entry->address * bfd_octets_per_byte (abfd);
+-  if (octets + bfd_get_reloc_size (howto)
+-      > bfd_get_section_limit_octets (abfd, input_section))
++  if (!reloc_offset_in_range (howto, abfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* Work out which section the relocation is targeted at and the
+@@ -1012,8 +1025,7 @@ bfd_install_relocation (bfd *abfd,
+ 
+   /* Is the address of the relocation really within the section?  */
+   octets = reloc_entry->address * bfd_octets_per_byte (abfd);
+-  if (octets + bfd_get_reloc_size (howto)
+-      > bfd_get_section_limit_octets (abfd, input_section))
++  if (!reloc_offset_in_range (howto, abfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* Work out which section the relocation is targeted at and the
+@@ -1351,8 +1363,7 @@ _bfd_final_link_relocate (reloc_howto_ty
+   bfd_size_type octets = address * bfd_octets_per_byte (input_bfd);
+ 
+   /* Sanity check the address.  */
+-  if (octets + bfd_get_reloc_size (howto)
+-      > bfd_get_section_limit_octets (input_bfd, input_section))
++  if (!reloc_offset_in_range (howto, input_bfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* This function assumes that we are dealing with a basic relocation
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-04-29  Alan Modra  <amodra@gmail.com>
++
++       PR 21432
++       * reloc.c (reloc_offset_in_range): New function.
++       (bfd_perform_relocation, bfd_install_relocation): Use it.
++       (_bfd_final_link_relocate): Likewise.
++
+ 2017-04-26  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21431
-- 
2.7.4


