Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SuV5g-0004Aa-Hc
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:55:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 13:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171909095"
Received: from unknown (HELO [10.7.198.152]) ([10.7.198.152])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 13:43:52 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1343331612.7600.19.camel@ted>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
	<1343331612.7600.19.camel@ted>
Date: Thu, 26 Jul 2012 13:44:43 -0700
Message-Id: <1343335483.4888.3.camel@joshua-dell-xps.jf.intel.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 (2.12.3-19.el5) 
Subject: Re: Package recipes change proposal (system-wide) - name	wise
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
X-List-Received-Date: Thu, 26 Jul 2012 20:55:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On Thu, 2012-07-26 at 20:40 +0100, Richard Purdie wrote:
> On Wed, 2012-07-25 at 07:23 +0000, Iorga, Cristian wrote:
> > For me, having the version number contained in the name of package recipe is a little bit puzzling.
> > For example: libpcre/libpcre_8.31.bb
> > 
> > Is there a solid technical reason to not have it like this?
> > 
> > libpcre/libpcre.bb
> > and inside the recipe to have a PV variable defined:
> > PV="8.31"
> 
> FWIW, you can do that and it will just work, even today. Its just not
> the convention we've "grown up" with.
> 
> > In that case, the upgrade/update process would not involve performing a "git move" operation.
> > In my opinion, this "git move" operation is something to be avoided, as it puzzles a little bit the versioning system and complicates the review process.
> > 
> > Of course, some changes in the bitbake system would be involved, but I guess would not be too complicated.
> > Also, there will be a volume of work to be performed for changing the name of recipes and adding the PV variable inside the recipe.
> > But I guess that a script could solve that, followed by some manual review.
> 
> The original idea was that updating to new versions was easy, it was a
> mv operation. The checksums have of course complicated this idea but the
> principle still applies. It also lets you see versions without having to
> view the files themselves which I know I personally find very useful.
> 
> Also, as others have mentioned, git can detect move operations if you
> tell it to.

FYI the create-pull-request script passes -M40 to git format-patch,
which tells git to:

"should consider a delete/add pair to be a rename if more than 40% of
the file hasn’t changed."

Though with the size of some recipes perhaps the -M value should be
increased, or not passed at all?

Joshua



