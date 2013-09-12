Return-Path: <stefan.seefeld@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACA360071
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 01:10:00 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id n9so3417827qcw.5
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=w8CFXEjKpHHm6Ze/GUdayf+ORtp7XJ6TNdl5WkpfBdM=;
	b=09VuZV0SYLKOMdm+OEz0aLIoUanMJwJ4Sjyvj8DgoscCKHUUPeYr8nL48EzxDdhOpG
	evf69jqa6yRtBzwBsotM79jnyQM4R7FOhY1tI6cW4cVDfP4NvGvodavMHheN239645Re
	0OuHvCyVjh1rkYFPi3FDMoWfoJH7b2GCFSaTEeURucJmpzQTaQCfYK56d6P34/hVpeBI
	i4HjdiLdSSlPtOnBMcMAcxwGy2uL6MXQbbQWMtR5x+//QZ54nQevLbdBF9C4k+ZYthSc
	3DH+sBqm7f1xUeh5/WruTuQ5g2lyXgE1RaST+oH18ak/a/otMLq3oF0krwUb1eKrw4rs
	fFLg==
X-Received: by 10.229.250.5 with SMTP id mm5mr8645787qcb.19.1378948201524;
	Wed, 11 Sep 2013 18:10:01 -0700 (PDT)
Received: from quasimodo.mgc.mentorg.com
	(bas2-montreal29-1177924826.dsl.bell.ca. [70.53.180.218])
	by mx.google.com with ESMTPSA id fy7sm2038291qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 18:10:00 -0700 (PDT)
Sender: Stefan Seefeld <stefan.seefeld@gmail.com>
From: Stefan Seefeld <stefan@seefeld.name>
To: Openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:09:49 -0400
Message-Id: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 01:10:00 -0000

This patch adds the necessary glue to bind the LTTng test suite to the OE ptest logic.

The patch consists of three parts:

1) The ptest enabling bits, including a new install-ptest target and a run-ptest script.
2) A patch (also filed upstream) to execute the tests also in the 'installcheck' target,
   instead of only the 'check' target.
3) Some test output post-processing to obey the ptest format rules.

Stefan Seefeld (1):
  Enable ptest support for lttng.

 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |  4 ++
 .../recipes-kernel/lttng/lttng-tools/runtest.patch | 52 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb     |  8 +++-
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-kernel/lttng/lttng-tools/run-ptest
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch

-- 
1.8.3.1


