Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28D9A6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:16:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2015 08:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; d="scan'208";a="831936355"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2015 08:15:24 -0800
Date: Tue, 1 Dec 2015 13:27:43 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151201112742.GA12531@mbabyjoh-mobl.fi.intel.com>
References: <1448875684-24516-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZO=xhvP5RS0hLn67aq2TVBBaQRG61K6+rzbxrV2LDyaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZO=xhvP5RS0hLn67aq2TVBBaQRG61K6+rzbxrV2LDyaQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Tue, 01 Dec 2015 16:16:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Dec 01, 2015 at 03:36:06PM +0000, Burton, Ross wrote:
On 30 November 2015 at 09:28, Maxin B. John <maxin.john@intel.com> wrote:
>> +PACKAGES =+ "jpeg-tools libturbojpeg"
>> +FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
>> +INSANE_SKIP_libturbojpeg = "dev-so"
>
>I don't understand why there's a libturbojpeg package solely for a development symlink that should be in $PN-dev.

We can move that to $PN-dev.

>Also, Martin pointed out that meta-oe's master-next has a 1.4.2 recipe, can you use that?

Oh, I didn't notice that. Will send a v3 with these changes.

>Ross

Best Regards,
Maxin

