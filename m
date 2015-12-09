Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 910216FF91
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 23:45:09 +0000 (UTC)
Received: by pfbg73 with SMTP id g73so38439468pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 15:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OSdFYw7zkYYltyE4QoZjZe/v1331FShf/JaSb522hx4=;
	b=G7lVylCXCOxWVEUs9f0NCMmM49kppiFHn6cYG8rAIsmTugNS3wIyQPs9OO/Ka+cxLE
	O7v6cmo5Prd8SmJopbX+OqhqIIstGE8U/CbOXL7he3vbt2eBa3lMq/WmL0Oqk/M1Sl2s
	DCHMFWvZ+wayNcl8SzTwXBBPu+sTllqP9d2yQSlVKqNXVkOBu5tNYv2+FM9QshkbTu3S
	9gzDu8xVTI6/M0EmJnHKZen3VdwoJJNdQsYhcRApm5zILzg5p2ErEo3NelsIAq+9nc7T
	s0J1+lPivaiRmQj898Aci8MSs3dL0yK9Xrk54xgFECazN/QsiQzttVfTywIlObYS57JW
	L7GQ==
X-Received: by 10.98.74.221 with SMTP id c90mr2334141pfj.127.1449704710367;
	Wed, 09 Dec 2015 15:45:10 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o2sm14252466pap.31.2015.12.09.15.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 15:45:09 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 15:45:03 -0800
Message-Id: <1449704703-28285-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] kernel.bbclass: drop unnecessary 'eval' from kernel_do_configure()
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
X-List-Received-Date: Wed, 09 Dec 2015 23:45:11 -0000

KERNEL_CONFIG_COMMAND will be expanded by bitbake, so can be
used directly in kernel_do_configure()

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b75a462..4ce1611 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -346,7 +346,8 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
-	eval ${KERNEL_CONFIG_COMMAND}
+
+	${KERNEL_CONFIG_COMMAND}
 }
 
 do_savedefconfig() {
-- 
1.9.1


