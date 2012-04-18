Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKWaG-00041X-6L
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:14:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Apr 2012 08:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90506894"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2012 08:04:47 -0700
Message-ID: <4F8ED80F.3060400@linux.intel.com>
Date: Wed, 18 Apr 2012 08:04:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334705370.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1334705370.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] glxgears fix
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
X-List-Received-Date: Wed, 18 Apr 2012 15:14:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 04:33 PM, Scott Garman wrote:
> Hello,
>
> This pull request fixes a bug where glxgears would fail with the
> following error:
>
> Error: couldn't get an RGB, Double-buffered visual.
>
> This was occurring for images which use RPM because do_rootfs could
> allow qemugl to be installed after libgl1, and qemugl's postinst needs
> to run after libgl1 is installed to replace the libGL library.
>
> This commit changes the postinst to run at first boot instead of during
> do_rootfs.
>
> This is an urgent fix to include with 1.2. - [YOCTO #2309]
>
> The following changes since commit dc0fe3fbf9ca862c1d0d90468e6da326f58e3b41:
>
>    qemugl: make postinst run at first boot (2012-04-18 00:21:51 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/glxgears-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=glxgears-oe
>
> Scott Garman (1):
>    qemugl: make postinst run at first boot
>
>   meta/recipes-graphics/mesa/qemugl_git.bb |   16 +++++++++++-----
>   1 files changed, 11 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


