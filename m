Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id A590B731D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:54:29 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so7472411pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=pOLmqk84LU573X6x2OAwk4PZkBJnu2cFOg2wpqlVzuE=;
	b=za1X6Y0gS6J1Pp7iw+UEiTcmADxi7zIlwBTwiimxeSNUv5Y4MeGY1B0jhe0gw4YFxH
	w2CxvUMZa9kfPBcaMs5XvwQ0w6gCUkIAnn9UgAb+5xMrpRHoh1T9OujkIOHINGwbkFKr
	sK5/wxd/XT2Irf73hE8RtnF7zN+pTnVYXWX1u3CmqPncTBA/AWlI8wzhh9oKB6rquazQ
	y5Vax3V3fWSUmHI6yLV5dwZRFJD6Bn5X7ulNsDaOKJTr4zNQYN5OFBYv0YPsU1ReKRUp
	9g/wzUdBqAIybqA6Va0lKgwXjhzXurgtCl2VodKe3iXxsf3pIzh5hhHij4joMLKaCUo/
	sGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pOLmqk84LU573X6x2OAwk4PZkBJnu2cFOg2wpqlVzuE=;
	b=gWhGjqT5YYiTMTGa5w7TpWYMscvN1W7PxyHLv9Qx8kmnLGD1t4wLQZH5wlt6n3mHyx
	6T6QDnrC3CK6fjfJsAlaIx7WPqENejPpRtvREuygQsLW2R2e1soSSqhuJLl4SRH4CvhS
	vAU7BDCENnGQBFdhtcoamX87kjnvQ1Dkl20HmBJ5GKwYZoq0unziWsCVekwVqbyn4eb4
	Qb/Y+sH9B8ABJ36FZm1xRhjMQVlaawRyWb4Wp7AzDloXaFh9ikOgiHDIKit/jK0S1Mcy
	2ekw8ij3XEjNoHXfdktlqyWStj3YDl2ALt0u0RP52piy3w5oF1jt80DlYFjPn6JtMyOh
	xHbw==
X-Gm-Message-State: AG10YOTXIX1A1PhxmHf+M27R8Y/wW6xJ2pEZGRcJFS9a6NNd8RtAwH+a/8cch5f7dqZsAA==
X-Received: by 10.66.194.230 with SMTP id hz6mr40182977pac.70.1454349270168;
	Mon, 01 Feb 2016 09:54:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	85sm30790130pfl.18.2016.02.01.09.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 09:54:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Mon,  1 Feb 2016 09:54:20 -0800
Message-Id: <cover.1454349039.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2][jethro] jethro-next Foomatic-filter security fixes
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
X-List-Received-Date: Mon, 01 Feb 2016 17:54:29 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these for an upcoming release

The following changes since commit fbfe937ab7effcacd1dae558a667eaa0e0500637:

  git: Security fix CVE-2015-7545 (2016-01-31 14:28:42 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (2):
  foomatic-filters: Security fix CVE-2015-8560
  foomatic-filters: Security fixes CVE-2015-8327

 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    | 23 ++++++++++++++++++++++
 .../foomatic-filters-4.0.17/CVE-2015-8560.patch    | 23 ++++++++++++++++++++++
 .../foomatic/foomatic-filters_4.0.17.bb            |  3 +++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch

-- 
2.3.5


