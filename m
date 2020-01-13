Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id AE0987FD3F
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:31:02 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g9so1742861plq.1
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=kXX7O8nKrCZ/n6ueyCvFp8Dj5uybhPTO0DOkT134bbPAgUUBqW2+ggnoe88c95EBFA
	IBznACE96xtQxRviG/7rdon6rL7cecm1+PI83TsZbafkXnIJ16BX7Xl06y4q18Qil+Jc
	Pr+8lqBjIe8JttZKWh4tvRI1yahh55sWSUOe2IE7UZPw0xYX+W9BSr8Vu1kHkSucNTy6
	NHK4kKzOVKEYxqyqv7tv3g1pZdhY3vNsgZwquIZFV3g5Zjx2x+Ly7JjWqww0MnW3nEun
	JgAs4KS7tF84tL/8NslPX7QrdJCjAzOO2RWNswTprLMM8nubEhfdukbsb5yakHVUlYq+
	CDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=qROB2cGBBcdjbARBOgCmoJruCTcFhWCDCjgPT3fHeAIBFxXSnlT1fdNqR18dXJcvqV
	lNnGYMI+aUigzxfk0zI/QkoXTOAEQT0ytPRYv3uk8evGemOHSqKQamdYE6VpYeZ/Ydks
	exLhwhPCtnNZv3qKXEKP5o9GJr3aec8acnr80x3nx3Log9ZSPCx5e8EAfzwzjzHTVRoR
	TMkkEGHZBlXZzCrKht88OkMtym4XrFaiCdQh8hLLS/y6DKNdx0QwnF8r/4l1zbmzPrf9
	TTktFCDwp5ixMokJLdZpUryJD8piR2SI/f/9m61iS0Sq4b0835OWIpFrs6H9lKeL0jMU
	pfAg==
X-Gm-Message-State: APjAAAWjKwx1O731EgQTDgMOIlu/ybbMjwOVQQ4BXLcIGSoiOkhV+auj
	GoR8mshtEfIb9R4MhMAfm4Wt87wN
X-Google-Smtp-Source: APXvYqzgn5K0GG9J1vQPAEg/kfNU0+uvlROjK+ST62yYwTW8mefsJ0xEsVMp1/pu6GQp22GpXUOoOg==
X-Received: by 2002:a17:90a:eb14:: with SMTP id
	j20mr22870825pjz.95.1578929463647; 
	Mon, 13 Jan 2020 07:31:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.31.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:31:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:25 -0800
Message-Id: <abb42b83e1a96cdc7dac73e223a87cf078979c49.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 26/28] sudo: correct SRC_URI
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
X-List-Received-Date: Mon, 13 Jan 2020 15:31:03 -0000

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


