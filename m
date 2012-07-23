Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1StNHH-0005Vf-Ri
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 20:22:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Jul 2012 11:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="176154664"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by orsmga002.jf.intel.com with ESMTP; 23 Jul 2012 11:11:11 -0700
Message-ID: <500D93BF.5050005@linux.intel.com>
Date: Mon, 23 Jul 2012 11:11:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
In-Reply-To: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
Subject: Re: [PATCH v2 00/16] python-native: Put binaries in seperate directory
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
X-List-Received-Date: Mon, 23 Jul 2012 18:22:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 10:46 AM, Morgan Little wrote:
> I updated python-native like it was suggest by Richard here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/024644.html
>
> It is to resolve an issue that comes up when python-native is building and
> autoconf finds the binary but not the libraries. This fix moves where the
> binaries are installed to remove this issue and use the system's python.
>
> I have used bitbake world to build to make sure most things are build and
> have added all of the recipes that I found were affected. I will be building
> more to make sure I managed to get all of them.
>
> -----V2 Change-----
> Updated distutils-base to inherit pythonnative
>
> Removed added pythonnative inherit in distutils
>
> Removed added inherit for pythonnative from python-dbus, python-pygtk,
> python-setuptools, python-gst, python-pygobject since they get the inherit from
> distutils-base
>
> Updated perf for the change
>
>
> The following changes since commit 28715eff6dff3415b1d7b0be8cbb465c417e307f:
>    Richard Purdie (1):
>          boot-directdisk: Fix kernel location after STAGING_KERNEL_DIR change
>
> are available in the git repository at:
>
>    git@github.com:morganlittle/oe-core.git master
>
> Morgan Little (16):
>        python-native: Put binaries in seperate directory
>        python: Update for python-native changes
>        python-scons-native: Update for python-native changes
>        python-pyrex-native: Update for python-native changes
>        mklibs-native: Update for python-native changes
>        telepathy-glib: Update for python-native changes
>        telepathy-python: Update for python-native changes
>        libxml2: Update for python-native changes
>        gnome-doc-utils: Update for python-native changes
>        gobject-introspection: Update for python-native changes
>        mesa-common: Update for python-native changes
>        libxcb: Update for python-native changes
>        xcb-proto: Update for python-native changes
>        perf: Update for python-native changes
>        kernelshark: Update for python-native changes
>        trace-cmd: Update for python-native changes
>
>   meta/classes/distutils-base.bbclass                |    2 +-
>   meta/classes/distutils.bbclass                     |    8 ++++----
>   meta/classes/pythonnative.bbclass                  |    3 +++
>   .../telepathy/telepathy-glib_0.19.2.bb             |    4 ++--
>   .../telepathy/telepathy-python_0.15.19.bb          |    4 ++--
>   meta/recipes-core/libxml/libxml2.inc               |    2 +-
>   .../mklibs/mklibs-native_0.1.34.bb                 |    4 ++--
>   .../recipes-devtools/python/python-native_2.7.3.bb |   10 ++++++----
>   .../python/python-pyrex-native_0.9.9.bb            |    4 ++--
>   .../python/python-scons-native_2.1.0.bb            |    4 ++--
>   meta/recipes-devtools/python/python_2.7.3.bb       |   18 +++++++++---------
>   meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
>   .../gnome/gobject-introspection_1.32.1.bb          |    2 +-
>   .../gnome/gobject-introspection_git.bb             |    2 +-
>   meta/recipes-graphics/mesa/mesa-common.inc         |    4 ++--
>   meta/recipes-graphics/xcb/libxcb.inc               |    2 +-
>   meta/recipes-graphics/xcb/xcb-proto.inc            |    2 +-
>   meta/recipes-kernel/perf/perf_3.4.bb               |    2 +-
>   meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    4 ++--
>   meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    4 ++--
>   20 files changed, 46 insertions(+), 41 deletions(-)
>   create mode 100644 meta/classes/pythonnative.bbclass
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


