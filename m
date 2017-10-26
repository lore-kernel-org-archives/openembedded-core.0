Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C536775DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 10:43:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 03:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; d="scan'208";a="167866809"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2017 03:43:09 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1509010439.25153.128.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ef4646b4-beb7-cdf4-f9fd-54bff2c26d82@linux.intel.com>
Date: Thu, 26 Oct 2017 13:43:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1509010439.25153.128.camel@intel.com>
Subject: Re: [PATCH 1/2] qemu: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 26 Oct 2017 10:43:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/26/2017 12:33 PM, Patrick Ohly wrote:>      The patch is already 
present in the upstream 2.10.0. Patching during a>      build succeeds 
by adding the same hunks again to configure (which>      seems to cause 
no problems during build) and skipping the one which it>      detects as 
already applied, but "devtool modify qemu-native" is more>      picky:
Seems like another instance of patch (the tool) being too permissive 
about the context by default. Git on the other hand is always strict.

When updating versions, I recommend everyone to use devtool 
upgrade/modify for this reason. There is at least one known case where 
applying a patch in an incorrect spot created a security issue:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450

Alex

