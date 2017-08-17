Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5320378528
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 15:06:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 08:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,388,1498546800"; d="scan'208";a="1206813852"
Received: from lbandamx-mobl.amr.corp.intel.com (HELO [10.252.248.59])
	([10.252.248.59])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2017 08:06:39 -0700
To: Andreas Oberritter <obi@opendreambox.org>
References: <cover.1502965191.git.alejandro.hernandez@linux.intel.com>
	<d19886da974978d84a0522b970503f74ad7ec382.1502965191.git.alejandro.hernandez@linux.intel.com>
	<20170817161428.172eb7b8@t460p>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <b620de0f-f1c6-67c4-563e-35b2918436a6@linux.intel.com>
Date: Thu, 17 Aug 2017 10:06:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170817161428.172eb7b8@t460p>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Thu, 17 Aug 2017 15:06:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Andreas,


On 08/17/2017 09:14 AM, Andreas Oberritter wrote:
> On Thu, 17 Aug 2017 03:24:23 -0700
> Alejandro Hernandez <alejandro.hernandez@linux.intel.com> wrote:
>
>>   - It creates a solution for users that want precompiled bytecode files
>>     (*.pyc) INCLUDE_PYCS = "1" can be set by the user on their local.conf to
>>     include such files, some argument they get faster boot time, even when the
>>     files would be created on their first run?, but they also sometimes give a
>>     magic number error and take up space, so we leave it to the user to
>>     decide if they want them or not.
> A serious problem with not shipping precompiled pyc and/or pyo files is that,
> once generated on first run, package managers won't uninstall them.
>
> This can cause many undesired effects, because python programs will still be
> able to import these files, but dependencies like graphics or shared libraries
> may have been deleted by the package manager.
>
> Also, not being able to uninstall something is bad on its own.
>
> So, if anything, I believe INCLUDE_PYCS = "1" would be the only sane default,
> unless no package management was involved at all.
>
> And no read-only filesystem, for what it's worth.
Interesting, I didn't know that happened, sounds like a fair argument,
I will make sure to set INCLUDE_PYCS = "1" by default to avoid problems
like this, and let the user set it to 0 if thats what they want.
>
> Best regards,
> Andreas
>
> P.S.: I didn't see patches 2 and 3. Is it just an incorrect subject?
Yes, there's 2 other patches, which are used for python3, but somehow
I forgot to send them, it was 4 am my apologies, will send them in a bit.

Regards,
Alejandro

