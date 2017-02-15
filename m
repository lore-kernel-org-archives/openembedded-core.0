Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 24E6C7665F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 11:39:05 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 03:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="65426043"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 15 Feb 2017 03:39:05 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<6d1f71de4f49b874be8f48b51d36967cbb4eaef4.1486997986.git.alexander.kanavin@linux.intel.com>
	<1487154498.2824.4.camel@andred.net>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <882b9264-b6eb-b573-9891-1c4e74d66721@linux.intel.com>
Date: Wed, 15 Feb 2017 13:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487154498.2824.4.camel@andred.net>
Subject: Re: [PATCH 35/36] nativesdk.bbclass: add a /bin/sh RPROVIDES
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
X-List-Received-Date: Wed, 15 Feb 2017 11:39:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/15/2017 12:28 PM, André Draszik wrote:
> Shouldn't there be a package that actually RPROVIDES /bin/sh, rather than
> having to add a fake RPROVIDES?

I tried that approach first, with a fake-sdkdeps package. It's too 
complicated to make it work with nativesdk packages and still have all 
the selftests pass. There's a million other issues to solve, and I'm 
working on this by myself, so when I see easy ways out, I take them.

> Alternatively, shouldn't this be added to package_rpm.bbclass instead?

Maybe, I can try and see if this is possible.


Alex


