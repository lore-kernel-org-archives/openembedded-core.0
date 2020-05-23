Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.778.1590254454808015138
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 10:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qSGJGUdW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id u1so11652294wmn.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 10:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cLh/Vxlu9mg3Dzo4d6gxlLkl3SU1pLaWuNQZTOTE9g=;
        b=qSGJGUdW5qS4iKRlk5OKCdBn6vAcrvIFsk2qVZ7ErTYp+qLxlnollNMdlA0RL1Vi6+
         ELK9w5LUywLFkYanEheg5+n17Je1a4pAejielYWFEJ1WNf+Fdf9aw5sOGQ+vFAKRgPAL
         Zye8edviAWn2mnrM3zRUcedcwX43TKXLfkZsj9B0k1D/dNMOstKZSN/B6e6/UIVPCvkk
         N+/Mq1eKRokWMDer7bfJmFtPax5v30f/2V39stVzFboyl0l12IvF3SZwCtmAaxYCXsmv
         F81UwtmDJuuVXlzOA3jIEol7MlrvFw+i75Q47WxY/Ih+ZmGQlM2f6M/DP7vDK2MX98t0
         NBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1cLh/Vxlu9mg3Dzo4d6gxlLkl3SU1pLaWuNQZTOTE9g=;
        b=qoGabYFk7JFkQNpHDpirZse69EDwYiWQotB6WjfKu1gyqTm3D7psvKggL0zNOSK3TK
         h6rHz4l4noxOIyIp5mbnxsOF9963pUJc+3FTZn+AWIqq4IjP41hfAwv9A48P5WgQPDXj
         /sdjBuvcat1kVw6UmoT+rYp0ejJbQiN2lMP1H50xUvOejGCvs1m3ridmvD+NawCOwe6n
         h8QKnTa01/9/daHZSY93n1tH6/fI0Eu1KhRtBfth+pavJF1nl8kGnMpbfPUsw6hE1Ukj
         eC32fMaxndVNoNxFEh+cb0/Bc/2Y6ykuATSoAbBOWSivh8rVUbs6YTypVNTWiea2poHT
         VskQ==
X-Gm-Message-State: AOAM532lu6hvQcURvfNBJ2WfX/HcLeMXOt3Z9xN6C0uyA3DpR17l5goR
	K0zVoECHmOfr3bbOUYsxpvvmahkVKf8=
X-Google-Smtp-Source: ABdhPJzEKs/F/pFswwztCHR4Xrg7UshHN5TwtEVkNshSsRmq5D6fjye8x2MDNWMN3+hHOkC31PQY+Q==
X-Received: by 2002:a1c:bd84:: with SMTP id n126mr3166163wmf.154.1590254452368;
        Sat, 23 May 2020 10:20:52 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id c143sm13302808wmd.43.2020.05.23.10.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 10:20:51 -0700 (PDT)
From: "Gregor Zatko" <gzatko@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gregor Zatko <gzatko@zoznam.sk>
Subject: [PATCH] docbook-xml: update recipe to stick with the upstream
Date: Sat, 23 May 2020 19:20:49 +0200
Message-Id: <20200523172049.1156001-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gregor Zatko <gzatko@zoznam.sk>

Until now a Debian package has been used as a source.
This change just switches it to project's upstream.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 .../docbook-xml-dtd4/catalogs/catalog-4.2.xml | 115 ++++
 .../docbook-xml-dtd4/catalogs/catalog-4.3.xml | 115 ++++
 .../docbook-xml-dtd4/catalogs/catalog-4.4.xml | 124 +++++
 .../docbook-xml-dtd4/catalogs/catalog-4.5.xml | 124 +++++
 .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  52 +-
 6 files changed, 502 insertions(+), 543 deletions(-)
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
 delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
