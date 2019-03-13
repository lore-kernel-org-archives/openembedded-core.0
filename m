Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 93B7D7C65C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 20:53:51 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id B1D83ABF0F;
	Wed, 13 Mar 2019 16:53:52 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id WzNtjVlQTPv7; Wed, 13 Mar 2019 16:53:52 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id EDD46ABF0B;
	Wed, 13 Mar 2019 16:53:51 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com EDD46ABF0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552510432;
	bh=YAZNbHs8RVbZs5yK26BktOyT34L5ifoXKpwza0tHA8w=;
	h=From:To:Date:Message-Id;
	b=kcGghvwJ3GWya1AMBdvkGuSraj1ZWBbzDBLalZ8zCGC1WL1npgLook7+xftoBydJp
	Vxjee6HvwTOyAnszXmb2qFVygDlJ6KcpBC4NB+O0BNqfAMv66NmfBhuLlqAXuaInBJ
	SGC+hxa7WLbRqFofugww+JaKVWkUZRVOKXMSH7S8x97NriMPm6JieXsTxKOWMs3EDp
	r57dA7uEX3MywoB8NDI58KfJjbvchSnt3zVB7mXKTQwzsCivszGfIM0qlwwC25MuVj
	m1743L93lKpkse5ms/GPQJ2b9HZ0i1VFGh1JkqPuvCwD0ubXkgEtGD7DulPR29R16t
	EtiV+4OSOEEwQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 37IO38kjavJu; Wed, 13 Mar 2019 16:53:51 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id C6BDBABF02;
	Wed, 13 Mar 2019 16:53:51 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 20:53:31 +0000
Message-Id: <20190313205332.9674-2-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
References: <20190313205332.9674-1-jonathan.rajotte-julien@efficios.com>
Subject: [Sumo][PATCH 2/3] lttng-modules: update to 2.10.9
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
X-List-Received-Date: Wed, 13 Mar 2019 20:53:51 -0000

Pertinent fix for OE-Core since 2.10.6:
    Fix: out of memory error handling
    Fix: access migrate_disable field directly
    Prevent allocation of buffers if exceeding available memory

2.10.9 also contains the necessary fix to support kernel up to 5.0.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../{lttng-modules_2.10.6.bb => lttng-modules_2.10.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.6.bb => lttng-modules_2.10.9.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
index 6146966894..cbe557aba2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
 "
 
-SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
-SRC_URI[sha256sum] = "04a080c81743eb29d181bac29ceb0c15819a2f4210793f2cc9958d885435029f"
+SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
+SRC_URI[sha256sum] = "a1855bbd02d0f71ebd180e9872309862036624f012442ab9cc5852eb60340145"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


