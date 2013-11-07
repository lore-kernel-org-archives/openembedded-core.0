Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEF860EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 18:36:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA7IaRjT016792
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 10:36:27 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.146.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 10:36:26 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 13:36:25 -0500
Message-ID: <1383849386-7680-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [Patch 0/1] perf: Disable warnings as errors for kernels 3.1+
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
X-List-Received-Date: Thu, 07 Nov 2013 18:36:26 -0000
Content-Type: text/plain

The original method to remove -Werror using sed does not work on 
kernels after 3.1 due to trailing space. To avoid build failures due to
warnings as errors add the WERROR env variable.

---
Konrad Scherer, MTS, Linux Products Group, Wind River

