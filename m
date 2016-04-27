Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6DF734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 23:24:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so6448129pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0TFGS8kj3p8+IiUMJ7JV0R3ZhdE5tQ98Dwx6lIdQfEY=;
	b=ALFhNL94k3rIM8KR9Xu7k/bEbb4+/QZp9XGGMYwI7Hjx8yAidBZC24C1JAUAPYGW7g
	uWhht8jDfBXWIG7KmDY9qXw8/ZZszAQqJf+5dKLW3IFOW/kvUH7bQTa8ZMvfNpK6pDFF
	t/vhJWM3eD/SohoU9DAqVFG04AJ4C8PfLlXHznLd6ZdMtqTI7HfbqalqymDwjHp+IYlp
	pCZd+xl6h9ZNiTuiiFxgnRXgcef+9YOa7oTMLQCn4MrCNYdL7fPUdN/MAv2m2ejVbdWZ
	iLchAiu/LI6Hk9uzdoZWRULBs66JcIG9/EU9CpzL/QrvNE2yF+iU2f1M6IIQfoV2gdDi
	UxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0TFGS8kj3p8+IiUMJ7JV0R3ZhdE5tQ98Dwx6lIdQfEY=;
	b=Ky3X2hPpYk/E+zrjET4Wyob9pWFw9isvc+t+18oOJb+sk0b0nPwvnz75CYuhcXJ6Z1
	LYWVGqOf5e8Su8oySB7xewqXysLH1cCtc5C9yLcffsrRT+Vb9w1TRw+Dbbi06xczzd3o
	GmPvFKQ44YltS/j+U2jYrGXo2wKydVOeIHX2GpvDRO5qW8LdAF71Z1QdPL/mC4NvfvJE
	5z51ioN76biROxzjNf1ovXvcwbXXVnj4dc3hx/SnbeYswOhTYa46zQUlWR4JZwKbo2x3
	IOYVNgiG+q1FqK3ouTPY3EVKYUHdsqSI37OIqReXSgqEXDDaVHpLTGRmhCcgLRCcqwMx
	xIyw==
X-Gm-Message-State: AOPr4FWmBnXq1ma2klkB9z49uvKzb2vl3X77TKejF31T+aBQ5/MI9tn+v4o0H1DvTRm9WQ==
X-Received: by 10.98.76.216 with SMTP id e85mr15893930pfj.121.1461799445548;
	Wed, 27 Apr 2016 16:24:05 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yl5sm9554679pac.38.2016.04.27.16.24.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 16:24:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:23:58 -0700
Message-Id: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461790921.git.chris_larson@mentor.com>
References: <cover.1461790921.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][PATCH 1/4] scripts/lib/argparse_oe: show self.prog in the error message
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
X-List-Received-Date: Wed, 27 Apr 2016 23:24:05 -0000

From: Christopher Larson <chris_larson@mentor.com>

This aligns our subclassed error() with that in the original class, using
_print_message and self.prog. Also add a docstring based on the original.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/argparse_oe.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index bf3ebad..95b42e7 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -16,8 +16,13 @@ class ArgumentParser(argparse.ArgumentParser):
         super(ArgumentParser, self).__init__(*args, **kwargs)
 
     def error(self, message):
-        sys.stderr.write('ERROR: %s\n' % message)
-        self.print_help()
+        """error(message: string)
+
+        Prints a help message incorporating the message to stderr and
+        exits.
+        """
+        self._print_message('%s: error: %s\n' % (self.prog, message), sys.stderr)
+        self.print_help(sys.stderr)
         sys.exit(2)
 
     def error_subcommand(self, message, subcommand):
-- 
2.8.0


