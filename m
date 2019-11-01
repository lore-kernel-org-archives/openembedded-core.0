Return-Path: <Alexander.Hirsch@gin.de>
X-Greylist: delayed 1928 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Nov 2019 12:19:32 UTC
Received: from good-out-10.clustermail.de (good-out-10.clustermail.de
	[212.223.36.11])
	by mail.openembedded.org (Postfix) with ESMTP id A07EC7F8A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 12:19:32 +0000 (UTC)
Received: from [10.0.0.2] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Alexander.Hirsch@gin.de>) id 1iQVOg-0008SO-Rf
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Nov 2019 12:47:24 +0100
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2)
	(envelope-from <Alexander.Hirsch@gin.de>) id 1iQVOg-0006a4-N7
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Nov 2019 12:47:18 +0100
Received: from LT-001-212-1.gin-domain.local (10.160.140.121) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Fri, 1 Nov 2019 12:47:17 +0100
Date: Fri, 1 Nov 2019 12:47:16 +0100
From: Alexander Hirsch <alexander.hirsch@gin.de>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20191101114716.GC2935@LT-001-212-1.gin-domain.local>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.160.140.121]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH] libksba: Fix license specification
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
X-List-Received-Date: Fri, 01 Nov 2019 12:19:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The tools (e.g. build system, tests) & manual are licensed as GPLv3+ and
the library itself is GPLv2+ | LGPLv3+.

This is documented in libksba/AUTHORS:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=blob;f=AUTHORS;h=c161951281f2a432ad0ff112111f70a83e1d93fa;hb=3df0cd32e3b21b7da96a93d1f84d6cb6a77b89be

Signed-off-by: Alexander Hirsch <alexander.hirsch@gin.de>
---

On the side, while looking where/how to send a patch I looked at this page:
https://www.yoctoproject.org/community/
The link "Submit A Patch" links to the style-guide instead of the
"How to submit a patch"-Page on the Wiki. Is this intended?

 meta/recipes-support/libksba/libksba_1.3.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index a7ea53f..4deda18 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -1,6 +1,8 @@
 SUMMARY = "Easy API to create and parse X.509 and CMS related objects"
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
-LICENSE = "GPLv2+ | LGPLv3+ | GPLv3+"
+LICENSE = "GPLv3+ & (GPLv2+ | LGPLv3+)"
+LICENSE_${PN} = "GPLv2+ | LGPLv3+"
+LICENSE_${PN}-doc = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
-- 
2.7.4

-- 
G.i.N. Gesellschaft für industrielle Netzwerke GmbH
Raiffeisenstr. 15
D-64347 Griesheim

Telefon: +49 6155 - 8259 - 0
Telefax: +49 6155 - 8259 - 11

E-Mail: alexander.hirsch@gin.de
Internet: www.gin.de

Sitz: Griesheim
Registergericht: Amtsgericht Darmstadt, HRB 5068
Gerichtsstand: Darmstadt
USt.-ID-Nr. DE 111633284
WEEE-Reg.-Nr. DE 20824942

Geschäftsführer:
Dipl.-Inform. Andreas Schoenberg
Dipl.-Ing. (FH) Kay Wuttke

