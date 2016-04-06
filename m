Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 005C97328A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:05:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Apr 2016 01:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="926489181"
Received: from mbabyjoh-mobl.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2016 01:05:14 -0700
Date: Wed, 6 Apr 2016 11:05:55 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160406080554.GA17261@mbabyjoh-desk.ger.corp.intel.com>
References: <1459878277-9734-1-git-send-email-maxin.john@intel.com>
	<1459890305.7348.171.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1459890305.7348.171.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] useradd.bbclass: remove user/group created by the package in clean* task
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
X-List-Received-Date: Wed, 06 Apr 2016 08:05:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Tue, Apr 05, 2016 at 10:05:05PM +0100, Richard Purdie wrote:
> On Tue, 2016-04-05 at 20:44 +0300, Maxin B. John wrote:
> > At present, if a recipe is built which creates users/groups via
> > useradd.bbclass, those users/groups are not removed from sysroot
> > when the recipe/package is cleaned using clean/cleansstate/cleanall
> > or when a recipe is rebuild and 'unstaged' from the the sysroot.
> > 
> > The "userdel_sysroot_sstate()" provides that functionality.
> > 
> > [YOCTO #9262]
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/classes/sstate.bbclass  |  6 ++++++
> >  meta/classes/useradd.bbclass | 26 ++++++++++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> 
> This patch looks the same as v2? Did you see my second comment?

My aplogies. Haven't seen the second comment last time. Will resend the updated one.  

> Cheers,
> 
> Richard

Best Regards,
Maxin

