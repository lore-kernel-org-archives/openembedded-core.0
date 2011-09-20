Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R64ra-0006fZ-V0
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 20:16:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 11:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50769603"
Received: from unknown (HELO [10.255.14.170]) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 11:10:52 -0700
Message-ID: <4E78D72C.2000709@linux.intel.com>
Date: Tue, 20 Sep 2011 11:10:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316507540.git.anders@chargestorm.se>
In-Reply-To: <cover.1316507540.git.anders@chargestorm.se>
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
X-List-Received-Date: Tue, 20 Sep 2011 18:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2011 01:32 AM, Anders Darander wrote:
>
> openSUSE has moved several of it's projects from gitorious to github. Lately,
> these has become unfetchable from gitorius, thus the SRC_URI fixes are needed
> also for the upcoming yocto release.
>
> No other changes are included, SRCREV's are kept the same.
>
> The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:
>
>    freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core opensuse-fixes
>    https://github.com/darander/oe-core/tree/opensuse-fixes
>
> Anders Darander (3):
>    libzypp: git repo moved to github
>    sat-solver: git repo moved to github
>    zypper: git repo moved to github
>
>   meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
>   meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
Do these need PR Bumps?

Sau!


