Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9D73F6A886
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:11 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so4233432pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PbL6yw2HEHXoT3rt1pUaIvn/pXw+4M2Q+xTk5nEq+No=;
	b=r+hEG1sXY2PWCJi/SudW5e+gNzyAQg9rE9KMc6UfpcOJny3wUziMASQZj/S9gKs24t
	RSO9S7A4ec3ivILUrXFsOM/E9Mir21A8tcYgwc540I++jwwIG5ykve9j3aCZQ2uOMPld
	MldJOUClFoAYMjugVAT8AKtOYxEJ9YUga/5UB0eRlLbFr3RJtgO/VwgMKnVMyg+yHy9q
	HqNp6Ae9HPzmoAvPwLy8xfu5UveQWsy7ZlpJLAVzkV0pEKbQ+T8LZoX42lQMI4IRrdf4
	qpCn9xKasw4Ko4UefQkELiYEduuFlq2wxLe5F/wBp97Amh7t7AIXnDywK0+tatgjegfN
	GTvw==
X-Received: by 10.68.129.197 with SMTP id ny5mr40930379pbb.180.1370583193057; 
	Thu, 06 Jun 2013 22:33:13 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	tq8sm75960250pbc.30.2013.06.06.22.33.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:47 +1000
Message-Id: <1370584012-28002-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/5] qt4: update HOMEPAGE for recipes
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
X-List-Received-Date: Fri, 07 Jun 2013 05:33:11 -0000

This patchset updates the HOMEPAGE of the qt4 recipes as it is no
longer hosted at http://qt.nokia.com/.

Jonathan Liu (5):
  nativesdk-qt4-tools.inc: update HOMEPAGE
  qt-mobility: update HOMEPAGE
  qt4-embedded: update HOMEPAGE
  qt4-native: update HOMEPAGE
  qt4-x11-free: update HOMEPAGE

 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc   | 2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc        | 2 +-
 meta/recipes-qt/qt4/qt4-native.inc          | 2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.8.2.3


