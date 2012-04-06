Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzqv-0007Md-Ta
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:28:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85936516"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 20:19:32 -0700
Message-ID: <4F7E60C4.1000609@linux.intel.com>
Date: Thu, 05 Apr 2012 20:19:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] Fixes for self-hosted-image v3
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
X-List-Received-Date: Fri, 06 Apr 2012 03:28:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 10:51 AM, Paul Eggleton wrote:
> Rebase my earlier patch and add a fix for Yocto bug #2208. Note that I
> have included Dexuan's fix for the sudoers file path to avoid conflicts.
>
>
> The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:
>
>    self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:11 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/self
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/self
>
> Dexuan Cui (1):
>    self-hosted-image: use the correct location of the file sudoers
>
> Paul Eggleton (2):
>    self-hosted-image: decrease reserved space to 0.5%
>    self-hosted-image: use Clearlooks theme
>
>   meta/recipes-core/images/self-hosted-image.bb |   13 +++++++++++--
>   meta/recipes-core/tasks/task-self-hosted.bb   |    3 ++-
>   2 files changed, 13 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


