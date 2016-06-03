Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3C97755E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 15:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53FWEMO020148; Fri, 3 Jun 2016 16:32:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dAxDBwGCUyTq; Fri,  3 Jun 2016 16:32:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53FWA8d020145
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Jun 2016 16:32:12 +0100
Message-ID: <1464967930.13979.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Jun 2016 16:32:10 +0100
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/25] Version updates and upstream check fixes
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
X-List-Received-Date: Fri, 03 Jun 2016 15:32:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-06-03 at 12:14 +0300, Alexander Kanavin wrote:
> A bunch of version updates for recipes where I'm listed as
> maintainer.
> I have also moved gobject-introspection recipe to Python 3, as it
> required
> first updating the recipe to latest version, and that required
> updating glib
> to latest version.
> 
> The following changes since commit
> dcbfc72303d6782d9108538c830cf2ee7849bf59:
> 
>   poky: Add Ubuntu 16.04 to tested/supported list since I run it
> myself (2016-06-02 10:37:05 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akanavin/package-version
> -updates
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/p
> ackage-version-updates
> 
> Alexander Kanavin (25):
>   gdbm: upgrade to 1.12
>   rt-tests, hwlatdetect: upgrade to 2.0
>   webkitgtk: upgrade to 2.12.3
>   cups: fix upstream version check
>   tzcode, tzdata: fix upstream version check
>   cantarell-fonts: fix upstream check
>   boost: update to 1.61.0
>   btrfs-tools: update to 4.5.3
>   build-appliance-image: update version to 15.0.0
>   ffmpeg: update to 3.0.2
>   cantarell-fonts: update to 0.0.24
>   gcc: fix upstream check for 5.x version
>   gdb: fix upstream check
>   gnome-desktop3: update to 3.20.2
>   gobject-introspection: update to 1.48.0
>   gobject-introspection: move to Python 3
>   mc: update to 4.8.17
>   icu: update to 57.1
>   iso-codes: update to 3.68
>   kexec-tools: update to 2.0.12
>   libksba: update to 1.3.4
>   libxslt: update to 1.1.29
>   msmtp: update to 1.6.5
>   systemtap: update to 3.0
>   watchdog: update to 5.15

It looks like something introspection related broken in a test build
with the above in it:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/157/steps/BuildImages/logs/stdio

Cheers,

Richard

