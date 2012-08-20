Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3UfK-0002yh-7P
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 18:17:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 09:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="182971924"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2012 09:05:17 -0700
Message-ID: <5032603D.5070408@linux.intel.com>
Date: Mon, 20 Aug 2012 09:05:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 16:17:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 11:58 AM, Ross Burton wrote:
> Hopefully the final Mesa patch set.  First pulls in an essential fix to
> PACKAGECONFIG, and then enables GLES and EGL using PACKAGECONFIG, based on
> whether the MACHINE_FEATURES contains x86.
>
> Ross
>
> The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:
>
>    foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/mesa
>
> for you to fetch changes up to 938675e4208fd34908653e1a7565c58f53067d77:
>
>    mesa: enable EGL, with DRM and X11 platforms (2012-08-13 12:53:45 +0100)
>
> ----------------------------------------------------------------
> Damien Lespiau (2):
>        mesa: Add a mesa-dri-glsl-native_git recipe
>        core: Prefer mesa-dri as virtual/libopengles1/2 provider
>
> Ross Burton (5):
>        clutter: DOLT isn't used anymore
>        mesa: enable GLES v1 and v2
>        mesa-demos: fix GLES2 build
>        mesa: respect x11 DISTRO_FEATURE
>        mesa: enable EGL, with DRM and X11 platforms
>
> Yao Zhao (1):
>        base.bbclass: fix PACKAGECONFIG handling code
>
Merged this lot into OE-Core

Thanks
	Sau!


>   meta/classes/base.bbclass                          |   25 ++++++++---------
>   meta/conf/distro/include/default-providers.inc     |    2 ++
>   meta/conf/machine/qemux86-64.conf                  |    2 ++
>   meta/conf/machine/qemux86.conf                     |    2 ++
>   meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +----
>   meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +----
>   meta/recipes-graphics/clutter/cogl_git.bb          |    7 +----
>   meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
>   meta/recipes-graphics/mesa/mesa-common.inc         |   26 ++++++++++++------
>   .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++++++
>   meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 ++--
>   .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 +++++
>   .../mesa/mesa-dri-glsl-native_8.0.4.bb             |    9 ++----
>   .../mesa/mesa-dri-glsl-native_git.bb               |   23 ++++++++++++++++
>   meta/recipes-graphics/mesa/mesa-dri.inc            |    8 +++++-
>   meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
>   ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
>   .../arch/qemu/conf/machine/{{=machine}}.conf       |    2 ++
>   18 files changed, 129 insertions(+), 50 deletions(-)
>   create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
>   create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
>   create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
>
> Damien Lespiau (2):
>    mesa: Add a mesa-dri-glsl-native_git recipe
>    core: Prefer mesa-dri as virtual/libopengles1/2 provider
>
> Ross Burton (5):
>    clutter: DOLT isn't used anymore
>    mesa: enable GLES v1 and v2
>    mesa-demos: fix GLES2 build
>    mesa: respect x11 DISTRO_FEATURE
>    mesa: enable EGL, with DRM and X11 platforms
>
> Yao Zhao (1):
>    base.bbclass: fix PACKAGECONFIG handling code
>
>   meta/classes/base.bbclass                          |   25 ++++++++---------
>   meta/conf/distro/include/default-providers.inc     |    2 ++
>   meta/conf/machine/qemux86-64.conf                  |    2 ++
>   meta/conf/machine/qemux86.conf                     |    2 ++
>   meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +----
>   meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +----
>   meta/recipes-graphics/clutter/cogl_git.bb          |    7 +----
>   meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
>   meta/recipes-graphics/mesa/mesa-common.inc         |   26 ++++++++++++------
>   .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++++++
>   meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 ++--
>   .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 +++++
>   .../mesa/mesa-dri-glsl-native_8.0.4.bb             |    9 ++----
>   .../mesa/mesa-dri-glsl-native_git.bb               |   23 ++++++++++++++++
>   meta/recipes-graphics/mesa/mesa-dri.inc            |    8 +++++-
>   meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
>   ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
>   .../arch/qemu/conf/machine/{{=machine}}.conf       |    2 ++
>   18 files changed, 129 insertions(+), 50 deletions(-)
>   create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
>   create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
>   create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
>


