Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RV6Fv-0003Lb-I9
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 19:48:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2011 10:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="80765925"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga002.jf.intel.com with ESMTP; 28 Nov 2011 10:42:00 -0800
Message-ID: <4ED3D5F8.50409@linux.intel.com>
Date: Mon, 28 Nov 2011 10:42:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
Subject: Re: [PATCH 00/10] Clutter tidy up & fixes
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
X-List-Received-Date: Mon, 28 Nov 2011 18:48:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 02:57 PM, Joshua Lock wrote:
> The theme of this series is removing some of the stale clutter recipes.
>
> It also includes fixes for the cogl and clutter_git recipes.
>
> Poky maintainers note: this series requires action; either merging my RFC series
> to drop clutter bbappends or a separate patch to remove the 1.6 bbappend.
>
> Cheers,
> Joshua
>
> The following changes since commit 381c7857a5b303bf9eadd7fffc39d17a2b8e31f2:
>
>    matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:16 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/clutter
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter
>
> Joshua Lock (10):
>    mutter: switch to clutter-1.8 to satisfy dependency
>    multilib.conf: update clutter
>    task-core-clutter: use clutter-1.8
>    distro-tracking-fields: add entries for clutter-1.8 recipes
>    clutter-*-1.6: drop clutter 1.6 recipes
>    clutter: PROVIDES clutter-1.6
There still seems to be a problem with clutter-box2d-1.6 recipe, not 
sure if it got dropped or modified properly.

Sau!

>    multilibs: remove clutter-1.6 recipes
>    distro_tracking_fields: tidy up and claim clutter recipes
>    cogl: add missing depends on libxcomposite
>    clutter: move STDDEPENDS to inc
>
>   .../conf/distro/include/distro_tracking_fields.inc |   59 +++++++------------
>   meta/conf/multilib.conf                            |    4 +-
>   .../recipes-graphics/clutter/clutter-1.6_1.6.18.bb |   26 ---------
>   meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    4 +-
>   .../clutter/clutter-gst-1.6_1.3.6.bb               |   21 -------
>   meta/recipes-graphics/clutter/clutter.inc          |    3 +-
>   meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
>   meta/recipes-graphics/clutter/cogl.inc             |    2 +-
>   meta/recipes-graphics/mutter/mutter.inc            |    2 +-
>   meta/recipes-graphics/tasks/task-core-clutter.bb   |    9 ++-
>   10 files changed, 37 insertions(+), 97 deletions(-)
>   delete mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.18.bb
>   delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
>


