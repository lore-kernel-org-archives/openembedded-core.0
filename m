Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8YM2-0006zD-GN
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 16:09:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2011 07:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,449,1312182000"; d="scan'208";a="67908304"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.111])
	by fmsmga001.fm.intel.com with SMTP; 27 Sep 2011 07:04:22 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Tue, 27 Sep 2011 22:02:24 +0800
Date: Tue, 27 Sep 2011 22:02:24 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110927140224.GA10415@edwin-gen>
References: <cover.1317131040.git.edwin.zhai@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1317131040.git.edwin.zhai@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/1] remove gnome-vfs completely
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
X-List-Received-Date: Tue, 27 Sep 2011 14:09:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BTW,
I found many recipes in meta-demoapps are not maintained: no 
LIC_FILES_CHKSUM/SRCREV, no workable SRC_URI, and even no layer.conf under 
meta-demoapps.

We need more test for demoapps, and require each commit to take care of them, or 
else remove them completely...


On Tue, Sep 27, 2011 at 09:49:25PM +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> All,
> This patch remove gnome-vfs completely: remove itself, dependence on it, and
> other obsolete recipe depending on it.
> 
> Last time, I remember one recipe in oe-core depends on gnome-vfs, but nobody
> depends on it. Could somebody have a double check on oe-core?
> 
> Thanks,
> Edwin
> 
> The following changes since commit e3c5d7a90ae179af0ac128ea4dfc1a5a6602c2e4:
> 
>   libtool: Fix an issue where unnecessary rpaths were being injected (2011-09-26 17:56:44 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/master2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> Zhai Edwin (1):
>   gnome-vfs: remove this obsolete recipe completely in favor of
>     GIO/GVFS
> 
>  .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 ++-
>  meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -----
>  .../recipes-graphics/clutter/table/fixes.patch     |   16 ------
>  .../recipes-graphics/clutter/table_git.bb          |   15 ------
>  .../conf/distro/include/distro_tracking_fields.inc |   11 ----
>  meta/conf/multilib.conf                            |    1 -
>  .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -----
>  .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --------------------
>  meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 ------------------
>  meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
>  10 files changed, 7 insertions(+), 175 deletions(-)
>  delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
>  delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
>  delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


