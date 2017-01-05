Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wj0-f169.google.com (mail-wj0-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 157C171A72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:35:54 +0000 (UTC)
Received: by mail-wj0-f169.google.com with SMTP id ew7so17947071wjc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=cx2OZjKca9ST/AsWi+VIaKpkp+LA7evhgN6gyuUVqq0=;
	b=gWMZEdoeMUvbMp2+D2r6RIj8o2JZtomimZmFqfzyPXGjTVDvaKIHM6tEJs1483VzGZ
	UQba0bbtRLeFN3+AdnLKFok6Rlwh/xNQGBtAFlCNdOO5AD7WJbZy7JunDCKWlZ13beyg
	nSRuln4MQOhyPIWT1Y2qlV9L7EawuiuGpiJrqfy+K54+Z808uycvUhfAReiMtOQj+Bo+
	Z7CEQACxVCIZyChsS/lxOlN4DsDqhjpAS/QnvPs7oC2jKRKgwGxoVQ5/Dsi8J2q219/3
	QOYcJG97Ee4Y5PMJ3wV6XgfgI3+kgZVeNmlEJa4riw1zKa/fl/bPsuatH4tpKCcvnrdj
	RuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cx2OZjKca9ST/AsWi+VIaKpkp+LA7evhgN6gyuUVqq0=;
	b=ZEnP/AWv8mjEaSGJcmm9njMQ7lGBKrp5tr1vgO8OzZREBkEiGDDLRk0uoH+5HJlDMy
	0Tob0fQrfRK3LVEAM5rBAM7qSYdkZSdI+OhKBOntGJCyJU/ULxjx7PeqWGSPxYiLirLG
	iyEd2fgYDBpxxXrefh5qK+0bPf6tFD6agqSTZwK/wXMZgns9rlJxq+J8D9+j/LspPAQt
	FUaCBcw69GtiVtXqOv0dPyYR3AEq4OF47hzBjxc/P+nIbwzrinq1+j4xhpJmdQe6u/5K
	5rIQmNM0AmuBG8JD0Bis0PVcWdmKVKv/+MvQeF7HBrIYP07pIjuuYf8CWWKkpYWlCMpe
	EDiQ==
X-Gm-Message-State: AIkVDXIYYfq3776yC5Gu4eTh3CoaSs8HJHtrJrYlGFIHxxbsJs1SOsJpR5hKV5ya9IIaaw==
X-Received: by 10.194.234.65 with SMTP id uc1mr4506784wjc.23.1483612554149;
	Thu, 05 Jan 2017 02:35:54 -0800 (PST)
Received: from piotr-ideapad.elnet (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	cl10sm102590376wjb.4.2017.01.05.02.35.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 02:35:53 -0800 (PST)
From: Piotr Lewicki <piotr.lewicki@elfin.de>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu,  5 Jan 2017 11:35:40 +0100
Message-Id: <1483612541-21017-1-git-send-email-piotr.lewicki@elfin.de>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH 0/1] Fix building apache2 on morty branch
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
X-List-Received-Date: Thu, 05 Jan 2017 10:35:55 -0000

Patch from master that fixes building of apache2 on morty.

Derek Straka (1):
  apache2: always use the archive.apache.org to ensure older releases
    are always available

 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


