Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.222.1592452451756514289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 20:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pR5z3GCK;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 38D5920B4783; Wed, 17 Jun 2020 20:54:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 38D5920B4783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592452451;
	bh=vuF5RLuEcykjjGejHaqWqmrmFumYB/1iwX3MtB2Zlrs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pR5z3GCKlBx9Q4Kj2DITW9jexfvKjESwLuvxiFYB/W4NygpijwPX77lKZ6MvoYGPI
	 oYEk0XoawX+fyvxZgYQHpacWL3kYQBT93SoeVZsO24yKdRhlM8Q39cn0HiSUAvw46H
	 7H29jfr8H7R1n92InkhEe1Vs/2751+LZrVyw1QSs=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] devtool: fix typo
Date: Wed, 17 Jun 2020 20:54:04 -0700
Message-Id: <59b080a8978a5917418580aec5f45a7ab7c10d28.1592452323.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>
References: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>

specifiy -> specify

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 scripts/lib/devtool/deploy.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 6a99773..b1749ce 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -330,7 +330,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
     parser_deploy.add_argument('-I', '--key',
-                               help='Specifiy ssh private key for connection to the target')
+                               help='Specify ssh private key for connection to the target')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
@@ -355,6 +355,6 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
     parser_undeploy.add_argument('-I', '--key',
-                               help='Specifiy ssh private key for connection to the target')
+                               help='Specify ssh private key for connection to the target')
 
     parser_undeploy.set_defaults(func=undeploy)
-- 
1.8.3.1

