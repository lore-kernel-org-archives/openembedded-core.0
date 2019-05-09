Return-Path: <breno.debian@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EF4316010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 10:03:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s15so2124679wra.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=1UE9qIfJD5nGhZ0X79n+TCa5I1p4/kOd8nyrOL69yNA=;
	b=qKy/rKX9LUqZfNxXKs3kcoX/EERjL4VW0QrI0YOpmDlECIHeUmrYfUHNFFR2siuPGO
	cixSdqcWfw8Rvtnv0MO9+7sQBehWyD+a+ugcB4H1UjM+HVphcPAf+uev9xtHYhunZPd4
	76wtWd9b+0l3MDvPPls1PZf6rYYmAc3bYhECM8IQAGxEMRVyARY6qXBE5OPq2pA38xe0
	f+hB4AtXwTjr0Y/EstAQHNz323WUwVyVMVrh5Bm5SlCKhl++5UozxCU5Ko/1hFS68wzW
	9lqYgN14qMEQEKxdUpNl9cYdzciPfSiSDjnpOWcWceYy0Qu36Apji9+G4cR4jLm8wtUG
	QkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1UE9qIfJD5nGhZ0X79n+TCa5I1p4/kOd8nyrOL69yNA=;
	b=cnr4o5QeSzwzzTF6N4IoNzeISQ4rn1jyeFSKteC56x4nXZ2D9rgbhBuq28bfPvGwwq
	5lDoSzLxuhUNZkPXCIyubHYpID7KWv5r7xdM/upiy9A4Szxtd9Z/yLnxGwHrJT5s9rHI
	KqsAT7FMMHeZEw4evdMAygkYrVdBhNjDTHdpYLyayBCW9jSlCIXVUI+KR+UGsNxMr7bG
	rjAWueINqZLz8D54sHh997ei9DUZG63u/KPnwK4UUA8Tt1oisTxAL5Z9TjayvhrtBN+B
	zABVN7gjuHf5Jq6y6gJc7z20vtIjJ5Rvz9TQQ+fD+Y9MGwNyGohhmSmOEiobfKqNYXLu
	fHXw==
X-Gm-Message-State: APjAAAVThqWon25IvCvTXa0VDPFvd9RIrfXB1ryjrEbzz7b7NzPfkm4h
	pr5h8C6PYw/euk/LBpyKdIXCkj8sECw=
X-Google-Smtp-Source: APXvYqy4v31wgjMhsneqnm4mVc2HfOPGG0kVcQH33LVv4rjhOp/KuQchSvbsbGYv110PY/3f3vdEvg==
X-Received: by 2002:a5d:43cd:: with SMTP id v13mr2550446wrr.227.1557396207414; 
	Thu, 09 May 2019 03:03:27 -0700 (PDT)
Received: from leit-mbp.thefacebook.com ([199.201.66.0])
	by smtp.gmail.com with ESMTPSA id 7sm2541125wro.85.2019.05.09.03.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 03:03:26 -0700 (PDT)
Sender: Breno Leitao <breno.debian@gmail.com>
From: Breno Leitao <leitao@debian.org>
X-Google-Original-From: Breno Leitao <leit@fb.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 11:03:23 +0100
Message-Id: <20190509100324.85677-1-leit@fb.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 1/2] weston-init: Fix tab indentation
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
X-List-Received-Date: Thu, 09 May 2019 10:03:27 -0000

From: Breno Leitao <leitao@debian.org>

This patch simply fixes space and tab mixes. It converts space to tabs. This is
being done since I am going to change the code in the next commit and I do not
want to change more lines than it is required, thus, I am creating a commit
just to fix indentation, so I can create a cleaner patch later.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../wayland/weston-init/weston-start               | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index e72fbaaac4..0c4fee23d5 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -5,8 +5,8 @@
 export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
 
 usage() {
-    cat <<EOF
-    $0 [<openvt arguments>] [-- <weston options>]
+	cat <<EOF
+	$0 [<openvt arguments>] [-- <weston options>]
 EOF
 }
 
@@ -59,11 +59,11 @@ if [ -d "$modules_dir" ]; then
 fi
 
 if test -z "$XDG_RUNTIME_DIR"; then
-    export XDG_RUNTIME_DIR=/run/user/`id -u`
-    if ! test -d "$XDG_RUNTIME_DIR"; then
-        mkdir --parents $XDG_RUNTIME_DIR
-        chmod 0700 $XDG_RUNTIME_DIR
-    fi
+	export XDG_RUNTIME_DIR=/run/user/`id -u`
+	if ! test -d "$XDG_RUNTIME_DIR"; then
+		mkdir --parents $XDG_RUNTIME_DIR
+		chmod 0700 $XDG_RUNTIME_DIR
+	fi
 fi
 
 exec openvt $openvt_args -- $launcher $weston_args --log=@LOCALSTATEDIR@/log/weston.log
-- 
2.17.1


