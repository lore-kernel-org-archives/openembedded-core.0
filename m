Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6747360017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:53:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 23 May 2016 05:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="960447233"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 05:53:40 -0700
To: openembedded-core@lists.openembedded.org
References: <1463723957-6584-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<5742FC01.1000402@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5742FD90.6080708@linux.intel.com>
Date: Mon, 23 May 2016 15:54:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <5742FC01.1000402@linux.intel.com>
Subject: Re: [PATCH] ghostscript: Update URL_SRI considered as 'old release'
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
X-List-Received-Date: Mon, 23 May 2016 12:53:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2016 03:48 PM, Alexander Kanavin wrote:
> On 05/20/2016 08:59 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> The Ghostcript project started to place their tarballs in two places
>> starting at 9.19 as explained in [1]. 9.18 version is considered old,
>> so including the 'old-gs-releases' in the URL.
>>
>> [1] http://downloads.ghostscript.com/public/
>>
>> [YOCTO #9573]
>
> You also need to add UPSTREAM_CHECK_URI because otherwise ghostscript's
> latest release will be forever reported as 9.18.

Actually, the same 9.18 tarball is available here:

https://github.com/ArtifexSoftware/ghostpdl-downloads/releases

so why not switch SRC_URI to that?


Alex


