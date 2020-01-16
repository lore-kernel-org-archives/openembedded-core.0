Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id A25EC7FA47
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:13 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id p14so10363662pfn.4
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=gNPYpGpWyVA/aCzpZRZ8WtApNJYvVCaLZtuv+BQJi0VOqWKan9e68PgCVwYcBqrZsS
	4Qhq4siGOOWC9kFxbb1hb++buMNylKkQlcxvSLI9Jw8ymshTyJdUeFIKQvAGj8KuYA4p
	Nna6GXcOMPhzeEAuY29uw72LHVnu13PuEVtt3978Q6LjXn65xd6CdE58Lt9HrZ7i8ft3
	aILw/ReRT6gHW9nPIM20infIylpaeZN91u17qs2Dm1+LKGGWEnlFvq5vEuV7qYHzNuA3
	OQ2iAnta3pQmI21Hxh3FklLqRzoppzHvNSPxOjR06NNFDOjN+MLcABGsSwQdqyfazAva
	Mw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=O+UJTHt0gmQ/70tzXX8OuhyjrDvM/Kvito+ivHds4moxOItJtk1YBui/8hUGeDPSwa
	RJgGDsX+w4EbGS5eHxeINSiOjUrP7iA8MMJbrUsngn3tY4sVzHqoDvX01WHB8yesY4w7
	pKpwUKzwZIMasSk/jhp/lpymqQ6MdxNNlUThxkHK1Rs2DJd9LY4Yc8x2o0X3qq5OhURM
	zgibSNvR5TeH+tKNRMwFloBO6Rvd4l7ri+mgz4nL8U3rc8uVdOQZWJ0s3h7xjhyKFYiM
	OhoKAOs1p4JKKQj6eHv9wJAyT1zp9uTMCjKq/uxCpvl14uYKfaiyYwjmTPi9QproA+42
	xhug==
X-Gm-Message-State: APjAAAVPHYKCtMTWcZ6HQz8KzYAQgAEZcFg3zYE/wJb7g0/LMYE+qf4n
	dJ624wfqbgEauVjntVMu0jJ+FqfI
X-Google-Smtp-Source: APXvYqzp5NbBqPMFW/1MxlORqe6fThUwQhIRd8w3FbRBS4AovAGc52bEOYoWiGZYk3tZ8jMr7twOjg==
X-Received: by 2002:a63:9d8f:: with SMTP id i137mr39393725pgd.33.1579188074565;
	Thu, 16 Jan 2020 07:21:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:40 -0800
Message-Id: <adb6af60dcf098bfce64168e6443c26d124661c4.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 31/32] sudo: Fix fetching sources
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:14 -0000

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


