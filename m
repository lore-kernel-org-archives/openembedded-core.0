Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48C307C5A9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:37:12 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id f18so5961376itb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0LZhn79N5e09roOHgLOVbtFwJSF9tANGmAlaNSkoPJs=;
	b=UUwBxrlNUqVkYuKbdJdGn9/GQA+73p0M3W7d9PNlHr3zimQ9hEWjyui1bC37MCHvo8
	6S1ZXz8VpR5NBu1O6zoRi/imfrrrvst3ZVEh9vpoTYrxxn9+mwXUoiPLyZIX/CqGK9wV
	v41yM982vfKZbUTJoh/HGHN8LCNzLMawx7D/dIV4NXscTPUfzero0+p4hD4GdJp/TNBC
	dCHncp9aip0HbhHsXsoiJpo5UAtiR0uZgQUJOo77ocrL0pyTGVl+/497Tvg93JvwfJCV
	NsOP7Q509XZC6T262aGKT+8AtmojmP68FXtvOi7mHRShNhO6GhUzzB9A4w4o7aAujy7A
	0oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0LZhn79N5e09roOHgLOVbtFwJSF9tANGmAlaNSkoPJs=;
	b=J2xgtaFQpmgJmuQXB3xaobTqDbkMASv5VdD2Z39aKpVuqah7g8ATOpbALVCN+MRJk7
	EPz1oMMBH87Orlem8puzHgy4UGExv0bN7/xO0Wmm2rtHVQUu5faQykNGnzwQhvXXEfox
	dn6O55pqickrG5vlDiwYvCEc+nYDJ8bVwWQHKajg5dgJ+AcdzVVjPwVTd41oP6e5e7bi
	v4FnXOj9MIMweioO4vxYl6DvNNhbLN39ZYWKn/DQkhfO0sq4BTYHWJhK3+xFODLl0yDA
	V+ozyYI/+fSKgd/kRJihLv6QoTtk1dcM2kIpA3O+XODq2xlDh2kSzMxgq6VmAPNRVWFO
	qTOw==
X-Gm-Message-State: AHQUAuZx4GOU6QPK8SLRi7AQEEv7oQDB7t24ggFeyCJYVh1gDPpUQDQ6
	CoDmnF5YpWasCqt8gnv59eL5+VZkLjFBsg==
X-Google-Smtp-Source: AHgI3IY0kYYOpxXUfro5OpyUwc9RYr08NW2yqrDiIAfCVK1/9v4ntPozqOd2zetBn2Kp3UxhaC++OA==
X-Received: by 2002:a02:818c:: with SMTP id n12mr15079792jag.108.1549737433213;
	Sat, 09 Feb 2019 10:37:13 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id h2sm2633643itk.0.2019.02.09.10.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:37:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sat,  9 Feb 2019 18:37:06 +0000
Message-Id: <c15ee7250db8a5bc3521c9a9442d63ca9fa0196e.1549737160.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549737160.git.bruce.ashfield@gmail.com>
References: <cover.1549737160.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto: Add dependency on libgcc for ARC
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
X-List-Received-Date: Sat, 09 Feb 2019 18:37:12 -0000
Content-Transfer-Encoding: 8bit

From: Alexey Brodkin <alexey.brodkin@synopsys.com>

As of now in case of ARC there's no in-kernel implementation of basic libgcc
functions used for millicode, multiplication, division etc instead we simply
link with libgcc.a which provides everything used by the compiler.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 1ebfb606da..f191946f2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
 KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
+DEPENDS_append_arc = " libgcc"
+KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
+KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
+
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
 KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
-- 
2.19.1


