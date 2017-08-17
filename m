Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 69CA86B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 11:57:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 04:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="124709992"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2017 04:57:48 -0700
To: openembedded-core@lists.openembedded.org
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
Date: Thu, 17 Aug 2017 14:54:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Aug 2017 11:57:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/17/2017 02:46 PM, Martin Jansa wrote:
> I meant "real-world" as builds for any products on the market (which are 
> likely using one of the failing recipes) - e.g. in LGE we have many more 
> failures over all internal components, so I'll just undo this openssl 
> switch (renaming openssl_1.1 as openssl11 and openssl11_1.0 back as 
> openssl_1.0 with PROVIDES openssl11). We won't be able to use 
> openssl-1.1 for long time anyway, because there are some 3rd party 
> component which are difficult (or expensive) to get rebuilt against new 
> openssl ABI, but we might be interested in some other improvements in 
> oe-core/master.

Yes, this will work for you as a quick fix, but it is merely postponing 
dealing with the issue properly to a later date. Make a plan for it and 
keep in mind that openssl 1.0 goes out of upstream support at the end of 
2019. Given its history of major security vulnerabilities, it will be 
removed from oe-core well before that time, so that it won't linger in 
supported YP releases.


Alex

