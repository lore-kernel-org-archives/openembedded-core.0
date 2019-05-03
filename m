Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEC626C0E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 16:47:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p21so7860695wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Fr5rJxP3k06o2QDJ7w87RvGzIaLkhI2xnW67j3CsIfU=;
	b=WK0CqXpqJrbIvVigH5Z+uBsf5EIpBkj+JKSr27A4pWPJRUpObtuBsgzpS507Ys8Gco
	f/w7rIMUIAZZ+CIN22sglDkzJE6ZgNqtUl4qDiMBrbXOPzjSQGsRvJZ3JSs704niJ/y6
	Si362h2nnoacsG7ed02KlGyYPsBUNIsXpL7J2pmlT43LH9PoQGYdI+kwVN/OZM4SOSDG
	iSgfUes9EKiZ1M8lT1ND/lZ3bh13pSCC8uo29WIIJ3Y2e0GF1I98zDMc7KhQBCC/809z
	tSQxWhV+XUzMFIg2/nU+klcTrpF8rK3/LqKJBQFQhlbKUhWDiv249QWZjIBJeLHO8TGv
	lvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fr5rJxP3k06o2QDJ7w87RvGzIaLkhI2xnW67j3CsIfU=;
	b=AJ4W1IaGd5PUAlmeWB3Aw/amSC/agjW+klE+uy+YTkBO6rdQPnvKiYpXcP8NynOOvH
	Gfx81yQqPBxP52p6URIxaXuxk+5yZk4eTUC46Jev4wYFQKO0uX5taBSmniZg+OJcOWSc
	5Myf8IxhQHZQVn8121j9RYhoXgkd6vmuVxoh/OzOKDCihZubaeMgY6gxwLEwB+ZwSq0l
	ZUS+tCA1Uftfj+EAVVynXPH1SFYIgnvh4JYTwvNkiaP8whrRqTkzLBueKsWoHa+r8Rk4
	N2TPCwxUAbjB685q6YUC0nuPnhXIS1E9sSVhzWh+qBGHK+Q2GA8T9e3E4dhVFD6kOew5
	Eg4Q==
X-Gm-Message-State: APjAAAUlAn2O6BXoDZ5YYpdt9bnjuW9+wxwZiyQrma5xNLiB0JxZu3Pc
	tC+ewdL3bi0k7eul0gqR8zOVqU15
X-Google-Smtp-Source: APXvYqxUYpajqcAE/U3BUX1w324AFuADHCEKzosY4zzfzScX5GVLPtlfgZcbLv/DQj6lZ5+ylMYQqg==
X-Received: by 2002:a1c:c243:: with SMTP id s64mr7349673wmf.46.1556902080093; 
	Fri, 03 May 2019 09:48:00 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	j13sm5871038wrd.88.2019.05.03.09.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 09:47:59 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 17:47:34 +0100
Message-Id: <20190503164734.130778-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bmap-tools: Add RDEPENDS on python3-misc
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
X-List-Received-Date: Fri, 03 May 2019 16:48:00 -0000

The newer python3 recipe no longer includes python3-misc in target by
default, leading to failures:

  Traceback (most recent call last):
    File "/usr/bin/bmaptool", line 6, in <module>
      from pkg_resources import load_entry_point
    File "/usr/lib/python3.7/site-packages/pkg_resources/__init__.py", line 42, in <module>
      import ntpath
  ModuleNotFoundError: No module named 'ntpath'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 7c4db85b32c2..2bb4a58d4cb3 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -18,6 +18,7 @@ PV .= "+git${SRCPV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
+RDEPENDS_${PN}_append_class-target = " python3-misc"
 
 inherit python3native
 inherit setuptools3
-- 
2.17.1


