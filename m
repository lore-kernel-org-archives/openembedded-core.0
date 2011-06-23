Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZi53-00008B-5I for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 13:28:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NBOgn3016311
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:24:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15983-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:24:38 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NBOaec016304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:24:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308769850.git.mark.hatle@windriver.com>
References: <cover.1308769850.git.mark.hatle@windriver.com>
Date: Thu, 23 Jun 2011 12:24:34 +0100
Message-ID: <1308828274.20015.117.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/40] Various Recipe Fixes (v3)
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
X-List-Received-Date: Thu, 23 Jun 2011 11:28:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 14:53 -0500, Mark Hatle wrote:
> V3 includes fixes to issues noticed by Phil Blundell
> 
> --- version 2 below ---
> 
> V2 only includes a change to patch 13, to resolve the issues mentioned
> by Koen.
> 
> --- original comments below ---
> 
> While working on the permissions and umask code, I found a number of 
> random issues with various packages in the system.  Most of these
> problems revolve around:
> 
> * directory and file permissions, and ownership
> * -dbg package not being produced correctly
> * stripped binaries
> * packages that couldn't rebuild due to dependency or other issues
> 
> Note, this doesn't solve the permissions and ownership issues that will come
> in a future patch set devoted to umask and fixing up of the permissions.
> 
> The following changes since commit 17d5422460bf9074223475b15d128171d12b170a:
> 
>   qt4-tools-nativesdk: fix compile failure in src/dbus (2011-06-22 17:41:39 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/recipe-fixup
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/recipe-fixup
> 
> Mark Hatle (40):
>   resolveconf: Fix file owners
>   base-passwd: Fix owners/groups
>   gcc: Fix owners/groups
>   ghostscript: Fix owner/group of /etc/cups
>   libtirpc: Fix owner/group of /etc/netconfig
>   tzdata: Ensure all files are owned by root:root
>   gnome-doc-utils: Fix the owner/group on select files
>   perf: Fix linux-tools to ensure perf is installed under "fakeroot"
>   kernel.bbclass: Add support for perf-dbg package
>   sysfsutils: Fall back to default -dbg package
>   classes/package_rpm.bbclass: Enhance diagnostic messages
>   classes/package_rpm.bbclass: Change the way the PV is transformed
>   python: Switch to using the default -dbg package
>   python-pyobject: Remove unnecessary -dbg setting
>   libxml-parser-perl: Fix debug package
>   texinfo: Change to use the standard -dbg file
>   psmisc: Remove custom -dbg packages, use default
>   modutils: Add in missing -dbg package
>   liba52: Remove custom -dbg, fall back to default
>   python-gst: Add missing files to the -dbg package
>   mc: Add missing debug files to -dbg
>   gamin: Add missing debug files to -dbg
>   gthumb: Add missing debug files
>   systemtamp: Add missing debug files
>   trace-cmd: Add missing debug files
>   gstreamer: Add missing debug files.
>   gtk-sato-engine: Add missing debug files
>   libproxy: Add missing debug files
>   wireless-tools: Avoid stripping binaries
>   busybox: Avoid stripping binaries
>   tinylogin: Avoid stripped binaries
>   quote: Avoid stripping binaries
>   sysstat: Avoid stripping binaries
>   db: Avoid stripping binaries
>   db: Fix file ownership
>   unzip: Avoid stripping binaries
>   dropbear: Don't patch in configure
>   nasm: Fix aclocal
>   python: Add python to the dependencies of python modules
>   boost: Move the do_configure_prepend to a seperate task

I did a first pass over this series and merged the ones I was happy
with. This leaves:

 git cherry-pick 5c4ce64fb0bf1c4e8a5899e292917836953412d3
 git cherry-pick 7e9ca99962148df2cee0f69ba2f7408788789af5
 git cherry-pick 4357212d04ad3bc4e286b72d74136f8d59e4b15c
 git cherry-pick 27ede7006d75bd6cae3677da9a54b5092b2d4079
 git cherry-pick 5f3bcbaf87ce947d48c5683917d9fc99a13e7a33
 git cherry-pick b39384a74aa03db222a39a023b4cb1a6a07dd5a5
 git cherry-pick a579d68ffe5c162a182d7f4157564f17294a8ff5
 git cherry-pick d215f1d253f3ef2ef4f74de36d39334a6939ee5e

and also this one which doesn't apply any more due to other gcc changes
I merged:

 git cherry-pick 60f955a2ba068db9e5d072c443a6ef7a894f114e

Why didn't I take these? My reasons included:

a) I didn't think the python dependency changes looked right
b) The whole test -n && eval thing looks wrong. I don't see why its 
   needed and would like to debug that.
c) I wanted to think a little further about how to handle chown in 
   do_install since we really need an easy way to make that a null op 
   for native cases easily. Options:
   
   * Don't call chown but wrap it in our own script oe-chown
   * Add an intercept script in PATH which would avoid root ops in the 
     native case
   * Prefix the calls with some kind of magic

   It might be the answer is not to worry about it right now but it 
   seems a good time to consider it.

Cheers,

Richard







