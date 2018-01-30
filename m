Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6F160684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 03:05:05 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id c69so8386540qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jwvaR/fSdjl+WgDy3N73iQtsIMJKb7+LxYsI7JC+DDQ=;
	b=lP88KhGWv4TLufOhh2rXIP/ovwFRw9T7q6awtBfBePfaRPwdkagDh7IJG0NM7p7FAu
	OXHXpii0wVFQs7aHM8O0gjF2YXhwtkqq3SPW8SOsjO05hmfUiPXn7jyZLSsLpRimkS72
	8CM7arUx/+7VrJmNe6/R2IEoSHDWC8IXi+b26f8TIKhTuLYCQ2m7DDZqmNywUiqrG9kh
	mbUmdqy5eOOk5z3ls02yyq7CzqTmj6/jd4/WrcCq8RxOmhSbRiaaMeatY7qMt2uJxhzT
	DXpM0nZ9csHvuKtQ0W0cS64hq5kggnPJP6nCv3WASUwNQg8JZD1aymAq+uqbTTmslL4v
	9MgQ==
X-Gm-Message-State: AKwxytdCKxXeGtE3oTOuJ3xfgkyyEKomzK8F+Xwfu/yYW7cULvXJky28
	ISaYOKbD8BGFFuQQe2S1uusGNAHk
X-Google-Smtp-Source: AH8x224mfizt17eBY9E0xG20h9+G2GseBuEpDMVRphx8Rm6JHl8E8Pogvmc+GHFER6xhKzrMydaXww==
X-Received: by 10.55.18.135 with SMTP id 7mr39981399qks.73.1517281506041;
	Mon, 29 Jan 2018 19:05:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c12sm9635948qka.17.2018.01.29.19.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 19:05:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 22:04:39 -0500
Message-Id: <1517281480-10598-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] python-native: add dependency for gdbm and db native packages
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
X-List-Received-Date: Tue, 30 Jan 2018 03:05:05 -0000

These two packages are required to ensure the manifest files contain
all of the generated packages.  Without this, the db and gdbm packages
will not contain the .so files as they are skipped during the compilation steps

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-native_2.7.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.14.bb b/meta/recipes-devtools/python/python-native_2.7.14.bb
index 622cb38..7c491fa 100644
--- a/meta/recipes-devtools/python/python-native_2.7.14.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
@@ -1,6 +1,6 @@
 require python.inc
 EXTRANATIVEPATH += "bzip2-native"
-DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native expat-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native expat-native gdbm-native db-native"
 PR = "${INC_PR}.1"
 
 SRC_URI += "\
-- 
2.7.4


