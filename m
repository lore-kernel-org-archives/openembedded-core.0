Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 05AD473129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:04:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2017 03:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="833110016"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2017 03:04:42 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
	<20170309202331.5595-4-alexander.kanavin@linux.intel.com>
	<CAJTo0LYVkJE9Yk4TSdmE4CUR+oZrf7RqVcadNcjcwGrD82vMmg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fa906793-1e80-ee81-5ba3-6e75fb2c4d3f@linux.intel.com>
Date: Fri, 10 Mar 2017 13:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYVkJE9Yk4TSdmE4CUR+oZrf7RqVcadNcjcwGrD82vMmg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gpgme: fix python module build and installation
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
X-List-Received-Date: Fri, 10 Mar 2017 11:04:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 12:51 PM, Burton, Ross wrote:
>
> No upstream-status.

Will fix/resend.

> Also, does the PATH mangling in master-next solve this?

I think not - python module build system calls gpgme-config to find out 
linking flags, and it gives -L${libdir} which is of course -L/usr/lib, 
so host contamination happens.

Alex


