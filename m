Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8971F6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 12:21:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 25 Apr 2016 05:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,532,1455004800"; d="scan'208";a="962192119"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2016 05:21:44 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <571E0BF3.8080408@linux.intel.com>
Date: Mon, 25 Apr 2016 15:22:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
Subject: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Mon, 25 Apr 2016 12:21:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

we want to deprecate Python 2 in oe-core and set Python 3 as the 
default, preferred choice. What does this mean?

1) Introducing new Python 2 dependencies via new recipes or additional 
DEPENDS etc. in existing recipes will be discouraged: you'll have to 
provide a reason.

2) Bitbake itself is at the moment Python 2 only - which will be addressed.

3) OE-core recipes that are currently dependent on Python 2 will be 
moved to Python 3 whenever possible (e.g. when nothing in oe-core 
requires them to be built against python 2). This may break some of your 
code, so please do try any patchsets before they land in master (or 
stable release), and suggest alternatives.

4) Of course, there is a large mass of Python 2 code out there, which 
may never be ported to Python 3, so Python 2 will continue to be 
provided at least until it's no longer supported upstream (the current 
date is 2020).

I'll prepare an initial patchset for review, so please keep an eye on it.


Thanks,
Alex

