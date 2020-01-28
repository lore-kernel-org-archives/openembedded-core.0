Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id AEA9B7CECE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 22:14:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t204so14251691qke.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DVjRdIrBlFwBTH/2UVoLAOHx3x7Wsq0RSbo6Qt+Vxw0=;
	b=oR5XLJ1A7m1nS5zEBC4ghvaK1x73Q90AaboXMntHzbC0OXV6vHz36nKCoA44yl/3as
	O4gD7vB2Fcu17DDSMJihiz/TcKdPtPS7kYmAhZDNJmlYNNlBl+xHl4VXFlD20Q4C9RNI
	MqLTU1ToOimf7ObxBbFq6rxiYWbwqR7E2BkvrjRKnAjF/w9lusi45MkBY4vHL3+dlpQq
	drTDyThEugcdwNGxBADLmdUUH2HpU/sI3aFUZm1UoBsg1qp0YIgt+2XCunMEg9/csJ8G
	nQGEnNWtwDGrf/mZZfIZkvCDNIXdgtH+10/7rOkKzznuH8jxkc75ulvOAu/Qs/8+SL9Y
	52XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DVjRdIrBlFwBTH/2UVoLAOHx3x7Wsq0RSbo6Qt+Vxw0=;
	b=dr0gmTF+FMN7ixs07KhPIaRd0/o6ItSx9iy2Rw2ytJcFPUbFg1cWQ/HwR5ph6aOBdk
	tHSRL1XHP7gjIsEEWEDPG8MSlowhtSC/mu6UKrPS1ouYKE9PQlkUsL9ZoGL3KKZQkEdM
	usSsYajYs9RDDrywgRa6PffApRWneKgjz2NnjRf7MUSb7i1H+sm/El/mJU/+ZhXbu7sK
	kD+olngLbVnOdzh0ADsFFcLfIsp7jqlmD/ALdtfAaQaVE7LjqIfxbrVNAZ4dMfK0P0Q7
	E89Z8RCDWeFEWvn7aSaIsuNZho53h1dQjPKcfO3kdC95cumFHiJu5b65xAC+OVQkMxGx
	QWTw==
X-Gm-Message-State: APjAAAVRzxxEO9VuiJ2l/+LFikyGvfO+m8kvaWO4lLW7uKvyNhm0gnBg
	hF1V1ZTV4vrKxQxpmVsdA0D4jQQwDWI=
X-Google-Smtp-Source: APXvYqwOQ4iGxLEJsqB8EX942G6PAxHB1L7aVBJtr3YO465uNkyKLKWv5wmRlB7czJZXk04jsdQwjQ==
X-Received: by 2002:a37:4755:: with SMTP id u82mr13479851qka.43.1580249654614; 
	Tue, 28 Jan 2020 14:14:14 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	l184sm13194994qkc.107.2020.01.28.14.14.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 14:14:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Jan 2020 17:14:09 -0500
Message-Id: <bdbb531016f40cf759408ddb9c65d565aee53526.1580248809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580248809.git.bruce.ashfield@gmail.com>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
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
X-List-Received-Date: Tue, 28 Jan 2020 22:14:13 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When a symbol doesn't make it into the final analysis is run
using Kconfiglib to show dependencies. v5.4 has introduced Kconfig
elements that Kconfiglib can't parse (hence we get no analysis).

Updating the Kconfiglib snapshot solves our problem.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8ca7193c8c..a4c0b6fb8a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "bb6df0ef2365689cd3df6f76a8838cddae0d9343"
+SRCREV = "7465c8497893ef8f6503c918aeede969f7e9753b"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


