Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 83C876AC28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 12:04:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 05:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="495022434"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2015 05:04:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 18 May 2015 13:04:04 +0100
Message-ID: <1616768.92EeT3bkJG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAP9ODKqzPP=wSQFxO+0E1XFjbd6rZfqo_GZbQYzNgYEFpAzKuw@mail.gmail.com>
References: <55555B65.80600@windriver.com>
	<2117516.tkUI32xNOp@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqzPP=wSQFxO+0E1XFjbd6rZfqo_GZbQYzNgYEFpAzKuw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Mon, 18 May 2015 12:04:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 18 May 2015 08:52:04 Otavio Salvador wrote:
> On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > Hi Robert,
> > 
> > On Monday 18 May 2015 09:52:50 Robert Yang wrote:
> >> On 05/17/2015 05:34 AM, Richard Purdie wrote:
> >> > On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
> >> >> Is is useful/possible if we add something like bitbake <recipe>
> >> >> -cmenuconfig, just like kernel's make menuconfig ?
> >> >> 
> >> >> We can use the menuconfig to config the vars such as MACHINE, DL_DIR,
> >> >> DISTRO_FEATURES, MACHINE_FEATURES and all the variables which are
> >> >> configurable, I think that this would help the newbie a lot.
> >> >> 
> >> >> I think that we can add a menuconfig.bbclass (or other names) to do
> >> >> this,
> >> >> and I'd like to work on it.
> >> > 
> >> > Why would you want to specify a <recipe> when configuring MACHINE? I
> >> > understand why you're thinking this but it isn't well thought out and
> >> > in
> >> > this form would confuse users more than help them.
> >> > 
> >> > I don't think the system will even parse without a valid MACHINE, let
> >> > alone execute tasks.
> >> 
> >> I meant that we need something to help configure the build easier, it
> >> can generate something like local.conf.append, not configure the recipe.
> >> 
> >> The example "bitbake <recipe> -cmenuconfig" wasn't right enough, it's
> >> just a rough thought, we can use the current default local.conf
> >> (MACHINE = qemux86) to make system parse.
> >> 
> >> The problem is that we have many bbclasses in oe-core, a lot of them
> >> has specify configurations, and also a lot of vars in the conf file such
> >> as bitbake.conf, it's not easy to know how and what to config,
> >> especially,
> >> for newbies. The "bitbake -cmenuconfig" maybe not a good idea, I think
> >> that
> >> we need something to help config the build (generate local.conf) easier,
> >> do you have any suggestions, please ?
> > 
> > This is likely the direction we will be going in with the Toaster web UI -
> > with a web-based tool we can present a much friendlier interface and have
> > the chance to link to other information, for example we can link to the
> > appropriate manual section for individual variables (and in future error
> > messages, classes, etc.), analyse the output of the build, manage
> > multiple sets of configuration, etc. These are things that would be
> > difficult to do practically from the command line.
> 
> Toaster is nice but we shouldn't stop improving cmdline use as the
> first won't work for some use-cases.

Sure, I'm pointing out that this kind of thing is being worked on in a 
slightly different context, it's not that nothing is being done in this area.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

