Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB317805C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:48 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e199so9590998pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qqEGhtyXi39gmPhJk3WIcZfF/wdykjKTl3fDxcWtwKM=;
	b=SdUTtxczZWb8GmfhyrlCkK9exLhgpoAe+QHF+2pyCq9AtSsWkE+KkWTgM4H0gkerpI
	B5Hwnfh4JWPQPsVRqzwgZqiMhhk7hkexqbQfw5WZp13Zq5rx/PUiviosq5vCsM4xVKli
	u2Pua/UcS9iANewmAjIBi3mMcJgSPxjV0eTbNQsl1xR07Exro3IcJ6kvgx4rLaTtirXI
	sHedn4BdqEzABfOiyWRrr7lMhMurNDynUOuzqbpNkWINJLTSsOuZ+hr7913IRw6ehBDO
	LViZ0dt8SamBTFz+q8wbqM3f3AEN91wzrrDxJj1eddINTscIyq5oo7UYPzUF57UNEW0L
	VSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qqEGhtyXi39gmPhJk3WIcZfF/wdykjKTl3fDxcWtwKM=;
	b=oxHdtHMNAPBKjdeGq/A6m/VSq1MF6DQerQrvhb66w+cHkQtM+d6YnPRmyPmfU99zwd
	tnq9RiOJI19j8+eeERL9bO+hv6/vajAr91CtHpW/5apVrY2EFQJHL9QY23vTN9WTcVTn
	mYN+aEOtSIkGonqY7/Mg2zXEIdweDV9BZhSHZImT5ZsTXtoXutt4ZB5XgJl3Yn0UY7UX
	fEymYURVAQK1n0+rfENhDYfJPpD95/1VGvtnJGpDB81Fp3PLWmFjWnejHgTcVv69HfLq
	aKKFilsN2SVt7zGVbN+LtwrNvqP9VoSW2I+TsrJpOekitS/3LQaRFgEBuUuu6JzAs6mi
	V2RA==
X-Gm-Message-State: AKS2vOwIgPrmngJJFHUPS0H/HhgW8j45NZSUvYYy1vo1qafAKcEikCCn
	lqRZ2l8jS8l28hms
X-Received: by 10.84.178.4 with SMTP id y4mr12718940plb.158.1498665889398;
	Wed, 28 Jun 2017 09:04:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:21 -0700
Message-Id: <481664a364a330875a79bf80876b4d30ff8aaaff.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] iptables: Apply 0001-fix-build-with-musl.patch unconditionally
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:49 -0000

This patch is generic enough, That it can be applied universally
and makes maintainence easier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/iptables/iptables_1.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index 4019e2a4a4..b37c55a64e 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-          "
-SRC_URI_append_libc-musl = " file://0001-fix-build-with-musl.patch"
+           file://0001-fix-build-with-musl.patch \
+"
 
 SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
 SRC_URI[sha256sum] = "0fc2d7bd5d7be11311726466789d4c65fb4c8e096c9182b56ce97440864f0cf5"
-- 
2.13.2


