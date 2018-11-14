Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id C50146C18A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 19:05:52 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t9-v6so15085466ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IjW4xwZLsIi66obN194Hrhali6szCEUDGGJGttHyKtk=;
	b=Nnhr3EcOwInTwbWtvDiKhxEJI01/C1ab7MaN0zsednOyXP0nFv4wr+Ydkc6fEZxSMF
	+RgkjmNzi5jtLkdGUaGro9rVwoqGKqnvhLNlJb6y8CXDWFNkuGV8SnvF4YMIALcrl57R
	cfd+H/QGJayJTK1WT38Ilj/alIdMRxe+dxLb0xZspFjEoNvv68CbrS9X0tJeNh+LMMb/
	yZn6Bg5WBBAgvKVARQaG/0RW+iItyvAq0yMdSsnniikzutPuvb8yNC0lfm68Nzoet1Zs
	kY2HO/gCsG+VpuqP/DW0Mp/vulYvbVTBa520TaqsZRJ4Vnf78vI+OyYwJfDSJ+f1Kl3f
	Fonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IjW4xwZLsIi66obN194Hrhali6szCEUDGGJGttHyKtk=;
	b=rpdQGIFyrbkmJ+2uE6+yhHJAZTi9femIAGQoQ6piWhveXh0B7cTqaoFNb9ZleOmp0o
	DtVuH2P9LzsowB/BegT4OJisY9gIjEfY8kPJYKf11v5UYCPKhBHneOTX1TyCU2ZZJJM3
	Xw2HgMo9ORsSZaYMTwhkQrIJLphQl2+E1RzBzWi8gO2F3tfDc8P68g08Mvb2N+WZGyGj
	DcaDpdAMwMCJgy4WQYNZEfJFQ0sBwOYZqMCnlbrnGDfVXIGlwl81uho7FZYLnSBsdRLX
	UOCXTOdMiuqZxVY70CCDTVXiGhKHble1DsZMczHL3w/+LZNJllpt5A0Arfu6lo0jNLT4
	yYVA==
X-Gm-Message-State: AGRZ1gKaEdyaTLHZ+j76RjdIzpbINclI4yrCQxBJh1pvoUDSdd5Q81Mg
	shlaC1zIPZ1XbdMmDfIIEIu1Q67G6Ws=
X-Google-Smtp-Source: AJdET5cEpxuTR5E8INTGitMGXEmq2ZO4Rk3l2mb27Dum2rLakn9qTeHGMF4DMiDb5Yk8SYpHNUDX0Q==
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr1871855ljl.162.1542222353166; 
	Wed, 14 Nov 2018 11:05:53 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id i78sm4044866lfa.9.2018.11.14.11.05.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Nov 2018 11:05:52 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2018 20:05:50 +0100
Message-Id: <1542222350-15249-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] doc: drop some incorrect instructions
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
X-List-Received-Date: Wed, 14 Nov 2018 19:05:53 -0000

From: Ming Liu <liu.ming50@gmail.com>

image_types bbclass now is being inherited mandatorily in image.bbclass
through the variable IMGCLASSES, and the users do not have to inherit
it in their customized image type bbclass, or put it in IMAGE_CLASSES.

Drop the incorrect descriptions, it's confusing the developers.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 documentation/ref-manual/ref-classes.xml | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index 24d7a0a..876e242 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1275,15 +1275,10 @@
     </para>
 
     <para>
-        By default, this class is enabled through the
-        <link linkend='var-IMAGE_CLASSES'><filename>IMAGE_CLASSES</filename></link>
-        variable in
+        By default, this class is enabled mandatorily in
         <link linkend='ref-classes-image'><filename>image.bbclass</filename></link>.
         If you define your own image types using a custom BitBake class and
-        then use <filename>IMAGE_CLASSES</filename> to enable it, the custom
-        class must either inherit <filename>image_types</filename> or
-        <filename>image_types</filename> must also appear in
-        <filename>IMAGE_CLASSES</filename>.
+        then use <filename>IMAGE_CLASSES</filename> to enable it.
     </para>
 
     <para>
-- 
2.7.4


