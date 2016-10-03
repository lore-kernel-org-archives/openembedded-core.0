Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC66719C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:09:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 03 Oct 2016 09:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,438,1473145200"; d="scan'208";a="1059851073"
Received: from kgmeyer-mobl3.amr.corp.intel.com ([10.255.79.230])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2016 09:09:32 -0700
Date: Mon, 3 Oct 2016 09:09:32 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161003160932.GA17161@kgmeyer-mobl3.amr.corp.intel.com>
References: <20161003004307.824-1-stephano.cetola@linux.intel.com>
	<20161003004307.824-2-stephano.cetola@linux.intel.com>
	<CAJTo0LZ51i2rAE=poK94vjYqWDJ3MBA6_Fxfw0fk+=WjgjxY7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ51i2rAE=poK94vjYqWDJ3MBA6_Fxfw0fk+=WjgjxY7w@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] sanity: add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 16:09:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/03, Burton, Ross wrote:
> On 3 October 2016 at 01:43, Stephano Cetola <stephano.cetola@linux.intel.com
> > wrote:
> 
> > +# If the user hasn't set up their name/email, set some defaults
> > +check_git_config() {
> > +       if [ -z "$1" ]; then
> > +               name="OE"
> > +       else
> > +               name="$1"
> > +       fi
> > +       if ! git config user.email > /dev/null ; then
> > +               git config --local user.email "${name}@${DISTRO}"
> > +       fi
> > +       if ! git config user.name > /dev/null ; then
> > +               git config --local user.name "${name}"
> > +       fi
> > +}
> >
> 
> Instead of embedding this into sanity.bbclass, could it just go into
> meta/lib/oe/ somewhere?
> 
> Ross


Yeah, I saw /meta/lib/oe/patch when Paul mentioned it. It looks like
things should be moving in this direction log-term anyhow. I could
move this to patch.py for now, and then submit a bug to move
functionality as well, if that's the direction we'd want to go.

Cheers,
Stephano

