Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4Is0-0005b1-8V
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 23:26:04 +0100
Received: by mail-ea0-f173.google.com with SMTP id i1so2236106eaa.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 14:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=hnHREQENl8dqdp4iheLz6gIQ6yzopsNT4Are7MVNVZg=;
	b=AzPVXXGbpWUPAh2UosTO52SrqRUf/dcmHgFf/35sf5DFVlHBBNdUXFRWXK5dKTbtaW
	YzZfV5OPB5aqkiY4L4616MNFkF/VlleTOVdiIl6OQOXwEw0IwoaKCmc+mVYwVarz4zBJ
	/WLp3xH7B03vK/0XZte+Z4YwE+Cn+M8IKZ2yhAV48O0n9teThss+t9n6I/wYW0FHODkW
	7QchxuNOpRcv1mMPCDbSGJQ/hgpL0a+/8DLjVYAYuuA0M4aPvj78tQ/PDXYsMj7VvPq3
	ZM06jwqA37dxF+yUiqSg3HVpA80VLmDN5uMatX+N+WOziy/kd2D4kDtRicsOoXpAjlR0
	Lfhw==
X-Received: by 10.14.194.4 with SMTP id l4mr31875863een.12.1360447808765;
	Sat, 09 Feb 2013 14:10:08 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com
	(5-13-217-124.residential.rdsnet.ro. [5.13.217.124])
	by mx.google.com with ESMTPS id k7sm51774853een.8.2013.02.09.14.10.07
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Feb 2013 14:10:08 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2013 00:09:57 +0200
Message-Id: <1360447797-10187-3-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360447797-10187-1-git-send-email-andrei@gherzan.ro>
References: <1360447797-10187-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkL6G4b95k4dtvbQbBFwAg83pCh1QBXZlM0u9VWinoZZz5Vhmw5ZQcMG9m5Wp3LZLuNaqZm
Subject: [PATCH 3/3] udev: PR bump
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2013 22:26:04 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/udev/udev_182.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index 56d412e..42b4d08 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r5"
+PR = "r6"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.9.5



