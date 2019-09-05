Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC717F2DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:19:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s12so1964445pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mz3oPDLTuzvFOB3kmyx8whAnhguc8jGalugXkHoNf/s=;
	b=vRCNmpa48sx4tW1Ew2Yo4IdlTfQk+sdDHJ1vDJp8N9MrmOWWGYgBmBBnBglHnCH3Vv
	VmeBggYwKWwauzCKzVbYdwTWQWP7xkXqgATUBPmD6CfDDHnx93cH2+gxM0SKHdQVRw2D
	BJFOqxFB/M2opxBlZLArpzx36l0f6UcmX5jPdXqaqW2PwA+UiVOzikTeASfdhCiLmmTf
	t9HBvTIIvAWyN2U04xpvSBWT0vGblB+1iq/bfvqXmrVgc1PxNqjT4c3AApKLyw4n2cfL
	UKIBEvuMB4fp28vumw4Jr2pL0+GKHBUAmgDqUhXt7zU7g844+pmA8Nk9uckiAKBLKKQb
	fzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mz3oPDLTuzvFOB3kmyx8whAnhguc8jGalugXkHoNf/s=;
	b=goN5m5E0c1VLUR9jn9QWnWtnTwwtvuZmJjF9VAHjGS94bfHDHBy1k/WHq0VgBsru1P
	Chqlyoie12gW+c/N6I/SmjLzgfwcVvrYFdtM4E7ejW+CZ1n+Tbqcf+t6O85ex5lOhLbT
	W6s2yJMA4ATanArrU71ysC3B+71/0PGQho1rp1xBIYzQNXbxB1/EVWSMigAIGkC4Y7sW
	E8dPjl4VC05Y7ygvunI/zm47jqY2tH7eKu2uuE427wumKFnGbFeAm3ehT8DErN+yEIeQ
	uTPSzgr2328RYBCiNhbYE8gwMXOeLvtH7eHz2m8aqOCUms8JWMndf3A7xU3B7Yn5+l1k
	SWJQ==
X-Gm-Message-State: APjAAAWlKp3tt6Mw2n5Ir2Sc5IqvwkrOFzgYVN7zCaplkcUvEUZHRDPn
	bNSuWPGa0BweoG3vRERQsyGeTRMt
X-Google-Smtp-Source: APXvYqxrsqiPHQwDXbvC83B2R5dC7Nh2jpw+RvWB1o6l8S72rsrl6FjVie5IwzPg19rMUYrEc7ay9Q==
X-Received: by 2002:a62:ed04:: with SMTP id u4mr4451164pfh.220.1567696755096; 
	Thu, 05 Sep 2019 08:19:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:811a:fbd5:24bc:2160])
	by smtp.gmail.com with ESMTPSA id
	o129sm3125712pfg.1.2019.09.05.08.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 08:19:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 08:19:09 -0700
Message-Id: <1567696751-26950-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/3] bind: update to latest LTS 9.11.5
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
X-List-Received-Date: Thu, 05 Sep 2019 15:19:14 -0000

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


