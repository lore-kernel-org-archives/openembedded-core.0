Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2628.1590261163771750234
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 12:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FPdyuKGK;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id u188so13214033wmu.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPq3Nyz6HYFcEBGX6UHjoUBK6mOh1HhTIYfXoM3oEys=;
        b=FPdyuKGKikWdngCIKHm/zmXgmIK4rkNfDqmvEbCdWrIf1gB72qdsbAdSjZ0RC3XJnV
         M3yf2ITulJ8DVvcVlpAqQraVI4tkJOanchxnj546E5wL16IDbbCrwM9itB8wPY5s7/ut
         +mZhvLGwCZ102K68UOA9I9/Ievu3bzdrPGOqT5SklBKJEFI3OifhBQif2W/GoGOakvtB
         xRResWxhYGfFJbVIUBaqKPxKbayOm4Xarkj0AHqCoFOpOebeEIyB8LD7vsq3unDUT3WL
         4Ei8Oalfu91LjY/4IaQBNNJOxNfkfjD2ez/gqlShz0bbzJ4UOhjEuovgFLtyG2jr707f
         FCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tPq3Nyz6HYFcEBGX6UHjoUBK6mOh1HhTIYfXoM3oEys=;
        b=iGs/viOxnrgSjoJF26GC6LbyuOIEXA8I08Y2tnibgxyPG8CeHkcJt2hxfrxoNwNVle
         v8qb9lYqGoU1fo3kwEahpHMM8eYkmbhrNeYWKLukdqRLiNhQtN8BhQOXCY8jkJ0cCTFt
         p715QN5qb6Dh7DAXDsYpZVkhwhUZ/unVejBoFddazV13monwP7WK0UUPInGWNZW0iJgM
         2Fn727wZ1tA4lvBsC8jGrKImwJMRXSAcLOk0Ewb5pmZoF/3+POI/coJJ3+002MaOt4ro
         SG0vOOTpnp3ZNSR2UJ0mGKP1ZxsMGnOVGMaM/PJr0UWHbxLLRpVbogNwiN83EFd4WGLt
         eMvg==
X-Gm-Message-State: AOAM532rgiGIqTjvpr3QpSvmnTkQYbFuy+PtRJOZj+9q4GFKdHT6BMu3
	kQy9OOL6LDyo6OjfzyVyoqdHqNwBnls=
X-Google-Smtp-Source: ABdhPJxj2nw6GA+oGQz6nxL3NRQ0zX7su7GmAnB2SSni+JZMxfpEXKyKMIhQ/9bvxVX1fc9PjUKc2Q==
X-Received: by 2002:a7b:c5d7:: with SMTP id n23mr4601697wmk.185.1590261161724;
        Sat, 23 May 2020 12:12:41 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id q144sm13663566wme.0.2020.05.23.12.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 12:12:41 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gregor Zatko <gzatko@zoznam.sk>
Subject: [PATCH] docbook-xml: update recipe to stick with the upstream
Date: Sat, 23 May 2020 21:12:38 +0200
Message-Id: <20200523191238.1224501-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregor Zatko <gzatko@zoznam.sk>

Until now a Debian package has been used as a source.
This change just switches it to project's upstream.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  65 ++-
 2 files changed, 36 insertions(+), 544 deletions(-)
 delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
