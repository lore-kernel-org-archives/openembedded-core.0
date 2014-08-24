Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6F67107F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:41:25 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so19677178pab.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zr5LIP1UcV5+wtbgg09eT/u28R389Py/701vSIJJQ0U=;
	b=NVen0nBpHzwZIRbuodZOkuzEN+lNYqY25oqDOZn7ajdbug/dp6VUyDtZEMb9OPJ+pC
	u2aeT9Itjxfbrz7zKh3fgP/T+jfPspcnDQGOub5e/Q1NTmWRH7qKD734dV2mr4iWyCjx
	9Jl9WSYqvmp7Yfa9jwwy+kGEa7u6Cp3EaFOt2A0T2I6DEFnfH8Kf/MgQHgWvDvpTIUOJ
	HIsQRlSpH+/RdViu4SehnkFcunkfafRaU4HPvD4KEWu7rrdxtyDE+pljIp7o02f+8clN
	Qzc77XCjAdV9cFDvMVyadi5wir/qmufc465X0fGjt+3L+s2YpYvc7ZJXRVMtt2Hyegog
	Ct6w==
X-Received: by 10.67.30.75 with SMTP id kc11mr391860pad.75.1408916486692;
	Sun, 24 Aug 2014 14:41:26 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	s16sm31659860pdj.21.2014.08.24.14.41.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Aug 2014 14:41:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 14:41:16 -0700
Message-Id: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Add new tune files for IBM POWER5,6,7
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
X-List-Received-Date: Sun, 24 Aug 2014 21:41:27 -0000

I believe these are new tune files. They add support for
IBM's POWER[5,6,7] cpus. Minimally tested on qemuppc64. 
This is the first set of patches to add qemuppc64 support.

Let me know if there are any issues with the format of these tune files.



Armin Kuster (3):
  IBM Power5: Add new tune file for PPC power5 cpu
  IBM power6: Add new tune file for PPC power6
  IBM power7: Add new tune file for PPC power7

 meta/conf/machine/include/tune-ppcpower5.inc | 21 +++++++++++++++++++++
 meta/conf/machine/include/tune-ppcpower6.inc | 21 +++++++++++++++++++++
 meta/conf/machine/include/tune-ppcpower7.inc | 21 +++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppcpower5.inc
 create mode 100644 meta/conf/machine/include/tune-ppcpower6.inc
 create mode 100644 meta/conf/machine/include/tune-ppcpower7.inc

-- 
1.9.1


