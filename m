Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 303467DEF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:21 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id u17so8416514pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TbozgFHGHr78OyX9dvf6XmHxWIhz2NzCddwQbLQROkA=;
	b=gvT3ehl4alD1MmN3qBqzyZSasE2flOkKOqWrzGpAFOiXgy8Xqf5pGp9anjaM36c2zI
	Yu1laVPYZuOgjD9XWJUg5TuMQdna1Cf2WofZNZ6xucmQPdx+hnXyr7Ig6BLad8orfEaa
	JIOnR1lrFvWIJB6ik2vgiJ28K64W9sdu6MKbKlReGrkQHr4IlyceS25MnfTa5UGOHoZl
	eQ8TYfty2hz5i4ae/Os24xPojervWHmsffHvF60ya4lzL1SPMzL8bHjD8f7gVKkjQzla
	Rcfhtl7aYJVV8AnbdvEhMRyAIKuSboz0s+XZAYp8oXND3+VMdQit6hs7YkMcK7NMLjCa
	8A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TbozgFHGHr78OyX9dvf6XmHxWIhz2NzCddwQbLQROkA=;
	b=a776gtNgS0Jl6D8DidlcvGWqF2eGZAFee7B9AIaLP7f4V3QTT0V4vv/mf2udonc7nk
	5xCiIAvBGiJT87NdylB0X0/8anLHoz8bLL49vDBs5oinMBR76VPnFh2SfslAN9X7PHm4
	Hv+1/ZvHux4yX0THKs9r26LvkGdKCbiueXat6ShjJdu0SzizDMw7pkAb3bBk+cYpXDk5
	M/WlTCqi7zczVukFlVFamESyuFuHInDci298aDGUvzE89zYYsEhSU9uYLCPYr/D7DzFz
	0YI1yCKDYamLfUpb4urmyKyNDMf0AbwBWzlINEP8jLbvSyPqTpVu+gScWBSuJCQbF7nW
	0RSg==
X-Gm-Message-State: APjAAAUusY4MD4ihWxMOTIjCeNz+36rUS9KsEtkFe2k7vRqXJPbmTGxO
	DDYKwZ43nmM4ualcBpBi3vaPKEDw
X-Google-Smtp-Source: APXvYqwgP5K/poUifwU02rf5FbP9ksiE7HG45NwfpXxtD/itqVEhQLRwEQomJjHxeA0kLJCEi0NztQ==
X-Received: by 2002:aa7:83d4:: with SMTP id j20mr17111038pfn.90.1557809662168; 
	Mon, 13 May 2019 21:54:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:57 -0700
Message-Id: <b1a5713b8746e4aa8fdc5e0122a30ebdc637b4dd.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 15/23] useradd-staticids: print exception after parse_args() error
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
X-List-Received-Date: Tue, 14 May 2019 04:54:21 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Without this, the user has no idea what went wrong.

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/useradd-staticids.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 70d59e5..3a1b5f1 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -76,8 +76,8 @@ def update_useradd_static_config(d):
         for param in oe.useradd.split_commands(params):
             try:
                 uaargs = parser.parse_args(oe.useradd.split_args(param))
-            except:
-                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
+            except Exception as e:
+                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s '%s': %s" % (d.getVar('PN'), pkg, param, e))
 
             # Read all passwd files specified in USERADD_UID_TABLES or files/passwd
             # Use the standard passwd layout:
@@ -197,8 +197,8 @@ def update_useradd_static_config(d):
             try:
                 # If we're processing multiple lines, we could have left over values here...
                 gaargs = parser.parse_args(oe.useradd.split_args(param))
-            except:
-                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
+            except Exception as e:
+                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s '%s': %s" % (d.getVar('PN'), pkg, param, e))
 
             # Read all group files specified in USERADD_GID_TABLES or files/group
             # Use the standard group layout:
-- 
2.7.4


