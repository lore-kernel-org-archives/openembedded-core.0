Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1D322783C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:18:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 15 Jun 2017 07:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="98297785"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 15 Jun 2017 07:18:30 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
Date: Thu, 15 Jun 2017 17:18:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Thu, 15 Jun 2017 14:18:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2017 05:11 PM, Peter Kjellerstedt wrote:

>> My apologies, but I do not think this is a satisfactory answer: it may
>> mean you are fixing the wrong problem, or a problem that does not
>> exist.
>>
>> Alex
>
> Well, I am pretty sure Git patches that rename files are not supposed
> to be used, since quilt does not support this AFAIK. So the change in
> this patch should be correct.
>
> However, I would be more than happy if anyone can explain why others
> are not seeing this (or does everyone have PATCHTOOL = "git" in their
> configurations somehow?)

This is unlikely; I certainly don't. Perhaps if you provide the exact 
command that is being executed, and what is the error it prints, I could 
try to do the same?

Alex


