Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 299A2770D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:54:52 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so23395345pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LCZ5sb61eVVI6xjDPobew0zdIAg+zg7QkU8Q+Kke0BY=;
	b=e8d18ipgZwle2IrP76bMS/mLQATTpKa+YWkumiWSZVG1576zbpIK234xTB7TBEksAQ
	UWMIwYmp44CpMsnuNqW9KLZ4EEO1mMTRl/8hhgwp/DDPJl8rw+9UntRsSg3jR3HL6dls
	jEp4XHsnbcwAYyztaezssjIQb6u6ZMBdDYPMIn6fheUKtbiQe3oNs1WULBC3B+FBb4m7
	uNIn61ha2Iu/b/f74q9viBHYfScz8E8juDiyHsPbc0w+pEk20DcgzM6zQhIB6n1nMATl
	gAnGTmk0hPhv9Y9umKEKISOZAu1sToC1aHHsQabgx2Ot6dmZV6TUARooV8GmAdgKyElw
	Oeew==
X-Received: by 10.66.185.228 with SMTP id ff4mr33839019pac.79.1446591293049;
	Tue, 03 Nov 2015 14:54:53 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	ha3sm31427036pbb.28.2015.11.03.14.54.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 14:54:52 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 16:54:33 -0600
Message-Id: <1446591276-28139-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.6.2.11.gb05c2f9
In-Reply-To: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
References: <1446591276-28139-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 1/4] os-release: use quotation marks
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
X-List-Received-Date: Tue, 03 Nov 2015 22:54:55 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

According to the os-release specification, variable assignments
must be enclosed in double or single quotation marks if they include
spaces, semicolons, or other special characters.

Update the os-release recipe to use always use double quotation marks.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index c690b82..df19ca2 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -29,7 +29,7 @@ python do_compile () {
         for field in d.getVar('OS_RELEASE_FIELDS', True).split():
             value = d.getVar(field, True)
             if value:
-                f.write('{0}={1}\n'.format(field, value))
+                f.write('{0}="{1}"\n'.format(field, value))
     if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
         rpm_gpg_pubkey = d.getVar('RPM_GPG_PUBKEY', True)
         bb.utils.mkdirhier('${B}/rpm-gpg')
-- 
2.6.2.11.gb05c2f9


