Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1AE7724B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:01:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 23 Feb 2016 02:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="53080514"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2016 02:01:04 -0800
Date: Tue, 23 Feb 2016 12:04:47 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160223100446.GB22912@mbabyjoh-mobl.fi.intel.com>
References: <1456218756-22996-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LYRNsnVUr39sLGto5FCoS79b99FEY-H0mh5R8H-+gRzjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYRNsnVUr39sLGto5FCoS79b99FEY-H0mh5R8H-+gRzjQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: fix build with uclibc
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
X-List-Received-Date: Tue, 23 Feb 2016 10:01:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Tue, Feb 23, 2016 at 09:25:01AM +0000, Burton, Ross wrote:
>
>>On 23 February 2016 at 09:12, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>   ++#ifndef _GNU_SOURCE
>>   ++#define _GNU_SOURCE
>>   ++#endif
>    #including config.h is probably a better fix, as that already defines GNU_SOURCE.
Yes, that looks better. Will send a v2.

>Ross

