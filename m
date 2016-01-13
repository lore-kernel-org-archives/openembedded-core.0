Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFD5C6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 21:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0DLiHCm025103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 13:44:17 -0800 (PST)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 13:44:16 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5696C52F.3070807@windriver.com>
Date: Wed, 13 Jan 2016 16:44:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.56.84]
Subject: Add python-systemd in oe-core or meta-oe?
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
X-List-Received-Date: Wed, 13 Jan 2016 21:44:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

https://github.com/systemd/python-systemd

This is a python module that was present in the systemd
v215 source but removed by v223.

So does anyone think it's useful say for testing?
If so, should it be added to oe-core or meta-oe?


 From the github page:

python-systemd

Python module for native access to the systemd facilities. Functionality 
is seperated into a number of modules:

systemd.journal:
supports sending of structured messages to the journal and reading 
journal files,

systemd.daemon:
wraps parts of libsystemd useful for writing daemons and socket activation,

systemd.id128:
provides functions for querying machine and boot identifiers and a lists 
of message identifiers provided by systemd,

systemd.login:
wraps parts of libsystemd used to query logged in users and available 
seats and machines.



It's present in several distros (F23, ubu-14.04):
   http://pkgs.org/search/python-systemd


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

