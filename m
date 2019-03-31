Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id CCEF97CF0C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 15:14:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id u2so4449553lfd.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EHZxnZLaqn9prT4n9PQt/hntv+HvtrRH40qvASRU2QE=;
	b=WUTwaBU4t/YmrYvAfiAeTPCI+97kYcFxNZ27xMtRFZseiMj55C1w33CRUlSc00ic1P
	2g7YPjEp0hvxgmlgl/XVedNY4o9hV0tmmG3ySwYnHFax7EKBzSZerJQQ4Ue07IEdJQXi
	l0Qitkst1wCgvK1FlwhbKV+LZwuMOGs3tqW5fsBhYR4jfVBhJwkNFbgAWe8umdJKRunw
	Hg30H6+iuIV//yNqjrJ5EIynb6loI2llIAkN3Dl4UzYHNBdJk/NBHWZQCAa/ffVExX98
	NLGkVbUBvC24UU79MNw/wMNQm12ywGgi8d850cT8FJRQSGQ+soT/wGgHQtfseUk3WEay
	ClUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EHZxnZLaqn9prT4n9PQt/hntv+HvtrRH40qvASRU2QE=;
	b=SUAO8lJS85gSvtV7D1OvP/p87v/M5TY3GDGUEFm3ATTYTsfSXG9LR2zVTOgU1J6/r8
	8hvBHyWZCNwUsJn947A2fWNCMIeqB5azzXsAh4BSb5j4ef0YtnkyqfBPgBsJDxyRs3Q/
	u2yseOG4pSUj3ClJ/x8zU91giQQjv0nr65qcLOIPDg/J90cH8ZEJyecV7AyERMZbI8j0
	wEg7roeNSDXIlce6cqtvs/zteNHDA9GEvkp9Kr49IJ6VDRWCkoOTHlgvArpM0E+0p1lb
	JQYJhj/j7kYiorlpbGQhDtZMXmNV8QCEWX30Sb/4MXZnSnAj7oCk8TMTfwnUIQmIimY4
	mvZw==
X-Gm-Message-State: APjAAAUuX2uCbT7eSGCmQuynI0gR0YbavptFammMYSmh/KUDK3L0k90M
	hIhrUt8u5TaP6KVyxLETT59OXGZUfIY=
X-Google-Smtp-Source: APXvYqzS5MEiP8aFa+cHLJvJbuFdc2VCzVQCcyyjeJFdkohTLPi3DT4Cz8wUwvQ9lwRqi+bkE/ogoQ==
X-Received: by 2002:a19:5506:: with SMTP id n6mr18101130lfe.119.1554045294148; 
	Sun, 31 Mar 2019 08:14:54 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	b26sm1340406lfa.47.2019.03.31.08.14.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 08:14:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 17:14:39 +0200
Message-Id: <20190331151439.25283-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 15:14:55 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb}            | 0
 meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb}     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1097.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.1.1017.bb
rename to meta/recipes-support/vim/vim-tiny_8.1.1097.bb
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1097.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.1.1017.bb
rename to meta/recipes-support/vim/vim_8.1.1097.bb
-- 
2.17.1


