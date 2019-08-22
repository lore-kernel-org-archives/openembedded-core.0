Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A31387F27C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 19:20:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7MJJ4J0027368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2019 12:19:40 -0700
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 22 Aug 2019 12:19:19 -0700
To: <alex.kanavin@gmail.com>, Trevor Gamblin <trevor.gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
Date: Thu, 22 Aug 2019 15:19:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
X-Originating-IP: [172.25.44.5]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: boost 1.69 -> 1.71 upgrade for 3.0?
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
X-List-Received-Date: Thu, 22 Aug 2019 19:20:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hey Alex, or anyone,

I'm checking if you have done any work on upgrading the
boost recipe? Trevor will work on it if you haven't started.
He's relatively new to YP so depending on how easy the
update is he might bail or need help or take a while.

The recipes that have a fixed dependency on boost
are in meta-oe (and likely elsewhere), any tips
on testing other than building all of those packages
and some some basic run-time testing? Eventually

Oh and there's an oeqa test:
meta/lib/oeqa/selftest/cases/recipetool.py
     def test_recipetool_create_cmake(self):


Thanks,
-- 
# Randy MacLeod
# Wind River Linux

