Return-Path: <praveen.lisieux2011@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 608CF61783
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:56:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so6580113wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 04:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UI2BUcnrDNxb1Pgf3J7CyqkL05B3jWSNbinKRWnLLwE=;
	b=l3V2JJiPmkGVwziKu8Yz50ZlUqASizd/anMsB74w2ZFByQNdKxa4I5VTnn+ob9Rzvo
	5S8y5F8HIkUdNOVf2GksvUuUS86iOPxjU4XE1HFQvMsiVh/HV+Pa+C1tMe321kj6PNY6
	ezEfl5dyAaS88+L9JCUAOPDW3xZzZxWyMUROdMZQtybjJC/I3nXf1TLvryUNgmPuPmWy
	PhY8nIMu5heXDh6CssipRKB2nDPNtKJEI8+FiShRYWmdYzTRuhZ7KSDOXaiGLbkE5XSP
	4GIEcuD6zWRrIXKN0tvdNmbAxbGBHbjb+m3yEdGl8GDryryMt0fl0T4g27jtx3tVludg
	b1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UI2BUcnrDNxb1Pgf3J7CyqkL05B3jWSNbinKRWnLLwE=;
	b=EdCPYgBfbJzykhkk18JSgSGb/gJ10n0627nQMKBMNImQK7yHGKw/Qeuw4NPoD3O6Xx
	UT+r3bN324/+Y1Cf9wTa+eYoVRNs2+mnDgabev7WM8tE4nGjdUwzs8w6w5ADT6m99to1
	N6pqYQOsRblu81PfjcjXWAGH/l0HZfFatSUAxZqine5SK/jfCaMFxMu0YKFEc4QZzzuJ
	uBjznNVQcgNMDgpzWgzFLgZaG70RsSlZ1ETzhism8DPjBt/ExLs4nGDcC+jKTA6tf6og
	SaXv52jadHbYk2div4HEMyZdVYfbqrzfcJcxor0gumR5zbdEH3HJOCQaG1gs8GVVseIp
	7+IQ==
X-Gm-Message-State: APjAAAW9jwNADIieqp8AB5auQjETtHvV79P+UOjuq9Niz+DrgHcDAMju
	eBElcLg78D8MaXnwAqlRfTV9Rf4JQDM=
X-Google-Smtp-Source: APXvYqx/cREkFp9Lk0aYCwccWWrTo5JOre3NB5ees9wBNvVcV0pbagYwcmXId/mYRU612ug/O+k0DQ==
X-Received: by 2002:a05:600c:21c4:: with SMTP id
	x4mr16565353wmj.147.1582462590724; 
	Sun, 23 Feb 2020 04:56:30 -0800 (PST)
Received: from localhost.localdomain
	([2a02:810d:a480:2458:acf9:bf3e:9060:854a])
	by smtp.gmail.com with ESMTPSA id
	y139sm14433149wmd.24.2020.02.23.04.56.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 04:56:30 -0800 (PST)
From: Praveen Muthusamy <praveen.lisieux2011@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 23 Feb 2020 18:26:20 +0530
Message-Id: <20200223125620.6117-1-praveen.lisieux2011@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V3] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Sun, 23 Feb 2020 12:56:30 -0000

From: Praveen Muthusamy <praveen@linumiz.com>

Changelog: https://alsa-project.org/wiki/Changes_v1.2.1.2_v1.2.2

Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
---
 ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
 .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
index 9144af628a..8bbc5d3ef3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
-SRC_URI[sha256sum] = "0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
+SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
+SRC_URI[sha256sum] = "44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.17.1


