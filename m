Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B528065CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:01:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2016 16:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,408,1455004800"; d="scan'208";a="773433398"
Received: from nsisa-mobl1.amr.corp.intel.com ([10.255.70.47])
	by orsmga003.jf.intel.com with ESMTP; 28 Mar 2016 16:01:43 -0700
Message-ID: <1459206103.18406.124.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 16:01:43 -0700
In-Reply-To: <1459204429.21672.15.camel@linuxfoundation.org>
References: <1459188436-13411-1-git-send-email-sgw@linux.intel.com>
	<1459204429.21672.15.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: "jianxun.zhang@intel.com" <jianxun.zhang@intel.com>
Subject: Re: [PATCH] xf86-video-intel: Add UXA PACKAGECONFIG and 20-intel.conf
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
X-List-Received-Date: Mon, 28 Mar 2016 23:01:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 23:33 +0100, Richard Purdie wrote:
> On Mon, 2016-03-28 at 11:07 -0700, Saul Wold wrote:
> > 
> > This patch adds the UXA Packageconfig option to handle older Intel
> > Graphics
> > the uxa code when enabled needs a patch from upstream due to a
> > change
> > in the
> > API of the Xserver.
> > 
> > Also added a generic 20-intel.conf with a commented line to enable
> > the uxa
> > AccelMethod option.
> > 
> > The Packageconfig only needs to be enabled in genericx86-64 since
> > other
> > MACHINE configs (such as meta-intel) include the VAAPI acceleration
> > that
> > handle the graphics hardware corretly.
> This doesn't really look right to me. It makes the driver MACHINE
> specific which is generally bad and will fail various tests. You
> likely
> need to detect this at runtime on the relevant hardward and enable
> if/as/when needed.
> 
Yeah, I had a thought that this might cause a MACHINE specific issue,
but wanted to get eyes on the issue.

Your right this could be another example of where the Runtime Machine
Config could help, I will add it to Jianxun's list.

> Is there some way that X can correctly autodetect what its running on
> and do the right thing without requiring manual config? The fact
> we're
> having to do that seems to fly in the face of the "configurationless"
> goals X has had more recently...
> 
Unfortunately X will start correctly with the newer AccelMethod which
this particular hardware does not handle well.

Let's hold off on this patch for now, we understand that basics, better
than we did yesterday and can get it logged in the Bug.

Sau!


> Cheers,
> 
> Richard

