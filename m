Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E17557ECAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:51 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id u17so359484pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=A2UxUOrKJQf4u/AT09tqarV8SvuGqeM/rCRx3+LZXt0rk6FW2NwQKCNw0UI5YThhn8
	xkZiI2GAt8v1eN2elu/aJcnXbYA686Fr9K0p9gZ/94IsBhCRp3yGvRLGvD3+l4X4FtqS
	HHL5xBBAQIoTBXRfvNd5wH2yFNTjbfVBcuU3ugRvPPkbWBkXRDYfUAyR8JrxGHMHbvkf
	LUZlqCEqNo+YqnMsfYUuIahmR6ioGzVMDzbo9C+jxfPnNVf9FZUQQEFLH5EB/6pMuaSq
	TpTWT/8AnPYPYvC3acn5IvUJYqJXKmOLx3fOim6PArOUJwyHVESwyhdFU7j6wY9e/L8j
	Cesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=8TBnuWQ3nIXwo9AjsPiT62zFLW06OGuohcF4DO218I4=;
	b=q2l7Et19o8YbYAHlLkGVrI+OHqvbvPA+4k+mCQCUasKZsdA7EqaP14mDDj0Pz5FL7T
	DIwvVa+HJs81y5NNgQU2ku4uNOEFaEZqdxqMxSCm/L8fXKFRLYrfZLoRVGcJi+1zXFhm
	o4zGBqgf/C+rl5B9PXHsewf0i3r0CFgzR2KuwFvjgvFuHntRqW9j/P9GTgmpTT1pH04M
	p3HiZ8lafGao7CVX0TmGF65STgQPPcL15UppxKDTv+oH2ITlKB/KpSTsZsU6RCQIuQbG
	z3iy/GNfbnn7jNlhqNNod/AY/PVlhUv46f/8Yj/lnlqZ5daZV4QOHdKBQoRIoUIreoRM
	aj7Q==
X-Gm-Message-State: APjAAAVkT3nN4t4gs70xKvdKT5Lnn7Z6sGobctgNOGmDgD9YpVObm+ai
	MoEKEKEFIu5ANR3omT5hO5CXZNNoOQM=
X-Google-Smtp-Source: APXvYqwVhfG7vByGHuxbmox9BL4q2gaaOTcjRnnG+TjTlnl/xSsjzNeuGwBJlfOXb1YZowMYoxRsdg==
X-Received: by 2002:a17:90a:7105:: with SMTP id
	h5mr378043pjk.107.1569293392822; 
	Mon, 23 Sep 2019 19:49:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:59 -0700
Message-Id: <c05342e30581a6280aabac621c31174eafa1ffd3.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 19/50] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2c44fc1..472d542 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1210,7 +1210,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.7.4


