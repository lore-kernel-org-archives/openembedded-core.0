Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 978426012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:21:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="608008604"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2015 04:21:34 -0800
Date: Fri, 27 Nov 2015 14:22:52 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151127122252.GB26454@mbabyjoh-mobl.fi.intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<CAP9ODKq4R9UT2oL_vMALhCA_ocqCSxJoegCa_WEgy0Xj9xFT5A@mail.gmail.com>
	<20151127111932.GC17303@jama>
MIME-Version: 1.0
In-Reply-To: <20151127111932.GC17303@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Use libjpeg-turbo in place of libjpeg
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
X-List-Received-Date: Fri, 27 Nov 2015 12:21:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Nov 27, 2015 at 12:19:32PM +0100, Martin Jansa wrote:
> On Fri, Nov 27, 2015 at 09:13:22AM -0200, Otavio Salvador wrote:
> > On Fri, Nov 27, 2015 at 9:04 AM, Maxin B. John <maxin.john@intel.com> wrote:
> > > This patch set provides libjpeg-turbo as a drop-in replacement for libjpeg.
> > >
> > > libjpeg-turbo is a fork of the original libjpeg project.Most of the major Linux
> > > distros (Fedora, Debian, OpenSUSE) moved from libjpeg to libjpeg-turbo recently.
> > > lbjpeg-turbo provides better JPEG compression/decompression(at least 25% faster)
> > > while maintaining same API/ABI as libjpeg.
> > >
> > > Once we reach an agreement on this, based on the decision, we can move the
> > > libjpeg package to meta-oe for applications which may depend on API version 9.
> > 
> > I support this change, due:
> > 
> >  - agreement with major Linux distros
> >  - performance improvement
> > 
> > I also think moving libjpeg (API version 9) for meta-oe is fine as
> > well. I am not aware of any application which requires it, though.
> 
> I'm not aware of any as well, so I would prefer to drop libjpeg
> completely.
> 
> + less junk in meta-oe
> + people were confused about multiple jpeg providers before, now they
> would be again, but without good reason (as nobody knows about apps
> depending on libjpeg9).
>

Agree. In this case, I will send a patch to remove libjpeg-turbo from meta-oe.

> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Best Regards,
Maxin

