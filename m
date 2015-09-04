Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 126F677016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:40:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Sep 2015 06:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="762310847"
Received: from maholain-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.141])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2015 06:40:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Lucian Musat <george.l.musat@intel.com>
Date: Fri, 04 Sep 2015 14:40:39 +0100
Message-ID: <2479070.4L73SyIo8I@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1441373587-27103-1-git-send-email-george.l.musat@intel.com>
References: <1441373587-27103-1-git-send-email-george.l.musat@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/decorators: Fixed a problem with tests having the same names.
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
X-List-Received-Date: Fri, 04 Sep 2015 13:40:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Lucian,

On Friday 04 September 2015 16:33:07 Lucian Musat wrote:
> When two or more tests had the same name but different classes then
> the decorator log whould have the output all wrong. This was because
> a comparison which was made only between method names but now it
> compares classes too.
> 
> Bug #8029

The correct way to reference a Yocto Project Bugzilla entry that's fixed by a 
bug is [YOCTO #xxxx] i.e. here you would use [YOCTO #8029].

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

