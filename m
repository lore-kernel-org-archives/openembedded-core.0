Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 23A2F60290
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:06:59 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a197so83463400wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U5SKpXgjG7Z0y6R0ZGuFTpSTnE6WFbxJwYuvidu1sHQ=;
	b=sb3IYxV0YE1qjwD9Q0d0S+JLlp0uxhHneSnlK8rr//lYc15EDGDCLSjIYZnhGWbnYX
	jTxJqe8Gu2a8Dgj3zvxCmrEaqhovtmPdaCOdyjlgiIP90GDVj/L2Ndl+j6izUbOR6eIt
	/OlGMbo7Tu9Kx2gwAefUkoZLr9bfJYnFGM3vZThUb9/Wu4QnYxYZ8cYqhrws/kKYLFJO
	0k2Vvux8bZmUQ7zK/ltEqPEDZfvGG+4y7FfmV8rVd1soeRM8m62dwnYt8dS1XZE2P9Nh
	/zHq9Ln/WTa+gl7dF5xwTJU9vxr9Q5tA+O5IPcTWyovISkLejwQHeWRaSRj/7QAwLUR8
	ntmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U5SKpXgjG7Z0y6R0ZGuFTpSTnE6WFbxJwYuvidu1sHQ=;
	b=EfpLIcceaAo2q9YexQF6AYa3XMr/4Y6bkmENanjeclPL8+Gvi6VPjnyKQp9pugBZB4
	+JCrxIj9Nm81CaS3/WGGo+7lygQlF5qtDdsAoTKriNkD4k4W1/75W1S5q1YdVeDYg0Zv
	4sxmqwdmuQY3gklX6LGaoRpD8m7KZHo4GpTuyUSAURzJzvzmHgiiUQ3FEZpPlaGZmjGN
	sinGrOXacusJUQ7Tvi86nkrDAVp8J7aZoBqP69k+LRz+KuGPFl1LRkKkauLfiLo9b5uN
	pQYGAUzT81KlFtm7KfCW0/1UhCn2/KCOmrc38kRNzKsYQQZoiP+r/83SRXrC2lLMIKDi
	XwkA==
X-Gm-Message-State: ABUngve910gWJN7KtJMNAc3CBkwfYPv65ePvvkhxJ8LnZfw92LA/Ovn+jkdnBFSxgraWFy7I
X-Received: by 10.28.163.5 with SMTP id m5mr852926wme.98.1478012819969;
	Tue, 01 Nov 2016 08:06:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c198sm30954467wme.24.2016.11.01.08.06.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 08:06:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 15:06:53 +0000
Message-Id: <1478012813-7913-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1478012813-7913-1-git-send-email-ross.burton@intel.com>
References: <1478012813-7913-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] shadow: add nologin.8 to alternatives
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
X-List-Received-Date: Tue, 01 Nov 2016 15:07:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 35a18f8..f79565b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -180,11 +180,12 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1"
+ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
 ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
2.8.1


