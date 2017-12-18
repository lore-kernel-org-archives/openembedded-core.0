Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D297071C71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 15:16:35 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 07:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,422,1508828400"; 
   d="scan'208";a="2728896"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2017 07:16:35 -0800
Date: Mon, 18 Dec 2017 17:16:13 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20171218151613.GA24438@mbabyjoh-desk.ger.corp.intel.com>
References: <1512652937-15773-1-git-send-email-maxin.john@intel.com>
	<1512838668.19417.119.camel@linuxfoundation.org>
	<1512839873.19417.120.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1512839873.19417.120.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] i2c-tools: upgrade to 4.0
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
X-List-Received-Date: Mon, 18 Dec 2017 15:16:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi RP,

On Sat, Dec 09, 2017 at 05:17:53PM +0000, Richard Purdie wrote:
> On Sat, 2017-12-09 at 16:57 +0000, Richard Purdie wrote:
> > On Thu, 2017-12-07 at 15:22 +0200, Maxin B. John wrote:
> > > 
> > > Update the SRC_URI to point to kernel.org location where
> > > i2c-tools is hosted these days.
> > > 
> > > Remove Modules.mk since it was used for deprecated binaries
> > > (eepromer, eeprom)
> > > 
> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > ---
> > >  meta/recipes-devtools/i2c-tools/files/Module.mk    | 72 ----------
> > > --
> > > ----------
> > >  .../{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb}       | 14 ++---
> > >  2 files changed, 5 insertions(+), 81 deletions(-)
> > >  delete mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
> > >  rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.2.bb => i2c-
> > > tools_4.0.bb} (64%)
> > Fails on musl sadly:
> > 
> > https://autobuilder.yocto.io/builders/nightly-musl/builds/643/steps/B
> > uildImages/logs/stdio
> 
> and on glibc qemux86-64:
> 
> https://autobuilder.yocto.io/builders/nightly-world/builds/622

Sorry for the delay in reply. 

> Build race?

Exactly! . It was partly fixed in upstream recently. Will include those fixes and
send a v2 soon.

https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=a6a59693066fd8da81f7107479df3e32a129247d
https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=08b0d67ba7eceb862cb17f52eb1911e9579726ea

> Cheers,
> Richard

Best Regards,
Maxin

