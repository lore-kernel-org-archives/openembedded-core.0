Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADCE7840D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 10:43:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 03:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="293674594"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2017 03:43:35 -0700
To: rpjday@crashcourse.ca, openembedded-core@lists.openembedded.org
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
Date: Mon, 31 Jul 2017 13:41:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
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
X-List-Received-Date: Mon, 31 Jul 2017 10:43:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
> 
>    given that some significant changes have been made to i2c-tools since
> version 3.1.2, is it worth adding a git-versioned recipe of that to 
> oe-core,
> and using DEFAULT_PREFERENCE to force people to select it if they want it?
> in particular, the code base has been restructured, and a new utility,
> "i2ctransfer", has been added.

It's better to ask the upstream to make a new release.

We've had dual git/release recipes in the past, and they were all an 
utter failure. In the sense, that only one version of the recipe was 
maintained, and the other was completely neglected.

Alex

