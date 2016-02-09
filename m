Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCD46FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:40:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 09 Feb 2016 07:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="45009684"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.26.146])
	by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2016 07:40:52 -0800
Message-ID: <1455032452.6918.13.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Philip Balister <philip@balister.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2016 15:40:52 +0000
In-Reply-To: <56B9FCA8.7010303@balister.org>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
	<1454885003.27087.344.camel@linuxfoundation.org>
	<1454944971.3396.8.camel@linux.intel.com>
	<56B9FCA8.7010303@balister.org>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: Stable branch rules [Was: Re: [PATCH][jethro] glibc-locale: fix QA warning]
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
X-List-Received-Date: Tue, 09 Feb 2016 15:40:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-09 at 09:50 -0500, Philip Balister wrote:
> On 02/08/2016 10:22 AM, Joshua G Lock wrote:
> > On Sun, 2016-02-07 at 22:43 +0000, Richard Purdie wrote:
> > > On Sun, 2016-01-31 at 11:55 -0800, Armin Kuster wrote:
> > > > From: Armin Kuster <akuster@mvista.com>
> > > > 
> > > > WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd
> > > > -in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which
> > > > is
> > > > the
> > > > same as the user running bitbake. This may be due to host
> > > > contamination [host-user-contaminated]
> > > > 
> > > > fix type
> > > > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > > ---
> > > >  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Enough is enough.
> > > 
> > > I cannot tell whether these patches are in master or not or
> > > whether
> > > master needs them or not. Master needs this one, its not in
> > > master,
> > > its
> > > only being proposed for jethro. Its a mess.
> > > 
> > > I am therefore not taking any more stable branch patches at all
> > > until
> > > we amend the stable branch rules to state that pull requests and
> > > patches clearly state which branches need a fix, or clearly state
> > > why
> > > they don't.
> > 
> > I made an attempt at starting to documenting that requirement:
> > https://wiki.yoctoproject.org/wiki/index.php?title=Stable_branch_ma
> > inte
> > nance&diff=17480&oldid=17028
> > 
> > 'Patches' welcome.
> 
> Does this belong on the Yocto Project or OpenEmbedded wikis? Hunting
> both is getting annoying.

I edited the guidelines where they currently exist. I'll be more than
happy to move this to the OE wiki, but I'd rather do that once we have
something that people can agree.

Regards,

Joshua

