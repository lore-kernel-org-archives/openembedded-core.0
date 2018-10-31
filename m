Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id A1C8C79BD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 14:40:04 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y11-v6so7402307plt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wTz4tEEaTIP9LDozDnPD61979YUhNuUIAIU0Y4EqqVk=;
	b=Ih5zSSmv+/bTepc4cbG2E4oRMiJKW2EsUkg2B6mz3tkpCaAsRr/iqPC99NrftDkeuz
	DIQqKNjKTWhJPZTWHZO084mD40J6NijdIDLVWC4FLXxxsB6aPYqmj/tG04JAPAejJBIn
	1gtmbKhZRCISYgkW3tjRpP9RSU9UAjEMy2opY3kQH60yz2QJxu4rHmCL7gQkjqccmBke
	ZsZiyBXtH9tr8735ZcgynTx8zuh5TKhTzwiLkW0nZzLrQM+Xg5i4W9boOjn0m0dYfsQI
	D+64+z46iyP/CaiirO6JFnno1F72lRBBiV2fp4UCKPcvayYagzjgksyUYrKYpWiXV5b5
	rhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wTz4tEEaTIP9LDozDnPD61979YUhNuUIAIU0Y4EqqVk=;
	b=RDzvsYfoWbyPMOrb0+Wa30X8dCidxK0FKTSO5N/ThFxys911zNPxSg+WoISof+uQaY
	jQP8k6afya9lwPjIHD6Sowm0PYGXgc6bbclpzhqGIK2C6soDdPtSA7vFL76PZFf723dK
	mgVSCItX2++EFSKLpx2dpJSBEcrDpThsregJDm2SmpGOX5FZJ/oRnaJCS+VsoB4P5YB6
	fpJ8G/yvTy/LRtQrE3Ys2VFmt7aHk8OYan0mztA3cule0ahvVA3rr4ZbkvqHTJMVuW3t
	6aPzMHxpjQUpbYDgVmN7tOlCjnNLyDHbqZ0rOUcleYAoLbUw4QRZ94omoc+NB/Y0liZo
	DHkw==
X-Gm-Message-State: AGRZ1gLIauiWO5+LJyj9MBcIvZRN1V9aWLDYKWaBK7atNNOn4fRYpMfQ
	0G+Vdvu8wo35Y6IaTR5lgGpLv1ua
X-Google-Smtp-Source: AJdET5eGhcdykHjAn9GYtqc2IRezy1wESRrgz0K0fHseewpWWDiOJ/7J9IFFMuDSXY0//l9KN9T2sw==
X-Received: by 2002:a17:902:9693:: with SMTP id
	n19-v6mr3781840plp.20.1540996805491; 
	Wed, 31 Oct 2018 07:40:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:571:f5d0:d940:5c94])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm7123568pfj.125.2018.10.31.07.40.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 07:40:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 07:39:59 -0700
Message-Id: <1540996800-29855-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
References: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
Subject: [master-next][PATCH 4/5] bind: update to latest LTS 9.11.5
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
X-List-Received-Date: Wed, 31 Oct 2018 14:40:04 -0000

includes:
CVE-2018-5738

drop patch for CVE-2018-5740 now included in update

see: https://ftp.isc.org/isc/bind9/9.11.5/RELEASE-NOTES-bind-9.11.5.html

Add RECIPE_NO_UPDATE_REASON for lts

Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


