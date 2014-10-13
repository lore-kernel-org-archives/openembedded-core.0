Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BB91760167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 21:17:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Oct 2014 14:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,713,1406617200"; d="scan'208";a="613862958"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.58])
	([10.219.4.58])
	by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2014 14:17:47 -0700
Message-ID: <543C4180.1050902@linux.intel.com>
Date: Mon, 13 Oct 2014 16:17:52 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: License manifest OR handling
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
X-List-Received-Date: Mon, 13 Oct 2014 21:17:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

I'm working in one bug [1] related to License manifest creation and i 
have some concerns about what is
expected in License creation more specifically in the OR's handling.

I re-implemented license creation function from shell to python for use 
oe.license module and added support
for take into account INCOMPATIBLE_LICENSES.

For example: Currently if you have LICENSE set to (MPLv2 | GPLv2.1) & 
LGPLv3,
     - With INCOMPATIBLE_LICENSES not set the result is: MPLv2 LGPLv3.
     - With INCOMPATIBLE_LICENSES set to MPLv2 the result is: GPLv2.1 
LGPLv3.

This is that oe.license model eval's the OR expression and if you have 
several OR only one is chosen, this is
the expected behavior?, if yes i think is needed to add priorities for 
license choose, example [2].

Comments?

Best regards.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6765
[2] https://gist.github.com/kergoth/1590028

