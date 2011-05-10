Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfNH-0001L7-3o
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:20:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,344,1301900400"; d="scan'208";a="744872250"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:17:51 -0700
Message-ID: <4DC8CA7E.4020302@linux.intel.com>
Date: Mon, 09 May 2011 22:17:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
In-Reply-To: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 05:20:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 12:15 PM, Otavio Salvador wrote:
> Hello,
>
> This pull request fixes some issues I found since the last pull
> request and should be preferred against the first.
>
Otavio,

Next time, please use the create-pull-request script, which will 
generate a set of patch emails so that we can review this information 
via email. I will make a couple of additional comments below associated 
with each patch.

> The following changes since commit d0dc2b5bb02ef55a41e7a97b6831c72391ae7f36:
>
>    u-boot: correct COPYING MD5SUM (2011-05-08 23:56:11 -0700)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>
> Otavio Salvador (10):
>        meta/conf/local.conf.sample: fix mklibs comment line split and typo
>        scripts/oe-setup-builddir: fix typo
>        syslinux: improve packaging
>        busybox: add support to mdev
>        libxkbfile: disable xcb
>        insane.bbclass: skip license checksum if LICENSE is "CLOSED"
I assume you are adding this for layers and commercial work, we should 
never have CLOSED in any open layer.

>        cmake.bbclass: fix qmake and rpath issues
>        qmake_base.bbclass: add generate_qt_config_file task
>        cmake: add support for oe qt4 tools names
Please add a comment to the patch explaining it's purpose and origin, 
and include a Signed-off-by: if appropriate. Any patches that you have 
modified or added should include the above info.

>        fuse: drop since it is not used by other recipes
>
>   .../fuse-2.7.2/not-run-updaterc.d-on-host.patch    |   15 ----
>   meta-demoapps/recipes-kernel/fuse/fuse.inc         |   13 ---
>   meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb    |   22 -----
>   meta/classes/cmake.bbclass                         |   19 ++++-
>   meta/classes/insane.bbclass                        |    4 +
>   meta/classes/qmake_base.bbclass                    |   15 ++++
>   meta/conf/local.conf.sample                        |    7 +-
>   meta/recipes-core/busybox/busybox.inc              |   14 +++-
>   meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +
>   meta/recipes-core/busybox/files/mdev               |    7 ++
>   meta/recipes-core/busybox/files/mdev.conf          |   35 ++++++++
>   meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    2 +-
>   meta/recipes-devtools/cmake/cmake.inc              |    3 +-
>   .../cmake/cmake/support-oe-qt4-tools-names.patch   |   85 ++++++++++++++++++++
>   meta/recipes-devtools/syslinux/syslinux_4.03.bb    |   12 +++-
>   meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 +-
>   scripts/oe-setup-builddir                          |    2 +-
>   17 files changed, 199 insertions(+), 62 deletions(-)
>   delete mode 100644
> meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch
>   delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse.inc
>   delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb
>   create mode 100755 meta/recipes-core/busybox/files/mdev
>   create mode 100644 meta/recipes-core/busybox/files/mdev.conf
>   create mode 100644
> meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
>
>


