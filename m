Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id C4C5C7ED96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 17:49:50 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id b19so1115005iob.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 10:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4HFJfkfJFj9VaN/pJljbgXEafxKPm4/oXZu2dCRaeys=;
	b=FYNIJekt7J4AYszxbdRxI7MJks25yAvCdl7cVCbZLRKDXktJk2QfW6UGVUdbfjl37F
	YBu0fAD5eMbbU5Vqxh7/Vbpoaei1tdeRWkVzVuMjqhJC270nWu38dRZMTQK3qPGTFyXo
	KFxZ54UftBnf1MVRH89Kkx0DZtPdJZ2lKGnmw5IceMfutxnEVT0yRx49WxNKfiXcC6zO
	WGo75wMvmtiLmDJfooBrBmMpk5/kuzWAITdm1UEebozYQb+NnDRWvdYdneYIXf4X2QM/
	sKZHCN6eSBQ+9jd9OwpEEPDM4dyAwyn5HlXp7C+uZOZhpJdpX3AAcfFUjJPki4VZXlv3
	1qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4HFJfkfJFj9VaN/pJljbgXEafxKPm4/oXZu2dCRaeys=;
	b=Hxg5kzWL3eE3uV6INnwjIvSA8Sy9eWFPstzzhDQmQm4ZJkUmCKFmFyR9PTlVXLFRwL
	8rSUp+O3I/hgvJyz5QP9VT1xwjpi8nA9SQ/1xO2ybz+eNL8wvV6iTAYpARJ7AUTz2E+V
	L9Ff4UlGu1UBNtzNHtEq4BFLO6ilsE3UACy3wmI0Y1Wp4Q0Xrr7Uryy3AQIK0DErGPyj
	6lumNExy5weFqu0O7cRQ5FI9GKEDsm4DcBQkji9NMS8HgQnHsw50mXPuJxK8I6OnfhKo
	cp/O3izf7UYJYxfF6mJuBNsYrFAr014/3zaUGoghbAdYctMFe+Tj4SL1xF7lVg8nLtdH
	Oqcg==
X-Gm-Message-State: APjAAAWYxTX38SM/IPlWqmhDyyJlu8BJecv+w5Ee1ykQBXMd3Z9isOEB
	xaWXvsEl2j8u2Tmiq+UYHEkCq7VG
X-Google-Smtp-Source: APXvYqyXyaGtaIt9gYJKGLp4yn/XxQJNtAYdaJW9l71zRgTyFlqrH0e6E4rLzTCVw+IqFFAulLSrKA==
X-Received: by 2002:a5d:9714:: with SMTP id h20mr1209533iol.294.1568656191549; 
	Mon, 16 Sep 2019 10:49:51 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	e139sm48739471iof.60.2019.09.16.10.49.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 10:49:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:49:43 -0500
Message-Id: <20190916174945.14562-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Update for new hash equivalence server
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
X-List-Received-Date: Mon, 16 Sep 2019 17:49:50 -0000
Content-Transfer-Encoding: 8bit

Updates to deal with the new hash equivalence server in bitbake

Joshua Watt (2):
  sstatesig: Update server URI
  Remove SSTATE_HASHEQUIV_SERVER

 meta/classes/sstate.bbclass | 5 -----
 meta/conf/bitbake.conf      | 2 +-
 meta/lib/oe/sstatesig.py    | 8 ++------
 3 files changed, 3 insertions(+), 12 deletions(-)

-- 
2.21.0


