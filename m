Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8xIS-0001Os-8r
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:47:49 +0200
Received: from mail-yi0-f52.google.com ([209.85.218.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 09:26:05 -0700
Received: by yie30 with SMTP id 30so13511700yie.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:26:04 -0700 (PDT)
Received: by 10.101.66.2 with SMTP id t2mr8585988ank.3.1317227164821;
	Wed, 28 Sep 2011 09:26:04 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id u4sm53854156ane.21.2011.09.28.09.26.03
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 09:26:04 -0700 (PDT)
Message-ID: <4E834A97.5010200@intel.com>
Date: Wed, 28 Sep 2011 09:25:59 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317185969.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/4] Remove gnome-vfs completely
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
X-List-Received-Date: Wed, 28 Sep 2011 16:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2011 10:02 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
> gnome-vfs need to be removed and taken place by gio. These patches remove the
> dependece on it, and obsolete recipes that need it.
>
> Pls. help to pull.
>
> Thanks,
> Edwin
>
> The following changes since commit e3c5d7a90ae179af0ac128ea4dfc1a5a6602c2e4:
>
>    libtool: Fix an issue where unnecessary rpaths were being injected (2011-09-26 17:56:44 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Zhai Edwin (4):
>    oprofileui: remove dependence on gnome-vfs
>    libgsf: remove dependence on gnome-vfs
>    tables: remove it as obsolete recipe
>    gnome-vfs: remove it as obsolete recipe in favor of GIO/GVFS
>
>   .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 ++-
>   meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -----
>   .../recipes-graphics/clutter/table/fixes.patch     |   16 ------
>   .../recipes-graphics/clutter/table_git.bb          |   15 ------
>   .../conf/distro/include/distro_tracking_fields.inc |   11 ----
>   meta/conf/multilib.conf                            |    1 -
>   .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -----
>   .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --------------------
>   meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 ------------------
>   meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
>   10 files changed, 7 insertions(+), 175 deletions(-)
>   delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
>   delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
>   delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb
>   delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
>   delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
>   delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core, except as noted about gnome-vfs possibly 
transferring to meta-oe as part of this.

Thanks
	Sau!



