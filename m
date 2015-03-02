Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E91C737FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 15:45:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2015 07:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="673919453"
Received: from dsloan-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.6.98])
	by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2015 07:45:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 02 Mar 2015 15:45:11 +0000
Message-ID: <5774096.IiVkEzFHVb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <54F4798C.8070402@topic.nl>
References: <54F4798C.8070402@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Building with OpenMP support in OE fails on #include <omp.h>
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
X-List-Received-Date: Mon, 02 Mar 2015 15:45:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Monday 02 March 2015 15:54:04 Mike Looijmans wrote:
> Here's the problem, running in a devshell:
> 
> # echo '#include <omp.h>' > /tmp/compileme.c
> # $CC -c -fopenmp /tmp/compileme.c
> /tmp/compileme.c:1:17: fatal error: omp.h: No such file or directory
>   #include <omp.h>
>                   ^
> compilation terminated.
> 
> 
> The #pragma's and linking of OpenMP work just fine, it's just the inclusion
> of omp.h that appears to fail.
> 
> What I was actually trying to do is to activate OpenMP in OpenCV to get
> decent performance on a multicore ARM system. But this is holding me back
> now.
> 
> Looking in the sysroots reveals that the include file is actually there:
> 
> $ find tmp-glibc/sysroots/topic-miami-florida-med-xc7z030 -name omp.h
> tmp-glibc/sysroots/topic-miami-florida-med-xc7z030/usr/lib/gcc/arm-oe-linux-
> gnueabi/4.9.1/include/omp.h

Funnily enough this is an issue I fixed a few weeks ago - here's the bug which 
contains a link to the fix:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7141

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

