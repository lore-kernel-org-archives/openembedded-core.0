Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0ijh-00087d-TT for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:10:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O01lEu030852
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:01:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30202-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:01:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O01chl030846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:01:39 GMT
Message-ID: <1330041700.25226.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 00:01:40 +0000
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/25] Catching up from ELC
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
X-List-Received-Date: Fri, 24 Feb 2012 00:10:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 07:58 -0800, Saul Wold wrote:
> Richard,
> 
> Here are a batch of changes reviewed and built
> 
> 
> The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:
> 
>   texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andreas Oberritter (5):
>   xorg-lib: don't build libs unless requested by DISTRO_FEATURES
>   autotools.bbclass: Don't copy into non-existant directory
>   busybox: don't create /etc/default
>   gst-plugins-base: depend on libx11 and libxv conditionally
>   mpeg2dec: depend on libx11 conditionally
> 
> Andrei Gherzan (7):
>   dhcp: Update to 4.2.3-P2
>   nspr: Integrate version 4.8.9
>   nspr: Compile nspr with tests
>   nspr: Add patch in order to remove rpath from binaries
>   e2fsprogs: e2initrd_helper was moved in libdir but not packaged
>     correctly in FILES_libext2fs
>   dbus: Remove empty ${lindir}dbus-1.0/test directory as we don't build
>     tests
>   openssl: Move libcrypto to base_libdir
> 
> Dexuan Cui (2):
>   task-self-hosted: remove duplicate packages
>   task-self-hosted: make the package lists alphabetical
> 
> Gary Thomas (1):
>   initscripts: Make /etc/timestamp consistent again.
> 
> Martin Jansa (1):
>   wireless-tools: remove ldconfig call from install-libs
> 
> Mike Crowe (1):
>   e2fsprogs: Cope with ${libdir} and ${base_libdir} being the same
> 
> Robert Yang (1):
>   A script to clean obsolete sstate cache files
> 
> Saul Wold (6):
>   syslinux: Use SYSLINUX_TIMEOUT and SYSLINUX_PROMPT to configure
>     syslinux
>   syslinux: add SYSLINUX_ROOT to APPEND line
>   image_types: add vmdk type to use with VMware
>   image-live: fix SYSLINUX_TIME and add SYSLINUX_ROOT instead of APPEND
>   boot-directdisk: Use correct SYSLINUX_TIMEOUT and SYSLINUX_ROOT
>     instead of APPEND
>   distro_tracking_fields: fix typos
> 
> Yauhen Kharuzhy (1):
>   ppp: Fix rp-pppoe plugin compilation

Merged to master, thanks.

Richard



