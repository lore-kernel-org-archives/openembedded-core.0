Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1975E72FA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489576812; x=1521112812;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=43o/h+SkY5JO8+18Y43Vjx1XcdYBt1yauG8uDePU1r0=;
	b=BIMLvuIrS1ULzr+KC6b1hcJ+GDTgflki4HxfydCM89HRU/H39l20Z1lZ
	jABaRDt3G/7LRZCOy/ijELwiIaL9pA==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 04:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,168,1486454400"; d="scan'208";a="67598666"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 15 Mar 2017 04:20:09 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
Date: Wed, 15 Mar 2017 13:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 11:20:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2017 01:13 PM, Burton, Ross wrote:
>
>     +        cls.repo_server.port = 8080
>
>
> What if parallel selftests are running at once?  Can this service be
> started before the image is created, so the right port can be written
> into the image?

I don't know. I only followed what Humberto wrote in the original patch; 
we need to ask him. I'm also not entirely certain that hardcoding the ip 
address will always work, and did not get an answer to that.

Another, more hackish option is to monkey patch the ephemeral port 
before running dnf into the repo config on the image.

Alex


