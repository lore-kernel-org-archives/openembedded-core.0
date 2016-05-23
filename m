Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 285D465CBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:34:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f75so12326098wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BEM2vfCdI7Kk1/dKus2M0b3oSigGwkH9A7mIjk4FZwk=;
	b=tmaW55MJ0ynBLp8IyngvkvrKGDnxnBDTo56oaYHItLjulgdZsWhJ5cT1d5PWw0llQC
	iT+QTqZMe+TAKYd/MTxq1hkuR2Hu/oZNlXQO1bB3Cl9YHPX6MvMZJm/ZJtS/LCrqVnZv
	SXUM/WSKDU2/h8cpVzAWXDn9J8HpnXlJRyEFmVx7Yj3OOPql3vlnQPl/Ilu6m6q22Gk5
	UDqUUYZ6U1bDHW3K8bDBIu6NC7N1YVFRH0oEBnaoASor/fLCK2yDwA+V9zJB2Ph5HYlP
	mZPsRpFGL1Dxcz2PqkfyirKmqbxH1F1qLXHZto1oLJOQH0P5R5+ZQTbDrbEGeoqBK06q
	0+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BEM2vfCdI7Kk1/dKus2M0b3oSigGwkH9A7mIjk4FZwk=;
	b=YAHd87C0ChFiYR9xM+WWMUBk6H6ea86iYrbzuiScSnSBVWIzivh+sbSp8v/yRHQwhk
	mvKG7Il0VTiyKJQGFCHiBWbpxQhduH+7m3Q+hBqZlLirOWVnh0iQqo8sfPHBu2p2hdQ8
	HsvE2IP994jCXjygb/MN9Cpba03ejlIusBqjdllPNpdfRT9Dx0Xnabdu/7lXUWcUw/i1
	V0tv5cQEJrkRYUnF7/axoUIr+6ryjYUomqfF+1uUe3GL8p7vRP33V3dZlB2rGShZ3EK7
	3C2ltbej7sCNYWOe4vkQjf7GVmbR4Gt/nFo7B35RwLcjwApwJWsgQHtsI2LhRtRKPBkA
	dvpA==
X-Gm-Message-State: ALyK8tIyW01dJmac+weQjRKRdP9sJPXChYUErGI74I7vZadOYYcK+cK214toya6ZmLtJvg==
X-Received: by 10.194.157.36 with SMTP id wj4mr603938wjb.139.1464035675345;
	Mon, 23 May 2016 13:34:35 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	r123sm15532548wmg.20.2016.05.23.13.34.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 13:34:33 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 13:34:24 -0700
Message-Id: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463769811.git.chris_larson@mentor.com>
References: <cover.1463769811.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] image.bbclass: append to prefuncs/postfuncs for do_image_*
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
X-List-Received-Date: Mon, 23 May 2016 20:34:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

These are list style variables, so append to them rather than blowing away any
existing value.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6b9f979..95dbb82 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -436,9 +436,9 @@ python () {
         d.setVar('do_image_%s' % t, '\n'.join(cmds))
         d.setVarFlag('do_image_%s' % t, 'func', '1')
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
-        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
         d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
+        d.appendVarFlag('do_image_%s' % t, 'prefuncs', ' ' + debug + 'set_image_size')
+        d.appendVarFlag('do_image_%s' % t, 'postfuncs', ' create_symlinks')
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
 
-- 
2.8.0


