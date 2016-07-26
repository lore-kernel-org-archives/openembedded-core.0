Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7DD8731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 17:35:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2016 10:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="740059243"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 10:35:27 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
	<1469550475.2740.9.camel@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <57979F69.6080903@linux.intel.com>
Date: Tue, 26 Jul 2016 12:35:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1469550475.2740.9.camel@linux.intel.com>
Subject: Re: [PATCH 0/3] Allows to copy symlinks to DUTs with testimage
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
X-List-Received-Date: Tue, 26 Jul 2016 17:35:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2016 11:27 AM, Joshua G Lock wrote:
> On Tue, 2016-07-26 at 07:39 +0000, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> Currently when using the install functionality in the DUT without
>> package
>> manager, if you copy a symlink the function will fail.
>>
>> These series will change the behaviour and will allow to recreate the
>> symlinks in the DUT.
>>
>> [YOCTO #9932]
>
> Would oe.path.copytree() work instead of using shutil.copytree()?
> copytree() was added because shutil was quite slow for our usage.

I didn't know the existence of that function, I tried it and it can 
replace shutil.copytree(). I'll send a v2.

>
> Regards,
>
> Joshua

Mariano Lopez

