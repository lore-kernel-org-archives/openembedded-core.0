Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 442E46F595
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 13:54:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Apr 2014 06:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,787,1389772800"; d="scan'208";a="513704238"
Received: from pmcgurk-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.138])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2014 06:53:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 03 Apr 2014 14:53:13 +0100
Message-ID: <5354658.FrfE13FD5F@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396532945.5879.189.camel@phil-desktop.brightsign>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1696721.rgbfGmBHri@peggleto-mobl5.ger.corp.intel.com>
	<1396532945.5879.189.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Thu, 03 Apr 2014 13:54:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 April 2014 14:49:05 Phil Blundell wrote:
> On Thu, 2014-04-03 at 14:13 +0100, Paul Eggleton wrote:
> > Incidentally, I think maybe for 1.7 it's time we bumped OLDEST_KERNEL.
> > What a sensible minimum would be though I'm not sure. The minimum version
> > for udev 182 would be one choice, but I believe there are people still
> > using older kernels even than that.
> 
> What would be the advantages of bumping it up?

I could be wrong, but my understanding was that EGLIBC functionality specific 
to a particular kernel version or later is enabled / disabled based upon this 
value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

