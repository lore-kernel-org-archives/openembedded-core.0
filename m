Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED3260EEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 03:17:18 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id v2so4145999qcr.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=s2LU1dB0PHHwW8FgzxDeUmGfuQipR69rRJDXSPfeb0g=;
	b=y7S8BnhcKG6x57r10s12w0bKj9cq86GEyqshDJ4zOjKFcijOgSTDUiQD4pqvJ/NpHg
	ulv322bARFKzNddq/MH++xV44A+J5BLp10hIKPc5DBtRvGIeKfZQhWyb58g7LWYMQG5G
	d9OuXK/oKNB06bKrgiQVFTtMtOMnS/+s5vjNpaF3yTf7bRAclGxIPjI7NYjdbQtO4uaF
	RqCpBS5Pc0oJNfJIZni1/shEW7q166KTVPPrhNfqXSNdej31D+kNs/ibi6ximPtbO1yT
	t+Gvmk42gqq6ce8fGNIuIoAVXHaoHAQ2X9JILjX/dZOyPwNqxvQXI1tmUto1AA+HXKYK
	bejA==
X-Received: by 10.49.94.172 with SMTP id dd12mr27015514qeb.4.1379474239466;
	Tue, 17 Sep 2013 20:17:19 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id g2sm2006491qaf.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 20:17:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 00:17:10 -0300
Message-Id: <1379474230-20707-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] core-image-x11: Ensure x11 distro feature is enabled
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
X-List-Received-Date: Wed, 18 Sep 2013 03:17:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3:
- Resend

Changes in v2:
- New patch

 meta/recipes-graphics/images/core-image-x11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-x11.bb b/meta/recipes-graphics/images/core-image-x11.bb
index 64dc053..14bb1ac 100644
--- a/meta/recipes-graphics/images/core-image-x11.bb
+++ b/meta/recipes-graphics/images/core-image-x11.bb
@@ -4,4 +4,6 @@ IMAGE_FEATURES += "splash package-management x11-base"
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
1.8.4.rc3


