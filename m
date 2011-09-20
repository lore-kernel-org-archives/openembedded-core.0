Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R66Dk-0008MC-PA for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 21:43:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KJi3FR032217 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 20:44:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1nn+wu44VWKz
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 20:44:02 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KJhuSj032211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 20:44:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 20:37:42 +0100
In-Reply-To: <4E78D72C.2000709@linux.intel.com>
References: <cover.1316507540.git.anders@chargestorm.se>
	<4E78D72C.2000709@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316547468.14488.16.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] [oe-core & yocto RC] Fix unfetchable	zypp-related packages
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
X-List-Received-Date: Tue, 20 Sep 2011 19:43:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-20 at 11:10 -0700, Saul Wold wrote:
> On 09/20/2011 01:32 AM, Anders Darander wrote:
> >
> > openSUSE has moved several of it's projects from gitorious to github. Lately,
> > these has become unfetchable from gitorius, thus the SRC_URI fixes are needed
> > also for the upcoming yocto release.
> >
> > No other changes are included, SRCREV's are kept the same.
> >
> > The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:
> >
> >    freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)
> >
> > are available in the git repository at:
> >    git://github.com/darander/oe-core opensuse-fixes
> >    https://github.com/darander/oe-core/tree/opensuse-fixes
> >
> > Anders Darander (3):
> >    libzypp: git repo moved to github
> >    sat-solver: git repo moved to github
> >    zypper: git repo moved to github
> >
> >   meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
> >   meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
> >   meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> >
> Do these need PR Bumps?

No, since the generated output didn't change and with git, we can be
pretty sure we're building the same thing if the hashes match.

Cheers,

Richard



