Return-Path: <eduardoabinader@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C49FA7F284
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 12:21:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so59127146wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IA0zuvkQ9UMF6RP/uYBdglMYQB4OCGhUf/3AysH+WCs=;
	b=eKyoi4YrSoMo6Fgd9FOAxSibzoE7MwefDwuXrLxvCmMlbeOmreDZL0v/xCGR+qe581
	Tf0GnW+3TJX5MqFzZR9tcsFqrnWGoz+vr9IvZgeoASjmsTrv3o/rZIEJZ0pq+f+i91Ib
	S0PEYMHGAcbA4mBiGiUTyO7WbSCur0GNNFKMX7aYofnPdDfiFxXE5lbTGLwUqhpGGRwu
	X77q5PIku0IAp1KZighgCsycPYK6EiQ0k85LUZH22HOsnpUvQWhDaUqTyB0SFaSXQGqk
	A79VQlbm19sXTUvWr5C4vHRb/+O4GBqXzcI7gBRXi8gL8tSntUtW4b4GnJ6Irg4YWSmx
	dvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IA0zuvkQ9UMF6RP/uYBdglMYQB4OCGhUf/3AysH+WCs=;
	b=DmXGxpAzM2BxEelrre7Fkx69bsYNUuipHVNz/nIB30ifyPapaEXT2dkoloVtC5hqBy
	kFWSfH+8So4P2yqCUotRuClkp2tpA5MjS8vTaFJQvwJXnDP7ymxnAUQ4PnP0SP1Wih9B
	6XoFOCYrFiGmnIGZ/OHMOWnKJdrXuIld6M9pg0cYrZ1tDWm50PgOZwDkjUXVP04lj3xF
	sFtvbPVmDcp961a2nydq7M524GCShWOlkYf4kT6Zs9Dy2F9T3h5Bo92HKfu71BE0tUKA
	5ZifDFyYxVsslMQan0lXLqEBIkqz3B4yjmRLsgP0cJPZGIbxYB/MHrKEEuVqDgL2Dsv6
	KJ4g==
X-Gm-Message-State: APjAAAU5Rq+nXZmA6jQZAdO4JjvM1kuDiK2dInHpjzxeqj+vwMIFxGhy
	qn8g6vcoqCpUGw5cNOdzZjEO9XjPFNg=
X-Google-Smtp-Source: APXvYqz9/6gTzYUnKoDhIVFYttakQEZ6++1VDL8cem0iQ24+WTibcWW7jauaz9SmXQnZ20KjmBCIcg==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr51574595wrp.149.1565007664789;
	Mon, 05 Aug 2019 05:21:04 -0700 (PDT)
Received: from localhost.localdomain (p5B2F645F.dip0.t-ipconnect.de.
	[91.47.100.95]) by smtp.gmail.com with ESMTPSA id
	v15sm77227191wrt.25.2019.08.05.05.21.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 05:21:03 -0700 (PDT)
From: Eduardo Abinader <eduardoabinader@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 14:20:38 +0200
Message-Id: <20190805122038.21312-1-eduardoabinader@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool: add ssh key option to deploy-target param
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
X-List-Received-Date: Mon, 05 Aug 2019 12:21:05 -0000
Content-Transfer-Encoding: 8bit

From: Eduardo Abinader <eduardo.abinader@gmail.com>

Signed-off-by: Eduardo Abinader <eduardoabinader@gmail.com>
---
 scripts/lib/devtool/deploy.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d1ce2309f9..6a997735fc 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -212,6 +212,9 @@ def deploy(args, config, basepath, workspace):
             scp_port = "-P %s" % args.port
             ssh_port = "-p %s" % args.port
 
+        if args.key:
+            extraoptions += ' -i %s' % args.key
+
         # In order to delete previously deployed files and have the manifest file on
         # the target, we write out a shell script and then copy it to the target
         # so we can then run it (piping tar output to it).
@@ -326,6 +329,8 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_deploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
+    parser_deploy.add_argument('-I', '--key',
+                               help='Specifiy ssh private key for connection to the target')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
@@ -349,4 +354,7 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
     parser_undeploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
+    parser_undeploy.add_argument('-I', '--key',
+                               help='Specifiy ssh private key for connection to the target')
+
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.20.1


