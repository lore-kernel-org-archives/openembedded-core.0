Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 60484605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 18:48:48 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c10so16475298pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=VnRKqeSl5+W6kSGHmPiAio+CUALqWCtqnCFiQTf8Tb8=;
	b=yUzjUQIskqkDPLy7FD/3y3HQxgLzGq3oerqRoq3p+EEWHUIHV8v9YGHMieXjK8uRm1
	FTqs0ixc246XUqPz1XjObJ+KzxCh9oY6V1JcvyAQ3DlkmAZP7V4HNB84AsWBw80TSdW9
	XwIBCSfcYiAPhTA5F3hTqy2EgB1X6c/o4AVLBHMwWowqch4ko/ynJs+vkWjypiaAYuTN
	CnR4srPqkuQM6AvjxEpMQyRag7+jwgXpZfF3Rc/f7vGctNtFb5mcjqjhjq9Qqwu5Bvjc
	QCBHzS8NF0GeKavVpQVThSqU5S95jBP3G0y9f45a12jptLLVTbmZWf/OS3/FNtaoYbra
	DkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VnRKqeSl5+W6kSGHmPiAio+CUALqWCtqnCFiQTf8Tb8=;
	b=YCjIdukiwGvVOW8EHctBVZ1MyU//MzpBIy+jRm9HohjxpGIuOunCbY74Y5yPfjFWat
	J+Zo+frX/5KzKSeSChFO4YxPCCRmDJvuwLSLcZMqKh9a7zu/XbiD82yImUOUSzJcegmZ
	tYZhwMUrpd5LxUamo7Q5HmgvKe5vkw5rEKnsW2PHVdv7J+RnytGrmJgaQE12lkDmOW5L
	oRFjrByx/TAT3aCw9iITEFA+9Mtw15bK6IapjK/NxlrPkc7Y4v1naFa1XZnDlyFt6Z7G
	6JCiHFQh2wYS/KFjcF4tsW/M8Phc5xyJgdfK7Ao1te4J+iFJjoLkAokW2CJBGBCz8Gax
	fjlg==
X-Gm-Message-State: AG10YOQxYYXcK2Q5H1hiwAO5pzjXMQptets2tmYHR4Ejsq/hw5T0wuuj7pxKNvJpkjRBfg==
X-Received: by 10.98.76.19 with SMTP id z19mr4286751pfa.78.1455734929673;
	Wed, 17 Feb 2016 10:48:49 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ss5sm4366282pab.15.2016.02.17.10.48.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 10:48:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 10:48:43 -0800
Message-Id: <1455734924-8832-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro][PATCH] glibc CVE-2015-7547
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
X-List-Received-Date: Wed, 17 Feb 2016 18:48:49 -0000

This is being submitted to comply to Yocto compatability.

Master is affected but waiting for 2.23 to be merged before sending patches.

Armin Kuster (1):
  glibc: Security fix CVE-2015-7547

 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch | 643 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb             |   1 +
 2 files changed, 644 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch

-- 
2.3.5