deleted file mode 100644
index 59703609ca..0000000000
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
+++ /dev/null
@@ -1,515 +0,0 @@
-docbook-xml: update catalog.xml
-
-Refer Ubuntu 13.04 to update catalog.xml
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- docbook-4.0/catalog.xml   | 72 +++++++++++++++++++++++++++++++++++++++++++++++
- docbook-4.1.2/catalog.xml | 66 +++++++++++++++++++++++++++++++++++++++++++
- docbook-4.2/catalog.xml   | 69 ++++++---------------------------------------
- docbook-4.3/catalog.xml   | 72 ++++++++---------------------------------------
- docbook-4.4/catalog.xml   | 63 ++---------------------------------------
- docbook-4.5/catalog.xml   | 63 ++---------------------------------------
- 6 files changed, 165 insertions(+), 240 deletions(-)
- create mode 100644 docbook-4.0/catalog.xml
- create mode 100644 docbook-4.1.2/catalog.xml
-
-diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml
-new file mode 100644
---- /dev/null
-+++ b/docbook-4.0/catalog.xml
-@@ -0,0 +1,72 @@
-+<?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
-+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-+
-+<!-- ...................................................................... -->
-+<!-- XML Catalog data for DocBook XML V4.0............................... -->
-+<!-- File catalog.xml ..................................................... -->
-+
-+<!-- Please direct all questions, bug reports, or suggestions for
-+     changes to the docbook@lists.oasis-open.org mailing list. For more
-+     information, see http://www.oasis-open.org/.
-+  -->
-+
-+<!-- This is the catalog data file for DocBook V4.0. It is provided as
-+     a convenience in building your own catalog files. You need not use
-+     the filenames listed here, and need not use the filename method of
-+     identifying storage objects at all.  See the documentation for
-+     detailed information on the files associated with the DocBook DTD.
-+     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
-+     detailed information on supplying and using catalog data.
-+  -->
-+
-+<!-- ...................................................................... -->
-+<!-- DocBook driver file .................................................. -->
-+
-+<public publicId="-//Norman Walsh//DTD DocBk XML V4.0//EN"
-+        uri="docbookx.dtd"/>
-+
-+<!-- Other ways to refer to DocBook XML v4.0............................... -->
-+<public publicId="-//Norman Walsh//DTD DocBook XML V4.0//EN"
-+        uri="docbookx.dtd"/>
-+
-+<system systemId="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
-+<!-- ...................................................................... -->
-+<!-- DocBook modules ...................................................... -->
-+
-+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN"
-+        uri="dbnotnx.mod"/>
-+
-+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Character Entities V4.0//EN"
-+        uri="dbcentx.mod"/>
-+
-+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Information Pool V4.0//EN"
-+        uri="dbpoolx.mod"/>
-+
-+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Document Hierarchy V4.0//EN"
-+        uri="dbhierx.mod"/>
-+
-+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Additional General Entities V4.0//EN"
-+        uri="dbgenent.mod"/>
-+
-+<public publicId="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN"
-+        uri="calstblx.dtd"/>
-+
-+<!-- UNOFFICIAL conversion of the exchange table model to XML, based on the OASIS Exchange -->
-+<!--    Table Model PUBLIC "-//SGML Open//DTD Exchange Table Model 19960430//EN"           -->
-+<public publicId="-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN"
-+        uri="soextblx.dtd"/>
-+
-+<!-- the following FPI is declared for the DTD inside the DTD, but we'll -->
-+<!-- use the version from the latest DocBook
-+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
-+        uri="soextblx.dtd"/> -->
-+
-+<!-- End of catalog data for DocBook XML V4.0 ............................. -->
-+<!-- ...................................................................... -->
-+
-+</catalog>
-diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml
-new file mode 100644
---- /dev/null
-+++ b/docbook-4.1.2/catalog.xml
-@@ -0,0 +1,66 @@
-+<?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
-+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-+
-+<!-- ...................................................................... -->
-+<!-- XML Catalog data for DocBook XML V4.1.2............................... -->
-+<!-- File catalog.xml ..................................................... -->
-+
-+<!-- Please direct all questions, bug reports, or suggestions for
-+     changes to the docbook@lists.oasis-open.org mailing list. For more
-+     information, see http://www.oasis-open.org/.
-+  -->
-+
-+<!-- This is the catalog data file for DocBook V4.1.2. It is provided as
-+     a convenience in building your own catalog files. You need not use
-+     the filenames listed here, and need not use the filename method of
-+     identifying storage objects at all.  See the documentation for
-+     detailed information on the files associated with the DocBook DTD.
-+     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
-+     detailed information on supplying and using catalog data.
-+  -->
-+
-+<!-- ...................................................................... -->
-+<!-- DocBook driver file .................................................. -->
-+
-+<public publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
-+        uri="docbookx.dtd"/>
-+
-+<system systemId="http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
-+<system systemId="http://docbook.org/xml/4.1.2/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
-+<!-- ...................................................................... -->
-+<!-- DocBook modules ...................................................... -->
-+
-+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN"
-+        uri="calstblx.dtd"/>
-+
-+  <!-- already included in docbook 4.2
-+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
-+        uri="soextblx.dtd"/> -->
-+
-+<public publicId="-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN"
-+        uri="dbpoolx.mod"/>
-+
-+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1.2//EN"
-+        uri="dbhierx.mod"/>
-+
-+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.1.2//EN"
-+        uri="dbgenent.mod"/>
-+
-+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN"
-+        uri="dbnotnx.mod"/>
-+
-+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.1.2//EN"
-+        uri="dbcentx.mod"/>
-+
-+
-+<!-- End of catalog data for DocBook XML V4.1.2 ............................. -->
-+<!-- ...................................................................... -->
-+
-+</catalog>
-diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml
---- a/docbook-4.2/catalog.xml
-+++ b/docbook-4.2/catalog.xml
-@@ -1,4 +1,7 @@
- <?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
- <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
- 
- <!-- ...................................................................... -->
-@@ -25,6 +28,12 @@
- <public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
-         uri="docbookx.dtd"/>
- 
-+<system systemId="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
-+<system systemId="http://docbook.org/xml/4.2/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
- <!-- ...................................................................... -->
- <!-- DocBook modules ...................................................... -->
- 
-@@ -49,66 +58,6 @@
- <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN"
-         uri="dbcentx.mod"/>
- 
--<!-- ...................................................................... -->
--<!-- ISO entity sets ...................................................... -->
--
--<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
--        uri="ent/iso-dia.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
--        uri="ent/iso-num.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
--        uri="ent/iso-pub.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
--        uri="ent/iso-tech.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
--        uri="ent/iso-lat1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
--        uri="ent/iso-lat2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
--        uri="ent/iso-grk1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
--        uri="ent/iso-grk2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
--        uri="ent/iso-grk3.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
--        uri="ent/iso-grk4.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
--        uri="ent/iso-amsa.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
--        uri="ent/iso-amsb.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
--        uri="ent/iso-amsc.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
--        uri="ent/iso-amsn.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
--        uri="ent/iso-amso.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
--        uri="ent/iso-amsr.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
--        uri="ent/iso-box.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
--        uri="ent/iso-cyr1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
--        uri="ent/iso-cyr2.ent"/>
--
- <!-- End of catalog data for DocBook XML V4.2 ............................. -->
- <!-- ...................................................................... -->
- 
-diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml
---- a/docbook-4.3/catalog.xml
-+++ b/docbook-4.3/catalog.xml
-@@ -1,4 +1,7 @@
- <?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
- <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
- 
- <!-- ...................................................................... -->
-@@ -25,12 +28,21 @@
- <public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
-         uri="docbookx.dtd"/>
- 
-+<system systemId="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
-+<system systemId="http://docbook.org/xml/4.3/docbookx.dtd"
-+        uri="docbookx.dtd"/>
-+
- <!-- ...................................................................... -->
- <!-- DocBook modules ...................................................... -->
- 
- <public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
-         uri="calstblx.dtd"/>
- 
-+<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN"
-+        uri="htmltblx.mod"/>
-+
- <public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
-         uri="soextblx.dtd"/>
- 
-@@ -49,66 +61,6 @@
- <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN"
-         uri="dbcentx.mod"/>
- 
--<!-- ...................................................................... -->
--<!-- ISO entity sets ...................................................... -->
--
--<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
--        uri="ent/iso-dia.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
--        uri="ent/iso-num.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
--        uri="ent/iso-pub.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
--        uri="ent/iso-tech.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
--        uri="ent/iso-lat1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
--        uri="ent/iso-lat2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
--        uri="ent/iso-grk1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
--        uri="ent/iso-grk2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
--        uri="ent/iso-grk3.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
--        uri="ent/iso-grk4.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
--        uri="ent/iso-amsa.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
--        uri="ent/iso-amsb.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
--        uri="ent/iso-amsc.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
--        uri="ent/iso-amsn.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
--        uri="ent/iso-amso.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
--        uri="ent/iso-amsr.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
--        uri="ent/iso-box.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
--        uri="ent/iso-cyr1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
--        uri="ent/iso-cyr2.ent"/>
--
- <!-- End of catalog data for DocBook XML V4.3 ............................. -->
- <!-- ...................................................................... -->
- 
-diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml
---- a/docbook-4.4/catalog.xml
-+++ b/docbook-4.4/catalog.xml
-@@ -1,4 +1,7 @@
- <?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
- <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
- 
- <!-- ...................................................................... -->
-@@ -58,66 +61,6 @@
- <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN"
-         uri="dbcentx.mod"/>
- 
--<!-- ...................................................................... -->
--<!-- ISO entity sets ...................................................... -->
--
--<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
--        uri="ent/isodia.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
--        uri="ent/isonum.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
--        uri="ent/isopub.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
--        uri="ent/isotech.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
--        uri="ent/isolat1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
--        uri="ent/isolat2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
--        uri="ent/isogrk1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
--        uri="ent/isogrk2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
--        uri="ent/isogrk3.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
--        uri="ent/isogrk4.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
--        uri="ent/isoamsa.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
--        uri="ent/isoamsb.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
--        uri="ent/isoamsc.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
--        uri="ent/isoamsn.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
--        uri="ent/isoamso.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
--        uri="ent/isoamsr.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
--        uri="ent/isobox.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
--        uri="ent/isocyr1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
--        uri="ent/isocyr2.ent"/>
--
- <!-- End of catalog data for DocBook XML V4.4 ............................. -->
- <!-- ...................................................................... -->
- 
-diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml
---- a/docbook-4.5/catalog.xml
-+++ b/docbook-4.5/catalog.xml
-@@ -1,4 +1,7 @@
- <?xml version='1.0'?>
-+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN"
-+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-+
- <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
- 
- <!-- ...................................................................... -->
-@@ -58,66 +61,6 @@
- <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN"
-         uri="dbcentx.mod"/>
- 
--<!-- ...................................................................... -->
--<!-- ISO entity sets ...................................................... -->
--
--<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
--        uri="ent/isodia.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
--        uri="ent/isonum.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
--        uri="ent/isopub.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
--        uri="ent/isotech.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
--        uri="ent/isolat1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
--        uri="ent/isolat2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
--        uri="ent/isogrk1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
--        uri="ent/isogrk2.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
--        uri="ent/isogrk3.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
--        uri="ent/isogrk4.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
--        uri="ent/isoamsa.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
--        uri="ent/isoamsb.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
--        uri="ent/isoamsc.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
--        uri="ent/isoamsn.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
--        uri="ent/isoamso.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
--        uri="ent/isoamsr.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
--        uri="ent/isobox.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
--        uri="ent/isocyr1.ent"/>
--
--<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
--        uri="ent/isocyr2.ent"/>
--
- <!-- End of catalog data for DocBook XML V4.5 ............................. -->
- <!-- ...................................................................... -->
- 
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 6452c8d99f..39c4da418b 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Document type definitions for verification of XML data files"
 DESCRIPTION = "Document type definitions for verification of XML data \
-files against the DocBook rule set, it ships with the latest DocBook 4.5 \
-XML DTD, as well as a selected set of legacy DTDs for use with older \
-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
-HOMEPAGE = "http://www.docbook.org/xml/"
+files against the DocBook rule set. It ships with the latest DocBook 4.5 \
+XML DTD, together with older version 4.2, 4.3 and 4.4."
+HOMEPAGE = "https://www.docbook.org/xml/"
+
+PR = "r1"
 
 LICENSE = "OASIS"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
