Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.10992.1590908568127778091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 00:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kRDFKIR9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id f5so8233478wmh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPs0XUAUBDLFL3g44f8OcjdYj5nHYVNunrawZInsVuQ=;
        b=kRDFKIR9hCWI4tUW/NhpveB8ABtGLAlm0mSjrui5fUbnAQDUnym26yrlozVMW9B6yb
         wjBAaRekcoZw84G81CE0vnKfq61RW3YK6gl1gLGlhhFH+c6lYeRUWBdTYmBaX40EkqoB
         XVP5u3TfO9dkgbjj9j+HiomfISccpchISA16tM8DzaTMMLWYCFckvO7f359X+rzRXraE
         b8Ms1EqBtLOj07VWgd4mnyjeyggxI5jEW3DdcU/bP3TWY+Wy50Exqxm3ap3YPjX3BWXn
         WWhBXKcFHUjt/7PoI5MW+r1QC4HIp8yFPSraBwtnfLdv76bGevsNcKuzKQ9P5NA+wbCI
         OjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rPs0XUAUBDLFL3g44f8OcjdYj5nHYVNunrawZInsVuQ=;
        b=XjMMdZKOmJmEP1C5l2QfLedHvoPDrsoegY/tQ5qJ30mRsQw7ZHbuwlaxtr0GT4dhMg
         +ZWwosUJQuBLSAEQJNlB9cah0lTfVE9P7V1plsAFFvZc8xGh3g0f3GA9L5I2sxqnCFul
         Klee2DtK3/ur/6mYpHKea2DlsUmxMEDV8k/pHWJqXY82+E4kRgpQH1kbUBZsH7tFpfbD
         x1Izfa5p7YIJfsDju4MwC4rJU4yn4oOxu11g4xiufXUxWKOlYloXxmiRjmQOoq7Pc7mF
         I1KDnw5inaGZe9foKJcLlWj08fD0u9AiyC4LO59HOvofBwgwAaeYY+CG07SNTUFmEmPF
         Gfiw==
X-Gm-Message-State: AOAM531jNXMhuCoNugU/oXdY9YLr6Se5G5BpMXiYTT6iIZ4Wfyg7P8/t
	PjbpxiICC0LK7KRMXR/Dp2pXdPK8
X-Google-Smtp-Source: ABdhPJwoXtve1IiAofQ5YjOyskusu1Vu3eqHQxr0wVkBvzHiz66BtpdP7xyykDb7aSQIMII+VshDdQ==
X-Received: by 2002:a1c:6243:: with SMTP id w64mr15893645wmb.162.1590908565298;
        Sun, 31 May 2020 00:02:45 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan ([80.94.50.178])
        by smtp.gmail.com with ESMTPSA id 23sm7015587wmo.18.2020.05.31.00.02.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 00:02:44 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [PATCH v3] docbook-xml: update recipe to stick with the upstream
Date: Sun, 31 May 2020 09:02:41 +0200
Message-Id: <20200531070241.1031992-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until now a Debian package has been used as a source.
This change just switches it to project's upstream.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 .../docbook-xml-dtd4/catalog-4.0.xml          |  72 +++
 .../docbook-xml-dtd4/catalog-4.1.2.xml        |  66 +++
 .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  68 ++-
 4 files changed, 177 insertions(+), 544 deletions(-)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.0.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.1.2.xml
 delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.0.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.0.xml
