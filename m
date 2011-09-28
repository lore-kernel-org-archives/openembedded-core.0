Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8rw5-0002gd-PR for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:04:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB5Foe000424; Wed, 28 Sep 2011 12:05:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RDgVtDL8eWaB; Wed, 28 Sep 2011 12:05:15 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB58WL000404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 28 Sep 2011 12:05:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 11:58:43 +0100
In-Reply-To: <50a562faa7db3aa67829a079030547e6696f1348.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
	<50a562faa7db3aa67829a079030547e6696f1348.1317185969.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317207530.26109.237.camel@ted>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 4/4] gnome-vfs: remove it as obsolete recipe in favor of GIO/GVFS
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
X-List-Received-Date: Wed, 28 Sep 2011 11:04:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 13:02 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  .../conf/distro/include/distro_tracking_fields.inc |   11 ----
>  meta/conf/multilib.conf                            |    1 -
>  .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -----
>  .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --------------------
>  meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 ------------------
>  5 files changed, 0 insertions(+), 128 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb

I certainly think this is a good candidate for removal from OE-Core so I
will take the patch.

Do we want to move this recipe into meta-oe?

I'm holding off in case the answer is yes and we want a smooth
transition.

Cheers,

Richard




