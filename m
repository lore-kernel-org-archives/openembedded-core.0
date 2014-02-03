Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90E936B6D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 16:47:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2014 08:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,773,1384329600"; d="scan'208";a="448992753"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 08:47:19 -0800
Date: Mon, 3 Feb 2014 18:47:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Message-ID: <20140203164718.GA5112@lpalcu-linux>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<52EFA891.7060806@enea.com>
MIME-Version: 1.0
In-Reply-To: <52EFA891.7060806@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/49] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Mon, 03 Feb 2014 16:47:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 03, 2014 at 03:32:49PM +0100, David Nyström wrote:
> On 2014-02-03 12:38, Laurentiu Palcu wrote:
> >Hi all,
> >
> 
> Have you tested that BUILD_IMAGES_FROM_FEEDS functionality is not
> broken by these commits ?
No, I did not test this. I tried to test it on master though and it
doesn't seem to work... Anyway, if you have a working environment, can
you give it a test? Technically, the feeds are added to the main
opkg.conf file in OPKG_PREPROCESS_CMD. And this functionality is
supposed to work.

laurentiu

> 
> Br,
> David
> 

