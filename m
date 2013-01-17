Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvoDc-0006TQ-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 13:05:20 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so1436394pad.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=MOrNDBMMXrvKuxc5g47LacFWIF9zo5z/ADL/8NEGODM=;
	b=D2xjwCERWjsb+o5TPNqrAzEAqgXaaYG/P469H13I2yno5rUGnLBuO3hl25rCf4oYyx
	hjRS1mnm8lb+dTOHKdbvOg/QMMp83Uotdq6PEoHafejoz2NDqyKvRhw7DVxIoc0mOt2m
	jM5GBLkaYfQrMCCdZf4mXZNkFZdfmDPlKcoMIDgxkzZutNFDkQWXwz5KOsststvpMg56
	uNZFyxGPHgPtXfan1es/A03Jjn8yEBAvv/IeFVcYCfKEuQUJ3KjcKx7YOQ5aAyEvzksT
	U7vaRjl7CWLzh5sENEo0i8XTIB0Pw1SIh5AWyZk0p3naTu9znL2QxpBgWRADbq4VcQr+
	JigQ==
X-Received: by 10.66.77.99 with SMTP id r3mr13019468paw.10.1358423393331;
	Thu, 17 Jan 2013 03:49:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qr8sm945474pbc.64.2013.01.17.03.49.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:49:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 12:49:42 +0100
Message-Id: <cover.1358423316.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH 0/2] Packaging license texts in PN
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
X-List-Received-Date: Thu, 17 Jan 2013 12:05:22 -0000

The following changes since commit 0ada16fe509d9a8608c05d16666243c8ebe4d3b3:

  apmd: fix license segment md5sum boundary (2013-01-16 11:54:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/license-pn
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/license-pn

Martin Jansa (2):
  license.bbclass: extract functionality to find license files to
    separate function
  license.bbclass: package license texts to PN-lic when
    LICENSE_CREATE_PACKAGE is enabled

 meta/classes/license.bbclass | 78 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 18 deletions(-)

-- 
1.8.1.1



