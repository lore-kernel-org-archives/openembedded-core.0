Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 456376FF4E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 17:41:19 +0000 (UTC)
Received: by wmec201 with SMTP id c201so32630669wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xZmugFGWKntj5rsicUoToTGU44YkukVGSVBI7q2TJdQ=;
	b=1UOjqiYKlBn9DL840Pjmoywhy1bRpoQmYWRnRU/0CXRi/DvWsjw1ahAnk9QnhrwrBb
	SwN0x3ypmcAO56dpBWs2X3ZbPxsJpyzrGB8b47zpWOlVEW0BIS/hoDjOAZG9McHMtrjA
	XNUu79tEMZgC6vlnO0sFXTVMqDg4Qsr0mVNZACECvQirHAx8c8iMMbXJ/H90SVrxRTsj
	ShmSyUNG+jTfqD6xbZ2/VTHYsVVmhP0ZmCzzRAuVEJtqh80RNr8PZ9Ye3m86sXeFvOLK
	cGWAk5bdSVvXNAJdVokj2Gzwc8pHPd/UTgEf8dIRwgV/xx0kGFVbham2BUR3AM//Hgl4
	R5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xZmugFGWKntj5rsicUoToTGU44YkukVGSVBI7q2TJdQ=;
	b=bu9pKVycOcU7YpeLayB7P3/oghE5/0BB5IOry2XxoInM2UK3ypOQ2tr1HnbqzYpbGg
	zSTfuigbR+DHV/7X4ytNnKCUdvi2q6hHBQyBxD49BHIDWwX36zOXKbcNUQyZWczFTynQ
	BN81tG1UKP4eJv1ZKVT4pNXvcCep69cvDQxLUG3sxJIYjvTOBjjHEpIqwKLUnkVsefcN
	QD26D9T6IXSCsITVWb1YvFY1SIuip9lYE4J/wDc8mOehMZrc5qPMroW2PNWBeT2QLTQR
	JJ0VvUaCJg8vZ7YDscRX7NwTlud6npo6Nsz20SR1aDwdrgbVfmDSIu3miEGoz20hp4D+
	M8Uw==
X-Gm-Message-State: ALoCoQmw1uPhPOAFBwgUdoXe0DdKNYpvINw44zMRW0dmP9Jd5iTvkJfZra23aBth8rjP/zjmjo74
X-Received: by 10.28.96.193 with SMTP id u184mr50006196wmb.64.1449164480148;
	Thu, 03 Dec 2015 09:41:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l128sm36374689wmf.10.2015.12.03.09.41.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 09:41:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 17:41:14 +0000
Message-Id: <1449164474-31892-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] scripts/oe-pkgdata-util: sort the packages in list-pkg-files
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
X-List-Received-Date: Thu, 03 Dec 2015 17:41:20 -0000

Sort the list of packages in list-pkg-files to make the output easier to read.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index cb19cc4..afdceaa 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -365,7 +365,7 @@ def list_pkg_files(args):
             sys.exit(1)
         pkglist = args.pkg
 
-    for pkg in pkglist:
+    for pkg in sorted(pkglist):
         print("%s:" % pkg)
         if args.runtime:
             pkgdatafile = os.path.join(args.pkgdata_dir, "runtime-reverse", pkg)
-- 
2.1.4


