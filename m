Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B472078B53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 11:15:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z13-v6so9411072wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O0fR2MBWsWWXETHqRx4Z+QtagGcKfZGW8hvRdBy6PLU=;
	b=pemB0hbskqB6Fw7xqeIvWWU9dJxUu4f60NKUERlO4gv3Zk7KTvTU9pZnboG0HDCtYJ
	zPOFrhxzQQeJQ0BcX0PMF4zNQFYt2vWL0vzaoWQrYelBKcwJ2QybPb9Laj1Y6aEtg/Ao
	FK2lRw7kbkDfDhh+rDQrNy9jUTfWQ0qyUkOWYgbahBGnfxYb2Z1dJM1fd79Wqg31MCo0
	kz9sVtJk19H+6D5keaGb2zeV0LKqGlx+f6IJfJbxWXhR+H+aUnsr5wcXFwNjfiM1Y0PE
	6fs2ujZZsVt6a4ujR0v8JBYKsZYMq5gf0rbMcwbYZocbKMeYb0GTnT8Ma7HBfJvXgoY7
	BvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O0fR2MBWsWWXETHqRx4Z+QtagGcKfZGW8hvRdBy6PLU=;
	b=gaxyPgHGQLKW3wmsxwCbKBHOw1kBTwE40ncXxncEZIIL55DNJFII3wkBNSlNagnYMr
	ya6WTcqSqr1T0Nj5bISVFHTNt8i5BdjoBwX3xUsO/21aG66JXtek+oF/lAdsbqo5LFhI
	0guWzu6TOoq7gJ+IPEdR6ZrJUy4MyJO1IKd+gzS3nyudthG+qzvhPuWxq1GoMuc/TPZA
	kbSKUkM0NiVW2PymcN2pfeiBJT8AXBnLXOHFvEGNHHJ3VylvbabjAFjWbZKIKwbp+f9S
	X/0z+OzL1yVhdrC5nGHfs9hMQuidac5+W9N3YOHC3hMjafGEC0iZpv5YaJLZyhz+jshr
	8gwQ==
X-Gm-Message-State: AOUpUlEkCtsvjip0VQzd1Y0zL73CJ9/v+qyJY9lCJtMiMrBDmwY7rY1Q
	otswthiiljqHdT9CRq3qpn6Y3q8l
X-Google-Smtp-Source: AAOMgpfuZiD/4hRdtKFz+IdL51eIhbOGC2xJQnval+Rfk3JSnDv3Ak+FMKNpX8B67LxUjQdduW+/zA==
X-Received: by 2002:a1c:dc41:: with SMTP id
	t62-v6mr1313307wmg.42.1532085325331; 
	Fri, 20 Jul 2018 04:15:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm1725459wri.53.2018.07.20.04.15.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Jul 2018 04:15:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 11:15:24 +0000
Message-Id: <cover.1532085117.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/3] linux-firmware improvements
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
X-List-Received-Date: Fri, 20 Jul 2018 11:15:24 -0000

I care only about the 1st commit, the rest is just what I've noticed
while reading the WHENCE file.

Separating other packages might be useful for someone, the catch-all
linux-firmware package is still huge:

160M    1_0.0+gitAUTOINC+d114732723-r0.old/packages-split/linux-firmware
147M    1_0.0+gitAUTOINC+d114732723-r0/packages-split/linux-firmware

The following changes since commit ff0b682b807959521c85716296de7a1d26d7d18f:

  systemd-boot: upgrade to 239 (2018-07-18 10:13:30 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/firmware
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/firmware

Martin Jansa (3):
  linux-firmware: add ${PN}-cypress-license handling from
    meta-raspberrypi
  linux-firmware: update LICENSE for bcm43* packages according to WHENCE
    file
  linux-firmware: add separate packages for all brcm files

 .../linux-firmware/linux-firmware_git.bb      | 194 ++++++++++++++----
 1 file changed, 151 insertions(+), 43 deletions(-)

-- 
2.17.1


