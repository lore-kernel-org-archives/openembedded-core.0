Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB3EC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:57:10 +0000 (UTC)
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
 (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web08.29562.1661245021582046115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=lQOXB/4V;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=PhAP7OuCMKWtZCnzO4KJtRTwfIBwpNbipaHRRCV/yxE=;
	b=lQOXB/4VWXETPnYrc1PKMfm8gNO6NxKlRYd+W9N8KLjMgz9m/kpw8vbNlyzV9FxHydGfdFlDbt1oF
	 DnGykWBVBFGyv2VuZl4BwEfT/vGcOI6bLFyqkH4eVkTj1pSzst3Z/0H2zwFWNkDb40uPoO0B+U51Mt
	 6Dmxkuzy3o1+0KArRTJQ2C3QTXgFjeRy1pEYLPp/l/UDbzj4O3O/rmODthj0mDUdzdA2odN36KaQEx
	 uOvonchkCeqWVnVFit7t7HRWUQuUeCasHNupY5kJQG/rXIZM+jHiqoF0648zSJa3q7NQBAbcPlGONz
	 XhPnLwO65fn21jlANRzdNmaczfJo/uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=PhAP7OuCMKWtZCnzO4KJtRTwfIBwpNbipaHRRCV/yxE=;
	b=bx0DNO9cMFsmiys2ziH5ng6Slrg1/a6PpbbN1DdKdWju0z0ndmju4KiFI052igs5Prwys6es81N/Y
	 +XAIdxpCA==
X-HalOne-Cookie: 0a18d33a1d7c4d453f477039c4462f92a17eaa85
X-HalOne-ID: 8c207235-22c1-11ed-a91d-d0431ea8a290
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 8c207235-22c1-11ed-a91d-d0431ea8a290;
	Tue, 23 Aug 2022 08:56:59 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 2/2] oeqa/sdk: extend rust test to also use a build script
Date: Tue, 23 Aug 2022 10:56:36 +0200
Message-Id: <20220823085636.30868-2-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823085636.30868-1-peter@berginkonsult.se>
References: <20220823085636.30868-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 08:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169698

The test for rust in the SDK is extended with the simplest
possible build script. This will make use of the host toolchain
for building build.rs before building the rust package for target.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/lib/oeqa/sdk/files/rust/hello/build.rs | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/build.rs

diff --git a/meta/lib/oeqa/sdk/files/rust/hello/build.rs b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
new file mode 100644
index 00000000000..b1a533d5dfa
--- /dev/null
+++ b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
@@ -0,0 +1,3 @@
+/* This is the simplest build script just to invoke host compiler
+   in the build process. */
+fn main() {}
-- 
2.34.1


