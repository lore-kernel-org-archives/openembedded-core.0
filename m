Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE566148C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 14:22:21 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CC70BF81212; Wed, 30 Oct 2013 08:22:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 261D9F81211;
	Wed, 30 Oct 2013 08:22:21 -0600 (MDT)
Message-ID: <5271162B.6020008@mlbassoc.com>
Date: Wed, 30 Oct 2013 08:22:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] core-image-basic.bb: Allow user extensions
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
X-List-Received-Date: Wed, 30 Oct 2013 14:22:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Allow the user to provide additional packages to this image.
This lets core-image-basic behave like all other core-image*
recipes (which do support CORE_IMAGE_EXTRA_INSTALL), as well
as match the documentation which suggests this as the mode to
extend any core-image* image.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
  meta/recipes-extended/images/core-image-basic.bb |    3 +++
  1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index 091f57d..e393a28 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -3,9 +3,12 @@ functionality installed."
   IMAGE_FEATURES += "splash ssh-server-openssh"
  +CORE_IMAGE_EXTRA_INSTALL ?= ""
+
  IMAGE_INSTALL = "\
      packagegroup-core-boot \
      packagegroup-core-basic \
+    ${CORE_IMAGE_EXTRA_INSTALL} \
      "
   inherit core-image
-- 
1.7.9.5


