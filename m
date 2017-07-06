Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id BAD8E77BDB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 19:49:12 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id j186so5789705pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lvPSRF7xJbEi/4OfzJz2G+afuEamQ2A1OIzOdQ3n8uM=;
	b=inJ6fAEeaX8srahMnhcow72hnn8nrpoDfbVKcCbk0gkgMTZQwSg4/dqSf9mXfDwp/b
	hBzlWONr4zbiF5GRL/PRMjciM+EkN9DCRp/RSYEe8An8sXSfVtQ0rKI+DwBesXE2xzsc
	F1mrQD4j5h++hpV+T1IYiGJM0LfetUjJ9IcuyzpIFVuvYDu54W+lc52X1UXMAeRtc+Se
	i4D3iJIa4QJAu94w9uT8Zx4dpZN8CnPfFaWomxOosjRQn4M1iy3IP/VW9mRBAoO4r1Aa
	4cQCXmIcarsm0O5cNqcC3eHTyqqVV9K/t83Ctz2PuIZO7A7Ja+oDApnuumTP+dwWLb/+
	lgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lvPSRF7xJbEi/4OfzJz2G+afuEamQ2A1OIzOdQ3n8uM=;
	b=oNK1a+k9tZfakygP4MmVjcZEVgvHx3yW/WkyrGUGTLGGaZyNsNKVTkckNnYgXQabD3
	Des9rRdO9rL/kQfzuLmvd3sj08+3OtzvihkLLEdRC69IVrpTTeUhU/uE4rXTtkBQ0D6m
	+/299R7heNvFI2BoouJD5KjMrN+1G2Reh5aB6Hnarphi/8VX1NukX68D4V5PteAcLx48
	AA9McBoit1VzEvdU851b6EPIGUMc3lwJ6clg8zR+Vi0lOijphf3bsnEux0BJsSiiLVwC
	WTP/jPZpYT9N7bYcwTpOF2bVr6v2kBH5ZyAlR5tv8bRpC8NaKlhn9WBykPIKGQz+pER5
	JFXg==
X-Gm-Message-State: AIVw1112qjbMrdaAD8Ek1y9i4HucPAnTJv3runuJJKc1RqwNCpTqfHmz
	WpKc+3wv6Wkwku76
X-Received: by 10.99.163.26 with SMTP id s26mr18995050pge.232.1499370553389;
	Thu, 06 Jul 2017 12:49:13 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e124sm2347580pfc.76.2017.07.06.12.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 12:49:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 12:49:00 -0700
Message-Id: <1499370542-31845-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
References: <1499370542-31845-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] lsof: minor recipe cleanup
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
X-List-Received-Date: Thu, 06 Jul 2017 19:49:13 -0000

  - Add HOMEPAGE
  - Remove ${S} from LIC_FILES_CHKSUM path
  - Use tabs consistently to indent do_configure()
  - Re-order LIC_FILES_CHKSUM definition to follow OE style guide

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/lsof/lsof_4.89.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 650b34c..0c38e97 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -1,8 +1,10 @@
 SUMMARY = "LiSt Open Files tool"
 DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
+HOMEPAGE = "http://people.freebsd.org/~abe/"
 SECTION = "devel"
 LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
@@ -12,9 +14,8 @@ SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a36
 UPSTREAM_CHECK_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
-S = "${WORKDIR}/lsof_${PV}_src"
 
-LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
+S = "${WORKDIR}/lsof_${PV}_src"
 
 python do_unpack () {
     # temporarily change S for unpack
@@ -36,11 +37,11 @@ export LSOF_INCLUDE = "${STAGING_INCDIR}"
 do_configure () {
 	export LSOF_AR="${AR} cr"
 	export LSOF_RANLIB="${RANLIB}"
-        if [ "x${GLIBCVERSION}" != "x" ];then
-                LINUX_CLIB=`echo ${GLIBCVERSION} |sed -e 's,\.,,g'`
-                LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
-                export LINUX_CLIB
-        fi
+	if [ "x${GLIBCVERSION}" != "x" ]; then
+		LINUX_CLIB=`echo ${GLIBCVERSION} |sed -e 's,\.,,g'`
+		LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
+		export LINUX_CLIB
+	fi
 	yes | ./Configure linux
 }
 
-- 
2.7.4


