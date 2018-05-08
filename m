Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B5E7174994
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 10:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2018 03:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,381,1520924400"; d="scan'208";a="227022322"
Received: from kchow2-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.72.51])
	by fmsmga005.fm.intel.com with ESMTP; 09 May 2018 03:03:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Date: Wed, 09 May 2018 09:33:36 +1200
Message-ID: <1973032.iokuBElcte@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <7dcc4aba-8453-1dbf-11c6-446b58d2b6c3@intel.com>
References: <7787493.mkkD0rIuAZ@peggleto-mobl.ger.corp.intel.com>
	<7dcc4aba-8453-1dbf-11c6-446b58d2b6c3@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: read-only-rootfs and EFI configuration
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
X-List-Received-Date: Wed, 09 May 2018 10:03:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Cal

On Wednesday, 9 May 2018 8:19:19 AM NZST Cal Sullivan wrote:
> You're right. Since its adding to APPEND from rootfs-postcommands, which 
> is inherited by images, its in the local space instead of global and 
> won't be picked up by these recipes...
> 
> Right now it won't actually affect anything out of the box, as that 
> method of booting isn't default due to lack of random UUID support, but 
> its something that will need to be solved in the future.

OK, thanks I wasn't aware of that - I do see the bugzilla entry now. The 
question I have is what should we cover in the release notes in terms of the 
user-visible features you added?

Thanks,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre



