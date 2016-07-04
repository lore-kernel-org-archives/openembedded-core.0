Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 669BF60119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 08:40:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 04 Jul 2016 01:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="133392644"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2016 01:40:42 -0700
Date: Mon, 4 Jul 2016 11:40:49 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160704084049.GA448@mbabyjoh-desk.ger.corp.intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
	<1467371591-12270-4-git-send-email-maxin.john@intel.com>
	<CAJTo0LbeJ947NY76c-RZxxDZiFih9ZZ+Dk23Q+SvGEX4HUHH-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbeJ947NY76c-RZxxDZiFih9ZZ+Dk23Q+SvGEX4HUHH-A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] default-distrovars.inc: remove directfb from GTK2DISTROFEATURES
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
X-List-Received-Date: Mon, 04 Jul 2016 08:40:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Fri, Jul 01, 2016 at 04:44:39PM +0100, Burton, Ross wrote:
>
>>On 1 July 2016 at 12:13, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> -GTK2DISTROFEATURES = "directfb x11"
>> +GTK2DISTROFEATURES = "x11"
>
>
> I think we should keep this, for people who want to use their own directfb recipe.
>
Agree. Thanks for spotting it.

>  Ross

Best Regards,
Maxin

