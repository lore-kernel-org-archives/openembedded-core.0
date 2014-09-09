Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9D7A617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 01:53:13 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lj1so5109726pab.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 18:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=7hROG59CKa7TKYGAeoqXcXnFDLRW64kPdbK+k6FeJAw=;
	b=yHHu9DqrmmRHQByCRpe57hXt6LTawfGIeKuWVrDcYcE3QPVU85lC1aOHlUMaCk9SWZ
	X+03NhhS4AmBzxCaWITWS4/IvZOCYKN5/D2qhM1TqWapAUpbFTIgM6CM73p3DZH1Fxa4
	A52WndAzzCqps9qX9/UTRX6sLPw2SkX5v6o1KlRZdv4PpjY2MD+i53uCeTbeShvOQkTn
	etTV7WfFCpuGXCkZcG2pvUEE9zolG8QEi7aYYypeGbcdUS9uD5UhFIBMFfgm5iI529xj
	yot5K2e+BUwpK7OqIMe4YZpde7xfcYdHDnu3XxL9hdyMdr6GTLznXKNOgckU2TodFTyL
	u3GQ==
X-Received: by 10.70.134.205 with SMTP id pm13mr52330290pdb.80.1410227594712; 
	Mon, 08 Sep 2014 18:53:14 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id dm7sm3140760pdb.72.2014.09.08.18.53.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Sep 2014 18:53:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 18:53:09 -0700
Message-Id: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Adding new qemuppc64 machine config
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
X-List-Received-Date: Tue, 09 Sep 2014 01:53:16 -0000

apply after "linux-yocto/3.14: configuration updates and feature merges."


Armin Kuster (1):
  qemuppc64: add machine

 meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

-- 
1.9.1


