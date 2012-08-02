Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sx1km-000254-RB
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 22:12:16 +0200
Received: by weyr6 with SMTP id r6so5738519wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 13:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WBEazbgDWxnq7kccwYsHw5L+uxyz0dmDLk7I0c7xilM=;
	b=IjWaouL57xfX/x57k4tKEowb94x7rKFZ0beY47NEK+tWRrM/tSWsifLrCFPkrYDja1
	4BUcrFRXlHZ+r6S9xma1N9TfJc/a53mm6Cqb10Dx7Bj4RnInZ3mw3JurL88cuQStfZSo
	5OIKGAufjPGlQd3xXPYP/z1muvpm0wU4vSnPJIaSrv1AkdhTufYvj88gRViv/zvRLwIc
	sc0hPvvXjjCRCF47jFD3U0n/ifcRTrC3uSBm0mwPcWGjQ+bgHPqPM7cRGWOqnBRDvKIu
	Z0g75xl27Yff9EaWOzIlLedUFPKFravM9o2SrSvuioyGOeutbTcX+46SadXYDfv+hG+N
	EtOA==
Received: by 10.216.203.152 with SMTP id f24mr8727107weo.41.1343937637099;
	Thu, 02 Aug 2012 13:00:37 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id o2sm19713322wiz.11.2012.08.02.13.00.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 13:00:35 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 23:00:24 +0300
Message-Id: <cover.1343937363.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkYwTHTq8RYZXklrClRDoVv1d4swRFqZEbZavPh8wXRm2/ORaezBdT6nYO3sBm9uaHvYIDF
Subject: [PATCH 0/1] Fix Bug 2881
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 20:12:16 -0000

Bug 2881 - Under pseudo rm of files > 2GB fail with errno 75 = Value too large for 
defined data type

The following changes since commit fd6251ef548da7dbca354754cc0b666b2ccd0c45:

  imagetest-qemu.bbclass: Fix whitespace issues (2012-08-01 09:10:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/pseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pseudo

Andrei Gherzan (1):
  pseudo: Use fxstatat64 in unlinkat

 .../pseudo/files/unlinkat-use-fxstatat64.patch     |   30 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.4.bb         |    5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch

-- 
1.7.9.5



