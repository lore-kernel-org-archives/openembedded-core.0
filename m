Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A15277D6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 11:29:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 03:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; 
   d="scan'208";a="9937826"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 03:29:53 -0800
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
	<20180110122742.1226-4-alexander.kanavin@linux.intel.com>
	<20180110090145.5729ba28@lsandov1-mobl2.zpn.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <66288735-03fe-71da-dfc3-e4da141e201b@linux.intel.com>
Date: Thu, 11 Jan 2018 13:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180110090145.5729ba28@lsandov1-mobl2.zpn.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gnupg: use native version for signing, rather than one provided by host
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
X-List-Received-Date: Thu, 11 Jan 2018 11:29:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/10/2018 05:01 PM, Leonardo Sandoval wrote:
> Great that you figure out a solution.
> 
> So I belive we need to revert this commit:
> 
> commit 043d9ac0ae441e9a7e2ea8934bfc595a03ef9a52
> Author: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> Date:   Mon Sep 25 13:52:59 2017 -0700
> 
>      sign_rpm.bbclass: force rpm serial signing

The revert is already included in the patch... :)

Alex

