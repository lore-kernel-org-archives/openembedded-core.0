Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web11.11093.1621955471177369419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 08:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=kaSzwriQ;
 spf=pass (domain: foss.st.com, ip: 91.207.212.93, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PF72sH025255
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=O+dXsZ106+qIprRPNuL+gXQQiKLLqqICZymFVKwa+As=;
 b=kaSzwriQu4N8AiF1OgFZW/J4rFOgiYPCcBbSyfygVc3yJ8G1l0VkE/jXcF8zS7Z8tVvn
 7quxusFK03+JrqU4HpKGBmJwsmhGlpEq4mV38XNqN6Cqt6iH/qU/aTzvZnkO1rq8Gdw6
 fea1OaSaOwOqvKPn2dc+GDoF08JQZ0LhbPieKZts3MJMgUqjfWTtseBts3ZBw7lZ+i9A
 FNEMnCCs88I3IbCFwjiFCCHDqm+r4gdfQZUQ3VsjmzYeZkY70hsuFxtdCICg99UrZ56e
 PB9gTlAh+SCQM3Sc3U+hh52qc6rapbEyv831IE+3eTCATRby2WDib3NPCq1ct0N74HFQ 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38rqekcra6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18BBA10002A
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FF7F22A66C
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:07 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May 2021 17:11:07
 +0200
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Subject: [dunfell][PATCH 1/2] glib-2.0: use python3targetconfig
Date: Tue, 25 May 2021 17:11:05 +0200
Message-ID: <20210525151106.522334-1-christophe.priouzeau@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_07:2021-05-25,2021-05-25 signatures=0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Meson request to have a valid python, meson-log indicate that
issue come from:
ModuleNotFoundError: No module named '_sysconfigdata'

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c3ddf18387..4a0b386a22 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,7 +28,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages features_check
+inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages features_check python3targetconfig
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1

