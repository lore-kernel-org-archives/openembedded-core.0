Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFpr9-00078S-2H
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:48:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2012 09:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138101746"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2012 09:38:41 -0700
Message-ID: <4F7DCA91.8090906@linux.intel.com>
Date: Thu, 05 Apr 2012 09:38:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333642153.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333642153.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/3] dexuan: build appliance: install xterm into the target [Apr 6, 2012]
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
X-List-Received-Date: Thu, 05 Apr 2012 16:48:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 09:10 AM, Dexuan Cui wrote:
> The following changes since commit a8b5a3ed58d2a136867fc55b53443b59557c6459:
>
>    self-hosted-image: use the correct location of the file sudoers (2012-04-05 12:01:31 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/self
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self
>
> Dexuan Cui (3):
>    libxaw: move it from meta-demoapps/ into meta/ and upgrade it to
>      1.0.10
>    xterm: port the recipe from OE and upgrade to v278
>    task-self-hosted: install xterm into the target
>
>   meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
>   meta/recipes-graphics/xorg-app/xterm_278.bb        |   25 ++++++++++++++++++++
>   .../recipes-graphics/xorg-lib/libxaw_1.0.10.bb     |   15 +++++------
>   3 files changed, 34 insertions(+), 9 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-app/xterm_278.bb
>   rename meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb =>  meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb (59%)
>
I am not sure adding xterm to oe-core at this point is the right answer, 
it might be better to look at the root cause which maybe hob using a 
hard-coded xterm instead of trying to determin what terminal is available.

Sau!