new file mode 100644
index 0000000000..aecf9c9f27
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.0.xml
@@ -0,0 +1,72 @@
+<?xml version='1.0'?>
+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
+
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.0............................... -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.0. It is provided as
+     a convenience in building your own catalog files. You need not use
+     the filenames listed here, and need not use the filename method of
+     identifying storage objects at all.  See the documentation for
+     detailed information on the files associated with the DocBook DTD.
+     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
+     detailed information on supplying and using catalog data.
+  -->
+
+<!-- ...................................................................... -->
+<!-- DocBook driver file .................................................. -->
+
+<public publicId="-//Norman Walsh//DTD DocBk XML V4.0//EN"
+        uri="docbookx.dtd"/>
+
+<!-- Other ways to refer to DocBook XML v4.0............................... -->
+<public publicId="-//Norman Walsh//DTD DocBook XML V4.0//EN"
+        uri="docbookx.dtd"/>
+
+<system systemId="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd"
+        uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Notations V4.0//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Character Entities V4.0//EN"
+        uri="dbcentx.mod"/>
+
+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Information Pool V4.0//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Document Hierarchy V4.0//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Additional General Entities V4.0//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN"
+        uri="calstblx.dtd"/>
+
+<!-- UNOFFICIAL conversion of the exchange table model to XML, based on the OASIS Exchange -->
+<!--    Table Model PUBLIC "-//SGML Open//DTD Exchange Table Model 19960430//EN"           -->
+<public publicId="-//Normal Walsh//Exchange Table Model 19960430 XML V4.0//EN"
+        uri="soextblx.dtd"/>
+
+<!-- the following FPI is declared for the DTD inside the DTD, but we'll -->
+<!-- use the version from the latest DocBook
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/> -->
+
+<!-- End of catalog data for DocBook XML V4.0 ............................. -->
+<!-- ...................................................................... -->
+
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.1.2.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.1.2.xml
new file mode 100644
index 0000000000..4cca2700a1
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog-4.1.2.xml
@@ -0,0 +1,66 @@
+<?xml version='1.0'?>
+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" 
+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
+
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.1.2............................... -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.1.2. It is provided as
+     a convenience in building your own catalog files. You need not use
+     the filenames listed here, and need not use the filename method of
+     identifying storage objects at all.  See the documentation for
+     detailed information on the files associated with the DocBook DTD.
+     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
+     detailed information on supplying and using catalog data.
+  -->
+
+<!-- ...................................................................... -->
+<!-- DocBook driver file .................................................. -->
+
+<public publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
+        uri="docbookx.dtd"/>
+
+<system systemId="http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
+        uri="docbookx.dtd"/>
+
+<system systemId="http://docbook.org/xml/4.1.2/docbookx.dtd"
+        uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN"
+        uri="calstblx.dtd"/>
+
+  <!-- already included in docbook 4.2
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/> -->
+
+<public publicId="-//OASIS//ELEMENTS DocBook XML Information Pool V4.1.2//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1.2//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.1.2//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.1.2//EN"
+        uri="dbcentx.mod"/>
+
+
+<!-- End of catalog data for DocBook XML V4.1.2 ............................. -->
+<!-- ...................................................................... -->
+
+</catalog>
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
index 6452c8d99f..ae53d7f4e9 100644
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
+XML DTD, together with older versions 4.0, 4.1.2, 4.2, 4.3 and 4.4."
+HOMEPAGE = "https://www.docbook.org/xml/"
+
+PR = "r1"
 
 LICENSE = "OASIS"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
@@ -11,42 +12,51 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e763
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
-           file://LICENSE-OASIS \
-           file://docbook-xml-update-catalog.xml.patch \
+# The legacy catalog versions 4.0 and 4.1.2 are taken from an Ubuntu package.
+SRC_URI = "\
+    https://docbook.org/xml/4.2/catalog.xml;name=catalog-4_2;downloadfilename=catalog-4.2.xml \
+    https://docbook.org/xml/4.3/catalog.xml;name=catalog-4_3;downloadfilename=catalog-4.3.xml \
+    https://docbook.org/xml/4.4/catalog.xml;name=catalog-4_4;downloadfilename=catalog-4.4.xml \
+    https://docbook.org/xml/4.5/catalog.xml;name=catalog-4_5;downloadfilename=catalog-4.5.xml \
+    file://catalog-4.0.xml \
+    file://catalog-4.1.2.xml \
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
+        dtdVersion=$(echo ${catalog} | sed -rn 's/^catalog-(([0-9].){1,2}[0-9])\.xml/\1/p')
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

