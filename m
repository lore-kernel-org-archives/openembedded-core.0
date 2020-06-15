Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.258.1592258521566605444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 15:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dyFFYNOd;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: danismostlikely@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id ec10so8546479qvb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ABWqVC/xbVpkSOSHHoVXxxY63zEm+EWgPI6s44B/h9g=;
        b=dyFFYNOdyO751kzoF0wUVqTuMINNrDxEhA6I8lUW3W0dJeXDl73DoCifl3QToH7dBO
         mAvEAHratNmFJfTbdS1gTUbGvuYz1J2+GNLDgKebIsNZdQWTzioZeTZalmRR5wmCtR7g
         nRDQZlt494gGgb6HUw0+Cu8KiDywGsYWWUPZhDa1Y0hL3ZmYsfpy0bG1Wvvl/Wvtha9a
         cFwtiXB0YNyNSR/EFzpjylzUJB/A7wX0iDUkh03oKIM15YLs3uuVr+Uy44fkw3MxWJEz
         ABt/jFW4SEuT6mWmAV27dSpJFCC4V0fHcmRQBszECj8C4kPLwF3Xn5v4XLO2rqReSIE4
         Labw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ABWqVC/xbVpkSOSHHoVXxxY63zEm+EWgPI6s44B/h9g=;
        b=CQLOWiWiVgiMh9Y4JJWQU9mM9Pt93U8xDNgqzfE3bvjRgeWkWvkvQ81G0WNlTnk6iO
         GrZqiBvU9kJuCXHQEm9uFQWNnqaYZcmc6hPtDeWLBN3dpiaHuFGa/xLZMFtEFOHlhOa7
         wIRDchoQbAAxdXTPj5FsdH9WnozoWLftrwidBw21n3Od/BKJU/QeKAdN2MUvXgAU59Q8
         Fv+ZGyv4Z64/Cv8RBi6nKnp5+psnGlCBQrCJDdDKj01RzGah6JzHUShvGFR34Chs0ngU
         Ao0nT/DrLYz0RS7I25HvkFSuevyc08OCSRzmz+rEWISHkl4Vgxa+bP7mer6whZLer6LP
         GxCg==
X-Gm-Message-State: AOAM532Q897Nx/LJSn+2qnzRtUf/hywKumchmoqqfvBwHqGC9eAXCd9V
	6+I9SVU9l6wM5FW6beQscnc4OqovBww=
X-Google-Smtp-Source: ABdhPJxZZQ4rP7oKr8b6IKy3+3pG+HEFJZEcMgnAT1Ds5kaJx9t8wplNJlepU1OCL12ZcO5GVZmJng==
X-Received: by 2002:ad4:49aa:: with SMTP id u10mr27995537qvx.162.1592258520612;
        Mon, 15 Jun 2020 15:02:00 -0700 (PDT)
Return-Path: <danismostlikely@gmail.com>
Received: from nebuchadnezzar.local ([2001:470:30f3:1:bafd:2698:c02f:136a])
        by smtp.gmail.com with ESMTPSA id 79sm12200056qkf.48.2020.06.15.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:02:00 -0700 (PDT)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danismostlikely@gmail.com>
Subject: [PATCH 0/4] Various minor improvements
Date: Mon, 15 Jun 2020 16:01:39 -0600
Message-Id: <20200615220143.4018104-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan McGregor <danismostlikely@gmail.com>

Fixes a few annoyances we've been experiencing, such as devtool
breaking on recipes that inherit python3native, and the number of
threads affecting the stamp of RPM signing.

Daniel McGregor (4):
  devtool-source.bbclass: Do not export _PYTHON_SYSCONFIGDATA_NAME
  sign_rpm.bbclass: ignore thread count
  systemd-conf: Accept MTU from DHCP
  buildhistory-collect-srcrevs: sort directories

 meta/classes/devtool-source.bbclass                  | 3 +++
 meta/classes/sign_rpm.bbclass                        | 1 +
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 scripts/buildhistory-collect-srcrevs                 | 1 +
 4 files changed, 6 insertions(+)

-- 
2.27.0

