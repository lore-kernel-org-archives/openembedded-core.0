Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R6G7z-0003gn-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 08:17:51 +0200
Received: from ad.chargestorm.se (85.231.30.150) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Wed, 21 Sep 2011 08:12:32 +0200
Date: Wed, 21 Sep 2011 08:12:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110921061242.GA3839@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1316507540.git.anders@chargestorm.se>
	<4E78D72C.2000709@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4E78D72C.2000709@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 0/3] [oe-core & yocto RC] Fix unfetchable zypp-related packages
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
X-List-Received-Date: Wed, 21 Sep 2011 06:17:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Saul Wold <sgw@linux.intel.com> [110920 20:11]:
> On 09/20/2011 01:32 AM, Anders Darander wrote:

> > openSUSE has moved several of it's projects from gitorious to github. Lately,
> > these has become unfetchable from gitorius, thus the SRC_URI fixes are needed
> > also for the upcoming yocto release.

> > No other changes are included, SRCREV's are kept the same.

> >    sat-solver: git repo moved to github
> >    zypper: git repo moved to github

> >   meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
> >   meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
> >   meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)

> Do these need PR Bumps?

No, nothing the in the source or the generated package should differ.
We're still checking out the same SRCREV from the git repo, it's just
the location of the git repo that has been changed.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


