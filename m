Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id D723771ABE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 22:23:26 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id p66so61412839pga.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 14:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dO9Ze3c6Xjgt8m5OH5g2MVOFsx0kTQhxNoeUzAG4qWQ=;
	b=SnH7rNrDZvbwoL6NgTVe+WI5OOra4OHUY7pIUZ4EC2iCps140UdyibLpMaa6Z8IPjG
	tRkDo74fJOQiQ6D9g6eN9VlFlPIx49oOsXbZPY40VNEN3d3I4CrJtfHTRXr7XifU1yT1
	gULQTE0gTPZGN7LW+Je0uCvc0/ttoxZYWwmxxkp5bMYPaTlah0uhAcUXHuzWWJIUzDgT
	q5HVaMxvFBowUeg7uPSSZ5h5MiJKsuji5WWHMZwmwPUjFyDkRgTH5HNdzBG9TUJ7JLTG
	LCX1L3297wUUpasqHnIFg8wKTeBdSGGHeXXwt+nv0yzkXcupfIdZ7hgeE9cFH+GVsStC
	4IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dO9Ze3c6Xjgt8m5OH5g2MVOFsx0kTQhxNoeUzAG4qWQ=;
	b=GljypKls+3xSdKkHE0x6Gi8/sTYdbVVJpvQFArOHEGmfqxEZ8YdFhLkcRuCIfsorYe
	AIZnzEZGbh94RHvxDa7dgXVkVIdl199XlqjHMDcpj0oFMNeFJo4qMQAf8VDmXqY+xSxQ
	VCWtsT2lXhKmnSBzIzwLbAw/KHLxLEq5izNACs5XGvsMU2oLv5Gr3dxqZ1nxMudbWbji
	Evbg4iJHVSJqOnmfYKJf/d0WlTzXpXCTMmSDXvMXUY5oS6KWe1wIGpdUQh1qNRfNEpd0
	6nytb4l/U6Sd79GS+taRccjeY2MfXwQuEg6AIfRnIyGu4KWMqkznjmo+EOmaTRB1bUhd
	fgIA==
X-Gm-Message-State: AKaTC01Wj/Xw2358VAQTNPX+e8Mf+il6t5G6QIhV+H3SEZ342dfNiZfg7JTIGcRI7nIlQQ==
X-Received: by 10.84.194.195 with SMTP id h61mr54220939pld.95.1480371807882;
	Mon, 28 Nov 2016 14:23:27 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	s5sm34454189pgj.19.2016.11.28.14.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 14:23:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 14:23:21 -0800
Message-Id: <1480371801-21467-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: squash whitespace when printing BUILDCFG_VARS
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
X-List-Received-Date: Mon, 28 Nov 2016 22:23:27 -0000

TUNE_FEATURES for ARM targets typically contains a lot of whitespace
due to refactoring in OE 2.1:

  http://git.openembedded.org/openembedded-core/commit/?id=f774b44fa007a2a756ada892ede832b1251d940c

Squash whitespace when displaying BUILDCFG_VARS in buildcfg_vars().

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 024fe43..c36c5ed 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -191,7 +191,7 @@ def buildcfg_vars(d):
     for var in statusvars:
         value = d.getVar(var, True)
         if value is not None:
-            yield '%-17s = "%s"' % (var, value)
+            yield '%-17s = "%s"' % (var, " ".join(value.split()))
 
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
-- 
1.9.1