new file mode 100644
index 0000000000..6920c2f7e0
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
@@ -0,0 +1,115 @@
+<?xml version='1.0'?>
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.2 ................................ -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.2. It is provided as
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
+<public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
+        uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.2//EN"
+        uri="calstblx.dtd"/>
+
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.2//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.2//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.2//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.2//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN"
+        uri="dbcentx.mod"/>
+
+<!-- ...................................................................... -->
+<!-- ISO entity sets ...................................................... -->
+
+<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+        uri="ent/iso-dia.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+        uri="ent/iso-num.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+        uri="ent/iso-pub.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+        uri="ent/iso-tech.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+        uri="ent/iso-lat1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+        uri="ent/iso-lat2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+        uri="ent/iso-grk1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+        uri="ent/iso-grk2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+        uri="ent/iso-grk3.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+        uri="ent/iso-grk4.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+        uri="ent/iso-amsa.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+        uri="ent/iso-amsb.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+        uri="ent/iso-amsc.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+        uri="ent/iso-amsn.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+        uri="ent/iso-amso.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+        uri="ent/iso-amsr.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+        uri="ent/iso-box.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+        uri="ent/iso-cyr1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+        uri="ent/iso-cyr2.ent"/>
+
+<!-- End of catalog data for DocBook XML V4.2 ............................. -->
+<!-- ...................................................................... -->
+
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
new file mode 100644
index 0000000000..34d1afdd94
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
@@ -0,0 +1,115 @@
+<?xml version='1.0'?>
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.3 ................................ -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.3. It is provided as
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
+<public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
+        uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
+        uri="calstblx.dtd"/>
+
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.3//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.3//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.3//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.3//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN"
+        uri="dbcentx.mod"/>
+
+<!-- ...................................................................... -->
+<!-- ISO entity sets ...................................................... -->
+
+<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+        uri="ent/iso-dia.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+        uri="ent/iso-num.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+        uri="ent/iso-pub.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+        uri="ent/iso-tech.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+        uri="ent/iso-lat1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+        uri="ent/iso-lat2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+        uri="ent/iso-grk1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+        uri="ent/iso-grk2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+        uri="ent/iso-grk3.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+        uri="ent/iso-grk4.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+        uri="ent/iso-amsa.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+        uri="ent/iso-amsb.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+        uri="ent/iso-amsc.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+        uri="ent/iso-amsn.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+        uri="ent/iso-amso.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+        uri="ent/iso-amsr.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+        uri="ent/iso-box.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+        uri="ent/iso-cyr1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+        uri="ent/iso-cyr2.ent"/>
+
+<!-- End of catalog data for DocBook XML V4.3 ............................. -->
+<!-- ...................................................................... -->
+
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
new file mode 100644
index 0000000000..8d709ba102
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
@@ -0,0 +1,124 @@
+<?xml version='1.0'?>
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.4 ................................ -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.4. It is provided as
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
+<public publicId="-//OASIS//DTD DocBook XML V4.4//EN"
+        uri="docbookx.dtd"/>
+
+<system systemId="http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd"
+	uri="docbookx.dtd"/>
+
+<system systemId="http://docbook.org/xml/4.4/docbookx.dtd"
+	uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.4//EN"
+        uri="calstblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.4//EN"
+	uri="htmltblx.mod"/>
+
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.4//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.4//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.4//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.4//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN"
+        uri="dbcentx.mod"/>
+
+<!-- ...................................................................... -->
+<!-- ISO entity sets ...................................................... -->
+
+<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+        uri="ent/isodia.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+        uri="ent/isonum.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+        uri="ent/isopub.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+        uri="ent/isotech.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+        uri="ent/isolat1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+        uri="ent/isolat2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+        uri="ent/isogrk1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+        uri="ent/isogrk2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+        uri="ent/isogrk3.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+        uri="ent/isogrk4.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+        uri="ent/isoamsa.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+        uri="ent/isoamsb.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+        uri="ent/isoamsc.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+        uri="ent/isoamsn.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+        uri="ent/isoamso.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+        uri="ent/isoamsr.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+        uri="ent/isobox.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+        uri="ent/isocyr1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+        uri="ent/isocyr2.ent"/>
+
+<!-- End of catalog data for DocBook XML V4.4 ............................. -->
+<!-- ...................................................................... -->
+
+</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
new file mode 100644
index 0000000000..f75c1d764d
--- /dev/null
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
@@ -0,0 +1,124 @@
+<?xml version='1.0'?>
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer="public">
+
+<!-- ...................................................................... -->
+<!-- XML Catalog data for DocBook XML V4.5 ................................ -->
+<!-- File catalog.xml ..................................................... -->
+
+<!-- Please direct all questions, bug reports, or suggestions for
+     changes to the docbook@lists.oasis-open.org mailing list. For more
+     information, see http://www.oasis-open.org/.
+  -->
+
+<!-- This is the catalog data file for DocBook V4.5. It is provided as
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
+<public publicId="-//OASIS//DTD DocBook XML V4.5//EN"
+        uri="docbookx.dtd"/>
+
+<system systemId="http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
+	uri="docbookx.dtd"/>
+
+<system systemId="http://docbook.org/xml/4.5/docbookx.dtd"
+	uri="docbookx.dtd"/>
+
+<!-- ...................................................................... -->
+<!-- DocBook modules ...................................................... -->
+
+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.5//EN"
+        uri="calstblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN"
+	uri="htmltblx.mod"/>
+
+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
+        uri="soextblx.dtd"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.5//EN"
+        uri="dbpoolx.mod"/>
+
+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5//EN"
+        uri="dbhierx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities V4.5//EN"
+        uri="dbgenent.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.5//EN"
+        uri="dbnotnx.mod"/>
+
+<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN"
+        uri="dbcentx.mod"/>
+
+<!-- ...................................................................... -->
+<!-- ISO entity sets ...................................................... -->
+
+<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
+        uri="ent/isodia.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Numeric and Special Graphic//EN//XML"
+        uri="ent/isonum.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
+        uri="ent/isopub.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
+        uri="ent/isotech.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
+        uri="ent/isolat1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
+        uri="ent/isolat2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
+        uri="ent/isogrk1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
+        uri="ent/isogrk2.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
+        uri="ent/isogrk3.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Alternative Greek Symbols//EN//XML"
+        uri="ent/isogrk4.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN//XML"
+        uri="ent/isoamsa.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary Operators//EN//XML"
+        uri="ent/isoamsb.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Delimiters//EN//XML"
+        uri="ent/isoamsc.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated Relations//EN//XML"
+        uri="ent/isoamsn.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Ordinary//EN//XML"
+        uri="ent/isoamso.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Relations//EN//XML"
+        uri="ent/isoamsr.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
+        uri="ent/isobox.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
+        uri="ent/isocyr1.ent"/>
+
+<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
+        uri="ent/isocyr2.ent"/>
+
+<!-- End of catalog data for DocBook XML V4.5 ............................. -->
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
index 6452c8d99f..786ca5418f 100644
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
@@ -11,42 +12,37 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e763
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
-           file://LICENSE-OASIS \
-           file://docbook-xml-update-catalog.xml.patch \
+SRC_URI = "\
+    file://LICENSE-OASIS \
+    file://catalogs/* \
 "
 
-SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
-SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
-
-S = "${WORKDIR}/docbook-xml-4.5.c31424"
-
-inherit allarch
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
+    for catalog in $(ls catalogs); do
+        dtdVersion=$(echo ${catalog} | sed -rn 's/^catalog-([0-9].[0-9])\.xml/\1/p')
+        DEST=${datadir}/xml/docbook/schema/dtd/${dtdVersion}
         install -d -m 755 ${D}$DEST
-        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
+        cp -v -R catalogs/catalog-${dtdVersion}.xml ${D}$DEST/catalog.xml
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

