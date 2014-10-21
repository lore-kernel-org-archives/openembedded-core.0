Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39A2560233
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 21:12:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 21 Oct 2014 10:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,762,1406617200"; d="scan'208";a="593122427"
Received: from justinda-mobl1.ger.corp.intel.com (HELO [10.255.13.67])
	([10.255.13.67])
	by orsmga001.jf.intel.com with ESMTP; 21 Oct 2014 08:09:53 -0700
Message-ID: <1413904192.3669.6.camel@empanada.home.network>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Philip Balister <philip@balister.org>
Date: Tue, 21 Oct 2014 10:09:52 -0500
In-Reply-To: <54454A41.7090900@balister.org>
References: <54454A41.7090900@balister.org>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: wic debug suggestions
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
X-List-Received-Date: Tue, 21 Oct 2014 21:12:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-10-20 at 13:45 -0400, Philip Balister wrote:
> I'm trying to make an sd card using the sdimage-bootpart.wks file. I've
> made an image and dd'ed it to a card. The card has a good vfat
> partition, but the ext4 partition won't mount. Looks like bad
> superblock. I can format the partition manually, so partitions seem OK
> and card works.
> 
> Does anyone have any suggestions for debugging this?
> 

If you think there's a problem in the way wic is creating the
partitions, I'd suggest using the wic --debug option, which will show
you all the details of the underlying commands used to create the
partitions.

If that doesn't show anything obvious, please create a bug report and be
sure to include myself and Maciej, who added the new sdimage-bootpart
functionality you're having trouble with, in case it turns out not to be
some more generic problem in the tool.

Thanks,

Tom

> Philip



