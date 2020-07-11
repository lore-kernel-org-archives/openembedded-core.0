Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.2968.1594437813968243522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ni33sAIG;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id d4so3372010pgk.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 20:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+fqRzgmgq6NpSxLmFWiPdQjouONCgY0VCv8BbHNVOM=;
        b=Ni33sAIG21UsG2uvJg0mCTEtxnGyZZfPhZCbcvGgp3XbVrvWrLcvQ9+pU1P6RLWk0I
         9Yt+kkQJ+gotVUhxfPazeQYFv1gR0q+gZV32VUa0uIuJ08+SbLSLk/pYanT1FzTiFteo
         8eFurPtt+InRr6784CO/4dRrbCtKCLbpwEVdhrpQNRttvP7xCAWFs0b0bX99P5W5vcIG
         KzbJtY1hErcx/br4ml1iHb5+QiiO2YfHxi9vBTezXPkjXgUXXW2fYwUYUY/8NI/2eXmQ
         WW/oe2Rcr2KIzET8asgg9pSRT/kfg6/pvF/2qFLdBG3W0NCKRu8U4NTPLpxQ19MJN6/U
         T7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+fqRzgmgq6NpSxLmFWiPdQjouONCgY0VCv8BbHNVOM=;
        b=gacLamtzHUENDTjF6znhW16arbKsmzF0l7e8pAzIegQDWthsyJtAt9ddghYo1NYnNu
         txPclXpmB48dXOtR96sPs/7FDJ3uU00qGqknL9jF7llfLByT9ZekpikfFvm//LCfEojJ
         xBLDiEbcwOiBXnZPYhoDMH5NGBJ2fAWy/RL/o0wj9s6pbkHsBBU5KCZevPORWUpS+l6i
         cVVI3xEWWSxW8J1ny8AuK7VV+OSjDNPnST799M/yOfyXRJGODL0xO+p8R8YLTweFh/wh
         03Pi1Y0KpyOamOHdON/ImQPx/YO0AX1SGVkmZ4/EoQBcixhOUNVEJEfKKRgLB40uhuKu
         j3Ow==
X-Gm-Message-State: AOAM533SvSfO5jrPfmlAdC4nzG6+gRTDynnFdcrpQH1+h1O1kUWq5WME
	X37fQAtAvyiD6UEz88EEOshqA/bZ
X-Google-Smtp-Source: ABdhPJy/zCvwEGOUaL83RnJ4XkUOON4fRiCXIn5bWZ5kPUQIXWbZynhFiRFAcO0I3sBgg5OWi4H3gg==
X-Received: by 2002:a63:5a01:: with SMTP id o1mr59713338pgb.337.1594437812801;
        Fri, 10 Jul 2020 20:23:32 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8846:99f4:e279:5146])
        by smtp.gmail.com with ESMTPSA id y17sm7235788pfe.30.2020.07.10.20.23.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:23:32 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] recipetool fixes
Date: Fri, 10 Jul 2020 20:23:14 -0700
Message-Id: <cover.1594437521.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

During development of a perl module recipetool plugin, some issues with
the existing codebase were uncovered:
(1) It is _impossible_ to add "AUTHOR" in the appropriate location
(2) Several regex patterns are not prepended with r'

The following changes since commit b3c96103a5063eeefb0c537227eab3f77616b9c0:

  libnl: Extend for native/nativesdk (2020-07-08 10:56:11 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/oe-recipetool-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/oe-recipetool-fixes

Tim Orling (2):
  lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
  scripts/lib/recipetool/create.py: fix regex strings

 meta/lib/oe/recipeutils.py       |  2 +-
 scripts/lib/recipetool/create.py | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.0

