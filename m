Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADA4A7835B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:55:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so2818965pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5YPeeSbulqKnl9n38pfcQ2+Joa13ZBGIAJlW2jkvzPM=;
	b=MYIDZy57wd394PV6DfZpNml7akQELbtO3NrtnWmgE3bwSo+L5KsQfoV3UeXbv9YxWP
	B5QSZgCjKnQ3H6mH40qAYgxPqzQE/2b9XwkQoNlFhZoxXbgheEutdGuMuVmIotmT+Q2F
	QVWX0pSzUmnxRjQLfBqYZzAbhX+clhyena9aH5KXsNXjHQ4kTxTuRxT/hPRZm+AUP3ZK
	ZzUA39vRwEDG6r5TGJhOoHKOGNI/YI0i0erS0ac8qlSPCz7l1CN+UX/7eBjex3+YQ8xW
	MSYpMP3fCeAaVrZfjNYSBoOsmBtr5m8KP3JWufoCQMvQ1SdIFy7pP5EJkhsk4mp9/DDF
	NOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5YPeeSbulqKnl9n38pfcQ2+Joa13ZBGIAJlW2jkvzPM=;
	b=QgZ/2TAhjhHrJUN2D8gtXIaj5zk73FH4B5Df3x5VzIwiAuQZ8bn6JIBcFUEQHa1nRs
	gWkqozjZoOw19YVdAEXg/YNeag/Ivzzr339MbbDX90kkEkpo7g+Uy0ohvvBVB+j2jRtx
	tFF20Ix1QHJtns0pZyUUzlmnWPrRvQYfqXlLXnPN3anOoFxqWd29PhlpkmU+Bbc3tUap
	7hjeBaj5yNwQ1SxEyoPR7cwj4OOBWvuYw8iq4qQKtP8F7Dw2DAGMjkP+Uqfk06mYJ3Lg
	YWDng3kUEEdr3FzmoJZTWfEvMjjxr5k7wrllZXHZYauUb45XfEsi8Z0dEzGv7TqdUm/t
	gHyA==
X-Gm-Message-State: AIVw111gRry9cjRvzO/obiRpxTyjta/0Tis6Nlh8VAm1Jsv6+X+7TMXP
	/3qkFfen8D0ceDmM
X-Received: by 10.98.23.69 with SMTP id 66mr19799073pfx.305.1501595749596;
	Tue, 01 Aug 2017 06:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	o29sm57189986pfa.60.2017.08.01.06.55.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 06:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 06:55:29 -0700
Message-Id: <20170801135530.33531-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170801135530.33531-1-raj.khem@gmail.com>
References: <20170801135530.33531-1-raj.khem@gmail.com>
Subject: [PATCH 3/4] mesa: Depend on llvm-native
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
X-List-Received-Date: Tue, 01 Aug 2017 13:55:48 -0000

We need to get llvm-config tool staged which is provided by llvm-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index da449fa70b..e14372775b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -75,7 +75,7 @@ GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-l
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "5.0"
-PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} \
+PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
-- 
2.13.3


