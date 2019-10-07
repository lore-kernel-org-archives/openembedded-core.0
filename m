Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36FDB7D41C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x127so8845149pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Mz3oPDLTuzvFOB3kmyx8whAnhguc8jGalugXkHoNf/s=;
	b=NbLDvy9sJFDEtALk5fDgHA4+hgQW2DT5e7qqXUoRwx0TAmQQFEj1IiHi8frJKG5wOl
	tegoZ33dSwYR6SvSkE9pyl9duLWJQ0SAKmTk6mLIzbDosejLz6cnwwFk3MqzZjWeR3iq
	Ol30T7VsfZeI7TnG0eTmZbytwvTOED+vaEkIThExD4jvCIVjjtbNPODgzm0HAc1BNFg6
	LD42cYkwGacNsP4s/hyATSebt4AtOvlV8ErQJjFwSj/+5wtZhjJDczZfIxAz+LugICRb
	JF6nX66HFSquNNjJDPXiUJ92QC2M0L4/fqal6wp7SzaNSFXNSteAX9Yy6/mX7qzgajoV
	a4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Mz3oPDLTuzvFOB3kmyx8whAnhguc8jGalugXkHoNf/s=;
	b=jXxGnxqJ2BKs1XxzoojsDuy/leRq6e6+S2Z4n4qjKkoMwDrybWkT5OAROYsf1SKTEM
	U6vQQmAOBCYrvN4u10i8Qy3vTeE6rMcOx16DrP8TX8uCarZUyOGJevppAwNr8Iq9hU47
	zlepx+YujAhHR7E2GwHHa2D1DFJtqNr0H5ZBFcCxjZnK0WfVuzgg2kVectWpBO+WLEml
	dp9GdEnamI5XC9g0y0RTx+u3OT455fe5kFGVIOWwrHY8o7lGPCAbJpln4OjDwcoabV8n
	Kx6KaRqj3Qn/z42wKTl2zmV/+f9USkz3LCkXFNysQ4oXCaMWHKNdHMWukyYumMfI17yJ
	ub0g==
X-Gm-Message-State: APjAAAW4rr1d2MpLfQx9zXXnB3KrE5yD/9oLCn7B3tEqiJtu4QBfSehO
	JMn/6V/WhaCLKIlh6V9/l9SLt7uMmdw=
X-Google-Smtp-Source: APXvYqzqkqR9i/b6T5dN3z7Ua2yPMTv5FRw3abQ00UumNezlzI4fQCsf/tF0lHSaHUWO6Ion6s/XnQ==
X-Received: by 2002:a62:7790:: with SMTP id s138mr32851585pfc.57.1570461078782;
	Mon, 07 Oct 2019 08:11:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:49 -0700
Message-Id: <25b2f2c6fc67eabb0e7f0b7c5ffe08c554613c10.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 12/26] bind: update to latest LTS 9.11.5
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:18 -0000

From: Armin Kuster <akuster@mvista.com>

Source: bind.org
MR: 99750
Type: Security Fix
Disposition: Backport from bind.org
ChangeID: bca5c436229f1b8c7e8eb3e45fc6188ffdb5e224
Description:

includes:
CVE-2018-5738

drop patch for CVE-2018-5740 now included in update

see: https://ftp.isc.org/isc/bind9/9.11.5/RELEASE-NOTES-bind-9.11.5.html

Add RECIPE_NO_UPDATE_REASON for lts

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Also includes CVE-2018-5740]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bind/bind/CVE-2018-5740.patch                  | 72 ----------------------
 .../bind/{bind_9.11.4.bb => bind_9.11.5.bb}        |  6 +-
 2 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.4.bb => bind_9.11.5.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch b/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
deleted file mode 100644
index 7a2ba7e..0000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2018-5740.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Backport [https://ftp.isc.org/isc/bind9/9.11.4-P1/patches/CVE-2018-5740]
-
-CVE: CVE-2018-5740
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-diff --git a/CHANGES b/CHANGES
-index 750b600..3d8d655 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -1,3 +1,9 @@
-+	--- 9.11.4-P1 released ---
-+
-+4997.	[security]	named could crash during recursive processing
-+			of DNAME records when "deny-answer-aliases" was
-+			in use. (CVE-2018-5740) [GL #387]
-+
- 	--- 9.11.4 released ---
- 
- 	--- 9.11.4rc2 released ---
-diff --git a/lib/dns/resolver.c b/lib/dns/resolver.c
-index 8f674a2..41d1385 100644
---- a/lib/dns/resolver.c
-+++ b/lib/dns/resolver.c
-@@ -6318,6 +6318,7 @@ is_answertarget_allowed(fetchctx_t *fctx, dns_name_t *qname, dns_name_t *rname,
- 	unsigned int nlabels;
- 	dns_fixedname_t fixed;
- 	dns_name_t prefix;
-+	int order;
- 
- 	REQUIRE(rdataset != NULL);
- 	REQUIRE(rdataset->type == dns_rdatatype_cname ||
-@@ -6340,17 +6341,25 @@ is_answertarget_allowed(fetchctx_t *fctx, dns_name_t *qname, dns_name_t *rname,
- 		tname = &cname.cname;
- 		break;
- 	case dns_rdatatype_dname:
-+		if (dns_name_fullcompare(qname, rname, &order, &nlabels) !=
-+		    dns_namereln_subdomain)
-+		{
-+			return (ISC_TRUE);
-+		}
- 		result = dns_rdata_tostruct(&rdata, &dname, NULL);
- 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
- 		dns_name_init(&prefix, NULL);
- 		tname = dns_fixedname_initname(&fixed);
--		nlabels = dns_name_countlabels(qname) -
--			  dns_name_countlabels(rname);
-+		nlabels = dns_name_countlabels(rname);
- 		dns_name_split(qname, nlabels, &prefix, NULL);
- 		result = dns_name_concatenate(&prefix, &dname.dname, tname,
- 					      NULL);
--		if (result == DNS_R_NAMETOOLONG)
-+		if (result == DNS_R_NAMETOOLONG) {
-+			if (chainingp != NULL) {
-+				*chainingp = ISC_TRUE;
-+			}
- 			return (ISC_TRUE);
-+		}
- 		RUNTIME_CHECK(result == ISC_R_SUCCESS);
- 		break;
- 	default:
-@@ -7071,7 +7080,9 @@ answer_response(fetchctx_t *fctx) {
- 		}
- 		if ((ardataset->type == dns_rdatatype_cname ||
- 		     ardataset->type == dns_rdatatype_dname) &&
--		     !is_answertarget_allowed(fctx, qname, aname, ardataset,
-+		    type != ardataset->type &&
-+		    type != dns_rdatatype_any &&
-+		    !is_answertarget_allowed(fctx, qname, aname, ardataset,
- 					      NULL))
- 		{
- 			return (DNS_R_SERVFAIL);
diff --git a/meta/recipes-connectivity/bind/bind_9.11.4.bb b/meta/recipes-connectivity/bind/bind_9.11.5.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.4.bb
rename to meta/recipes-connectivity/bind/bind_9.11.5.bb
index cb4a21a..21e979f 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5.bb
@@ -20,14 +20,14 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2018-5740.patch \
 "
 
-SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
-SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
+SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
+SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
+RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
 
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
-- 
2.7.4


