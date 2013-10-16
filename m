Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C12660EB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 15:44:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9GFj0MN012671
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 08:45:00 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 16 Oct 2013 08:45:00 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2013 11:44:58 -0400
Message-ID: <1381938299-19599-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [Patch 0/1 V2] Update relocate_sdk.py to work with Python 2.4
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
X-List-Received-Date: Wed, 16 Oct 2013 15:44:59 -0000
Content-Type: text/plain

As a bootstrap script, relocate_sdk.py needs to support as many
versions of python as possible. Since python 2.4.3 is default python
on RedHat/CentOS 5.x, the recent updates to support python 3 broke
these platforms. This is the cleanest way I could find to support all
pythons 2.4 to 3. I have tested the patch on 2.4.3, 2.6.5, 2.7.3 and
3.2.3.

V2: Detect the system encoding before converting

---
Konrad Scherer, MTS, Linux Products Group, Wind River

