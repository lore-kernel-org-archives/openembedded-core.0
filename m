Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDB672F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490620595; x=1522156595;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=8Gqg82ZeLW/G6NYIYvaUic/dX/E4FJwdmSs6kjdorUY=;
	b=K8jgjGKkvpgYLYWtANAmupwT2G75AsXPlfvO25L2cWcj9gAnxGhxh8nF
	g8Li0JRldxD/WEZH3sCr0y6/h8+yEg==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 06:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,231,1486454400"; d="scan'208";a="1127581414"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2017 06:16:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170327125359.16788-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LaHFRVRJuK6VLyP-O=wo+O1iGRdeZrTvzUwgQY68Dg73A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2c8d7162-32a9-ebbc-c7d3-85611e4d4848@linux.intel.com>
Date: Mon, 27 Mar 2017 16:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaHFRVRJuK6VLyP-O=wo+O1iGRdeZrTvzUwgQY68Dg73A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 1/2] python3: do not hardcode "lib" into site-packages search path
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
X-List-Received-Date: Mon, 27 Mar 2017 13:16:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2017 03:58 PM, Burton, Ross wrote:

>     +
>     file://0001-Do-not-hardcode-lib-into-site-packages-path.patch \
>
>
> This should probably be added
> to meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> instead of being in a separate patch.

Sure, but the patch that does that isn't particularly easy to read, 
because devtool moves things around when modifying patches. You'll see 
in a second.

Alex


