Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TpcB9-000521-9b for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 11:01:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBV9k3NP021832;
	Mon, 31 Dec 2012 09:46:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08694-08; Mon, 31 Dec 2012 09:45:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBV9jq6n021825
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 31 Dec 2012 09:45:54 GMT
Message-ID: <1356947154.28649.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 31 Dec 2012 09:45:54 +0000
In-Reply-To: <cover.1356626500.git.sgw@linux.intel.com>
References: <cover.1356626500.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/26] Next batch, mostly updates
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
X-List-Received-Date: Mon, 31 Dec 2012 10:01:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-12-27 at 08:46 -0800, Saul Wold wrote:
> Here is another batch of patches, mostly straightforward updates.
> 
> I would like a little more review of Constantin's multilib allarch
> patch, it seems OK to me, but want your eyes on it also. It built OK 
> on the AB.  I will be trying a world build with his next patch set.

Its not perfect, we have some issues with packagegroup, allarch and
multilib combining badly however it does massively improve the situation
for things like kernel modules and other allarch packages so I merged
that.

> The following changes since commit 69bbce0176183b0dc14eda21e4f6b601443060f0:
> 
>   libpng: fix packaging (2012-12-25 14:00:22 -0800)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Constantin Musca (17):
>   ethtool: upgrade to 3.7
>   freetype: upgrade to 2.4.11
>   gnome-doc-utils: upgrade to 0.20.10
>   gsettings-desktop-schemas: add recipe
>   gthumb: remove recipe
>   json-glib: upgrade to 0.15.2
>   libcroco: upgrade to 0.6.8
>   libsoup-2.4: upgrade to 2.40.2
>   libuser: upgrade to 0.58
>   matchbox-panel-2: fix PV
>   menu-cache: upgrade to 0.4.1
>   metacity: upgrade to 2.34.13
>   shared-mime-info: upgrade to 1.0
>   libcroco: fix license
>   multilib: fix allarch/kernel/module-base multilib issues
>   xserver-xorg: enable multilib
>   xorg-driver: enable multilib
> 
> Marko Kati? (1):
>   udev: Remove deprecated binaries from packaging

This commit message is still odd looking.

> Marko Lindqvist (2):
>   curl: update to upstream version 7.28.1
>   sqlite: update to upstream version 3.7.15.1
> 
> Martin Jansa (2):
>   xf86-video-omap: skip package if opengl isn't in DISTRO_FEATURES
>   webkit-gtk: fix build with bison-2.6+
> 
> Noor Ahsan (1):
>   cairo: Adds libxext in X11DEPENDS.

No, we shouldn't be depending on libxext. Ross will not be happy about
this. See Ross. Ideally we shouldn't have libxext in the images at all.

Otherwise merged to master, thanks.

Cheers,

Richard



