Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ri9Nz-0000iV-Ug
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 19:47:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 10:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102778906"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 10:39:36 -0800
Message-ID: <4F034B68.6080103@linux.intel.com>
Date: Tue, 03 Jan 2012 10:39:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325613367.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325613367.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1] v2 - POKY -> COREIMAGE
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
X-List-Received-Date: Tue, 03 Jan 2012 18:47:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2012 09:57 AM, Saul Wold wrote:
> Thanks to Phil for pointing out my Dyslexic COER
>
> Sau!
>
Please hold off on this patch until we get 1.1.1 completed, due to issue 
with the Autobuilder that will take longer to deal with.

Sau!

>
> The following changes since commit de679a3036ebef1c7d7b8ee23f05590c95e498d9:
>
>    pseudo: ensure libs are included in package (2012-01-03 12:10:59 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
>
> Saul Wold (1):
>    Rename references from POKY_*_INSTALL to COREIMAGE_*_INSTALL
>
>   meta/classes/core-image.bbclass                    |    8 ++++----
>   meta/recipes-core/images/core-image-minimal.bb     |    2 +-
>   meta/recipes-core/images/self-hosted-image.bb      |    2 +-
>   meta/recipes-extended/images/core-image-basic.bb   |    2 +-
>   meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
>   meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
>   meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
>   meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
>   meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
>   9 files changed, 12 insertions(+), 12 deletions(-)
>


