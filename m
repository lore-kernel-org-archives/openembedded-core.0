Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B258475FF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 17:15:35 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so64615597pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mt8dwBt9ISE87UJFZTMX18aIUw/e/ReZaLwZ6L2fvtY=;
	b=vdqTBMbPJ4wbf1pWNUN/Hkmy44TDGEHqBw6LJcL2C7xv9KxmryNbDof61vfZ+rs53a
	hdS2PCiVgG8XllYq/ChM8q8EVQFs3Muq7rTJyaEGQbsC+K8/2nUZgkDvU5N/gepP2x79
	qW1eWM3nqc1885Y8jNKeyohakD5BE7jSPiwAEgqWloX8o+IvNz5x7gREbOkra82w36nx
	ULZqVFb10O3R5yXBcyMV138P1Q2LkV/kX36V9ONtMfEZsmGb02hxwoqERvN1dWPitamU
	M6cJ/dtIPfh0VkfpGkkQfsvjmI/rmnT0bu9bG9fX2KHOKGiEql5W/fMHw4QnusScKZv9
	r9tg==
X-Received: by 10.70.134.70 with SMTP id pi6mr31513786pdb.100.1437153335781;
	Fri, 17 Jul 2015 10:15:35 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	nl10sm11832492pdb.38.2015.07.17.10.15.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 10:15:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:16:04 -0700
Message-Id: <a1179c76b473ed5f9e1e69b8f7e746e1cdd1f6f6.1437153291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <910a69c2d626117ec01e2d9dacad04c447999489.1437153291.git.chris_larson@mentor.com>
References: <910a69c2d626117ec01e2d9dacad04c447999489.1437153291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437153291.git.chris_larson@mentor.com>
References: <cover.1437153291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] recipetool: appendsrcfile: use -D, not -d for destdir
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
X-List-Received-Date: Fri, 17 Jul 2015 17:15:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

-d is already taken for --debug.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/append.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 0997f82..ed4af20 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -456,7 +456,7 @@ def register_command(subparsers):
                                    parents=[common_src],
                                    help='Create/update a bbappend to add or replace source files',
                                    description='Creates a bbappend (or updates an existing one) to add or replace the specified file in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify multiple files with a destination directory, so cannot specify the destination filename. See the `appendsrcfile` command for the other behavior.')
-    parser.add_argument('-d', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
+    parser.add_argument('-D', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
     parser.add_argument('files', nargs='+', metavar='FILE', help='File(s) to be added to the recipe sources (WORKDIR or S)', type=existing_path)
     parser.set_defaults(func=lambda a: appendsrcfiles(parser, a), parserecipes=True)
 
-- 
2.2.1


