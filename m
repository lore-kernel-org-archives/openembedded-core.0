Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QKDWH-000053-Kg
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:48:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2011 10:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,353,1301900400"; 
   d="scan'208";a="978585"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2011 10:45:34 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2011 10:45:28 -0700
In-Reply-To: <BANLkTinh1L9sn+F6nAJ9DvJ4DWtAuOLamg@mail.gmail.com>
References: <BANLkTik-WKWNkvyLtvh-CEtD2e4qa8EcGQ@mail.gmail.com>
	<1305121270.30391.359.camel@rex>
	<BANLkTinh1L9sn+F6nAJ9DvJ4DWtAuOLamg@mail.gmail.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305135934.1988.3.camel@scimitar>
Mime-Version: 1.0
Subject: Re: How does openembedded-core-contrib/master relate to openembedded-core/master?
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
X-List-Received-Date: Wed, 11 May 2011 17:48:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 19:22 +0200, Leon Woestenberg wrote:
> Hello Richard,
> 
> On Wed, May 11, 2011 at 3:41 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-05-11 at 14:37 +0200, Leon Woestenberg wrote:
> >> how does the master branch of openembedded-core-contrib relate to the
> >> master branch of openembedded-core?
> >>
> >> Is -core-contrib tracking -core 1-to-1?
> >
> >> My first feature branch (likewise/gnuspe) was cloned from, branched,
> >> and pushes against openembedded-core-contrib, is that the correct
> >> approach?
> >
> > The pull request you sent looked fine. This only works if that master
> > branch is kept in sync with the main repo though.
> >
> which was exactly why I wrote this email. Thanks for confirming my concerns.
> 
> 
> So the safer way would be to create a feature branch on core-contrib,
> that however is (re)based on core.
> 
> Should I clone core, then create a feature branch that I push to core-contrib?
> Should I clone core-contrib, then rebase against core, then create a
> feature branch that I push to core-contrib?

Yeah, the way to do this is with git remotes. A basic work-flow is as
follows:

$ git clone ssh://git@git.openembedded.net/openembedded-core
cd openembedded-core
$ git remote add contrib
ssh://git@git.openembedded.net/openembedded-core-contrib
$ git branch my-name/my-work
$ git checkout my-name/my-work
<some work and commits on my-name/my-work>
$ git push contrib my-name/my-work
$ ./scripts/create-pull-request -b my-name/my-work

https://wiki.yoctoproject.org/wiki/Poky_Contributions#Git_workflow

HTH,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



