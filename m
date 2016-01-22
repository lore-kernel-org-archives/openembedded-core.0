Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 66C89731EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:13:17 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id yo10so25547840obb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VyQav8CBhES5S5rjtUP5txw4+oMdNE2rjGGiyGXfWe8=;
	b=G4EnnbXrQp9bst9pZjlPLVhSJLZuLfQAYyqel0oTco8/mtGgo+dRrPqx6oEjDmku4r
	zUEhBuOjUxuhhQ5hQxP4J/MJoUhez0F248p6OwDnDHG3hzIm5wv4H8+jKK/KYtBWhYL3
	XWHdD/g8PpFRh4dCmuI791RAbBq8Q/Xxs9QCloceqEyWnoyMsTGRa+ixe8AxYvu7/1R0
	pThDTLgZtA4vspJSUubtjZinzigHqTbXEGqo25VwGfq5qsp7Ej/6q+gkMnL5QS8qWYW+
	mnmJ4VjI8hV8QjN5VJUb8kk+V8bpdZXOZAJJkIy9c2EH0HGiL/MvQOa8TV9ToMdQSgPN
	QIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VyQav8CBhES5S5rjtUP5txw4+oMdNE2rjGGiyGXfWe8=;
	b=l5Kk0TPG0fLCu0hqr3Rn4Wvqlieh1CQB3Icn93jHaSLqrRHZdXTFJeFcSz+1+wAQgl
	cMg2F9w/vz5oBFSiPIT69k+SxWfoBCeFOLIK4elhV55efQxwNezF3KsBVgs3D22PseyO
	Mo4BzaaGtlN5uw8UyLlQ57/leb6XxzFr+knx0R17yAgs34Zk9gjScWqxXkm9kzYZB38N
	MHhfsyYnn4evHc5/HxC02yjGJSIl7N6xM8XxuxoICEB9DUr08beA3RbCzK3LidLScYcq
	7z+AvkgjA8NAy2GCQJNzjxuyHDGItilq4s+L0hxk02Bf05gfNPWJ9rG/spYRzjYNhP9f
	DnLQ==
X-Gm-Message-State: AG10YOSyCqg10Ao4zfdlLka1eyoSDPchLp1SnF7+EApIfoq4gx6SgToGStF5qGUu3LFk8g==
X-Received: by 10.60.79.164 with SMTP id k4mr284940oex.16.1453425198763;
	Thu, 21 Jan 2016 17:13:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm1902548oer.10.2016.01.21.17.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 17:13:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 17:13:12 -0800
Message-Id: <1453425192-25142-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-base.inc: drop obsolete dependency on liboil
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
X-List-Received-Date: Fri, 22 Jan 2016 01:13:18 -0000

liboil was replaced by Orc prior to the gst-plugins-base 0.10.30 release:

  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=8e4314f0fbfa4957f8e84d46824d10178b106fe6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index d543bdd..5d18752 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -2,7 +2,7 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
 
-DEPENDS += "freetype iso-codes liboil util-linux zlib"
+DEPENDS += "freetype iso-codes util-linux zlib"
 
 inherit gettext
 
-- 
1.9.1


