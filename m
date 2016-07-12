Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 06CD86067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:01:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Jul 2016 16:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,354,1464678000"; d="scan'208";a="1005620589"
Received: from yocto-dev86.jf.intel.com (HELO
	bkrishn1-mobl.amr.corp.intel.com) ([10.7.198.60])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 16:01:04 -0700
Date: Tue, 12 Jul 2016 16:01:03 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160712230103.GA1303@bkrishn1-mobl.amr.corp.intel.com>
References: <20160712124501.5216-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20160712124501.5216-1-stephano.cetola@linux.intel.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
Subject: Re: [PATCH V4] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Tue, 12 Jul 2016 23:01:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/12, Stephano Cetola wrote:
> Changes from V3:
> Split off of whitespace rather than comma.
> 
> Stephano Cetola (1):
>   rootfs.py: allow removal of support packages
> 
>  meta/lib/oe/rootfs.py | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> -- 
> 2.9.0
> 
I spoke with Paul today and I'm going to be reworking this a bit. Please hold
off on merging this.  Thanks.

