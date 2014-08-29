Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id F039471186
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:15:30 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so2905318qgf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=H4o8aKYmOuWnPcSSkPE5Upifu6Wfdn55Qm6VVCQbLKI=;
	b=OB9MH6oyPpMn4MrHMvhXBhMePnybEgwLP/jcQViSkKfBe4NuAe9v/Hw9k/iJfJV0wE
	rTb5Rf+WY0lqKU6xrKhfl3B2lC70YCWSRm62CsuMhS4K5M9RSOjY4FU3MoSNAr/dRfbw
	OXH2aKrwzdUiyGpUBQ+fy6wBEJNHzCX6Uck6Mj7vs6oCbSvuIOfarr+bnbtoaKSWhpqL
	+o99tKCXwZsv7C9yF1cgXxka/3HqfO4M4Sil7TOvKtENj+xuM1oVKCU2MI7B5/vgg3aJ
	BG9Im6sKrghProSa9LL0GWeACMJHmzs5ZyM5l4X33DMF07DyDMQeASV5oFk9AGWblk3p
	jorQ==
MIME-Version: 1.0
X-Received: by 10.140.104.162 with SMTP id a31mr20046399qgf.104.1409346931938; 
	Fri, 29 Aug 2014 14:15:31 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 14:15:31 -0700 (PDT)
Date: Fri, 29 Aug 2014 15:15:31 -0600
Message-ID: <CACS+7ZRkPrqrydPR_HLfUUi=E44x_2Of1gb_i84TNbfWMqjXdQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] lighttpd: install config file without execute permissions
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
X-List-Received-Date: Fri, 29 Aug 2014 21:15:31 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index 0acc37d..20d5c1c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -51,7 +51,7 @@ SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 do_install_append() {
  install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d
${D}/www/pages/dav
  install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
- install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+ install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
  install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html

  install -d ${D}${systemd_unitdir}/system
-- 
1.9.3

