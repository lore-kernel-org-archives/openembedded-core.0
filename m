Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B4227745BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 02:50:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2018 19:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,408,1520924400"; d="scan'208";a="49901627"
Received: from dalmania-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.137])
	by FMSMGA003.fm.intel.com with ESMTP; 16 May 2018 19:50:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:50:35 +1200
Message-ID: <7138478.4eoPDZnUto@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <7dcc4aba-8453-1dbf-11c6-446b58d2b6c3@intel.com>
References: <7787493.mkkD0rIuAZ@peggleto-mobl.ger.corp.intel.com>
	<7dcc4aba-8453-1dbf-11c6-446b58d2b6c3@intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 17 May 2018 02:50:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 9 May 2018 8:19:19 AM NZST Cal Sullivan wrote:
> You're right. Since its adding to APPEND from rootfs-postcommands, which 
> is inherited by images, its in the local space instead of global and 
> won't be picked up by these recipes...
> 
> Right now it won't actually affect anything out of the box, as that 
> method of booting isn't default due to lack of random UUID support, but 
> its something that will need to be solved in the future.

I've filed the following bug to track this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12755

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



