Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCF26FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 13:54:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2018 05:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,335,1511856000"; 
   d="scan'208";a="9021968"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 09 Jan 2018 05:54:56 -0800
Received: from scetola-mac01.local (unknown [10.252.207.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 658A25803E0;
	Tue,  9 Jan 2018 05:54:56 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
From: Stephano Cetola <stephano.cetola@linux.intel.com>
Message-ID: <a5ae4b88-c729-5201-c73a-0ec0733d57a5@linux.intel.com>
Date: Tue, 9 Jan 2018 05:54:56 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
Subject: Re: [rocko][PATCH 0/4] Backport masterimage fixes
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
X-List-Received-Date: Tue, 09 Jan 2018 13:54:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

These missed the 2.4.1 boat. Could we get these applied so they are sure
to make it into 2.4.2?  Thanks!

https://patchwork.openembedded.org/series/9690/


On 11/9/17 8:58 AM, Stephano Cetola wrote:
> Backporting fixes since I never got these into 2.4.
> 
> Requested by erik.boto@pelagicore.com.
> 
> This fixes [YOCTO #11524]
> 
> Erik Botö (4):
>   masterimage.py: fix issue with calling reboot on masterimage/DUT
>   masterimage.py: fix stop()
>   masterimage.py: rename parameter "params" in start() to
>     "extra_bootparams"
>   sshcontrol.py: in copy_to() always use scp
> 
>  meta/lib/oeqa/controllers/masterimage.py | 6 +++---
>  meta/lib/oeqa/utils/sshcontrol.py        | 9 +++------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 


