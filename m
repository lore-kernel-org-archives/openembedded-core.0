Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B9BF66013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 08:57:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2015 01:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,393,1422950400"; d="scan'208";a="664716264"
Received: from bonchen-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.183])
	by orsmga001.jf.intel.com with ESMTP; 13 Mar 2015 01:57:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 13 Mar 2015 08:57:35 +0000
Message-ID: <1782246.kyus0MKleI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1426189532.3602.9.camel@intel.com>
References: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
	<1687842.XY6UoZ3apI@peggleto-mobl5.ger.corp.intel.com>
	<1426189532.3602.9.camel@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Fri, 13 Mar 2015 08:57:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 March 2015 20:45:32 Patrick Ohly wrote:
> On Thu, 2015-03-12 at 18:21 +0000, Paul Eggleton wrote:
> > On Monday 09 March 2015 13:56:39 Patrick Ohly wrote:
> > > +# global options
> > > +[DEFAULT]
> > > +
> > > +# Add 'Signed-off-by' to all commits that get imported automatically.
> > > +signoff = True
> > > +
> > > 
> > >  # component name
> > >  [bitbake]
> > >  # mandatory options
> > 
> > So I'm OK with adding this in as an option. However to me a name like
> > DEFAULT implies you're establishing a general section to apply default
> > settings for all components where the component can override those
> > defaults if it chooses, which doesn't really represent what this does -
> > so a different name might be more appropriate (GLOBAL or _global_
> > perhaps?)
> 
> "DEFAULT" is the special string that Python's ConfigParser uses, well,
> by default for that special section which does not show up in the list
> of sections. I don't know how to rename that.
> 
> I'm probably abusing this concept a bit here: it seems that special
> section is meant to provide default values that get returned also for
> the other sections when they don't have their own value.
> 
> Here's a cleaner solution:
>       * Get rid of the [DEFAULT] section in the file.
>       * When reading it, on-the-fly prepend the string
>         '[this-is-not-really-a-repo'].
>       * When reading global properties, get it from that section.
>       * When listing sections to find repos, ignore it.
> 
> How about that?

Hmm, ok, I wasn't aware of this built-in "DEFAULT" section behaviour. A simple 
solution then would just be to make this setting per-component and keep the 
DEFAULT usage in the example config - although I do realise it's unlikely to be 
very useful on a per-component basis, at least it will work in the same way as 
other values we read from there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

