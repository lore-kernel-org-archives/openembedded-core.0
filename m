Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id F2A187F2AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:55 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id l7so1879699ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M85F998U8VgUL/0u1mO/rYYj80orzbdRh9agA7CsbiA=;
	b=u9zryq8FjUo8F48BQmFB1lFA8K9HKmOIVOvB8Ip4RAphgdDqwR1pjnajv7SEvMq/JM
	i20IPA8hQ1mgUacPBBrKGweowKz32Uzv5RHBD3nsZ7E/dVt4WPmtdgoYEdMwBSGTrMdD
	nL1uWToxlzUfaTAzM27NJcBjxLj6RXhRUYT0ZqtzItsjx8uMrRTx6sBTyPTjWTY+c6/w
	yrxL9XpzNhC+ZirC1vXMUYIQwnJ9Ha0bEGwCC7aw09yx9DZhCV5x/gKedmUq9rArJdKY
	39MftaggWKd77xnJgfR9RV7Lg+514GWpJHVuUDZ5MidLSomIjEAA0SFkmyBC4MKaFSBz
	Rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M85F998U8VgUL/0u1mO/rYYj80orzbdRh9agA7CsbiA=;
	b=fyxuMyEva+C1yGL89FNOaQIB+8cHJrLUGvzTbnK0FT0QLoqEOzpuqePhx+DU8/CnOD
	NcYTfbNQfC5D/752EbZ0MyJfama5pcceAlugDgPcfHE6+i3cOMPh/4BqUW2K1ESdq88P
	jvbVPa4nCDSbA5Wl+p1/YZU0XisZ2mxJzZXua09xVqeRlbLRJsMkA/e1A0G+UxsHOD6C
	pdGslrxIohw9jUQxXAFscur/xK2lDD9oWKAVMHAjiauDh5KrFErRKxzZdBLExehB58mK
	owTkGeCSZkPGQS6U6stP8jdpLSDP/T2bb/wufkPRLP/XnNfbGFGl9UbAmhl0BizjDQbS
	EW+w==
X-Gm-Message-State: APjAAAWS6zS9SIyCQuJqOV+d9H2AjxmWEGplOKpxy3ffF/4HnX0qBujm
	IMrhsOuxLSnLKrz1pSFqz7427EGfC4M=
X-Google-Smtp-Source: APXvYqyjfXNK0f48i/b5Hv6yWV2k6tnIXOcs+15f63KsY7EggIKKE8P6Og/RM1/gk80CDB8n9yU0Hg==
X-Received: by 2002:a6b:e013:: with SMTP id z19mr6434343iog.141.1567020536886; 
	Wed, 28 Aug 2019 12:28:56 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:40 -0400
Message-Id: <1d17bdc6ed17c0aa0680c7bcfbeb6f37a8d9cb8c.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] perf: v5.3+ build fixes
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:56 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In the 5.3+ perf builds, there are multiple unistd.h files that need
to be kept in sync. So not only do we update one, we update both to
ensure that libc-headers and the perf build are in sync.

perf checks some key files itself to be sure they are in sync, and
bits.h can be out of sync. There's no build error that results with
bits.h at the moment, but we still make sure they are in sync to
avoid the configure/compile warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8ac8e7c308..58543c73d8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -241,6 +241,10 @@ do_configure_prepend () {
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
+    install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
+
+    # bits.h can have the same issuen as unistd.h, so we make the tools variant take precedence
+    install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
 }
 
 python do_package_prepend() {
-- 
2.19.1


