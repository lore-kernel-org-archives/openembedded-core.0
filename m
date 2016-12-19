Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1DADE71B87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:00:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 19 Dec 2016 01:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,372,1477983600"; d="scan'208";a="799907094"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2016 01:00:21 -0800
Date: Mon, 19 Dec 2016 11:01:56 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161219090155.GA31191@mbabyjoh-desk.ger.corp.intel.com>
References: <1481548162-22276-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZ5ne934RKTZChfSx8TeuTqneZE5R7fd6JJNOSsd=9M=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ5ne934RKTZChfSx8TeuTqneZE5R7fd6JJNOSsd=9M=A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Cristian Iorga <cristian.iorga@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: add ptest
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
X-List-Received-Date: Mon, 19 Dec 2016 09:00:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Fri, Dec 16, 2016 at 05:53:25PM +0000, Burton, Ross wrote:
>>On 12 December 2016 at 13:09, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    +                         python-argparse python-pprint diffutils openssh \
>    Sadly this dependency on openssh breaks images which pull in dropbear explicitly, such as core-image-sato-dev.

Ah, ok.

>    Why does the curl ptest needs openssh, and can it use dropbear if that is present?

Will check and take care of it in V2. Thanks!

Best Regards,
Maxin

