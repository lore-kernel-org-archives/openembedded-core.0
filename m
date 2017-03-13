Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C16BA776D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:57:29 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 77so68570346pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MD53jaoaSG0KQ3UOFr33ejzUMQi0T2kYCBDKaOos7QY=;
	b=mC6Dztg7mIdLyoU5oMT8H0iF3YpVppsEkyoKlXIL3vD9DYekXtLnn3yUpdbCSICNyv
	HPJlJg+cUrUo6wdBQmu3vdbHvlKYOpCs6Idt+ro97gosX0rLEouA84xd60r/OzZLJle0
	AnGNw7qXXi74D73Cqw/oUYCt+dAla/YiE9VUY0rZJ8ikphKc5DZQ1a2W1gZ7HWDkjl5f
	MMl48SFPS8HwmKFH2Db28v+3nrPa6Vqj+28YEmR1UW4QHV6xilt4M2NUD/1hEN/f7B8c
	P5MPL5xLMmyqnR9DkBH/bb3RJ1iiodvc3KLJ/5W0jY2ix5DxCSuOUZ+PbIRQ68TYme4M
	qmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MD53jaoaSG0KQ3UOFr33ejzUMQi0T2kYCBDKaOos7QY=;
	b=FqcmibFbT9Ux9vKMbzPiHIQS8TrPvT35fhGRnMskSldpm3vGkOfx//kvCRJfHPoEbk
	i19oZJS3neJh/HbSZB47Z3TVMkJ0c3WpCARySnPYihTqWHGsUvyeQ6Ijv+N5Rz9/q0C6
	rZ63AYWcQSAx0MvtTB36CsMwPq4NKQloUJIM0aGtj8U0vrwpxwl9oGBCdbsyVij2/elY
	EZ6TfVqM0rtUCwZJX2jlVBrrwkWS5PsruMnSxkFyV6BwfMarGfTtr83ozQkhBVs01G1y
	YoSITOL2YkN3xlm+4BGuIfkf3ObfEHhuJ7kFXPkKX7lK9N7hByu3lsTix3I0LNkfnKXP
	CKsg==
X-Gm-Message-State: AMke39mzrRq1SEGnQfY0tMubCxBESz3e6bbm9YTNZGWvM2xyMWHzwnJWEtfKhlWg4nem2Q==
X-Received: by 10.98.112.134 with SMTP id l128mr39321352pfc.81.1489435051015; 
	Mon, 13 Mar 2017 12:57:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y187sm34182699pfy.123.2017.03.13.12.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:57:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 12:57:20 -0700
Message-Id: <cover.1489434627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/2] Enable go on musl and add native version for 1.8
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
X-List-Received-Date: Mon, 13 Mar 2017 19:57:29 -0000

The following changes since commit 86b09a7ed67a43a45c805f44778bed0bfdf57361:

  u-boot: add option to specify FDT argument in extlinux.conf (2017-03-13 09:43:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/go
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/go

Khem Raj (2):
  go: Enable on musl
  go: add native recipes for 1.8

 meta/classes/go.bbclass                                  |  2 --
 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb      |  3 +++
 meta/recipes-devtools/go/go-cross.inc                    |  2 --
 meta/recipes-devtools/go/go-native.inc                   | 16 +++++++++-------
 .../go/{go-native_1.4.bb => go-native_1.8.bb}            |  1 +
 meta/recipes-devtools/go/go.inc                          |  6 ++----
 6 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
 rename meta/recipes-devtools/go/{go-native_1.4.bb => go-native_1.8.bb} (54%)

-- 
2.12.0


