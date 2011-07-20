Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjaDH-0005hE-8Q
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:05:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jul 2011 10:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="29493009"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2011 10:01:27 -0700
Message-ID: <4E2709E6.7070409@linux.intel.com>
Date: Wed, 20 Jul 2011 10:01:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310969462.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/4][PULL] Resend: multilib: change hard coded /usr/lib path.
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
X-List-Received-Date: Wed, 20 Jul 2011 17:05:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2011 11:13 PM, Dongxiao Xu wrote:
> Hi Richard,
>
> (Please ignore the previous pull request which doesn't contain the latest code.)
>
> This pull request fixes some hard coded /usr/lib path in recipes within
> minimal image. Please help to review and pull.
>
> Thanks,
> Dongxiao
>
> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/multilib
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib
>
> Dongxiao Xu (3):
>    xcb-proto: add multilib support.
>    pciutils: Change the hardcoded /usr/lib to support multilib.
There two were merged into OE-Core

>    udev: Change hard coded /usr/lib to support multilib
There is some discussion about this one not being needed on the list.

>
> Yu Ke (1):
>    perl: revise the RRECOMMENDS_perl-modules for multilib case
This has been merged also,

Thanks to both of you.

Sau!


>
>   .../pciutils/pciutils-3.1.7/makefile.patch         |   14 ++++++++++++
>   meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    5 ++-
>   meta/recipes-core/udev/udev-164/makefile.patch     |   16 ++++++++++++++
>   meta/recipes-core/udev/udev-new.inc                |    1 +
>   meta/recipes-core/udev/udev_164.bb                 |    2 +-
>   meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
>   .../xcb/xcb-proto-1.6/aclocal.patch                |   22 ++++++++++++++++++++
>   meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +-
>   meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
>   meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
>   10 files changed, 62 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
>   create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
>   create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


