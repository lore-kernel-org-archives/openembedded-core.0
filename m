Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7039B7297B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:07 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so5107383pdb.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=W9pN+s0ea87hhW/3M4eGQyv21wvdBh3010kO/9ZBBTg=;
	b=e/CHCGKor1uVlGjs1KprNlHc1E24/wcm2/7sZdAZc98Jb5gx6TH8WTzJ+PNiIUJLf5
	MJ2cjmn0ST5Ubz2tFR59Ym3VE3Xn6uCLHie/z63DAtZacCvOoRPYLys0yXA7EzKJxQF9
	URsyfF6JBedjcUjHmDPu+BMbXQUuS9GhxJuf1+ZE8Tg3Ex4KP47Ky8KGa6Qnuo35iT7D
	/2bJMxfO339UvgUjeS6ZbLUaKwtuSHwflrEwZnF8YmvfTwPrDGoZ4VAvXdwml1PW/1Sy
	d0wqPJjFONi56aD3zXWk/2QD4dzaYiviKEyNSSQlLMF1t9m5GfHYiWrXwdL75AuuMPn+
	zYqw==
X-Received: by 10.68.138.194 with SMTP id qs2mr14526308pbb.8.1419224108213;
	Sun, 21 Dec 2014 20:55:08 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:54:56 -0800
Message-Id: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] [RFC] Move packages from meta-oe to core for X11
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:14 -0000

Please consider moving xterm, xclock, twm and libxaw from 
meta-openembedded/recipes-graphics to OE-core.

This fixes 'core-image-x11' image dependancy on meta-oe packages
since xinit requires xterm, xclock and twm to 'startx'.

if approved and commited, I will post patches to remove those packages
from meta-oe.


Armin Kuster (5):
  xclock: move from meta-oe to core.
  twm: move from meta-oe to core.
  libxaw: move from meta-oe to core.
  xterm: move from meta-oe to core.
  xinit: fix depends issue

 meta/recipes-graphics/xorg-app/twm_1.0.8.bb     | 20 +++++++++++++++
 meta/recipes-graphics/xorg-app/xclock_1.0.5.bb  | 15 +++++++++++
 meta/recipes-graphics/xorg-app/xinit_1.3.3.bb   |  8 +++++-
 meta/recipes-graphics/xorg-app/xterm_313.bb     |  1 +
 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb | 33 +++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-app/twm_1.0.8.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xclock_1.0.5.bb
 create mode 120000 meta/recipes-graphics/xorg-app/xterm_313.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb

-- 
1.9.1


