Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4251E6A8BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:53:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2013 09:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,816,1363158000"; d="scan'208";a="313294156"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2013 09:53:27 -0700
Message-ID: <51B0BE87.8010807@linux.intel.com>
Date: Thu, 06 Jun 2013 09:53:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Carlos Rafael Giani <dv@pseudoterminal.org>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
In-Reply-To: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] GStreamer 1.0 recipes
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
X-List-Received-Date: Thu, 06 Jun 2013 16:53:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 12:15 PM, Carlos Rafael Giani wrote:
> These patches introduce recipes for GStreamer 1.0 . They
> are copied over from my gstreamer 1.0 layer at
> https://github.com/dv1/meta-gstreamer1.0 . All files except
> gstreamer1.0-plugins-package.inc were copied; gst-plugins-package.inc
> was patched to fix a problem with -meta packages and can be used for
> both 0.10 and 1.0 now (the only difference is the value of the LIBV
> variable).
>
So is there an update path from 0.10 to 1.0?  Also normally we replace 
the older version with the newer version by "git mv" in order to 
preserve history where possible.  I am not sure if you can do this with 
a move and then copy the new versions in.

Since the packages are renamed, and I don's see any RPROVIDES/RREPLACES 
or RCONFLICTS to cover the upgrade path.


> Some open questions:
> * Is it OK to add _git versions of the recipes to OE core?
Yes, it's OK to have both a versioned and _git recipe in OE-Core

> * The gstreamer1.0-omx recipe sets itself to be machine specific if
>    this is explicitely requested. This is necessary, since gst-omx has
>    machine specific codepaths (currently for the Raspberry Pi). By
>    default, it is not machine specific, and uses the Bellagio OpenMAX
>    implementation that is supported by OE core. Is it OK to include
>    options for machine specific support which can be set by BSP layers?
>
Not sure about this one.

Sau!

> Carlos Rafael Giani (3):
>    gstreamer: fixed -meta package rdepends
>    gstreamer: moved LIBV out of gst-plugins-package.inc file
>    gstreamer: added GStreamer 1.0 recipes
>
>   .../gstreamer/gst-plugins-package.inc              |  28 ++++--
>   meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   1 +
>   .../gstreamer/gstreamer1.0-libav.inc               |  34 +++++++
>   ...-Disable-yasm-for-libav-when-disable-yasm.patch |  33 +++++++
>   .../gstreamer1.0-libav/libav_e500mc.patch          |  21 +++++
>   .../gstreamer/gstreamer1.0-libav_1.0.7.bb          |  27 ++++++
>   .../gstreamer/gstreamer1.0-libav_git.bb            |  27 ++++++
>   .../gstreamer/gstreamer1.0-omx.inc                 |  42 +++++++++
>   .../0001-omx-fixed-type-error-in-printf-call.patch |  30 ++++++
>   .../gstreamer/gstreamer1.0-omx_1.0.0.bb            |  12 +++
>   .../gstreamer/gstreamer1.0-omx_git.bb              |  22 +++++
>   .../gstreamer/gstreamer1.0-plugins-bad.inc         | 105 +++++++++++++++++++++
>   .../gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb    |  12 +++
>   .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  26 +++++
>   .../gstreamer/gstreamer1.0-plugins-base.inc        |  42 +++++++++
>   .../gstreamer/gstreamer1.0-plugins-base_1.0.7.bb   |  11 +++
>   .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  18 ++++
>   .../gstreamer/gstreamer1.0-plugins-good.inc        |  55 +++++++++++
>   .../gstreamer/gstreamer1.0-plugins-good_1.0.7.bb   |  11 +++
>   .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  17 ++++
>   .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  33 +++++++
>   .../gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb   |  10 ++
>   .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |  16 ++++
>   .../gstreamer/gstreamer1.0-plugins.inc             |  57 +++++++++++
>   meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  23 +++++
>   .../0001-Fix-crash-with-gst-inspect.patch          |  28 ++++++
>   .../gstreamer/gstreamer1.0_1.0.7.bb                |  13 +++
>   .../gstreamer/gstreamer1.0_git.bb                  |  17 ++++
>   28 files changed, 765 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
>

