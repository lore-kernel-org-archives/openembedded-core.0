Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.634.1594231347413929444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UN4icFDG;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7A32A20B4908; Wed,  8 Jul 2020 11:02:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A32A20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1594231346;
	bh=GW5EbJ1KB+dcuAd/JQqzN+RNSxNyFQImBRQeQzCNqXc=;
	h=From:To:Subject:Date:From;
	b=UN4icFDGF4Z5RTi/LMypWT45LGsk0dmo9fLcbMO1/fUnAa1RIB0uVmDZdGVF7Yn+e
	 IGwVZBlc5jU0AHLTxQXGo5tI1OasaS9gP9Wc+ypQCWcOWp269yPTK6agbF9r71QtP6
	 KRvY650Jmxbi2bUF/zBWCByhjPfMzAgQ2ha5Latw=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] classes: add workdir_save class
Date: Wed,  8 Jul 2020 11:02:19 -0700
Message-Id: <cover.1594231229.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

This is fairly trivial but I've found it useful in my setup - I'd like to
know if others would as well. Improvement suggestions welcome.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit b3c96103a5063eeefb0c537227eab3f77616b9c0:

  libnl: Extend for native/nativesdk (2020-07-08 10:56:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/workdir_save
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/workdir_save

Paul Eggleton (1):
  classes: add workdir_save class

 meta/classes/workdir_save.bbclass | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/classes/workdir_save.bbclass

-- 
1.8.3.1

