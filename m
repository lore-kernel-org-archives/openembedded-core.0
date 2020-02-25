Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 897C1617A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:28:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s1so7341339pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vcEcry9qkxlo0r4j+V2Ve3DBV05uJnHhhXH4GCFhsdg=;
	b=OIGa3qyh0V6RYxFwhyylYHkBARmRilOivtTzPFKar5TqRi5n6ZWIdUUWfEZ+w9NZXX
	asKVoWBXWr7iy6QAYdQaKpvYrli5NWR5LgmrT89dV3JDVXKyMPk4yW+kWE+Q1+OzTdGU
	Y7oN8klCH1LOwuq2nmVBpsM7f5y+TEM63qK2NrFAo1Pjg0cwbVE7GpouPNrE4+54Z3CY
	tJViiW0FC5YDHmg3Z0TvIdIg77K7P1ofoNWT7rgmbOaSeKdtLTtzEJ5nSqI2EVp6VmPm
	TXJlexnRuerwpEAVLBA861EpOTdZCc2M7yUsX5b6pRN8S2qEpazbuBez6oGXMZXhrbRN
	ZJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vcEcry9qkxlo0r4j+V2Ve3DBV05uJnHhhXH4GCFhsdg=;
	b=me8MlRzrGc6tXWfLSgJisaqN1ItVJmM2fpXBgF/MFmSjLS3jOl8HDbEPvk3RwCqcv2
	+9t4hh8MhcERO+BPeFCHs9wEP3VR4VSAX277qq+B3NUtY6VHAZhrphgZii1Hp2Kkyc0U
	weYhfnc6sctwok0GBTpRyVfwgwl3exLRP5k0v+iXajL/RXX4LJjLgyxRcGstra70k8X9
	9hVKcqeGo7xN2I897UY3nvqCXPV0uyTt5xOpQ5rVQD1VF2ZoYrFhqJHbypg9ET/uiUNU
	DvR6Ys9PjK8YFdESJtuoGa722lQtAxC9GQjyRlq2S166JNNDEHP8ehTEXxixHb9FXCeu
	pLdg==
X-Gm-Message-State: APjAAAX+SqPVYdSXQ7Snihkrrie96RFzdo3fMZhlHzoSRweBSw33taTd
	wtOiI/QOuqEk10Vf6nuO5Xl+A2CVZ48=
X-Google-Smtp-Source: APXvYqxzBC4hS4agANSeeMYa2Ma8sQkUKbBImEFmuTOLRkXgzbb2bhkMkFHI3vKogMyX9vUiKvZOog==
X-Received: by 2002:a63:f311:: with SMTP id l17mr868586pgh.142.1582644528993; 
	Tue, 25 Feb 2020 07:28:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	o36sm3395219pgl.24.2020.02.25.07.28.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 07:28:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 07:28:57 -0800
Message-Id: <20200225152857.3546150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Disable GI data for musl/arm
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
X-List-Received-Date: Tue, 25 Feb 2020 15:28:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qemu-arm hangs forever when running gobject introspection

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 7b3d16d8cb..e8fb8b1c64 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -123,5 +123,10 @@ ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
+# introspection inside qemu-arm hangs forever on musl/arm builds
+# therefore disable GI_DATA
+GI_DATA_ENABLED_libc-musl_armv7a = "False"
+GI_DATA_ENABLED_libc-musl_armv7ve = "False"
+
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
-- 
2.25.1


