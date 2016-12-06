Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 713B871A6F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:08:30 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id r94so8120274ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=meGDBQOh6FHKSs/qla1Xig1RX4pThQk5/PFvQ6FqY60=;
	b=rKMc7pgIytE4jNsV47f72/tfLF8e3KvsSqjwy5CTH3pQnUs4EMQobC9OkLWDwQWeP+
	5g7fFN/FxB+eObfZjZv68gViloGrKVHWSTKLBeqc153oEGBda/4ao7CEv0oZg3SyrNCr
	5h8F7Ai/K4QcPutg2QJiXRVvYFZ7mTD4Lm9szklecIVELxkjW1V7ckvOY8frxmHgCFaG
	220S3GE6VE4GqXaCAm8HKuDNkJo1SMm8dZ2PibBa7zPlfHQ/l9p14UWCywMypM0vWnFT
	lhdvENpiwg/XleN7vFmfDeYH8c1CyzbZXVHKhqYL4rZhgF1aj+7l1lzVx52871kWgG/w
	sUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=meGDBQOh6FHKSs/qla1Xig1RX4pThQk5/PFvQ6FqY60=;
	b=fqZx7NKLa6H3hhjXXDtoWGp8ZMYBb3FBHNtl+swayG6QCEzsld9LtHovg6RWTcGLbW
	EYB8C1nNe+LZ/zkS1U3nB4a+FkCbXVxx3iEr8HAo2dX6iLu0Nkup1tw7lOGPwor0Ma8h
	hg/hzLPgraq8RIvsB3yZBgjljgh6+lggLIWNaeHTuvX6c/KrZsahgHvWP0u+u1xpGM5r
	3lZZFAuqPYSnyRckNGiIRrAOBExKYk9GKlpas+1s3iH8xKECEnHJg/XbgZ9XsUxXXpgB
	zDiNZ6WpGAPjq+Zncj5bKBzWKE07Er52gUG6dhxdW38Smkpf3UdZi+JthjtXAITrYb3V
	3lmQ==
X-Gm-Message-State: AKaTC00UeOcOltLnrmmGRrAoMzGdqrgZXUg/nvr1TZhGVZWxwQtl9mJG91evzRkEut+BVg==
X-Received: by 10.36.36.146 with SMTP id f140mr3538900ita.75.1481047711599;
	Tue, 06 Dec 2016 10:08:31 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	h76sm9424564ioi.43.2016.12.06.10.08.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:08:31 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:08:16 -0600
Message-Id: <cover.1481047167.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [master][PATCH 0/2] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Tue, 06 Dec 2016 18:08:30 -0000

Add imp to python3-importlib. Make gdb-cross-canadian depend on
nativesdk-python3-importlib when python is enabled.

The following changes since commit 11063a01d4511b2688ea7ba2d7359e4e07328c66:

  ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core master-gdb-cross-canadian
  https://github.com/gmccollister/openembedded-core/tree/master-gdb-cross-canadian

George McCollister (2):
  python-3.5-manifest: Add imp to importlib
  gdb-cross-canadian: Depend on nativesdk-python3-importlib

 meta/recipes-devtools/gdb/gdb-cross-canadian.inc     | 3 ++-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.9.3


