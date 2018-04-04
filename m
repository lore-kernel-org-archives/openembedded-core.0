Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA43D74D8D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:45:38 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 91-v6so14571064pld.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U9NAxnsVeGaz84LDJVdTQKJaEbfTDtev+UrPs+Fe12k=;
	b=LqlxLrcJT0SfFFxnLSaOHeZwJvBr5PtKj5kh/qOE8ZCFwbRkN3bQOboL8mZXlW3dEy
	AxmZDxSCzIyBToHdC+YlEc11ESfAIXPH6b8zOygLRtGI6DFZNvcwoOW60WF4mb5HMBqk
	AD5K4kaRGFwa7sHG1EKXR8GNZjnk5W39AflRuJG6X8kNX/SU+SvjtjfKlBZUS1Zeryc6
	fr3prv2k9i8XesRuhxsHHJm3VfZsmtqPwHCLBNXGPzAm7AfrAwCDVHt3wBwGPmx3yzej
	JTj+vr+UV/kKe+L2XThCHLyxq4iXfpY4NUsVpOwdMhB7YuThmr3J3ehSCcYv9d72A2rS
	gysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U9NAxnsVeGaz84LDJVdTQKJaEbfTDtev+UrPs+Fe12k=;
	b=KlJGra3o5ieRJ+veAo5b4RxCXn+BP7bogLiML6It+aL1E5nf3RhBTktQpxHDIxAuDg
	VywO2BE7IrlmVzI9Mwsvd2ukaiLDZIRFApiBAZ4iOhT7SM6/W5M1+1bG/VQCNfSmGrme
	on983Q9J/KR8/u+IxrcWJKwEMVKfyktEF0N408JkMMZuOn86DgkcIn4L+UIRQ76hrScQ
	Z9fexB6RaxFc/v9Bv8NdT9Co4k3YJ3mrn14QDMMJEHWws9KfIoKEwfJe+/DNIZ1zKjC6
	FQhMKZ0I7Btl4oYesvr38Afo9DbE41tt58L8O1ZzyK0H7mydpeH14skrYJElia8vII10
	i9tA==
X-Gm-Message-State: AElRT7EX/6U+dSecqRprVXzgSxHQ2K1e7W2jXf/OB1FKlJql96nuxuYR
	ei8v5lkDUWk2n/eqApDkr7rmtw==
X-Google-Smtp-Source: AIpwx49ow+fIqIDf5T3Ji4mdt2THb4IIkG0R7dZSEhxOHl8IemyxALMKT3HGYQ+NPdF2yEHFJ4xB8A==
X-Received: by 2002:a17:902:3001:: with SMTP id
	u1-v6mr19457474plb.164.1522856739956; 
	Wed, 04 Apr 2018 08:45:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b184sm3611392pfg.110.2018.04.04.08.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 08:45:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 08:45:29 -0700
Message-Id: <63204b5c5a0987d61878f00c220d4d7ce7a4e8b8.1522856627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522856627.git.raj.khem@gmail.com>
References: <cover.1522856627.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa: Require llvm 6.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:45:39 -0000

llvm is now at version 6.0 in core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 639eb35f6b..b501b7e726 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -89,7 +89,7 @@ GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-MESA_LLVM_RELEASE ?= "5.0"
+MESA_LLVM_RELEASE ?= "6.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-- 
2.16.3


