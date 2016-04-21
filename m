Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9386E681
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:40:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Apr 2016 05:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="937192649"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.29.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2016 05:40:50 -0700
Message-ID: <1461242448.3571.4.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 21 Apr 2016 13:40:48 +0100
In-Reply-To: <alpine.LFD.2.20.1604210822220.6578@localhost.localdomain>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
	<CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
	<alpine.LFD.2.20.1604210822220.6578@localhost.localdomain>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 12:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-04-21 at 08:24 -0400, Robert P. J. Day wrote:
> On Thu, 21 Apr 2016, Burton, Ross wrote:
> > 
> > On 21 April 2016 at 13:06, Robert P. J. Day <rpjday@crashcourse.ca>
> > wrote:
> >         next bit of muttering is, "can we downgrade the OE build to
> > use
> >       rpm4-format packages?", which is not a path down which i want
> > to walk.
> > 
> > 
> > Assuming that the obviously correct option of "build the packages
> > inside OE" really is being written off for mysterious reasons, rpm4
> > was only just removed from oe-core (though depending on what
> > releases you're using you may have never noticed it be added and
> > removed again).  So you could just recover that from history
> > (oe-core a6e7a86f1635be9a688c56c25e9d215ea4d2cc84 removed it) and
> > fix it up.
>   under the circumstances, that sounds like the simplest approach.
> would we be losing any significant functionality downgrading to rpm4?
> it's not my first choice, but if all that's required is to do basic
> installs and upgrades, i suspect it will work just fine.

On the topic of RPM4 vs. RPM5 you should be able to find more details
in the list archives, I easily found a brief summary by Mark Hatle in
the Yocto Project mailing list archive:

"There are some specific uses of RPM 4 in the YP, but I do caution
against people just using it "because".  The RPM 5 version is generally
better suited for the embedded world.  (There are been posts on more
reasons on the oe-core lists in the past.  But as quick summary --
dynamic architecture support, better cross compilation support, cross-
endian support, more configurable for custom distributions, etc.)"
http://article.gmane.org/gmane.linux.embedded.yocto.general/28654/

We ended up removing RPM4 support because it was clear that it was
broken when using SMART as a package manager and we didn't have the
resources to fix it, nor any objections to its removal.

Some recent examples of the kinds of breakage:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8968
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8969

Regards,

Joshua

