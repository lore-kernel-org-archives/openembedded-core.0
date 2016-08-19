Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28C6877051
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:49:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so2947337wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mIYoQ4IfCnMY0OOVoNOAsUW+q33sPFjX23A+wY3K+Bg=;
	b=AFqF7dfJ3Jr4giXy9HDkU13hQTUwDLByNT3b3mSWxG7MCrIQzaNqTlnHdDfm/ZFl8d
	wu7UOlrq5tM49kFWJutM8/DIro0RO8qzuvZ/j5hYUKNehTMWsFZggMAhpb6eJYMqKysD
	KSQPQTe4SYvtplVwkpp4rGfXEiidPnKp6pONGW6o4kIdGTLgkjZOKhMy4w2c5S+Y5ifM
	C66QGyIbyVz2CNIGVMyIuNWaWZgGLYQFEpC5YhmFJkOr3CmATXvn4dN2pLc6c2FsPyj0
	vaHUxeHrGSAtYjV5NEETIZ9Cd1q7E7OIRcWHZHwsXL47rf9t65CjXPtGAn8oor2ZAVE8
	oMdQ==
X-Gm-Message-State: AEkoous5orA5QwPu5wreBvtZi2jVOK7IMgdWJFl/JdRRCDfBGl+XnAOkUTNgXj3RX9ETQg==
X-Received: by 10.194.47.206 with SMTP id f14mr6459518wjn.98.1471603745122;
	Fri, 19 Aug 2016 03:49:05 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	jv9sm6494544wjb.45.2016.08.19.03.49.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Aug 2016 03:49:03 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 11:49:02 +0100
Message-Id: <20160819104903.11167-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] libffi: fix a typo (mips)
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
X-List-Received-Date: Fri, 19 Aug 2016 10:49:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While code elsewhere checks for
MIPS_INSTRUCTION_SET == mips16e in order to decide how
to compile, hence the typo doesn't affect behaviour, the
intention was to set it to 'mips', as is done everywhere
else. Fixing the typo also helps to avoid confusion.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-support/libffi/libffi_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 42ab108..0aff3f5 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -25,6 +25,6 @@ FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
-MIPS_INSTRUCTION_SET = "mips16"
+MIPS_INSTRUCTION_SET = "mips"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.9.3


