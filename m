Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 17D816103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:15:02 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id l10so3674530qcy.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=aofGZsARpIbDz6etrukz/TMQdRt7hl3i3Zt9EeTei9Q=;
	b=cpZmFpTWjCyydGBTs8MiFeMLB8XomXkKYD0CE2H5i0KSHdKXfe3Dn53fOAN3SFv4n7
	Bv4lUpQkHswygqfcAFZk6QTS25y9tynn5m/yTfNVVe6XPnvuds9XOkPhdkXjw0FoAE98
	WL1NvKPItrp0in0xTplMNSHSlFWm6e9Ky+2N4BHcymocS+Y/kTJBm0k6POe28xxcpewk
	F1o0u/Jz4z9JoioVZdUWwO1Pn5UrdfvyY02sa+f9Uh4ph4VfwpopOD52yWGvjF3Q0NWZ
	5Dldzp9VJ3vlvyBhIVX+SM8fC5FyMBh9hzu4KiZVuu4CjCF4O3JHnU0TPbppVI8moKP6
	6zWQ==
X-Received: by 10.224.122.66 with SMTP id k2mr40043079qar.47.1372774502274;
	Tue, 02 Jul 2013 07:15:02 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id 15sm37190458qaa.9.2013.07.02.07.15.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 07:15:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Jul 2013 11:14:39 -0300
Message-Id: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] lttng-tools: Update to 2.2.0 based release
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
X-List-Received-Date: Tue, 02 Jul 2013 14:15:02 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../lttng/{lttng-tools_2.1.0.bb => lttng-tools_2.2.0.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.1.0.bb => lttng-tools_2.2.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
index e7ce7fc..e664d85 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt lttng-ust"
 
-SRCREV = "917f768512b5d336d553b801f6c5308d90252a89"
-PV = "v2.1.0"
-PR = "r0"
+SRCREV = "eff0b2c38d24092c41bbb51926ac4e3b8c6acb83"
+PV = "v2.2.0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
 
-- 
1.8.3.1


