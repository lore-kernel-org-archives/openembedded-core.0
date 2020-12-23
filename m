Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.9452.1608732729031836388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 06:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c5HJTekI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id t6so9202041plq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 06:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=BRBGxOdoccIc0EB8Fgpa3dr4nVLxSMN474Ysc+pF1eg=;
        b=c5HJTekI0plIJuM4Si6q0k6X6Ti6dcLqRFv5Q7pBke2ustgzdRFbO0BDkVNquUQvwq
         7BNUR3GzeuJDmVG5n//AFrdEwiBMuGumouqcGB0Muh59YtuEhDAnEAxCY4bIz3cFTlFz
         huyPhvyPdMKPKx5qI8T48CuZfCMIBVANIdvU3062oRHolkFBladDpjQVCg5AT/e4GngD
         vD1WaN1+RBVvilk+hvMPmVsmt30NDWWxLaowL9CSZtnPvLJHyJrzw54lKMhhbn9Nd6Th
         7HciuEQSqYQzf90r4jb2fxvhbUUUgAlf349COPXA56HCQydIi6y1Ws80I0NwEnTIPz80
         X0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=BRBGxOdoccIc0EB8Fgpa3dr4nVLxSMN474Ysc+pF1eg=;
        b=KyYQ93u0fxX8WRfESdGz2i6ZuDCHknqNdGlxj9TfyrUNlIxT0e3XN4ZfsSeL/mnLG7
         b+CXJnEhedFNg15WKqdLIqnkWEZPQyiSARpZTQLK1nUFZeu6YUuda9xowWqFXYq2ZFLP
         ZE56hVmlgyf0UpxKq6hcgJZtyPDiBXrZ5m0C6IaHGDk+klZc3bslj8CQyVIf/LxrYSna
         P2oCdwwKr5GjkG9Y6BtmD71UyzTPLx3cbVzvQWL3ZrHYWH9MZPjgN/izNIh7JfTlD4gT
         zKnf01+sSmMcoSlUX0VkaK20vkwXOYFkZOSSfp5F6Y6mvbFdCE7ExfnTZDmuJ1Jmw6+V
         uDFg==
X-Gm-Message-State: AOAM530wXm8+S7jDq6NClKuDlAPp4cgkqW1kXvlIhSMvkJRNZQUEVBnY
	aZvRkrNOGEcp0bgulFpv7jue9nlhg51HXrVG
X-Google-Smtp-Source: ABdhPJx8+s55P4vQV1TfkBh799vgKpNFtBdUGdFwfDERmizXPvhBAm37hVpQEUAWxQgzXskC1jAZcQ==
X-Received: by 2002:a17:902:a401:b029:dc:3e1d:234a with SMTP id p1-20020a170902a401b02900dc3e1d234amr4167154plq.48.1608732726366;
        Wed, 23 Dec 2020 06:12:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x18sm24101376pfr.158.2020.12.23.06.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 06:12:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [master] [dunfell] [gatesgarth] oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
Date: Wed, 23 Dec 2020 04:11:49 -1000
Message-Id: <20201223141149.6954-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Causes intermittent autobuilder errors:

2020-12-21 19:34:23,035 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 68, in setUpModule
    bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1460, in edit_bblayers_conf
    (updated, newlines) = edit_metadata(newlines, ['BBLAYERS'], handle_bblayers)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1290, in edit_metadata
    if handle_var_end():
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1215, in handle_var_end
    (newvalue, newop, indent, minbreak) = varfunc(in_var, full_value, op, newlines)
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/bitbake/lib/bb/utils.py", line 1425, in handle_bblayers
    res = edit_cb(layer, canonicalise_path(layer))
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/devtool.py", line 60, in bblayers_edit_cb
    shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
NameError: name 'ignore_patterns' is not defined

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b8edc89768..4eba23890f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -57,7 +57,7 @@ def setUpModule():
                         if relpth.endswith('/'):
                             destdir = os.path.join(corecopydir, relpth)
                             # avoid race condition by not copying .pyc files YPBZ#13421,13803
-                            shutil.copytree(pth, destdir, ignore=ignore_patterns('*.pyc', '__pycache__'))
+                            shutil.copytree(pth, destdir, ignore=shutil.ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
                             bb.utils.mkdirhier(destdir)
-- 
2.17.1

