Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2C07F687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:53 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id a18so1195535plm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ooijRPf0CZz6ybEelDOcMfpKVWkRK8H6S1D4SpXGoaQ=;
	b=mXWLFapyX9DdOmRie17SrVI9BEqwKwxbc68OtfjOOhp25a57psoIPP7KBnhgtyQdjM
	n4ZrIF/+emFxvA9DBfIkVVkSzwAT/hxFCBJ+cNOb39Ni08IBIdbE+wIYAywvtbV/HqCY
	SwPdxGwNeABo9peTs3zvooXcHm7WzNI/2gur9iPpKXV/1tEYf6HcoCVvCDC1gcnL0YRI
	ZNQgzqUbzNxI4Wowdxhx2vmAWG6ZCHM9azHmuXjPTSBwsBF/eSeIZbINXWwd8U8PvhNt
	M4fsJbXFLxC3fqX/f6evipc87IkX2isr+/HSuk95YnGxpGqTk+aa3fGXsFHzofkKBY+V
	7+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ooijRPf0CZz6ybEelDOcMfpKVWkRK8H6S1D4SpXGoaQ=;
	b=N1//1DGyiAM8FwPnYNRnVQEIa90g6h1Pth5ycVGIcHOmB/4rz1VcUd0pZ6adwwYSR0
	E5pW7qLfnWkQm/c2Bx0PFNRUZDUVUloPS92PUNT3iA/cYKcHbMujHnCYoo/He1uv1uxi
	ydbnw4+gUleDvTGAC6nohG6E5P8PMP99C9ur0lgj/+SyfuSXBxBoK35d48iXO6uu3i+n
	K5nOIXdK46UnKLPIH4bm+a0UT+pE08Hhg4AFAGs4DvlQzJp4SHKBBa7Q1fHQp8zzkhDI
	VAvpjWXFvfxjQnGM7Qr7AhNaChzz1j7cv7nl0EiF/xKe5S04qaLpDtYLQVGZ4wtnaBaH
	GlpA==
X-Gm-Message-State: APjAAAWfDOdpNbXSdkSV5aw7g8eRyWNfLKloQ8cjPjfxR5GvYGtD0O2z
	c5bBU4ouzb4NGHo33jg1Ru6n04zh
X-Google-Smtp-Source: APXvYqz/Dn5eEugEwmBQlPU7t1HLstWa5eyGju4Mau/VhTPCtt8+WKb3ObUbfEw3tMHNcMEmdRAZuA==
X-Received: by 2002:a17:902:a410:: with SMTP id
	p16mr4302896plq.184.1573658394449; 
	Wed, 13 Nov 2019 07:19:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:11 -0800
Message-Id: <950168bce4ee69b04d7679d9e2d164e2f5c36953.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 08/25] devtool: finish: Add suppport for the --no-clean option
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:53 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This works just like the already existing --no-clean option to the
`devtool reset` command.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b944ec3..aeb9452 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1895,7 +1895,7 @@ def finish(args, config, basepath, workspace):
         else:
             raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
 
-    no_clean = False
+    no_clean = args.no_clean
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
@@ -2169,6 +2169,7 @@ def register_commands(subparsers, context):
     parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
     parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
+    parser_finish.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_finish.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
     parser_finish.add_argument('--force-patch-refresh', action="store_true", help='Update patches in the layer even if they have not been modified (useful for refreshing patch context)')
-- 
2.7.4


