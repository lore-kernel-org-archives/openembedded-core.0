Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE2DC7835D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:38:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2017 06:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,306,1498546800"; d="scan'208";a="134524500"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2017 06:38:58 -0700
To: Khem Raj <raj.khem@gmail.com>, rpjday@crashcourse.ca,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
	<20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
	<37a603ae-32a7-3126-680a-cf5f6bf4a575@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <465b6fb5-72bc-2860-d186-cf8f97301195@linux.intel.com>
Date: Tue, 1 Aug 2017 16:35:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <37a603ae-32a7-3126-680a-cf5f6bf4a575@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Tue, 01 Aug 2017 13:38:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/31/2017 09:57 PM, Khem Raj wrote:

> usually, sending it upstream at same time when its proposed here for OE
> is best. Then you can discuss it with upstream on sides, if upstream
> does not want a patch, that creates some maintenance debt for future
> upgrades but such is life.

Also, if the patch is non-trivial, there is a risk it will be dropped 
from Yocto in the future, if rebasing it to a newer upstream release is 
difficult and requires specialist knowledge. It's best if upstream 
maintainers take it.

Alex

