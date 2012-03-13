Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7bYZ-0005qr-J4 for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 00:55:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DNkMxo001218
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:46:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32245-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:46:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DNkEHs001212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:46:15 GMT
Message-ID: <1331682374.18586.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 23:46:14 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] perl-modules: Fix LICENSE fields to mention the correct license versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 23:55:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/perl/liburi-perl_1.59.bb b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
index 877b252..3916b1e 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.59.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
@@ -3,8 +3,8 @@ The module implements the URI class. URI objects can be used to access \
 and manipulate the various components that make up these strings."
 
 SECTION = "libs"
-LICENSE = "Artistic | GPLv1+"
-PR = "r0"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index ff61078..be41578 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "XML::Parser - A perl module for parsing XML documents"
 SECTION = "libs"
-LICENSE = "Artistic"
+LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
 
 DEPENDS += "expat expat-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index ba5ebd0..163dc76 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -4,8 +4,8 @@ works in combination with XML::Parser, PerlSAX, XML::DOM, \
 XML::Grove and others."
 SUMMARY = "Collection of Perl modules for working with XML."
 SECTION = "libs"
-LICENSE = "Artistic | GPLv1+"
-PR = "r2"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
index 205aa4d..1e22cdd 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
@@ -1,8 +1,8 @@
 SECTION = "libs"
-LICENSE = "Artistic"
+LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
 DEPENDS += "libxml-parser-perl"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
index 0f49950..c904c37 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Perl is a popular scripting language."
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
-LICENSE = "Artistic|GPL"
+LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 PR = "r0"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
index 98ca804..dc950f1 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
-LICENSE = "Artistic|GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
index 67c5836..12439cf 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "TimeDate - parser for absolute times"
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
-LICENSE = "Artistic|GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
-PR = "r3"
-
+PR = "r4"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
index f306ff1..cf89cb6 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-ba
                 basic checks. "
 
 SECTION = "libs"
-LICENSE = "Artistic|GPLv1+"
-PR = "r1"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=3b2b564dae8b9af9e8896e85c07dcbe5"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
index ee9ac30..3a0873f 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
@@ -8,10 +8,10 @@ come from the Java JAXP specification (SAX part), only without the \
 javaness."
 
 SECTION = "libs"
-LICENSE = "Artistic|GPLv1+"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 




