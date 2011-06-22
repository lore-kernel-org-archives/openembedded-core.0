Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPZN-0003Qz-39 for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:42:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFcklh005326
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:38:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04956-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:38:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFce6F005319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:38:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308639329.git.edwin.zhai@intel.com>
References: <cover.1308639329.git.edwin.zhai@intel.com>
Date: Wed, 22 Jun 2011 16:38:22 +0100
Message-ID: <1308757102.20015.70.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Remove obsolete gnome-vfs
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
X-List-Received-Date: Wed, 22 Jun 2011 15:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 15:12 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> This patch removed obsolete gnome-vfs in favor of GIO/GVFS.
> Pls. help to review.
> 
> Thanks,
> edwin
> 
> 
> The following changes since commit 4ff7af11ef69849ef9c16f585eae58ac920b222b:
> 
>   machine confs: Add xserver-kdrive as PREFERRED_PROVIDER (2011-05-27 15:30:19 -0700)
> 
> are available in the git repository at:
>   git@git.pokylinux.org:poky-contrib.git gzhai/master
>   http://git.pokylinux.org/cgit.cgi//log/?h=gzhai/master
> 
> Zhai Edwin (1):
>   gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and
>     GIO
> 
>  .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 ++++++++++++++++++++
>  meta/recipes-kernel/oprofile/oprofileui_git.bb     |    1 +
>  .../gstreamer/gst-meta-base_0.10.bb                |    2 +-
>  .../gstreamer/gst-plugins-base_0.10.32.bb          |    6 +-
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
>  5 files changed, 224 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch

This is nice to see, thanks!

I've merged it but please try and send pull requests from a slightly
more up to date branch please as this one threw conflicts that I needed
to resolve in the webkit recipe.

Cheers,

Richard



