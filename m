Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 692F277DB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 12:16:17 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 05:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="109307489"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 05 Jun 2017 05:16:06 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
Date: Mon, 5 Jun 2017 15:14:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496585728.6630.165.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 12:16:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2017 05:15 PM, Richard Purdie wrote:

> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/1
> 163/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build
> s/1203/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/builds/1
> 112/steps/BuildImages/logs/stdio
>
> I suspect the same issue causing failures in multiple places.

The patches as they are now require that the C compiler on the host is 
recent; specifically that it defaults to C11 mode. I'm not sure when GCC 
made the switch, but it works that way with GCC 6.3.0.

In any case, I'll rework the patches to use openmp, as requested by 
upstream - this may however cause a different set of compatibility 
problems with older GCC versions. What are the oldest host compiler 
versions/distro versions that we still need to support in master?


Alex

