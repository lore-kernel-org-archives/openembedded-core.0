Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E6707606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:02:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2015 06:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="750115805"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2015 06:02:13 -0700
Message-ID: <55D1DBA7.800@linux.intel.com>
Date: Mon, 17 Aug 2015 16:03:35 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>	
	<993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
	<1439730631.1218.25.camel@linuxfoundation.org>
In-Reply-To: <1439730631.1218.25.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rpm: update to 5.4.15
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
X-List-Received-Date: Mon, 17 Aug 2015 13:02:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2015 04:10 PM, Richard Purdie wrote:
> Not sure what this was tested with but a simple "bitbake
> core-image-minimal" breaks after this (and the db) change with licensing
> failures.
>
> The autobuilder exploded with failures like:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/430/steps/BuildImages_1/logs/stdio
>
> which are due to the installed manifest file listing installed packages
> being empty.

I tested by running 'bitbake world' (which completed fine), but I wasn't 
aware that 'world' doesn't include any images (why not?).

I'll investigate what is happening.

Alex


