Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DD70A78371
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 10:08:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 24 Jul 2017 03:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="996376942"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 24 Jul 2017 03:08:31 -0700
Date: Mon, 24 Jul 2017 13:09:35 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170724100935.GA2583@mbabyjoh-desk.ger.corp.intel.com>
References: <1500551494-19244-1-git-send-email-maxin.john@intel.com>
	<CAJTo0Lbfro=E6O=1Gt_R8qFi1jB8JutD=TXCn=icTQMJ3rmAzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbfro=E6O=1Gt_R8qFi1jB8JutD=TXCn=icTQMJ3rmAzw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng: upgrade to 1.6.30
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
X-List-Received-Date: Mon, 24 Jul 2017 10:08:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Mon, Jul 24, 2017 at 10:12:16AM +0100, Burton, Ross wrote:
>Fails on beaglebone:
>
>../libpng-1.6.30/arm/../pngpriv.h:476: Error: bad instruction `typedef unsigned long png_ptruint'
>
>Ross

Will fix this one and resend it.  

>>On 20 July 2017 at 12:51, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    1.6.29 -> 1.6.30
>>
>>        No changes in License.The license checksums changed because of
>>            update in Copyright dates in LICENSE and png.h files.

Best Regards,
Maxin

