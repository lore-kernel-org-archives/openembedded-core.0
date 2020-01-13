Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9E93F7FD45
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:31:03 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id z16so5046613pfk.0
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=eYiKpPxsQKM3K8W120QLcr4yIUcfVwfEug4xmfJKUJLO6sADiiCYvEGKkWgYr10yyy
	lrbb+6xD6TFintR8yRJ9IiRx54GRq0Nyys4IFpOmMefa/YBYG3aRdUmmXamWfV1+CPkS
	uue5kGgBWjO49u+/DW7H0CXp4Bgg9BVoHSIO+DRCcfMsTTukhExVR4DnI8ndJDLcbzf8
	hMa3QknOYRkQSAojciyqlBkATDDveqUGMqxyzDz7VouOlnalvOXjIM43PKjiuXnu27nz
	h6mmHsY6tH8al6L9TYABE/8+KAIA4BzbLi6+QED4d6dSY5JzOloae4UhJTSlgyYyq+TE
	m4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=uTYy7S8XWz7ngsHoFqwPItheeXbFvLWemzsSq7scj5YYRphI1wJq9Kn9kPY4p0zHES
	e2Sw2VsjfShzyxWFVz7AJpb70MhMtG2jFugt1uJkyvIJJT0yDq2WUdAURK/sx+Up+VY2
	0bTznBfl1itPrZJ6rfa/bgYDVuqO3eizIW9/gOWr5/KJ/ubCie+ZlXUPuWX6CO4ZI1hB
	okp0BUS68pM8S+N9xq+7EQ3SSICgMKwWQTBOhJWdA95lnaK26mr18vzLlc7vnaPnqiJz
	GgRDQHj7ORA+klvo3084x4wkCpK4JUEWoTDSnwrRahWLI6CvTszA6CFTGiD0DFjwED3N
	TQBw==
X-Gm-Message-State: APjAAAX8JHmxIbbs8OQSFxeRo1p+R0s4bzKDMN1SymVax1EUI28oo+8V
	QwTKKKi6EL0yfBVSLdXYcofVQhsI
X-Google-Smtp-Source: APXvYqyt/SiwgEWNKd6hrUy3TYQmKD2/TlTTu5Rv7sRmVjlLmVX4XkqF8SJLayP4smfd/hKrhGcokA==
X-Received: by 2002:aa7:8a8e:: with SMTP id a14mr20126021pfc.217.1578929464688;
	Mon, 13 Jan 2020 07:31:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.31.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:31:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:26 -0800
Message-Id: <adb6af60dcf098bfce64168e6443c26d124661c4.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 27/28] sudo: Fix fetching sources
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
X-List-Received-Date: Mon, 13 Jan 2020 15:31:04 -0000

From: Ferry Toth <ftoth@exalondelft.nl>

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f02e9f46ce54fed3c7ddfad7d1003a2fb7ba3a67)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index bbca8395b9..43c27bf37f 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


