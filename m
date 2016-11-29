Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C5491719F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:24:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="1092148781"
Received: from cloo7-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.199])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2016 09:24:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Nov 2016 06:24:06 +1300
Message-ID: <1708364.g3ONUbFma5@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LZrWkbyaDWb-8mfNZm2d3mqsqab4uwtNN6Q=dPEKXhiHg@mail.gmail.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<alpine.LFD.2.20.1611290542100.24580@ca624034.mitel.com>
	<CAJTo0LZrWkbyaDWb-8mfNZm2d3mqsqab4uwtNN6Q=dPEKXhiHg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Tue, 29 Nov 2016 17:24:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 29 Nov 2016 11:31:44 Burton, Ross wrote:
> On 29 November 2016 at 10:47, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> > one example i mentioned is that the YP guide does not list "sed" as a
> > build host requirement, but "sed-native" is in ASSUME_PROVIDED;
> > however, it's not listed in SANITY_REQUIRED_UTILITIES. that seems
> > inconsistent.
> 
> It would be somewhat useful if there where a way to annotate in recipes
> what binary to check for on the host, so just doing
> ASSUME_PROVIDED=sed-native would look up in the sed recipe to check that
> "sed" exists on the host, so that SANITY_REQUIRED_UTILITIES doesn't need to
> be maintained separately.
> 
> Very low hanging fruit though.  Patches welcome!

How would you get access to that recipe-space information within 
sanity.bbclass though?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

