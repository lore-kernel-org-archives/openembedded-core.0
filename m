Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A2DD4760AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:29:41 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r144so206354502wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xG5J9VB4qRtZzYcQzy5+ZNOvtMIQIuxvPBSIgC1ViL0=;
	b=FgNeasmmeIq3i80czDrO7V360jBhOoUcg9UpN/aacnn6rUHyGXnNlEAmErL8nxgokQ
	eS2sjKj+3vbGDFCorLLJDrBznFD34fMLUktPw3ujpRbCGwlTDz9Z1hl5tY2i0NFtojf0
	CDriYO36R67g3xjdz6OgtVWVVSlnFUOZD3jGcV6lDSbJFiVIHC0WHnLsNalP/6/qy4Rg
	Ky0OhO+xqY65/T6SgBaKc401+TP6rjcNUBUlH8MwHXvTwMT8IBfsr63wPZSH9d+fWjS+
	ES69RXqIuuAKFnzjBRagwIeT+vNSaMMs9PfBms9FTAC1gRWp1Mwhe5nWxgfbltfoSLUc
	UrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xG5J9VB4qRtZzYcQzy5+ZNOvtMIQIuxvPBSIgC1ViL0=;
	b=iQi/JCAD4IYPCEVrAWytQbGsEKP2fGUXD5EXqPEbRhlpjHoQ5rqrtXRbAZ4Ix/tR4w
	s8oVdwf4TrYpoAkk34M3oU3ok6l6Ydt3zNSNm403ukBSOU9lCnJc2NetriX1gy+CGq9R
	vpQup2Yu/KhmfPEDIjFmIJFr5SWNGgIfSVSu8I8gFfeJBJtE41quhT4e2qoi9kPvTpPI
	OzFVL3oDBIeukQlb+2C9Y6UbWV+wViNXqA8ksEAI40SFI7uXqh8NAvEgPm+MOXDhsTFa
	RF4UBojsk2aKSp1o5VwWTyM2cjFP2C07Htl9jCKStXXSDUGULbKBqhaIBu/hjvZRQn4e
	ee5g==
X-Gm-Message-State: AIkVDXJKGWqC1++4G924nWpSMCZsm2+Ay2LgPNy5R11wMnbrZNihMWP4ax8mreXt5Z2M+Uwy
X-Received: by 10.223.139.93 with SMTP id v29mr27161888wra.5.1485260981139;
	Tue, 24 Jan 2017 04:29:41 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o143sm26241192wmd.3.2017.01.24.04.29.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 04:29:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:29:36 +0000
Message-Id: <1485260977-10218-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] ppp: update SRC_URI
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
X-List-Received-Date: Tue, 24 Jan 2017 12:29:43 -0000

ppp.samba.org has disappeared from the Internet and isn't responding anymore, so
point the SRC_URI at the canonical samba.org download server instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 86ada69..b2c4d4c 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
-SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
+SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://makefile.patch \
            file://cifdefroute.patch \
            file://pppd-resolv-varrun.patch \
-- 
2.8.1


