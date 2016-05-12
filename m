Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 99192608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 19:05:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2016 12:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="964707652"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2016 12:05:40 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1462969737.git.mariano.lopez@linux.intel.com>
	<1c3ceaa93f95993002acd3ce3e1a07bea1ffd6b1.1462969737.git.mariano.lopez@linux.intel.com>
	<1463045464.3794.6.camel@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <5734D407.1000005@linux.intel.com>
Date: Thu, 12 May 2016 14:05:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1463045464.3794.6.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] package_manager.py: Add extract() method for RPM package manager
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
X-List-Received-Date: Thu, 12 May 2016 19:05:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2016 04:31 AM, Joshua G Lock wrote:
> On Wed, 2016-05-11 at 12:31 +0000, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> +        #Parse output
>> +        for line in output.splitlines():
>> +            line = line.rstrip()
>> +            if line.startswith("Name:"):
>> +                pkg = line.split(": ")[1]
>> +            elif line.startswith("Version:"):
>> +                tmp_str = line.split(": ")[1]
>> +                ver, arch = tmp_str.split("@")
>> +                break
> Could pkg, ver and arch be potentially undefined here?
>
>

I'll send a v2 with default values

Mariano Lopez

