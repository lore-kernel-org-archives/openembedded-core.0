Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E1E0561470
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:00:55 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id g3so9274253pgs.11
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=7Tl4T1yzP+X/Z879iJRzczjCDfT5/DZ+qMjhfm0Zblg=;
	b=N9TB6I/4tk9sJKVrvlPqvos4I1PEXjSqvdddpti3bmIcGzY+V3ngJ1BeS+hanPgUM/
	61ZeGTStJI2lVN91QIzUmq/ydfJ9OCoHI02Qmeo5OE2R4RaqniFu46ul9yx7tEySMOmj
	lviUo3UhLdUUFlY9mqdxhT9+vT0nkZ1kopK9qyD3zVi46J7b9rt9HR1uaUJ4qAUtnaNz
	0dNOGjCfJrYoj6MYdgKcjPGBwwoS165wHHTp6Tg6lep/3UOo4CEtnkpPGsuA7cAbbIEr
	dvEMOlRkeu0sqocIhxuEVvA2AcqC9pwC+YdxnIP84fXilbMeD3WBLd2hE6tVel1QxaCK
	/YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7Tl4T1yzP+X/Z879iJRzczjCDfT5/DZ+qMjhfm0Zblg=;
	b=LnttyvPl6TJ4RHHk22F7s4vGN8bPhR9aYBN+EpglJ9jv2BzU0JjlOD5IX2mZtE1T5K
	sNHHZEc8hnwlT/Ask0FvQ0SSlAjHUV5nV76Tcf6aiFzN8k6uxocG4eeEFAN3qiHYUT2k
	9Mito+xQXzJ82d/W+2AEzLsk3Ya1CpS5a/byPv4TpVHLN0KUorZgQgAli5PrMScZd5Ot
	Q794hdGTktxULcf5MmX9mbzfv7OsGlHGxD4+hLU5UIDn1Ni5zjd/HTuqD2QFzarAzzCM
	mSc7Gsv8+l/2LDXwR2c+JGZXxuAndWQTBdLIqobZ8KaaRxu9Z/pk9ivWliweh+VMZ164
	44/Q==
X-Gm-Message-State: APjAAAUbrA+MiqHm3WkQlqAw4O/lVUMZT4eBUT9NXMP99AJhJsri5Lvj
	G1aBQHlr9m69KF3+DkW+R3zHzwYJ
X-Google-Smtp-Source: APXvYqyfdGU36IPsT7WRvPZl4PnNre0nRxAccqps5/jPb9RS2mLKVwNWHkzz45iyvIo4vVS/NnOkDg==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
	h95mr20941655pjb.30.1581955256514; 
	Mon, 17 Feb 2020 08:00:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.00.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:00:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:38 -0800
Message-Id: <cover.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior 00/14] Patch review
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
X-List-Received-Date: Mon, 17 Feb 2020 16:00:56 -0000

A few more for the 2.7.3 release.
Please have comments back by Wednesday
Passed A-full

The following changes since commit a63d59f64a2d1f450a7639426cae8e0373a2d764:

  sanity.bbclass: Move sanity_info from conf to cache (2020-01-25 08:37:48 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nut
  http://cgit.openembedded.org//log/?h=stable/warrior-nut

Anuj Mittal (1):
  cpio: fix CVE-2019-14866

Armin Kuster (2):
  python2: add ntpath
  timezone: update to 2019b

Bruce Ashfield (4):
  linux-yocto/4.19: update to v4.19.72
  linux-yocto/4.19: update to v4.19.78
  linux-yocto/4.19: update to v4.19.84
  linux-yocto/4.19: update to v4.19.87

Lee Chee Yang (1):
  rsync: whitelist CVE-2017-16548

Oleksandr Kravchuk (2):
  linux-firmware: bump to 20190618
  linux-firmware: add PE back

Otavio Salvador (1):
  linux-firmware: Upgrade 20190618 -> 20190815

Rahul Chauhan (1):
  libxml2: Fix CVE-2019-19956

Samuli Piippo (1):
  linux-firmware: update packaging for brcm files

Zang Ruochen (1):
  timezone:upgrade 2019b -> 2019c

 .../libxml/libxml2/fix-CVE-2019-19956.patch   |  38 +++
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |   1 +
 .../python/python/python2-manifest.json       |   1 +
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   3 +
 .../cpio/cpio-2.12/CVE-2019-14866.patch       | 316 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |  10 +-
 ...ware_git.bb => linux-firmware_20190815.bb} |  26 +-
 .../linux/linux-yocto-rt_4.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_4.19.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb |  20 +-
 11 files changed, 397 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_git.bb => linux-firmware_20190815.bb} (98%)

-- 
2.17.1


