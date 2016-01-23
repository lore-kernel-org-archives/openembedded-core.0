Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7385277058
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:13 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pv5so3840980pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CvlMWYB/C5tiiMuKGpXrLdotD5/quDv+pNm4zw8b8oo=;
	b=CrzMIToz3UeboCEEpsX6JldPm9IVIp7VfIONZx9NzZokJnjw5Z0eJca33lnOpgrMq+
	ytF8/qfBbdCuVDGZ32BPcHzuNmWfwGrQKA3Lo3CqHD5U1dWQazwcEk8Mt6CTolRAkuOT
	48RW11HcBOz36lS509M98nVvrNeoU/d2RbQgjiOGxM9OnsJG/jlx6d/7nCbL9NOjubvm
	VX6UiKAQKILq3bFbeBXjPjFlmHOOOCjx71dHJdZq+NnRc6rUp/id10qgpVY9Pq3KjEWg
	Te9sQpsFpFMvgYl9D5q7CJcBPW3sqUdqnOEvurW0K+3JI+9YiCkmHx+fRJ4GtiRFOkPR
	qtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CvlMWYB/C5tiiMuKGpXrLdotD5/quDv+pNm4zw8b8oo=;
	b=XXiwiAS86zCHCxHSnze/ikaaKpKM6ceRTh2sGkt7ofikXLQhqKPEHVCJ7cxEXyyOsa
	0lwEdSzhP3jJ49rWDcElQRJfHkn9aE79KNQ9iIeYWLJm5dmsoA0YO5OYIux1E8C0n6Jn
	N+YgqjStrWgJdjXlFSNuU3s1RYu5Fvwcjr8EwbYtkW9fVHxT+dmfunhKBNf8s4KUFhLI
	p56tz7T7K5iTQyF0mQRvEDGHng4GJ1Ai79/yfoUm4kwB9LYTMJ8PrW9rvhGKH99T1E5B
	LaYOZYPAGKvid8sh+HOugGkw6Tr/Q3mdSJD7UNZaohGokWr7TaVzUtxE5VhAZttKtZfR
	CSyQ==
X-Gm-Message-State: AG10YOQ9iW/gHRusW5UvVR5Iqt/lsaJYGirxfpnXMa6DfK5Mr98kyxYOpQ9C4DlpxJe1lA==
X-Received: by 10.66.100.163 with SMTP id ez3mr8797328pab.5.1453512373873;
	Fri, 22 Jan 2016 17:26:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:25:58 -0800
Message-Id: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] sqlite3: misc fixes, cleanup + update 3.10.0 -> 3.10.2
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:13 -0000

Andre McCurdy (7):
  sqlite3: fix the parallel build fix patch
  sqlite3.inc: fix readline PACKAGECONFIG
  sqlite3.inc: drop obsolete config_BUILD_CC, etc exports
  sqlite: formatting improvements, move more stuff into sqlite3.inc
  sqlite3.inc: dynamically link the sqlite3 command-line utility
  sqlite3.inc: add PACKAGECONFIG to support building against libedit
  sqlite3: update 3.10.0 -> 3.10.2

 meta/recipes-support/sqlite/sqlite3.inc            | 45 ++++++++++++++-------
 meta/recipes-support/sqlite/sqlite3/parallel.patch | 46 +++++++++++++---------
 meta/recipes-support/sqlite/sqlite3_3.10.0.bb      | 27 -------------
 meta/recipes-support/sqlite/sqlite3_3.10.2.bb      | 11 ++++++
 4 files changed, 69 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.10.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.10.2.bb

-- 
1.9.1


