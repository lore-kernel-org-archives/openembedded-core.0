Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 302B7760A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:38:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so15703123wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=958NY9eMH5eB2rABrxIP035r/2JGofdoUahpzLNBIII=;
	b=ELu7H4/2TOmqq5H7soBydRKgQstFkZlDk+UYoO3GavStabmiFxKVO35BBp5SRW8S4h
	Js9HQgz06gitSN7UH6dgfj4TZy5u89CJsp0vXiYuXs1e4VW9xVL0U5EuHQCJlRSpmQa6
	+XjIW3c+pv6a1r9Rbic9h/mnSrMYsJFS0jbsb8NeS0r78dACwmgYti0kNHE5hn3WkM1a
	SbIV+851gxRS4Z1DO4By7H+uvX7pv6pqQF2NiKVt0nhmydLIvro5gln0Lh63D+WxgNT5
	3Pg2XCXIHd15F/q+9MLhHl+ODDkCyVXgX9t6CpOiTqnBrrEVuI/Lg/aCdvE8nQqv7ja+
	qEqw==
X-Gm-Message-State: AEkoouuXb5NDwrNaqIZDaskdHJzb2Ty+y/LX51DC8l6SDood7o6fk+64lB0CCv/1kF34yQ==
X-Received: by 10.28.172.195 with SMTP id v186mr4793971wme.97.1471343895913;
	Tue, 16 Aug 2016 03:38:15 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	wc3sm26012009wjc.47.2016.08.16.03.38.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 03:38:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 11:38:34 +0100
Message-Id: <1471343914-1689-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] connman: add missing space in _append
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
X-List-Received-Date: Tue, 16 Aug 2016 10:38:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We do that everywhere else, and otherwise anybody
extending SRC_URI through bbappend must know to
add a space at the end, which is an unusual
requirement.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-connectivity/connman/connman_1.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 6c7e10c..6ea1a08 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -6,7 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://no-version-scripts.patch \
             file://includes.patch \
             "
-SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
 SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
 SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
-- 
2.8.1


