Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.5268.1606352514945652405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 17:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bh0AcwZM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 452E720B717A; Wed, 25 Nov 2020 17:01:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 452E720B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1606352514;
	bh=GoxpsfeS1sMpqDXXTUFxuuXiqR34bCjgAlt8TOFviDc=;
	h=From:To:Subject:Date:From;
	b=bh0AcwZMYcZgmei69wS0Keb/ruFTu97rSwa5pR60ApmZOgVYP3H9uBqe3V92HVwpH
	 tFINyUWt/6gPt/bkBUK6gvEnON/t3LNlu4CJhKUG3vMZAOTQnq8cnjfPQOOa477WME
	 ch4pBryGNqKaXn2N6CGeS9xiSCYAj7Nj+T5u9OVk=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] classes/kernel*: allow disabling symlink creation
Date: Wed, 25 Nov 2020 17:01:46 -0800
Message-Id: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

The following changes since commit 6e3785a3f1f3cf68f5fe101cd6bebe91db165973:

  uninative: Don't use single sstate for pseudo-native (2020-11-24 15:53:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/kernel-symlinks
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/kernel-symlinks

Paul Eggleton (1):
  classes/kernel*: allow disabling symlink creation

 meta/classes/kernel-devicetree.bbclass | 18 ++++++++++++------
 meta/classes/kernel-fitimage.bbclass   | 16 ++++++++++++----
 meta/classes/kernel.bbclass            | 14 ++++++++++----
 3 files changed, 34 insertions(+), 14 deletions(-)

-- 
1.8.3.1

