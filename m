Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 257EC766B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 12:44:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 11 Nov 2015 04:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,275,1444719600"; d="scan'208";a="848443306"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2015 04:44:52 -0800
Message-ID: <56433886.3060700@linux.intel.com>
Date: Wed, 11 Nov 2015 14:45:58 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com>
In-Reply-To: <56421DA6.5080700@windriver.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 12:44:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 06:39 PM, Mark Hatle wrote:

>> This requires custom bitbake support I'm afraid, a specialist needs to
>> answer this.
>>
>
> Let me rephrase.  Instead of calling out to qemu (or a real target) for a
> gobject and result.  Can the result be cached (like we do with the config-site
> info?)  This would allow me to run say a MIPS64 n64 gobject build, cache the
> results and use it on my octeon3 build (which can't run in QEMU.)

The results in this case are .typelib files. They are raw dumps of a C 
structure in memory - different compilers may produce different binary 
representations of those. I wouldn't trust that they are the same and 
that it's okay to copy them around like this. What makes you confident 
that they are?


Alex

