Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.7112.1603080240718787797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 21:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=MF+587qC;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DFABA20B4905; Sun, 18 Oct 2020 21:03:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFABA20B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603080239;
	bh=985aa0eo0HsqB0WDvp43FXyb7RexnbBLwvAJMACFv9g=;
	h=From:To:Subject:Date:From;
	b=MF+587qCq8zV3sun95q9LZAmGToO+rjhlPx8fTai0KJEniFuqfkN7DYllY6xRMKE1
	 lVSs435hlzRGEBJBReY8PX+6EZKbXkx2NHkWJ4JNZVbDzWGCdBdZXAhhs6uSyWBF85
	 3b/SP+PKnFVhf4nzBwKnlc8izU8GsTjl64PqSjR0=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/2] buildhistory: record SRC_URI
Date: Sun, 18 Oct 2020 21:03:55 -0700
Message-Id: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Record SRC_URI for all built recipes in buildhistory. Since we also
want this recorded for native recipes, enable writing out the "latest"
file under packages/ for native recipes as well.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 1f26495884b8f567aecadc5936651846dfeed3f5:

  siteinfo: Recognize bigendian sh3be and sh4be (2020-10-17 23:22:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-src-uri
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-src-uri

Paul Eggleton (2):
  classes/buildhistory: record SRC_URI
  classes/buildhistory: also save recipe info for native recipes

 meta/classes/buildhistory.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
1.8.3.1

