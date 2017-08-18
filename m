Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DDD3D77D08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:33:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 11:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="1184363515"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2017 11:33:33 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<20170818174114.GA3298@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6240dfca-820c-ced5-4e78-615b544b9f04@linux.intel.com>
Date: Fri, 18 Aug 2017 21:30:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170818174114.GA3298@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 18:33:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/18/2017 08:41 PM, Martin Jansa wrote:
> openssl 1.1 goes out of upstream support on 2018-08-31 _more than a year
> before_ 1.0.2 support, see:
> 
> https://www.openssl.org/policies/releasestrat.html
> Version 1.1.0 will be supported until 2018-08-31.
> Version 1.0.2 will be supported until 2019-12-31 (LTS).
> 
> Given its history of major security vulnerabilities, I hope you'll
> remove openssl-1.1.0 even sooner than openssl-1.0.2.

openssl 1.1.1 should be released as soon as final TLS 1.3 spec is 
published. I expect it will go out of support much later than 1.1.0. I 
do not expect a situation where 1.0 is supported but 1.1.something is not.


Alex

