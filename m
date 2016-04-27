Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 44A4675D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 23:24:11 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id vv3so7398396pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9oUjI5+2NiEXTQUR5m4LfbeYVfRUiM4Xfs1HZAGu3ik=;
	b=E/vUth7ciPvB3GvXZ+sRB6ia3vKaUJ9smXgsPlNTYi+RuddbAgzg0+g1zueACBj8b4
	NW7cCVhm+jSYRsBmoecKXT2gSbjwp65rhlnqdI1ls6AfaD9nu9mmTMhpfCrSpKc7HfyR
	De1InWdvPSS1vFWOAM7p66jV4V1waL2NQyfV1dyBnflbJNQkAWIiE0z/1ICfLjNmutLY
	Kbvvq7ItG1aLaE65CbfoT1ouExLoHI06yQklCTcJtXgmVaEyIPQ6TMDuzxkRFnw4rVbi
	C5GP+L9ndruGy7qXFeyUTqCp+7ZYlAqzAmTgiBRbN4N+HQsTB9g73SgLbOTdQWmjtTh4
	3fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9oUjI5+2NiEXTQUR5m4LfbeYVfRUiM4Xfs1HZAGu3ik=;
	b=hqQcOkI2PlV/uY3uTwtjuwaGO8aAVa9Ckyc0XXIq3tTR9bwKjzjvJAK1whj7rGsLwf
	wRNo02A4HZbgsxuWfIl6/BA0W5U+qRI5opQZ6ZnJE0OwE3oeS6caygSkI/UUeY9tikM6
	EycbT32FvEA882p7zH7k10IzYx/cUGsYXjar83czLrZWnooiUUiuSIJqXPNAPCzBEw2f
	oebbRGhu1Fy5ciftAIWKZJkbJrFVxKNQoWY91qYySVOldD85HexSKdt6l4j3R5SfFBlm
	b3pjY2Rh+8Pl2W6A9W7rRGEamxZxhPYZLWNkz8NxOVjTMEwJDw4mbpchsIJfeI/fTUTf
	1GyA==
X-Gm-Message-State: AOPr4FWi6engas2xRz66SRAVKztTGRD2K96xPtvM19vEubN0jaEIYEz9gBOg2lj3S+EDew==
X-Received: by 10.66.249.166 with SMTP id yv6mr15654308pac.91.1461799453012;
	Wed, 27 Apr 2016 16:24:13 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yl5sm9554679pac.38.2016.04.27.16.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 16:24:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:24:01 -0700
Message-Id: <b2ff49d38fba3c1d89ba4b5a32a4cfe8fb94500f.1461790921.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
References: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
In-Reply-To: <cover.1461790921.git.chris_larson@mentor.com>
References: <cover.1461790921.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][PATCH 4/4] scripts/lib/argparse_oe: also change 'positional arguments' to 'arguments'
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
X-List-Received-Date: Wed, 27 Apr 2016 23:24:12 -0000

From: Christopher Larson <chris_larson@mentor.com>

This aligns with our existing 'optional arguments' to 'options' change, and
seems more intuitive for users.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/argparse_oe.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 2185a66..bf6eb17 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -14,6 +14,7 @@ class ArgumentParser(argparse.ArgumentParser):
         kwargs.setdefault('formatter_class', OeHelpFormatter)
         self._subparser_groups = OrderedDict()
         super(ArgumentParser, self).__init__(*args, **kwargs)
+        self._positionals.title = 'arguments'
         self._optionals.title = 'options'
 
     def error(self, message):
-- 
2.8.0