@@ -11,42 +12,48 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e763
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
-           file://LICENSE-OASIS \
-           file://docbook-xml-update-catalog.xml.patch \
+SRC_URI = "\
+    https://docbook.org/xml/4.2/catalog.xml;name=catalog-4_2;downloadfilename=catalog-4.2.xml \
+    https://docbook.org/xml/4.3/catalog.xml;name=catalog-4_3;downloadfilename=catalog-4.3.xml \
+    https://docbook.org/xml/4.4/catalog.xml;name=catalog-4_4;downloadfilename=catalog-4.4.xml \
+    https://docbook.org/xml/4.5/catalog.xml;name=catalog-4_5;downloadfilename=catalog-4.5.xml \
+    file://LICENSE-OASIS \
 "
-
-SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
-SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
-
-S = "${WORKDIR}/docbook-xml-4.5.c31424"
-
-inherit allarch
+SRC_URI[catalog-4_2.md5sum] = "37efa9b1f4ffa6e5b05126bbf9b9a9e0"
+SRC_URI[catalog-4_2.sha256sum] = "274834261133669b98966d2a53e94a98b735a146c3e452901ee5002ab0b990a2"
+SRC_URI[catalog-4_3.md5sum] = "dc8a64236d9c3d4aae5263a8afc3dbc3"
+SRC_URI[catalog-4_3.sha256sum] = "2673ec05844517ed1965c5da74c76193cb00132e0cd1f72646bd9b55fc2fd24b"
+SRC_URI[catalog-4_4.md5sum] = "5576531ac936f1655f717b3681f4f6b5"
+SRC_URI[catalog-4_4.sha256sum] = "21d68015dfa64b8c90242b71dbaa5314785ec2e06f0bf02f25d35e109c0f851e"
+SRC_URI[catalog-4_5.md5sum] = "1e948be9c9324edf05688f252697308a"
+SRC_URI[catalog-4_5.sha256sum] = "9cf6672e30a61f2303491841741b2976785629ad85ed0323daf0c04baf7c8b2f"
+
+inherit allarch xmlcatalog
 BBCLASSEXTEND = "native"
 
-do_configure (){
-    :
-}
+# the XMLCATALOGS variable is used in xmlcatalog BB class
+XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
 
-do_compile (){
-    :
-}
+S = "${WORKDIR}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
+
     install -d ${D}${sysconfdir}/xml/
     xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
 
-    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
-        DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
+    for catalog in $(ls catalog-4.*.xml); do
+        dtdVersion=$(echo ${catalog} | sed -rn 's/^catalog-([0-9].[0-9])\.xml/\1/p')
+        DEST=${datadir}/xml/docbook/schema/dtd/${dtdVersion}
         install -d -m 755 ${D}$DEST
-        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
+        cp -v -R catalog-${dtdVersion}.xml ${D}$DEST/catalog.xml
         xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
     done
 }
 
-XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
-inherit xmlcatalog
-
-FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
+FILES_${PN} = "\
+    ${datadir}/* \
+    ${XMLCATALOGS} \
+"
-- 
2.26.2

