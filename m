Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJYHY-0001kk-GA
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 01:23:12 +0200
Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 16:10:10 -0700
Received: by padfa11 with SMTP id fa11so6909506pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 16:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=fXGDfbMvXltzTQ9UFGEM4yjBjHG3EBlDspZLLmFpAQk=;
	b=YxCIDDEeASA+Ln8pbQF8EPNGC5H9VVMlv6uDHC9nDaSUyQd9pqa1eUhbaUroXRUk+k
	tBLJ3gaaT2jgT/5HOQJNnly8ZL1i/npTJ3bYy9I/qAGXGObQyd0uk+zJRHsX1D5Fowmj
	sbeHA6SGBU/9JwgJcm7xh+88AfqkssU6WuI47vlHPK24OrOQRc83OXFRIQyu0hnj7UI7
	chhSYJ6sqkOBLIlY6snXt1syUAwUU+cffvG/ZOFlg21ETMQI9lomaGI2XxaaAwP41xBH
	x1ySBCrzhDdIIbYiiNtW8ms5zJ2RiPDQjfIblbxzZwIMbLuODhXfveX5BvEg261cgr+G
	2x8Q==
Received: by 10.68.190.233 with SMTP id gt9mr16450326pbc.137.1349305809938;
	Wed, 03 Oct 2012 16:10:09 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id pj8sm3264909pbb.60.2012.10.03.16.10.08
	(version=SSLv3 cipher=OTHER); Wed, 03 Oct 2012 16:10:08 -0700 (PDT)
Message-ID: <506CC5D0.9040107@intel.com>
Date: Wed, 03 Oct 2012 16:10:08 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1349213410-14141-1-git-send-email-Chase.Maupin@ti.com>
	<506C7341.4010305@intel.com> <1349302889.18301.61.camel@ted>
In-Reply-To: <1349302889.18301.61.camel@ted>
X-Gm-Message-State: ALoCoQkJI3gUVPTq9tYRGeLpmFmIx5U2ZlSs1Sz+e7RC2jggGwSKwEfNNbWykuGOupbIRLBYac66
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][PATCH] libtool: Add missing DEPENDS on libtool-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 23:23:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 03:21 PM, Richard Purdie wrote:
> On Wed, 2012-10-03 at 10:17 -0700, Scott Garman wrote:
>> On 10/02/2012 02:30 PM, Chase Maupin wrote:
>>> * When building with 24 bitbake threads on my system I observed
>>>     errors like the following:
>>>       | configure.ac:199: error: LT_LANG: unsupported language: "Go"
>>>       | <tmpdir>/work/armv7a-vfp-neon-oe-linux-gnueabi/libtool-2.4.2-r3.0/libtool-2.4.2/aclocal-copy/libtool.m4:768: LT_LANG is expanded from...
>>>       | configure.ac:199: the top level
>>>       | autom4te: m4 failed with exit status: 1
>>> * This could be found by doing a clean build.  If a build had
>>>     already been performed then often just cleaning the libtool
>>>     package and rebuilding it would resolve the issue.
>>> * Adding a DEPENDS on libtool-cross resolves this issue with a
>>>     clean build.
>>> * Bump the PR
>>>
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>
>> Thanks for this, I've merged it into my sgarman/denzil-next testing
>> branches.
>
> This isn't even in master yet and I have some concerns about why its
> necessary. I've not had a chance to look into it properly yet though :/.

Yeah, sorry I'm jumping the gun a bit. I'm trying to merge commits 
quickly so I can test the branch soon on the autobuilder and get another 
pull request in before the patchset gets too large (last time it was a 
bit unwieldy).

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


