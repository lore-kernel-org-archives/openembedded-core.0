Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A3E7D71A81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 18:13:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 14 Apr 2017 11:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,199,1488873600"; d="scan'208";a="1155992220"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.126])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2017 11:13:03 -0700
Message-ID: <1492194041.27873.4.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 14 Apr 2017 13:20:41 -0500
In-Reply-To: <7b44de40-fe30-474b-620f-4efec4bf5cac@windriver.com>
References: <655290B7709079438B7932553958E60D16D199CA@ESS-EX01.essvote.corp.local>
	<7b44de40-fe30-474b-620f-4efec4bf5cac@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Handling of users in multiple recipes.
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
X-List-Received-Date: Fri, 14 Apr 2017 18:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-14 at 12:52 -0500, Mark Hatle wrote:
> On 4/14/17 11:49 AM, Davis, Michael wrote:
> > I have a user that is added in a recipe using inherit useradd.
> > 
> > Previously in Morty I was able to include that recipe as a dependency to other
> > recipes and chown files to that user during do_install.
> > 
> > In checking at master in prep for 2.3 I noticed those recipes no longer work
> > stating the user is invalid.
> > 
> 
> A patch for this issue was added yesterday to oe-core.  I'm not sure if it has
> been merged to master, but should be soon if it has not already been.
> 
> Search the list archives for "base-passwd/useradd: Various improvements to
> useradd with RSS".

Right, in the other hand, the scenario  you are indicating is basically
the same as described in bug 7724
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=7724)

and confirmed that the patch worked.

Leo



> 
> --Mark
> 
> > 
> > Is there a new mechanism in place to handle this use case or am I going to have
> > to find some sort of other work around?
> > 
> >  
> > 
> > Thanks,
> > 
> > Mike
> > 
> >  
> > 
> >  
> > 
> >  
> > 
> > 
> > 
> 



