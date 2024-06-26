Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E74C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:10:08 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.20791.1719389401959221604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vplijtqt;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: mail2szahir@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-700ca6171f1so669391a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719389401; x=1719994201; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4ybN4SY8CBVU/1Y/ee7Jq/16cV5e83r4+XEXi/Mk2A=;
        b=VplijtqtmNSN5u7hClrTZCtcwK+9FdxNhCREUj5/ZwKXUwW2z99ofa3/pAmhMvHc2H
         ncEEg6x0YIkDF7JwUDTEOetm3F2CHbG93jCq3IJQWAnFAaRlV1IvXhg0O10WFn8ZewU2
         57X8ZE1GhcHNaaaHSPatEqNIeaaGgLkdGHZPCDByeKxhDHZW399Bs6lEEhHH0zxJUFyP
         x1ME4UKZQIe55JOKshqnlsz2EnwZv2+ZxuivH0vj8PYVE2sWQsiyQiIP3h/oNS7W7ivp
         YFxx7VsJg40Ke28GfKtUSLG05pJ5CCDNTH9bfE7sWg3Oby5qiHnqUeeKc4Z9TmOhPJqd
         nRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389401; x=1719994201;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4ybN4SY8CBVU/1Y/ee7Jq/16cV5e83r4+XEXi/Mk2A=;
        b=RjY8e+uZMhvJ9FHfmva1QA1WDfBfJASKKLF26WOgEAukqSpEYQ2vFHRgQLMZaRy6mh
         edjnwVBrlNOZTnaSoYayoDqNklE4fsqeOWcymLUU23LzixQ8Nq5DE4Jcku7tols13zxC
         LGzIq9amL7/VUk+2yenY448NdHcQ94ckmqSFE01fI5Zx54xg3o3Ww3ihfA+KMqkDNAsa
         K5nhE1UXJ06gyYGApuz9WLhfPR0v3oGJkaClmVTJfiySDucPB4MS7D/Rjtxh5Eq4ZM7k
         uKg3hTBJ1I2G7gVkmkMw0O13I7y42fW6FzXJNt/XYsZcll4TmumuV4MHWzbbXgSFC3Q/
         5Ekg==
X-Gm-Message-State: AOJu0YwBL/NnA3d9SzAJ74S7r4CXfyoNEwjHGzuMSGa0/PtAsigBNNAp
	OjzP5lNEFH0pT2xo24ZgIdHEbaQ+q3aAw6CNRlyFOmWBNEUoR3JGB1MtHg==
X-Google-Smtp-Source: AGHT+IHWg7KdvIWCAmVpPsIczQq+LJH96sBkLQxj/SOQZosJ2NISIu5oIQ65ubQ+BGmXGFzX/9aKoQ==
X-Received: by 2002:a05:6870:b4a4:b0:254:b6f0:21b6 with SMTP id 586e51a60fabf-25d06bb45d2mr9810732fac.10.1719389400668;
        Wed, 26 Jun 2024 01:10:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:40cd:e212:6602:698d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70677235b41sm5956333b3a.24.2024.06.26.01.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:10:00 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: Bhabu Bindu <bindu.bhabu@kpit.com>
Subject: [OE-core][master][scarthgap][PATCH] xz: Update LICENSE variable for xz packages
Date: Wed, 26 Jun 2024 13:38:55 +0530
Message-Id: <20240626080855.4673-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 08:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201152

Update LICENSE defined for xz packages to match the license
information provided in the xz COPYING file.

The License information from PACKAGERS file of xz mentions
packages with lzma files are in public domain.They ask to
use GPLv2+, if only it's not possible to mention "PD and GPLv2+".

Include PD license with GPLv2 to packages with lzma content:
xz-dev package contains lzma header
xz-doc package contains lzma man pages
xz packages contains lzma binaries

Links: https://github.com/tukaani-project/xz/blob/v5.4.6/COPYING
       https://github.com/tukaani-project/xz/blob/v5.4.6/PACKAGERS

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 meta/recipes-extended/xz/xz_5.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.4.6.bb
index 6c13e7ebe5..3f363d29d9 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.4.6.bb
@@ -9,10 +9,10 @@ SECTION = "base"
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN} = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
-- 
2.17.1


