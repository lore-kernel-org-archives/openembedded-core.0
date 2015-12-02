Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B38C2605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:26:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Dec 2015 05:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,373,1444719600"; d="scan'208";a="865004634"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2015 05:26:46 -0800
Date: Wed, 2 Dec 2015 10:39:07 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20151202083906.GA11041@mbabyjoh-mobl.fi.intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
	<CAP9ODKopbd5EhoyWnjg_Luj_ySB-ufSMXiH1wikOTuMD12aK8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKopbd5EhoyWnjg_Luj_ySB-ufSMXiH1wikOTuMD12aK8g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Wed, 02 Dec 2015 13:26:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi  Otavio,

On Wed, Dec 02, 2015 at 10:56:54AM -0200, Otavio Salvador wrote:
> On Wed, Dec 2, 2015 at 5:56 AM, Maxin B. John <maxin.john@intel.com> wrote:
> > Moving libjpeg-turbo from meta-oe as a replacement for libjpeg
> > package. libjpeg-turbo has same API/ABI as libjpeg. It is
> > relatively faster in JPEG compression/decompression than libjpeg.
> >
> > Changes in v2:
> > a) Squash the two libjpeg related commits into one
> >
> > Changes in v3:
> > a) Use libjpeg-turbo version 1.4.2
> > b) Build libjpeg-turbo with libjpeg v6b ABI which is commonly used
> > by other major distributions.
> >
> > [YOCTO #8628]
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> 
> Please move the Changes out of the commit log; you should send it
> adding it after --- so it is not applied.
>

Ok, will do that. Thanks!

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

Best Regards,
Maxin

