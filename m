Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA37078417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:09:41 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c22-v6so2120808pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2mio5div0KED7F9/1QBaTNRB5i7mpN1JvdEZHqBw96Y=;
	b=EalmcACcxY8JK6Xc6j+jOwfNIMh+6CwH20KQjdk63qvl5ntXPZ/YUgRLnmr89/lcZz
	PC4WL5doac+x8Mg9Rkl5kUW2BhwIgdi5l+s3GBIgJcd7/ySOjUwdvx9S7sHzIgZ3wfSi
	1skixqa/8mGZYOH9pejWytlar6f87w+5FCr1r/An2cV9HqGW1GODPaVulfxfPEPuhfft
	wwEniYXuB9OMg8guyEpkAl3PalF50lFZutEjaR42FDTPvoHuqNNIMyaqY6dYGIQ/EOpN
	Sjud7NEcYUJ0rQUT7bDVeVyRSsWIxp0YwqFvJWqFzJxG8/EB8cSf+TlIOsyNlWQHQOPb
	kkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2mio5div0KED7F9/1QBaTNRB5i7mpN1JvdEZHqBw96Y=;
	b=eYdwVPCFWRYt9cWnwNEk0SiJqs2rxs3dbar4abJiixfIPmSkjXX82pDrSgOWTwRBs2
	3WB1aM/d3buKj16jO7R/2r9bbQXi9z/WE8IlQYz7F4V8hfAVu7DL6Du1Sotr1+l7XwFP
	m4/0wYvOTMy/6TwuXq1imF2YDdAH97mzezB9fx/rmBIzuWHiAV06Z6ofC4ir1zQPWvPP
	42zc3dFvJWm8o+D3oeDtEsLf4OXN6D4PV/8QGH+r3UQJXioY5BET7SaE/3s9Ieh0jCC+
	4oioOE09xzQVexLIFtnf6xmAzKpIevfJyJnIKURVvcXmzbYOj4E3xqgEpRJ7GAcS0tJW
	O1jQ==
X-Gm-Message-State: APt69E1QgJopbWm+IShDnQJ50lL30qLJU84YrN7UoVW3GGgS5JeWQ6SL
	wIM0Zd2TtXq/p7k4ns9hgoHinbht
X-Google-Smtp-Source: ADUXVKK2rj82kEoh5ApFUtknpgou8YHNuwBYgUhXaDu9U4N0qqC5rxyqeE8F0onVIuEvRmo2NwgnzA==
X-Received: by 2002:a62:d508:: with SMTP id
	d8-v6mr29175375pfg.128.1529615382734; 
	Thu, 21 Jun 2018 14:09:42 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm15699415pfi.147.2018.06.21.14.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:09:41 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:09:34 +0500
Message-Id: <193c90c9e2c749d93ba8c09fbfb85cdbfc7c6dd3.1529605040.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529605040.git.chris_larson@mentor.com>
References: <cover.1529605040.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] recipetool: add 'edit' subcommand
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
X-List-Received-Date: Thu, 21 Jun 2018 21:09:42 -0000

From: Christopher Larson <chris_larson@mentor.com>

This edits the recipe and any bbappends for the specified target.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/edit.py | 54 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 scripts/lib/recipetool/edit.py

diff --git a/scripts/lib/recipetool/edit.py b/scripts/lib/recipetool/edit.py
new file mode 100644
index 00000000000..c4789a9994c
--- /dev/null
+++ b/scripts/lib/recipetool/edit.py
@@ -0,0 +1,54 @@
+# Recipe creation tool - edit plugin
+#
+# This sub-command edits the recipe and appends for the specified target
+#
+# Example: recipetool edit busybox
+#
+# Copyright (C) 2018 Mentor Graphics Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import argparse
+import errno
+import logging
+import os
+import re
+import subprocess
+import sys
+import scriptutils
+
+
+logger = logging.getLogger('recipetool')
+tinfoil = None
+
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
+def edit(args):
+    import oe.recipeutils
+
+    recipe_path = tinfoil.get_recipe_file(args.target)
+    appends = tinfoil.get_file_appends(recipe_path)
+
+    return scriptutils.run_editor([recipe_path] + appends, logger)
+
+
+def register_commands(subparsers):
+    parser = subparsers.add_parser('edit',
+                                   help='Edit the recipe and appends for the specified target. This obeys $VISUAL if set, otherwise $EDITOR, otherwise vi.')
+    parser.add_argument('target', help='Target recipe/provide to edit')
+    parser.set_defaults(func=edit, parserecipes=True)
-- 
2.11.1


