Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id A263D7FA47
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:12 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i6so10364760pfc.1
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=LkFsiSARVKtO2fwuEFsirw7DoI9AzrcE05xh/68iuJWNoAQIX3oOQ4JfDnrJCh077f
	Kwzd9DEJ/jdZJDCOJqGVjVVbZqlirX8A2dF0BvYlcctLAcehgpyjRdwYWFgvaeUV4WEa
	FT4VfKL7jeK9rto1OtRoQl512ZZdjn9BIg8VW6HGi/7aewEAq+2RxMccTQ7CP/ipOktD
	twpShCRiR6incCuBFS/V/+nw0KMbtXhmSrrqTuymCGxyVBxKF1fSX5IbhhDnMJydNRA0
	fjOvVjhjaSTN4ohiEh6tzhuOFOEkugRE2gKJkmV12brOu6IeQoNJiCBwY67iLBXAHXbn
	6Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=b9I9slToJc7jerDzgsApk1UC77SHSph+Cuz8On6bAcPeVt+qz6d7GmH2CUs4FO0xl9
	modkgeHlgm0RU1o+92uxT1q7ni5oAvz4MXm54FWnsxrj8t6dRXVRsA8AAZ/K36eqa5gQ
	KfydjZH7TsJt/qx1hhnRYTh2d4adi02t4aEx5SnzCN5tfQC2gtdyQjUR5AUMHHWl0eKH
	icC80414GUFL+llbu4KMJpUJCQNFbyJfmqzg06DVKFfaXOswGlevN8b++o+X1PMQXxjq
	o1ldt13bkwtadckXWOa+mkZ9JID7G8xndxcZIer0czl7VEcDYQNtKjsqMeqaS7PLFIKH
	zjyA==
X-Gm-Message-State: APjAAAWXuWHF7ouxupt3UQSQFb3qcXE/1f3FkBF1COMLJxTrGJvO6CN9
	VA5uG3pgNUQZ5ptwAxfw+TMHyL0a
X-Google-Smtp-Source: APXvYqzBZiKIMwvtEAH2CR+nunDfq+8z4rXTSxY8hK7He/TEIeL6uMnZuUJYqWEv9mdV4dJN8KBB4Q==
X-Received: by 2002:a63:642:: with SMTP id 63mr38712081pgg.73.1579188073509;
	Thu, 16 Jan 2020 07:21:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.12
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:39 -0800
Message-Id: <abb42b83e1a96cdc7dac73e223a87cf078979c49.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 30/32] sudo: correct SRC_URI
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:13 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

The old URI returns 404, and has an invalid TLS certificate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73ff6aba0a53ffc3ee0a5859a3ad4c8021be4de0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 7460a5bfed..bbca8395b9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


