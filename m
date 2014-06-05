Return-Path: <Shan.Hai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC8465F09
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 02:12:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s552CH3a004459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jun 2014 19:12:17 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 4 Jun 2014 19:12:16 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jun 2014 10:12:11 +0800
Message-ID: <1401934332-1714-1-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH 0/1] overwrite /etc/mtab conditionally
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
X-List-Received-Date: Thu, 05 Jun 2014 02:12:18 -0000
Content-Type: text/plain


The installation fails with message "cat: /proc/mounts input file is
output file", the root cause is a failure of overwriting existing
symbol link in installer script.

Fix it by conditionally overwrit of the link.
 

