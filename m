Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA2773BB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:41 +0000 (UTC)
Received: by igrv9 with SMTP id v9so162742815igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PK5AQGfNp1M1w5i0wKUbb1MPNTgCvFten27JioF0MD4=;
	b=E/HMjSY0R8SXCH44CJ/GVoncVj94/b3jcHfxc8oV6Y+1Mnfui2Dh/DyVnyOV4QDHLa
	7liV01i87drnuQjMYrc9PIHw6wC+MdoXHahdpXWJZONCQzeHw4jDsm/Plo/f5KLjZq50
	2Q3trUAgWc6oy2zx7Dl09ii0HAF5Y8O+QdI/sh7YBA7DP1nxIXdfbZ16lrRkMo1K7CPp
	uV7HRxxXpnThY/WCUGbO+liADqoYD5sFhjoP9YJq4rNwo+ZMkNjUA+II9uLNaQUi9i7Z
	4zHUVbnt7gp9uASlpxSJdh84cMv36CrvE4wCnq0pcxgty3mNeGM1mIEzNw7Vjs+2G56v
	umvg==
X-Received: by 10.107.12.92 with SMTP id w89mr1282870ioi.10.1436215841262;
	Mon, 06 Jul 2015 13:50:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:49:58 -0700
Message-Id: <1436215810-23722-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 01/13] distrodata.bbclass: fix typo, Upsteam -> Upstream
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:41 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/distrodata.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 39d5508..a228242 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -10,7 +10,7 @@ python distro_eventhandler() {
     with open(logfile, "a") as f:
         writer = csv.writer(f)
         writer.writerow(['Package', 'Description', 'Owner', 'License', 
-            'VerMatch', 'Version', 'Upsteam', 'Reason', 'Recipe Status',
+            'VerMatch', 'Version', 'Upstream', 'Reason', 'Recipe Status',
             'Distro 1', 'Distro 2', 'Distro 3'])
         f.close()
     bb.utils.unlockfile(lf)
-- 
1.9.1


