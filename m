Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92BCF605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 04:23:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f21so850079plj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 21:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1AZ0HNsgNdT//kBGhhIJr2VSc0BzdX6XZnE6NrrNQ7c=;
	b=PAd3sAE58jP4S+15S9lFCQzSi+2uyppuI7jMkavc1anyVhEuuuNLV22VPdHQzjgS2U
	4mxB4FKUpk6n1QFkDvlgmkTyias3ywmOuCj2/couPSWnCO+MJhlVtW++El9D3S6AGCXv
	fd0Moz/RAs+xP8uOXBt64o72f7uqdqF61bttuJ8emx4A8Cap0dNyXm5k9Uq33z/Hv4x/
	F9O0sEp4ITw55irxu6sznMhTVsK+kuHpRLE1jF7DqlBGkWChfykDbMr+Eh44SeqjM+Gc
	2JJsh9cRexp+pa5uGpUGGD/irsf6Py05u+p/auKgb8dLm7ZjEBu6XFhivjLk/JZ02hBi
	nmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1AZ0HNsgNdT//kBGhhIJr2VSc0BzdX6XZnE6NrrNQ7c=;
	b=XU3b3pGLgdnH6lWC4zN8ckPuoXD9YeqfegpWsKUPaAgv1SVRgKBf44LGwb2Na/uQnF
	rvRCQl72fksZS85qf0xRph6hhvjH2FDUSRsfeaeubM3DTvtRtWJ13u5wI6XVnskvql+s
	hwkpjQdq/cB74HpPreLBCRyUVYl0Ey0Pp6SF6DtKdmOCWuxEIKhKREJNZwq6t/OeQ+zi
	Staw/7P5kTzQjE5HU8PgYGbGp6yf+3ipvxUq27zVQjh05pREAE+iKWiuGqgj1ITkfsem
	5oShzIS78KCue4CN944tFgWnoy+nnWEjLixm2d2dlYHwsNwqILABE//2XpeEtrPOfVcL
	yqMQ==
X-Gm-Message-State: APjAAAWYJJbKniOT8lV6BR7UKutxsjJDNce5Uek0R9bvWUC2Tvkb2Phd
	ZRu8awVwQtlKOnwrc1ITAMykpNpfa+k=
X-Google-Smtp-Source: APXvYqxaV8OdLJCiMapOJJnUtJReBHgwnAahMvH+3KhlHwCTqhxtzeCzC7lGfGBO4pJ3ilKt5+qEZw==
X-Received: by 2002:a17:902:7045:: with SMTP id
	h5mr7376876plt.161.1570076582349; 
	Wed, 02 Oct 2019 21:23:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	e6sm1002856pfl.146.2019.10.02.21.23.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 21:23:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 21:22:49 -0700
Message-Id: <20191003042249.2147767-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003042249.2147767-1-raj.khem@gmail.com>
References: <20191003042249.2147767-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemu: Add ppc64 to QEMU_TARGETS
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
X-List-Received-Date: Thu, 03 Oct 2019 04:23:01 -0000
Content-Transfer-Encoding: 8bit

helps with qemuppc target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index de21d30732..551b49ac0a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -53,7 +53,7 @@ do_install_ptest() {
 }
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc riscv32 riscv64 sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 riscv32 riscv64 sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
-- 
2.23.0


