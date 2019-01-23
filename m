Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6236D638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:18:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so3180935wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SwxB0DyT0LW8g2qLLo2Rs5znzdcQxFYv1DGFv6LGTXk=;
	b=IiDYnv501bw1u5BvDBbo5zyIhmev7jkSNXO1GiJRj/A6nwgTUVFa0rdFecWdM0Amk1
	54S+xCQnMFsAgKAlwCtNFVwjLnuwsaUJl4/2DTUGEoPPUGIqVUSEiochfPanOlPtmsT3
	frGcH+GXE9fjghPDrmzDm4dyOADCM0L+ud/kjuaNPCHODZAg+jkjkCdwmJ+yMnESmVFv
	XmC2PQaMx6b0lzedBoALLv7PMwF2Q5MfKVdNFPnqoeVVqrdKf21u9MYCf1YHrh7vMflM
	Z7BhuP257IRVNa+Oa1rIq6cBQe8ZqWFHO0ELcH8KMsxyzQB2WEhr3giK7QSK7wKn9usf
	2Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SwxB0DyT0LW8g2qLLo2Rs5znzdcQxFYv1DGFv6LGTXk=;
	b=Z81AylHph3XdlR9zokKkCmHX4/DLaWsy/A31vHyJVlrfsem9zgIFn4ce0aq6YG7zvm
	AvJY+cxWRYixjBnoV0sZhSHoWAwIdgy5omRpJrxdvUl2vZ3heP5zwDSTC/SSopdJ4y2l
	cnrnlCcUGQsIZeFxn7Enqc8Ee/7f63kacgUnWKWjLt/PlLffsl1SH367kvYEuRBCWRdI
	ZHvigV0dOtY0El79ZC7VWFaaul3Dk6Wj+onKcf/hSknsxaHCubLfrBddpkxKBWqiiM8x
	kKqc2xdQSuqaJFRKsGFGDZmUFLOUj+2bNu4CZSVB0h5PUlQ6ygFIzO/HE6zHjSLJpwuQ
	vrbw==
X-Gm-Message-State: AJcUukf93z3Hcgk1y8mGRmOWiu4Muw8vsAHk5DsaEaRZqVZiwzAIa/Se
	eZOAY9wsfmW+X5uxlfyhx5F6ayqe
X-Google-Smtp-Source: ALg8bN74Ra8gHn5njjlhQ09zGhrraeu0cTdsc1v3/3EYbpeYUzXew6/2sXtCD3CtpYAYOliJI1h+SA==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr3587267wrn.257.1548260281872; 
	Wed, 23 Jan 2019 08:18:01 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.18.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:18:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:44 +0100
Message-Id: <20190123161744.45763-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/10] devtool: add a command to print an overall list of recipes that can be updated
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
X-List-Received-Date: Wed, 23 Jan 2019 16:18:01 -0000

A sample portion of the output:

$ devtool check-upgrade-status
...
NOTE: acpid                     2.0.30          2.0.31          Ross Burton <ross.burton@intel.com>
NOTE: u-boot-fw-utils           2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
NOTE: u-boot-tools              2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
NOTE: u-boot                    2018.11         2019.01         Marek Vasut <marek.vasut@gmail.com> d3689267f92c5956e09cc7d1baa4700141662bff
NOTE: bind                      9.11.5          9.13.5          Armin Kuster <akuster808@gmail.com>  cannot be updated due to: 9.11 is LTS 2021
NOTE: iproute2                  4.19.0          4.20.0          Changhyeok Bae <changhyeok.bae@lge.com>
NOTE: ofono                     1.25            1.27            Ross Burton <ross.burton@intel.com>
NOTE: wpa-supplicant            2.6             2.7             Changhyeok Bae <changhyeok.bae@lge.com>
NOTE: base-passwd               3.5.29          3.5.45          Anuj Mittal <anuj.mittal@intel.com>  cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
NOTE: busybox                   1.29.2          1.30.0          Andrej Valek <andrej.valek@siemens.com>
NOTE: dbus-test                 1.12.10         1.12.12         Chen Qi <Qi.Chen@windriver.com>
NOTE: dbus                      1.12.10         1.12.12         Chen Qi <Qi.Chen@windriver.com>
NOTE: glib-2.0                  2.58.0          2.58.3          Anuj Mittal <anuj.mittal@intel.com>
NOTE: glib-networking           2.54.1          2.58.0          Anuj Mittal <anuj.mittal@intel.com>
...

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 202007793b2..42a4c0e4bff 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -600,6 +600,20 @@ def latest_version(args, config, basepath, workspace):
         tinfoil.shutdown()
     return 0
 
+def check_upgrade_status(args, config, basepath, workspace):
+    if not args.recipe:
+        logger.info("Checking the upstream status for all recipes may take a few minutes")
+    results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
+    for result in results:
+        # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
+        if result[1] != 'MATCH':
+            logger.info("{:25} {:15} {:15} {} {} {}".format(   result[0],
+                                                               result[2],
+                                                               result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
+                                                               result[4],
+                                                               result[5] if result[5] != 'N/A' else "",
+                                                               "cannot be updated due to: %s" %(result[6]) if result[6] else ""))
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
 
@@ -627,3 +641,9 @@ def register_commands(subparsers, context):
                                                   group='info')
     parser_latest_version.add_argument('recipename', help='Name of recipe to query (just name - no version, path or extension)')
     parser_latest_version.set_defaults(func=latest_version)
+
+    parser_check_upgrade_status = subparsers.add_parser('check-upgrade-status', help="Report upgradability for multiple (or all) recipes",
+                                                        description="Prints a table of recipes together with versions currently provided by recipes, and latest upstream versions, when there is a later version available",
+                                                        group='info')
+    parser_check_upgrade_status.add_argument('recipe', help='Name of the recipe to report (omit to report upgrade info for all recipes)', nargs='*')
+    parser_check_upgrade_status.set_defaults(func=check_upgrade_status)
-- 
2.17.1


