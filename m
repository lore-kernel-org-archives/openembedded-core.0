Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id E70CD7C6A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 21:30:24 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 7F379182927;
	Wed, 13 Mar 2019 17:30:25 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id oZLuJnqstN7r; Wed, 13 Mar 2019 17:30:24 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 9BC66182923;
	Wed, 13 Mar 2019 17:30:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9BC66182923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552512624;
	bh=vOupmdsiV9lmSSEScetdhTPIQqCbQi2dSMqYi0Fjyg4=;
	h=From:To:Date:Message-Id;
	b=GqsMwXImvL2/TRhthyCvYSteaoiqww6aLhuWNnoGbn0GOJjDMo88CN4bYHf+iL8or
	zNQznOK1AZyF571azI+EUNvZtc3ESDCqXzPgOhiTaXp2kUjOxUJQnJbCiNwrgJRsFy
	1bBhHXC0V+gW2zJx5gXu8MNXOSp4RAMLBpA2VPdS9vzcKGuY7JuhkxFWI8fB5V1tS8
	/FxcIeLnynPe74lHLxXgcMCfJ6o8RF2kcQJy/tsMONDuFCKBxj++fDEaQCCvJjeizE
	ZjkzoJlBWi2VdQRe1jMUOoz0lmqjX5c31A3E7fxhHvJ0kS2EpgfTVx8b7GyilXIgmP
	KsH6RcYZxw61A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id NpB1hTub0Q-7; Wed, 13 Mar 2019 17:30:24 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 7479218291E;
	Wed, 13 Mar 2019 17:30:24 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 21:30:08 +0000
Message-Id: <20190313213008.9842-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [Sumo][PATCH] babeltrace: update to 1.5.6
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
X-List-Received-Date: Wed, 13 Mar 2019 21:30:25 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 .../lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.4.bb => babeltrace_1.5.6.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
index a29402adb1..254b5f652a 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.6.bb
@@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "3e8cdafec3ac0346a389870e87bf1344"
-SRC_URI[sha256sum] = "9643039923a0abc75a25b3d594cee0017423b57f10d2b625e96ed1e8d4891fc1"
+SRC_URI[md5sum] = "8ce610461e73f48b9c6beec9ba95dcc3"
+SRC_URI[sha256sum] = "5308bc217828dd571b3259f482a85533554064d4563906ff3c5774ecf915bbb7"
-- 
2.17.1


