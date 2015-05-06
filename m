Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 08A2B72A85
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:53:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 May 2015 08:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="690865257"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.36])
	([10.219.4.36])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2015 08:53:18 -0700
Message-ID: <554A3929.4090107@linux.intel.com>
Date: Wed, 06 May 2015 10:54:17 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1430810046-27021-1-git-send-email-rongqing.li@windriver.com>	<CAJTo0LZegzqLHxrTkyyH3ybErWejuZLQh9ZgFCxcJJwfEaPswQ@mail.gmail.com>
	<5549B5A4.7080902@windriver.com>
In-Reply-To: <5549B5A4.7080902@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Wed, 06 May 2015 15:53:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/05/15 01:33, Rongqing Li wrote:
>
>
> On 2015年05月05日 23:34, Burton, Ross wrote:
>>
>> On 5 May 2015 at 08:14, <rongqing.li@windriver.com
>> <mailto:rongqing.li@windriver.com>> wrote:
>>
>>     Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
>>     Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
>>     Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
>>     Update use-host.patch no-curl.patch db_linking_hack.patch and
>>     noconfigure.patch
>>     Not build the test cases since it requires gtest
>>
>>
>> What runtime testing was done with this upgrade in place?
>>
>> Ross
>
> apt-cache search by copy host's /var/lib/dpkg/status
> apt-get -h
> Not too much;

For testing you can add package-management to DISTRO_FEATURES to install 
apt
also try to install a package from package feed.

     alimon

>
> -Roy
>
>


