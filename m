Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbGxD-0000gD-SW
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:26:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2011 11:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96644521"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 11:19:53 -0800
Message-ID: <4EEA4859.8040906@linux.intel.com>
Date: Thu, 15 Dec 2011 11:19:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323883800.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323883800.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] CentOS 5.x fixes
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
X-List-Received-Date: Thu, 15 Dec 2011 19:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2011 09:31 AM, Paul Eggleton wrote:
> A few fixes I made in the process of testing builds on CentOS 5.7.
>
> The following changes since commit b9dfccc018f32a47fc045f35d5f53d7269d791ed:
>
>    gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:18 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/qemu-centos5
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-centos5
>
> Paul Eggleton (3):
>    qemu: for native, do not fail if kvm is unavailable
>    scripts/runqemu: show an error if /dev/net/tun is unusable
>    scripts/bitbake: add a version>= 2.6 check
>
>   meta/recipes-devtools/qemu/qemu.inc       |   10 ++++++++--
>   meta/recipes-devtools/qemu/qemu_0.14.0.bb |    2 +-
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 ++
>   meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
>   scripts/bitbake                           |    9 +++++++++
>   scripts/runqemu                           |    8 ++++++++
>   6 files changed, 29 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


