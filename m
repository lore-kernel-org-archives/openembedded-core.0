Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8F7971B0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 11:28:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 04:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,357,1498546800"; d="scan'208";a="888972193"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2017 04:28:48 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-6-alexander.kanavin@linux.intel.com>
	<CAJTo0La5aPZ711UmGoXpvLxoQ3cJPQ1aPjD8EtBdyVaaoeyv5A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7cec3a5a-e514-5730-47ce-1604ab4fc1a3@linux.intel.com>
Date: Fri, 11 Aug 2017 14:25:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La5aPZ711UmGoXpvLxoQ3cJPQ1aPjD8EtBdyVaaoeyv5A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] oprofile: update to 1.2.0
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
X-List-Received-Date: Fri, 11 Aug 2017 11:28:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/09/2017 11:47 PM, Burton, Ross wrote:
> Breaks with musl:
> 
> http://errors.yoctoproject.org/Errors/Details/150200/

Should we just remove oprofile? From git log I understood that it has 
been deprecated in favour of perf, and this musl failure is non-trivial 
to fix (necessary version of basename() is not provided by musl on 
purpose, and so needs to be manually reimplemented).

I'll send the patches :)

Alex

