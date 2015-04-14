Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9AF6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 17:25:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 14 Apr 2015 10:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,576,1422950400"; d="scan'208";a="713570597"
Received: from tkkaskin-mobl3.ger.corp.intel.com ([10.252.22.135])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2015 10:25:26 -0700
Message-ID: <552D4D85.9010104@linux.intel.com>
Date: Tue, 14 Apr 2015 20:25:25 +0300
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Should disabling features in glibc also disable the corresponding headers?
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
X-List-Received-Date: Tue, 14 Apr 2015 17:25:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

oe-core's version of glibc allows configuring out some libc features. 
Currently, if a feature is disabled in glibc, glibc still installs the 
header for that feature. This means that applications using glibc can't 
rely on checking just the header presence in their configure scripts, 
they also need to check whether the function implementation is present. 
Is there some good reason why glibc works that way, or should glibc be 
fixed so that disabling a feature disables the header too?

At least alsa-lib requires patching[1] for this reason, and I wouldn't 
be surprised if there were many other similar cases in other packages.

[1] 
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch

-- 
Tanu

