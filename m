Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE89174DF0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a22so4507351pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jvvfG14KDHvHcnWe87Wp+vrQdPqR8xPDDEjubxy9Q3w=;
	b=lIVyGoBdkrUcsoWK9DT4EA0nqMqkYMuFgdyzDwteyyKr2UbJG+BqwEpxMWnJwwknNB
	nU4lTAqSIcI53FcZx3/rdwvQoM8OpTQa8z3glDcZd4Z3qbKovXgf44PI/sccInlHpodY
	3shiZAbitKzWUklmpX/ePzNmBNxNV0Leqo7T4EyNNF0bfGHEIBGnxEvvRh1lJrEovish
	YB/n5cDiTU3mL3x4FpmnNBUccyZiXg4404Jg1CsDHorKuSAs0idC4wIKzhuFYTwJTTiN
	UYk0Ox9ibFoQEmgJ+tuFaA1NuwTlXwZZgNwMGSdKmf9YLlo2bJy8G3x5AIqrWGxWOp/d
	/Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jvvfG14KDHvHcnWe87Wp+vrQdPqR8xPDDEjubxy9Q3w=;
	b=JGBKz9fRyrszLKi2eBJIVSRU7hKGaFfUR0trArb7yUFxA8lPn8QlZalPFvVqEyhGfN
	+yvwz2K2KhsKwMOe0qhtvvk63ZP0R4Aq17r1l3MK3nKcdg8COo5OlB+Ph6WUcmKc1z7p
	S9yNr+7bdQbZNd5sIo5kL5VCRT4/2xUyQZPLek6dDlxZUcBTVQwR+mF6KCmsq8HEkq9c
	uj9netWaXqQ1scpgk3/SCCvVC39rc9MWCj/vXrnjysjAhjW8hiyQLYdIS0jb69lxUg+o
	1Z5Rbx9Nk0vSjGnh7G4jjmCrxjDVx7yaFuUdsGQjbv24QFBsuh9+mdXHaAos7UdfojPr
	MHTw==
X-Gm-Message-State: ALQs6tA+8Gp7CINA+3eduD/yIHhn4aIY6jhj5y/JySEX+DYRIGRp+U5E
	xtFu14ZPiDicopDrqmVent0c9A==
X-Google-Smtp-Source: AB8JxZqmLh1NpVxyLCkBlyJpmZYv3eq/x6KQkBDA935Yo8uAump6GhRMM51Brsp0Phn52dcKU37OtA==
X-Received: by 2002:a63:a54f:: with SMTP id
	r15-v6mr24582434pgu.236.1525479291954; 
	Fri, 04 May 2018 17:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:19 -0700
Message-Id: <0697c7845e50ac8803151867abf15246be492f46.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 25/27] mesa: Define PYTHON2
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
X-List-Received-Date: Sat, 05 May 2018 00:14:51 -0000

Ensure that python2 is not assumed to be python which can
point to python3 in some cases, when building gallium-llvm
there are scripts which are requiring python2 and wont work
with python3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 354271e826..5d4a452d33 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -35,6 +35,7 @@ export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
+                PYTHON2=python2 \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
-- 
2.17.0


