Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 96B5C7BFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j2so3754751wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=QKUq6eM62dKZZoKeqoJlR4Ei7L0WomaG7tNZujnS9uNtNuxxtT7/Espdzs9RPYniy9
	QNTEG/nRA5+p0X3rOLU76CSo5RxwdYXkfEqDIpClk4jVaPJFs8Th3int71OxmCYd+VkI
	C4ygGhF/IJh3VqIvNeKiW02DoYcMRtEL/q1boa45Ox2LVoKxI7wdm4fG7x6lV5WXBR9H
	HA/Riq9AscrCz/v1vKSYiBAf78uyt/fnQaPldt6uqf1xp62OqP2IgevVUhEf3pFLYBxC
	GLmjF4cCWMHia2EaOwEKxBaLADg5YU6q20qZtVqNtq/oK/UtfGzCEgeUeiv8F9VTOJFF
	R5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=mMRMky0hiJCnqer6G+Owj59HamQcmwNahIOWNBqK9gMWrbFGXMYGKE8wvCMyzqxzyA
	aNeUbpp08DFWfCcDBHpF22YpXoeaPtZE9JDoe2Pze3BxvkhaTbuwK1pMnXPUewV6lqNs
	GlZm5uwNfcRXbMWSmjDjYk1mYBDKDkNzA668TjAdmS9UdE+E6kGvVm3ucMJdjMXP6RZH
	ZPaeE1stUhlU0P8MpUwOQc86ilXN3oSt4aITfw+AZRAeu5l0c7wPRc4m0P+kviYb3q4T
	65tCIJpI3rVVMzZ9auaUhENkbBB5rJm9QwwCUQSRKV5FCucyOSGRQn9D7XLIqF04O+p9
	Et0A==
X-Gm-Message-State: AJcUukfFZJCE0TLCCbZ76+i+1tSrMFEHQcWZQxJgNwOLQseDu/hybUxv
	LsEJDmlbrmYY4Qgk/95pgqDbYsbhScc=
X-Google-Smtp-Source: ALg8bN4lTE9NP7hqnFyoW/jPddWOOrGGi4NFfTsPhVKbHFknOXYVJVgXKNv4Bd7mxObFc8j+6aIWig==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr3670941wrj.91.1547570347970; 
	Tue, 15 Jan 2019 08:39:07 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:39 +0100
Message-Id: <f2c82e6ad83256c834f2c1614707dbdfa8b29897.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 04/22] pixbufcache.bbclass: remove a dependency loop introduced by enabling gtk+3-native
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3378ff2c806..fb50cd49659 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -3,7 +3,7 @@
 # packages.
 #
 
-DEPENDS += "qemu-native"
+DEPENDS_append_class-target = " qemu-native"
 inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
-- 
2.17.1


