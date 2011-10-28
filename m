Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RJdKW-0006Yn-LE
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:42:04 +0200
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LTR00IV18JSA6GT@vms173001.mailsrvcs.net>; Thu,
	27 Oct 2011 21:35:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2590414AF5D; Thu,
	27 Oct 2011 22:35:52 -0400 (EDT)
Date: Thu, 27 Oct 2011 22:35:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111028023552.GR15391@denix.org>
References: <E1RJWkv-0001RX-LN@happy.bec-systems.com>
	<20111027210911.GM15391@denix.org>
	<CAOd_LFw0kBsf-NDpUQ-rUHxYP+v_5Ff3nuSNTUK3QuSrB5_eHw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOd_LFw0kBsf-NDpUQ-rUHxYP+v_5Ff3nuSNTUK3QuSrB5_eHw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: "angstrom-distro-devel@linuxtogo.org"
	<angstrom-distro-devel@linuxtogo.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Changelog for 2011-10-17 to 2011-10-24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2011 03:42:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 27, 2011 at 10:06:32PM -0400, Cliff Brake wrote:
> On Thursday, October 27, 2011, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Thu, Oct 27, 2011 at 04:40:53PM -0400, cliff.brake@gmail.com wrote:
> >> Changelog for 2011-10-17 to 2011-10-24.  Projects included in this
> report:
> >
> > FYI, I think you have a bug in your scripts, where it misses commits made
> on
> > Monday, that were not included in the previous ChangeLog and they are
> being
> > skipped in this one...
> 
> Can you give me an example of a commit that got missed and I'll debug?

Well, it's not like I specifically verify that all my patches get mentioned in 
the ChangeLog... :) But just glancing over it struck me that only u-boot 
related ones were listed:

Changelog for meta-texasinstruments:
Denys Dmytriyenko (3):
  u-boot-2011.10rc: update to cover ti33x SOC boards, not just beaglebone
  u-boot 2011.10rc: update with latest rev and new SRC_URI
  u-boot 2011.10rc: update to the latest revision

So, I checked the previous ChangeLog and couldn't find others from the same 
series, such as:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=2c8dcc2a8c16792c8a765a70109cc2462b83018e
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=3b5eced12a10a3809f60df256b8f952c2286af4d
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=98cca8ea1d324a1a59b7d96838952a579c72b419

While, of course, the commits in question are still there, your ChangeLogs 
provide additional informational benefits to the Community. So, I figured, you 
might want to fix that small issue in the script to make it even better... :)


> > Also, can you please include meta-ti@yoctoproject.org as the official
> mailing
> > list for meta-ti/meta-texasinstruments BSP layer. Thanks.
> 
> Ill look into something like that.  We currently don't have any type of
> email field, but something could be added.

No, I meant to add it to the distribution list, i.e. send future ChangeLogs 
also to meta-ti@yoctoproject.org mailing list, along with oe-core, oe-dev and 
angstrom lists. Unless you think it's overkill. Thanks.

-- 
Denys


