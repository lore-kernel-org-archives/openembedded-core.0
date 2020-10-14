Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2354.1602642425320887370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 19:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=kz5hW2wn;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7FA5720B4905; Tue, 13 Oct 2020 19:27:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7FA5720B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1602642424;
	bh=OCgWNq108SUv0BQWLUedU0t40RPHLrzg6/1JJ034HWI=;
	h=From:To:Subject:Date:From;
	b=kz5hW2wnrLYEeoOdogwhQ4kztHggT9EymbNUjLNqIEUalVre/giFwjHrLr+4dN0Bs
	 7oHRfzO4K/hfCriKFYQyaD8xYaqTkvrf161f4gE03B8PyrvF8mcwlMiYwXqcIPEhP1
	 elWNSecOBsKwsJ2H0mlsQ548PwNc2DD9nf2BDh74=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] classes: add class for retaining build results
Date: Tue, 13 Oct 2020 19:26:41 -0700
Message-Id: <cover.1602642330.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

This is a renamed, reworked and polished version of the workdir_save class
that I sent previously. I'll send documentation patches separately if folks
think this looks good.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 8d78b819c2ec33fce3a34254fa90864ee5fa7617:

  IMAGE_LOCALES_ARCHIVE: add option to prevent locale archive creation (2020-10-13 09:41:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/retain
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/retain

Paul Eggleton (1):
  classes: add class for retaining build results

 meta/classes/retain.bbclass | 103 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 meta/classes/retain.bbclass

-- 
1.8.3.1

