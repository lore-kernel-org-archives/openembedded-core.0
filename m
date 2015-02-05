Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Feb 2015 17:49:00 UTC
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8147760169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:49:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,525,1418083200"; d="scan'208";a="111514761"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 05 Feb 2015 17:42:08 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1YJQRM-00021n-AM; Thu, 05 Feb 2015 17:42:08 +0000
Date: Thu, 5 Feb 2015 17:42:08 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150205174208.GA7735@mcrowe.com>
References: <1423155741-7715-1-git-send-email-mac@mcrowe.com>
	<CAJTo0LZpT+RGH7zzMs56UVBh1im3YkQvovxWJtW5ZL8Gdzex0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZpT+RGH7zzMs56UVBh1im3YkQvovxWJtW5ZL8Gdzex0A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Thu, 05 Feb 2015 17:49:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 05 February 2015 at 17:38:07 +0000, Burton, Ross wrote:
> On 5 February 2015 at 17:02, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > ${bindir} and ${base_bindir} may be the same. If they are don't try and
> > move files onto themselves.
> >
> 
> Funnily enough I did the same fix last week but didn't send it to the list
> yet as I needed to rewrite the message.
> 
> Can you update this to change both versions of sed?

Oh, I spotted there were two versions of sed but managed to forget that by
the time I'd tested the patch. :(

I'll send an updated patch.

Thanks.

Mike.

