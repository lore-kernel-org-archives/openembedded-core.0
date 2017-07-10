Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B3F126FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:26:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2017 10:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,341,1496127600"; d="scan'208";a="877292360"
Received: from scetola-mac01.jf.intel.com ([10.54.74.129])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2017 10:26:11 -0700
Date: Mon, 10 Jul 2017 10:26:11 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170710172611.GA68719@scetola-mac01.jf.intel.com>
References: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: Re: [PATCH v4 0/4] fix runtime testing using systemd-boot targe
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
X-List-Received-Date: Mon, 10 Jul 2017 17:26:10 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Any updates on this?

I can setup a test for this if one doesn't already exist.

Cheers,
Stephano

On 06/20, Stephano Cetola wrote:
> I'm sending this on behalf of Zeeshan Ali <zeenix@gmail.com>. One of
> the patches required a rebase and he is on vacation. This fixes
> [YOCTO #11524].
> 
> Erik Botö (4):
>   sshcontrol.py: in copy_to() always use scp
>   masterimage.py: fix stop()
>   masterimage.py: rename parameter "params" in start() to
>     "extra_bootparams"
>   masterimage.py: fix issue with calling reboot on masterimage/DUT
> 
>  meta/lib/oeqa/controllers/masterimage.py | 6 +++---
>  meta/lib/oeqa/utils/sshcontrol.py        | 9 +++------
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> -- 
> 2.13.1
> 

