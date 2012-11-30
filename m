Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXY-000664-4e
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:14 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so413161lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=W8UoJkG5HE6p0SBaC9X0pq1uqQimnLVDLlUKiKl9mUg=;
	b=sP+PIZLQ+yg8YPFFiyOeft7D9qr5t1V35INGpOwUyfHy+98HMhZS2Iwbowvg7rC8PV
	/GWXDFB2DYDlzOg4Kzkg+QFt3XxEqhWa6MKog3kY0LKoZH79KAwz7XlUtLqasgk1Gdmp
	baVZwemtC7rAq7oiWeghR3rN//ZxmZUyEdJwuIM/+kcAyg8w39+mx0JRL25yGjtqTRhw
	fyHVAF4J1j/sRmzgT6TadqDYC4Rur40G4eVGSa4LXYIbWQeCguPxI4qR97tc0qp/BXah
	JQ8aJUaTVIA+O/+s5hi5eQulqsLJ0JWJO1gY6K8gq6nfYMJoFWX0jGKCcGaBO8aqqdIP
	ZL7g==
Received: by 10.152.144.10 with SMTP id si10mr1514638lab.55.1354288550738;
	Fri, 30 Nov 2012 07:15:50 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id bf3sm2206640lbb.16.2012.11.30.07.15.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:15:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TeSJd-0002oZ-Uk
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 17:15:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:34 +0200
Message-Id: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:14 -0000


Fix most cases where "startline" is used instead of correct "beginline"
to tell where license segment begins in file.
Two cases are not handle here, to avoid conflict with other patches
in progress:
- coreutils-8.14 is fixed in update to -> 8.20 patch
- libpng


