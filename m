Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id EA2F87FE5D
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:14 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k3so2602844pgc.3
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=DmNmAg954aCr+frXiEFRDlNYybFlyG0kP9BYHqhXbAvRJ+yaa71XanLmUGHlyvDsEi
	GR9OpxwASdigSRoKa3ng3l7zHNSnrPQPRThtkTb1AoPsIiN+BftVhslW4tTRUIYjwPPh
	buqSBTAjvGDjXz1EeC7jmnoSzWz/OAT9Fi3tIi2zSl68SIZdVFFlKBBZxUC4aYE++sh3
	/REwPgnhjWyusRnsGu2cQNzzIvRUAIT2ldVRhbG+pZ9lI588LrIWvEna4Pn9FxtQ/K+f
	dfFTAw/Ry3rNJKIChb9SiaPqdFAH012yffnXMnpbwx3OhiUdkl9JuKsjJSh3jKnJoRqT
	CDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=ru2lw4NoGe13y5IGY5A5j6+bNjscaqDJYoq4wfhTgCm+qCgTzGQP3DBlNAv2tVHKFP
	ZdFE6LJeg8lFg6beWUXDNhHt0PAccPzRH4nmvjcXs1ENVNpVCaY30AzAMkc0QQfuzA8s
	Iz9vDV8pmEpcC1uRAb4tPqumQkg5UgF75133Af9mCbOPavDtfKdRppXgoQjXnVXtt0aR
	PucovJl096BPAUiyUJQ4Tb9cndAFvkhwiSPDHjysyA43cw0fPIFR1GwXQsQZGPcJ5fOW
	KN21dWY6sWViiYvPUcbqRslWCtso1bs7gFSsRLEKuo9p0W49serXmkra7Xop+C3JeSjF
	j/sQ==
X-Gm-Message-State: APjAAAXJrVuGZQ/aTPO1bzy/6xvOz4K+lkJz57v91HY+fK6tfAHAu9Kc
	v1Zrez9Ck7ccKud+SJuqrd5LoUzq
X-Google-Smtp-Source: APXvYqyjNgcvpnX6Q/170TuMkPFWlEtSp3U3ajp1BeRnEvzuyEonKgADKRmT1UZRsKm9tgSgXczW1Q==
X-Received: by 2002:aa7:982d:: with SMTP id q13mr9354161pfl.152.1578545415939; 
	Wed, 08 Jan 2020 20:50:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.15
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:41 -0800
Message-Id: <fd1aa49d8a25767953e8b1beb91001d5e115f781.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 22/28] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:15 -0000

From: Adrian Bunk <bunk@stusta.de>

Bugfix-only changes on the 243 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb}    | 0
 .../systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 +---
 .../recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} | 0
 4 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.bb
rename to meta/recipes-core/systemd/systemd-boot_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.bb
rename to meta/recipes-core/systemd/systemd-conf_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7f3a59c208..18f17d28ac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-
-PV_append = "+${SRCPV}"
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_243.bb
rename to meta/recipes-core/systemd/systemd_243.2.bb
-- 
2.17.1


