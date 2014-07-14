Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AFB1070194;
	Mon, 14 Jul 2014 12:15:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jul 2014 05:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="561475884"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2014 05:14:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Jul 2014 13:14:56 +0100
Message-ID: <2532084.Gn1ogpR50R@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1407140736060.12986@localhost>
References: <alpine.LFD.2.11.1407101115390.10701@localhost>
	<3833732.EFEfTvAqk5@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1407140736060.12986@localhost>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 14 Jul 2014 12:15:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 14 July 2014 07:39:23 Robert P. J. Day wrote:
> On Mon, 14 Jul 2014, Paul Eggleton wrote:
> > On Friday 11 July 2014 20:39:04 Otavio Salvador wrote:
> > > On Thu, Jul 10, 2014 at 12:21 PM, Robert P. J. Day
> > > 
> > > <rpjday@crashcourse.ca> wrote:
> > > >   a number of the current packagegroup recipe files still have
> > > > 
> > > > backward compatibility support for the old "task-core" names, seems
> > > > like that's been there for well over a year, would it be safe to
> > > > finally just toss that? seems like everyone's had enough time to make
> > > > the move to the new names, and it would be clearer to not confuse the
> > > > proper use of the word "task" these days.
> > > 
> > > I agree; however this question should also be send to oe-core mailing
> > > list (added in Cc)
> > 
> > I agree as well; these should go. I know there are some who want to
> > keep these indefinitely for upgrade purposes, but I think there's a
> > limit to how long they should stay around in OE-Core. They can
> > always be preserved in bbappends for those that do want to keep
> > them.
> 
>   one more (general) question about this ... there's a fair bit of
> this task/packagegroup backward compatibility stuff under the meta-oe
> layer as well. i assume that patches to the meta-oe layer should still
> be posted to this list, but have a subject line of:
> 
>   [meta-oe][PATCH] ...
> 
> correct? as in, two separate patches.

To be clear (since we're cross-posted to two lists in this thread) OE-Core 
patches go to the openembedded-core list, meta-oe patches to the openembedded-
devel list.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

