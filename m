Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 006927703A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 07:08:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 13 Oct 2015 00:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,676,1437462000"; d="scan'208";a="825614001"
Received: from porlows1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.182])
	by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2015 00:08:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, "Burton,
	Ross" <ross.burton@intel.com>
Date: Tue, 13 Oct 2015 08:08:16 +0100
Message-ID: <12350428.oQrj5AvgHG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <5617A53F.9070506@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<CAJTo0LbgZb=Q+sAd9W82U9Y5AQsR1xcyoRUQy=6HeS5b1LN4XA@mail.gmail.com>
	<5617A53F.9070506@windriver.com>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Tue, 13 Oct 2015 07:08:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 October 2015 19:30:07 Robert Yang wrote:
> On 10/09/2015 06:51 PM, Burton, Ross wrote:
> > On 9 October 2015 at 02:28, Robert Yang <liezhi.yang@windriver.com
> > 
> > <mailto:liezhi.yang@windriver.com>> wrote:
> >     I'm afraid that realpath is not generally existed on the build host ?
> > 
> > It's part of coreutils on my Debian stable box.  I guess the real question
> > is "does it exist on Centos 6?".  [looks].  Hmm, it's not present on
> > that.
> Ubuntu 14.03 desktop doesn't have it, either.

Does readlink -f suffice ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

