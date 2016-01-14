Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 916DE731E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:30 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id q21so33905173iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N1iZguXL3l7CmRDGUlT1g5VEce7aAt+avEYZ5e5neYw=;
	b=eJA9HixUKUgRDMv3iTVua4+VlWJmCfHWeUrQFnmjU78epWpHfIVnkKYogxRQYkxJGB
	1nNM6dm3Ndpw+mTxHrN3FZM3hE6u6fINg8xWYLdEYxLmsxNv+nDfGY6MerCxOlCZNoNB
	+ifcoBwvaXuibN5H3Fekf2hgFpstaZjz7txGmKCojAvLq4+y4rSuMG9Du0em5agmyu2A
	BwlMFVCBkPof9Q7sy/aNEBot+GMhCBF9js4j8vJtGdSydlWCfK+gO1eWrXUj0dh0PNI7
	/we963/GFKVdTBewLPj7vRwEbap/8Mi0iUEdTFJsbqWiaBfED1A8pUIPGKED7PBrpT9l
	T+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N1iZguXL3l7CmRDGUlT1g5VEce7aAt+avEYZ5e5neYw=;
	b=b/I4dQ8XAUiNxtcm8cWtY9bUFtrT3fE9ELuQxgxS7yip8u0RIKU6ap/au25k4kzD/2
	SRmIQve+siAZyH8Ka0ofXK4acE+co5TF7nV0v64ls4WT7xsPzyPfWCuf2O/M3689R8+N
	6HPt63t/Ee3H14vGCLEi4tUZ9wauo8JKgFxWIVqe2C36mn7oUwaPDvpjad2ZUqXiqIEH
	pD3DEB0a5xhQKQQoWz3TDsFomvexNXN4TakSDsoKp064jNFeDOiELHf1m8k3sRCQCE7A
	Lika/3CsJUMPz/BrJmYQpLbiPiw2tzKZjk0QkXETb+naP4golR+lPvvQGKqNQFIdQxsO
	lCYw==
X-Gm-Message-State: ALoCoQn14q9U/fc5ZHJQAry5i5iOFIstSW/9G1MbP2o8rYew0xsan4iHTMEWa9lRrTchbQbTxsKbetZ3MjBCJmvuP8Cb0SuzYw==
X-Received: by 10.107.165.14 with SMTP id o14mr6205801ioe.49.1452805111486;
	Thu, 14 Jan 2016 12:58:31 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:31 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:30 -0600
Message-Id: <1452804997-20926-3-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 2/9] bash-completion: build nativesdk variant
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:30 -0000

The nativesdk variant is required for some recipes like git to use the class.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-support/bash-completion/bash-completion_2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.1.bb b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
index fbe4278..5c39863 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.1.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -37,3 +37,5 @@ RDEPENDS_${PN} = "bash"
 PACKAGES =+ "${PN}-extra"
 FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
     ${datadir}/${BPN}/helpers/"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.4.5


