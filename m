Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.10778.1592196524929120682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 21:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pA+we4eV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 4B7C0205DDFB; Sun, 14 Jun 2020 21:48:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4B7C0205DDFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592196524;
	bh=MQEjFf8Qn8RmmN7bzrXpvwg7t2nJLegzOCWfV1TDOdM=;
	h=From:To:Subject:Date:From;
	b=pA+we4eVLOwOkGYpf5rXr89pwjHtDa161q4RzMNdeG5Q5N92s3hfAxLKSL7slYx0o
	 MZ+yTSsGGPgpasDduwSz4WlLfmQTY6Ae+7+8bWDr1jQpUNFtD1X9/6TirWG6FTxtma
	 5RZTGovY1QSj2uvOzcYJw9JkzJ0nP1JALiYsGc0o=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Filter feature for graph-tool
Date: Sun, 14 Jun 2020 21:48:41 -0700
Message-Id: <cover.1592196326.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Add a subcommand to scripts/contrib/graph-tool to filter down .dot
task graphs produced by bitbake -g to something manageable when you
know what you're looking for.


The following changes since commit 49d0f822618890b61d2498b07dda6418f885321e:

  Revert "bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable" (2020-06-12 08:25:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/graph-tool
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/graph-tool

Paul Eggleton (2):
  graph-tool: switch to argparse
  graph-tool: add filter subcommand

 scripts/contrib/graph-tool | 100 +++++++++++++++++++++++++++++++--------------
 1 file changed, 69 insertions(+), 31 deletions(-)

-- 
1.8.3.1

