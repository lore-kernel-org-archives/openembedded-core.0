Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 864E1704B4;
	Mon, 14 Jul 2014 12:22:13 +0000 (UTC)
Received: from [69.196.158.250] (port=46651 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6fGn-0006QH-UF; Mon, 14 Jul 2014 08:22:13 -0400
Date: Mon, 14 Jul 2014 08:22:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2532084.Gn1ogpR50R@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1407140821380.21204@localhost>
References: <alpine.LFD.2.11.1407101115390.10701@localhost>
	<3833732.EFEfTvAqk5@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140736060.12986@localhost>
	<2532084.Gn1ogpR50R@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] any value in keeping the backward compat "task-core" stuff?
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
X-List-Received-Date: Mon, 14 Jul 2014 12:22:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Paul Eggleton wrote:

> On Monday 14 July 2014 07:39:23 Robert P. J. Day wrote:
> > On Mon, 14 Jul 2014, Paul Eggleton wrote:
> > > On Friday 11 July 2014 20:39:04 Otavio Salvador wrote:
> > > > On Thu, Jul 10, 2014 at 12:21 PM, Robert P. J. Day
> > > >
> > > > <rpjday@crashcourse.ca> wrote:
> > > > >   a number of the current packagegroup recipe files still have
> > > > >
> > > > > backward compatibility support for the old "task-core" names, seems
> > > > > like that's been there for well over a year, would it be safe to
> > > > > finally just toss that? seems like everyone's had enough time to make
> > > > > the move to the new names, and it would be clearer to not confuse the
> > > > > proper use of the word "task" these days.
> > > >
> > > > I agree; however this question should also be send to oe-core mailing
> > > > list (added in Cc)
> > >
> > > I agree as well; these should go. I know there are some who want to
> > > keep these indefinitely for upgrade purposes, but I think there's a
> > > limit to how long they should stay around in OE-Core. They can
> > > always be preserved in bbappends for those that do want to keep
> > > them.
> >
> >   one more (general) question about this ... there's a fair bit of
> > this task/packagegroup backward compatibility stuff under the meta-oe
> > layer as well. i assume that patches to the meta-oe layer should still
> > be posted to this list, but have a subject line of:
> >
> >   [meta-oe][PATCH] ...
> >
> > correct? as in, two separate patches.
>
> To be clear (since we're cross-posted to two lists in this thread)
> OE-Core patches go to the openembedded-core list, meta-oe patches to
> the openembedded- devel list.

  ah, gotcha, will fix.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

