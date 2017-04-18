Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F1D1171AB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 10:16:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 18 Apr 2017 03:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,218,1488873600"; d="scan'208";a="1120676314"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2017 03:16:56 -0700
To: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com
References: <cover.1492135840.git.pkj@axis.com>
	<1492159760.19076.10.camel@linuxfoundation.org>
	<5d709f7eb9fa49fd89cd95818ddf4018@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cb98dab5-e932-a66a-311e-7aa5b2484652@linux.intel.com>
Date: Tue, 18 Apr 2017 13:16:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5d709f7eb9fa49fd89cd95818ddf4018@XBOX02.axis.com>
Subject: Re: [PATCH 0/2] Allow postinst functions to be verbose
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
X-List-Received-Date: Tue, 18 Apr 2017 10:16:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2017 04:10 PM, Peter Kjellerstedt wrote:
>> I'm afraid I can't take these since these scripts get written into the
>> sstate objects for the recipes in question and this would make the
>> sstate change depending on the parameters you call bitbake with. I
>> think we'd both agree that is undesirable.
>
> Bother. Did not think of that (I am so used to having it enabled in all my
> builds).
>
>> Not sure what we can do but this needs more thought.
>
> Yeah, it would be great if the output from the postinst scripts was actually
> captured. But we can think of that for 2.4.

Are you using rpm? If you are, we already have ROOTFS_RPM_DEBUG variable 
which, if enabled, directs rpm to output a lot more to the log.do_rootfs 
than it normally would. Can you switch it on in your local.conf and see 
if you get what you need?

If the log still isn't verbose enough, please write a comment to this bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11096

explaining what kind of output from rpm would be useful to have, and we 
can patch rpm to do that.


Alex

