Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B84606CA24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 18:03:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2013 09:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="449996469"
Received: from unknown (HELO helios.localnet) ([10.252.122.53])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2013 10:03:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 10 Dec 2013 18:03:32 +0000
Message-ID: <5616775.7LhWvOXBE4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1386687474.git.liezhi.yang@windriver.com>
References: <cover.1386687474.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/124] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Tue, 10 Dec 2013 18:03:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 December 2013 10:08:10 Robert Yang wrote:
> * Main changes:
>   - Wic fixes
>   - Update the kernel to 3.10.17
>   - CVE fixes
>   - Other Bug fixes
> 
> Note:
> The PULL is created based on poky, maybe oe-core is preferred ?

OE-Core is preferred for the OE-Core parts, yes.

I haven't yet looked at all of these, but:

> Bruce Ashfield (10):
>   kernel: restore scripts in the sysroot

Wasn't there a problem with this patch? I can't recall if it was rectified 
before or after it was merged to master.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

