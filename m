Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 03B2475A64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:48 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so121555294iec.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Segtm3Wd5LmBUBdFhf+JFB/xTmlP+WbMFFvZ8f0SF0=;
	b=o0q+JgNcSZuuuNnNuf5dyyivd+DjfsU+bD0qVk0cow8gciJ3XppBkoIoVxNN9rT7Di
	JqXjqryEmQoNaF8IW6JmeytrKb13LhRRx/gXZZJOvYXSCC08XJk8WiWaE3pc1KRG6coW
	bwGDHzEJwGOAfz/Quw8+pzHBVvoIwTlUx8nq69F19ENeM7Qm5AsGGv65HOcQDFpEwGKT
	Ug6XcZkGIzJGOncXZ7RnKY5PfZqSh6IdTjY8EEThDQ/OqlnJ3FnPYCAd/Kxkk0f/HqmI
	oWcOH6ZWfC2lU4pcD1wgdwBHo72Xc5cBRHl99244p2w2LA9wP/ghqMLiD9Wn5fbSUBKs
	HC+A==
X-Received: by 10.50.141.164 with SMTP id rp4mr73153082igb.2.1436215848906;
	Mon, 06 Jul 2015 13:50:48 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:02 -0700
Message-Id: <1436215810-23722-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 05/13] dosfstools: fix typo in nofat32_autoselect.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:49 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch b/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
index 6ee3f7f..848a76b 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
@@ -4,7 +4,7 @@ broken images with the -d option. It can still be enabled on the commandline
 at the users own risk. This changes us back to the 2.10 version's behaviour
 which was known to work well even with large images.
 
-Upstream-Status: Inapproriate [depends on other patches we apply]
+Upstream-Status: Inappropriate [depends on other patches we apply]
 
 RP 2011/12/13
 
-- 
1.9.1


