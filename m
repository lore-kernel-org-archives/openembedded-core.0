Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BA1C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:53 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.142670.1671132111896010736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VD2mh6Y/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id gt4so178636pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KcD1dMWsiDajC8BK/vr3ezOCC8BWL15oMjGCa6+4IU=;
        b=VD2mh6Y/LYAjfe8Cp+dKfHczxJv1L54VqYLExCBWxT2R8VxXFr7kbcufb53pDLuufV
         qfZxcEVaEiAxFQHg4RvodxvXTEFD5SNV5djTQpQBdXcImQyKl29Z/OtrIA0PCsXqvo1R
         3jSABIL/zlKoaQVgmFXTZ4CzPkaw/x2pVRp2R/DfkeQyWpbiQRNOHhWYCfUo4yFMbzx5
         3lz/SMnIK1j3ixmPgEcWJoepZgJ/q0NdUi6GWCseur2U5gyFBWnLpJZMMf2XRUN8Q4It
         t8S9qLSCssvFV3BE7MsMHwwLB0bWG5zc/wpLJ5jmWdEstthDmfS+Fvvd6TBYGg0xhWfs
         6PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KcD1dMWsiDajC8BK/vr3ezOCC8BWL15oMjGCa6+4IU=;
        b=Dmo/QX5yloDopgilcuilGCP/hG1GakJHMAoPL0D1WialM/myoHPaRvSeN1oL12LQOw
         SP1B8E9Kq0048mg5plGLAGlITDHBaWZ2741Ee8xD8PzgT8Dx8Yz0dZL+uOILOvL+Zd9e
         lpMXxbU7A/ixvO7Qt9LIP/qW91e2l0+azsObYiKD+C0ai+t+m+lDDCeWdfUuuPxa8rMe
         D0RS46aXjOjYq/AK/Q42hx/42OsATmUmCoHnB2Y3uDbMp3+SAFw5h00EH6i7+HYuXtBx
         L4iJKlEW6eBE4rB+URAyIGHGNCAKA3TZjaltzWeeTelI5JgEYgsX9wtLoogXbKpN5iHN
         hm+A==
X-Gm-Message-State: ANoB5pnn3ScLN6N6DZ33IoJVG9WUXvbe4ickcqZW8jMb+JYIYxuAQ/99
	goSXHP/8wxvvRHWI+vlPdyAhgmFzymbtv80NF20=
X-Google-Smtp-Source: AA0mqf7EH7E1goYtpJgTMkq1sm8OyWwd48UM3SiAopeiZ/dFhTRtXLc6BH5PXP5UP4Tvc7HDVYJfPw==
X-Received: by 2002:a17:903:40ce:b0:189:c83f:d5 with SMTP id t14-20020a17090340ce00b00189c83f00d5mr32056287pld.52.1671132110905;
        Thu, 15 Dec 2022 11:21:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 29/30] combo-layer: add sync-revs command
Date: Thu, 15 Dec 2022 09:20:53 -1000
Message-Id: <3f297420eadf107bb19e71322e34b8aef2623e04.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174621

From: Ross Burton <ross.burton@arm.com>

When starting to use combo-layer, or if someone else is using it too,
the local last_revision may be incorrect.

This command will forcibly update the last_revision config values to the
latest SHA on the remote branch that is tracked.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bb5d12ecd1b0273983f7c05699f34dd64b11c25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index e467f390c1..7f2020fca7 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -191,6 +191,23 @@ def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
     logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
 
+def action_sync_revs(conf, args):
+    """
+    Update the last_revision config option for each repo with the latest
+    revision in the remote's branch. Useful if multiple people are using
+    combo-layer.
+    """
+    repos = get_repos(conf, args[1:])
+
+    for name in repos:
+        repo = conf.repos[name]
+        ldir = repo['local_repo_dir']
+        branch = repo.get('branch', "master")
+        runcmd("git fetch", ldir)
+        lastrev = runcmd('git rev-parse origin/%s' % branch, ldir).strip()
+        print("Updating %s to %s" % (name, lastrev))
+        conf.update(name, "last_revision", lastrev)
+
 def action_init(conf, args):
     """
         Clone component repositories
@@ -1301,6 +1318,7 @@ actions = {
     "update": action_update,
     "pull": action_pull,
     "splitpatch": action_splitpatch,
+    "sync-revs": action_sync_revs,
 }
 
 def main():
@@ -1311,10 +1329,11 @@ def main():
 Create and update a combination layer repository from multiple component repositories.
 
 Action:
-  init                 initialise the combo layer repo
-  update [components]  get patches from component repos and apply them to the combo repo
-  pull [components]    just pull component repos only
-  splitpatch [commit]  generate commit patch and split per component, default commit is HEAD""")
+  init                   initialise the combo layer repo
+  update [components]    get patches from component repos and apply them to the combo repo
+  pull [components]      just pull component repos only
+  sync-revs [components] update the config file's last_revision for each repository
+  splitpatch [commit]    generate commit patch and split per component, default commit is HEAD""")
 
     parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
                action = "store", dest = "conffile", default = "conf/combo-layer.conf")
-- 
2.25.1


