Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 892C66FD45
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 May 2014 04:03:17 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so2376631pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 21:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nKR5omWU0re/d2WOsjgmfDTqQzDfKUGXi4d9s91SFMU=;
	b=NGFBkKfmCZFwMVJ9Kk6uFKSP2uz/LY8xZO0C9pWgKvZF0HuvrR2dG5PNEWiX74LBSp
	GuwDijYWZhMLu0o1XDog0UxsZzvNyR4vyzTRXslHqKsbHE20lNrBFMDJ2rGLwL0jyNNf
	Aiv854szhxfe3j4wMGmhQGjOLPw/p+WVSrre+S4gEuNtJpEInP/fgRRTZcsR9gnAfyp4
	8iNEFl6nfaIB4sB8VSrZ4gdIzT585nnReDRKobXBSI7aTXO8vVSA2MU57kYl0LMW5lZa
	oO/zQSvR9bbhXQvde7R1jVhmWGqLTEkx86HD9y+Aollge2FgADT0x3NmLMmwIl7yxD/5
	yUDA==
X-Gm-Message-State: ALoCoQnWYnzkIkg68+hO7M606+MiNgGOvv9zlgEfFGaK1cQ8DeKhyY1Jk8LDsG+UflmjAkDQq/9H
X-Received: by 10.69.25.69 with SMTP id io5mr24503683pbd.22.1401508998696;
	Fri, 30 May 2014 21:03:18 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id og3sm8905425pbc.48.2014.05.30.21.03.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 May 2014 21:03:18 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 21:03:14 -0700
Message-Id: <1401508996-21323-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Timezone code and date update to 2014d
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
X-List-Received-Date: Sat, 31 May 2014 04:03:27 -0000

It is not uncommon to have the tzcode and data update several times
a year. This update fixes a bug the 2014c update introduced to
zic.

I moved the build information out of the bb files into inc files to keep 
future update patches smaller.


Armin Kuster (2):
  Update tzcode to 2014d for zic fix
  Update tzdata to 2014d

 meta/recipes-extended/tzcode/tzcode-native.inc     | 15 +++++++++++++
 .../recipes-extended/tzcode/tzcode-native_2014c.bb | 25 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2014d.bb | 11 ++++++++++
 .../tzdata/{tzdata_2014c.bb => tzdata.inc}         |  5 -----
 meta/recipes-extended/tzdata/tzdata_2014d.bb       |  6 ++++++
 5 files changed, 32 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native.inc
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014d.bb
 rename meta/recipes-extended/tzdata/{tzdata_2014c.bb => tzdata.inc} (97%)
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014d.bb

-- 
1.9.1


