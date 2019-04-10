Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 341EB7D906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id q16so2560630wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z9m3TNaxBdrGZ98gPaAdVxhvif3BPaSmmsHec69aFL8=;
	b=bJZF34COa7rwYD55DMZBYJSJP9R4jezFx0EVv+GJ4l8pwar7TuZ+5qiO6bKP5qEQJP
	nO2fE06Zkr/ohT9pKKc4d9eYX//hCcoaD9xn8QobEox4BVfRw63v1wOXGGGpyyOMBmWe
	sUGaOM7oLQd6dSuvnNsMwk14YwgryweYEKQd61vItR24AoW5/6bVMHSDs9GWlC/vHqsM
	o24GA4SGkOOmxpLyIU0mC7Bi9yBupXbgDrrsDMJq2GwkRs13afj5hFOehh4AacJ6fSv9
	xLzXE72wz5tKOKxTL3717e4NmJhuj9ZuJDOwFBehNhoxB/arfHPcXFQpTcytiZ6P7AV5
	fJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z9m3TNaxBdrGZ98gPaAdVxhvif3BPaSmmsHec69aFL8=;
	b=kw1vccY03k3CBW1kIkRM3VLUefp2zmBQ5rk9wUw38uJtVKiG0gu4SxVP1cec/BXGsX
	URt2xnz/NhoHPBQo65f9mqUzs4l7wk+gIDtDj/QMR0ULWqTnsl2Z4Rwenhq9qu6sADjj
	Z5Z19STVvfcHpaTmt7S4k583/efHLPfBEThk5Og4HPSAclomew0JofyHifxdI839erSV
	JzQLHvdhmk3pW+/XqY9BSnecpQvnUNylAoCd/ns//6JJx/I0/r6D/OzDh+bJwWxkUp6Z
	lQXPPHcipChr/43g/q0HhW0K2Gelx19AB+4baAxdrp+VXta6jyamLCm5NQTTnUrYBadY
	hDOg==
X-Gm-Message-State: APjAAAXfyg9u3tuN4STWBhtbYRwbNne6V3cDwvaaVOPWvr5hZvIhaUwp
	xK6crIFQ6XrxbevrVtDT/ZiRAbql77o=
X-Google-Smtp-Source: APXvYqzOWTW1eNRADxu0Ob6zkUn4LnBr6Z1mlvh1puHHsuIY37B0J8+2LK1j9JRqNmTH+qLgDXs/qw==
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr2806943wmf.118.1554901942864; 
	Wed, 10 Apr 2019 06:12:22 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:35 +0530
Message-Id: <6eb041fd930a3731743cc715eb8d73b045cf8932.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 16/33] resulttool/manualexecution: Standardize input check
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:22 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Current input checking does not match the standard input practiced
by QA team. Change the input checking to match the standard
input practiced by the QA team.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 6487cd9..8ce7903 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -45,9 +45,9 @@ class ManualTestRunner(object):
     def _get_input(self, config):
         while True:
             output = input('{} = '.format(config))
-            if re.match('^[a-zA-Z0-9_-]+$', output):
+            if re.match('^[a-z0-9-.]+$', output):
                 break
-            print('Only alphanumeric and underscore/hyphen are allowed. Please try again')
+            print('Only lowercase alphanumeric, hyphen and dot are allowed. Please try again')
         return output
 
     def _create_config(self):
-- 
2.7.4


