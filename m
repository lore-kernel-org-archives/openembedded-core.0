Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 64C3B605B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 16:28:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2014 09:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,888,1392192000"; d="scan'208";a="435618081"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2014 09:28:49 -0700
Message-ID: <537E25A9.9080106@intel.com>
Date: Thu, 22 May 2014 19:28:25 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1400690725.git.valentin.popa@intel.com>
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
Subject: [PATCH 0/4] [V3]mesa: upgrade to 10.1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 May 2014 16:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

New from V2:

(*) removed the old patch for eglinfo and updated the recipe to a newer 
version.
(*) renamed libmesa-megadriver to mesa-megadriver

The changes are available at :

  git://git.yoctoproject.org/poky-contrib vpopa/mesa
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa



On 05/21/2014 07:49 PM, Valentin Popa wrote:
> New in V2:
> (*) eglinfo: patched to compile with mesa10+
> (*) mesa: upgrade to 10.1.3 - multilib rootfs issue fixed
>
> The following changes since commit 122079e9b0b513c46ca76993403db4cfa51e858f:
>
>    bitbake: data_smart: Fix an unusual variable reference bug (2014-05-21 16:47:01 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib vpopa/mesa
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa
>
> Valentin Popa (4):
>    dri3proto: add it to oe-core
>    libxshmfence: add it to oe-core
>    mesa: upgrade to 10.1.3
>    eglinfo: patched to compile with mesa10+
>
>   meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb    |  2 ++
>   meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb   |  2 ++
>   meta/recipes-graphics/eglinfo/eglinfo.inc          |  4 ++-
>   .../0001-eglinfo-x11-change-constant-name.patch    | 33 ++++++++++++++++++++
>   .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
>   meta/recipes-graphics/mesa/mesa.inc                | 36 ++++++++++++++--------
>   .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
>   meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
>   meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 ++++++++++
>   meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
>   10 files changed, 99 insertions(+), 17 deletions(-)
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo/0001-eglinfo-x11-change-constant-name.patch
>   rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
>   rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
>   create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
>


