Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 834BD60232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 12:23:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Nov 2015 04:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,234,1444719600"; d="scan'208";a="840576698"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 02 Nov 2015 04:23:43 -0800
Date: Mon, 2 Nov 2015 14:24:10 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151102122410.GA21986@mbabyjoh-mobl.fi.intel.com>
References: <1446197957-20485-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZ64XfEPFS+Z1ibASPUDnGUC2XV-hp+2uKBdkj6fzjeqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ64XfEPFS+Z1ibASPUDnGUC2XV-hp+2uKBdkj6fzjeqw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: fix ptest output format
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
X-List-Received-Date: Mon, 02 Nov 2015 12:23:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Mon, Nov 02, 2015 at 12:12:52PM +0000, Burton, Ross wrote:
>>On 30 October 2015 at 09:39, Maxin B. John <maxin.john@intel.com> wrote:
>> +gnome-desktop-testing-runner glib | sed 's/FAILED/FAIL/g'

>Don't all upstreams using the GLib test framework emit FAILED, or is this really specific to glib?

You are right. Please ignore this patch. This is caused by the gnome-desktop-testing package which
is part of the test framework. Currently, I am testing a fix for that package.

> Ross

Best Regards,
Maxin

