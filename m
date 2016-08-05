Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED988770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:17:17 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id o80so41658358wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=caAotvc9p5z5tmWpqc8JoR2b7TiYvIx0FcawlZVpPzU=;
	b=ChvSA8dKmo2rm9QsgytSyEgOFICJb0EIzJIQaV0TW6VDRag1DP9DG7M4GZNeZwZ+ZH
	YYiNdw7vuVMAF8uIMgUcz7L3oIUZWKpYBmA5LcZkQcKUc5LSrXI/3Lbqjodo+YV5NtmZ
	vJ94YMb9NGCftIoD7vFJE9xJEEURaAUEASDbFdGr513zqUf4DEacekQL0sq1yN5Dzspl
	yChKKeC3IvcK7eJReJiemN1arK76pROFzRR6DwTnBPxFrIZI4tlgvW5Pd0puset2qJ7i
	0XwUQv3LNFqz4QQ8XT5g/nc2kGZWESo2e1DVIr5YrctbPIjGwtFsTXO9kuKB2axV+O/l
	Fj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=caAotvc9p5z5tmWpqc8JoR2b7TiYvIx0FcawlZVpPzU=;
	b=DVRLpJehXxdUdI1uXNY8G436JoeDe/gSeSIlQLT5WAzMyAC6v+4mljxH7obUqmiTh1
	btnwCTU+yaRenxEzXh/P5hF6q0gDFktyZJMkbW1PYVq+dlBZX9qZYTrs6VKK6ZPDrPLP
	iSiI0AgY9fKKVFYTvDdJ3NeDdABzq6jsUWVpG2zfGfX/RO2zcmweWztI8ARrvlEoPsEA
	kymBuqI8+YWj/SAfiTEOv7jElHBF3B8WaJMIrFkdSrGO9dWFyMLH7pK7wF0gxrvMbyPh
	0eYPcYRsfGFK8qkGQeo/t4a1lJees7GPXSoCRBy5XnycqRR2NN6j0pEISxRgOBej9hO9
	hAsw==
X-Gm-Message-State: AEkoouthM4S5mGV+N3HQpZKzOqGJf0nYU5XGYrL/RYDgGjbmn3z822W/NUUoUAj7RECeqsMR
X-Received: by 10.28.111.213 with SMTP id c82mr3932037wmi.47.1470410238158;
	Fri, 05 Aug 2016 08:17:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm18285249wjc.28.2016.08.05.08.17.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:17:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:17:11 +0100
Message-Id: <1470410231-21681-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
References: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] hdparm: set LICENSE correctly
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
X-List-Received-Date: Fri, 05 Aug 2016 15:17:18 -0000

LICENSE is recipe-wide so should be BSD & GPLv2, and then override LICENSE_${PN}
to just BSD as LICENSE_wiper is GPLv2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index ec3d26f..93a37ff 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -2,8 +2,11 @@ SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
-LICENSE = "BSD"
+
+LICENSE = "BSD & GPLv2"
+LICENSE_${PN} = "BSD"
 LICENSE_wiper = "GPLv2"
+
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
-- 
2.8.1


