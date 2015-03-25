Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5B46AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:59:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2015 10:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,466,1422950400"; d="scan'208";a="704109322"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 25 Mar 2015 10:59:40 -0700
Message-ID: <5512F78B.2090800@linux.intel.com>
Date: Wed, 25 Mar 2015 10:59:39 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1427242586-23928-1-git-send-email-randy.e.witt@linux.intel.com>
	<CABcZANkfjcqPVHPOKZBjQYGAr2HRwmAEha1LgPM3spZ90NwxBw@mail.gmail.com>
In-Reply-To: <CABcZANkfjcqPVHPOKZBjQYGAr2HRwmAEha1LgPM3spZ90NwxBw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_ext: Log the "Preparing build system" step
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
X-List-Received-Date: Wed, 25 Mar 2015 17:59:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/25/2015 10:31 AM, Christopher Larson wrote:
> On Tue, Mar 24, 2015 at 5:16 PM, Randy Witt <randy.e.witt@linux.intel.com>
> wrote:
>
>> When using bitbake to do the setscene as part of sdk setup, it would be
>> useful to have a log in the case where it fails.
>>
>> The log is called preparing_build_system.log and is in the top level
>> directory of the extracted sdk.
>>
>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>
>
> Is this step just doing a setscene from shipped sstate, or is it intended
> to build anything from scratch? Because I've seen cases where the sstate
> isn't used as it should be, and it ends up taking ages to run real tasks.
>

It should be using the shipped sstate based on the locked-sigs.inc file. I would 
expect it to fail if the signatures didn't match for some reason, but perhaps a 
change went in that changed behavior.

If you see an instance where it is not using the shipped sstate, could you file 
a bug or send an email? I'm really curious as to why it doesn't fail outright, 
because that's the whole point of the locked-sigs.inc file.

