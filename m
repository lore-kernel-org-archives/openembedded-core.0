Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rns8c-00044K-NM for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 14:34:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JDR7jM002141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:27:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01601-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:27:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JDR0rX002135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:27:01 GMT
Message-ID: <1326979620.2511.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 13:27:00 +0000
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/33] patches and staticdev fixes
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
X-List-Received-Date: Thu, 19 Jan 2012 13:34:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 01:22 -0800, Saul Wold wrote:
> Andrea Adami (1):
>   xinput: add utility for configuring and testing XInput devices.
> 
> Andrei Gherzan (3):
>   busybox: defconfig modified in order to activate
>     CONFIG_EXPR_MATH_SUPPORT_64
>   chkconfig: Update package from v1.3.55 to v1.3.57
>   libsoup: Update package from v2.2.100 to v2.2.105
> 
> Bruce Ashfield (1):
>   linux-yocto: restore WORKDIR as a patch source directory
> 
> Joshua Lock (6):
>   busybox: drop MARKINT option from init script and syslog-startup.conf
>   busybox: remove incorrect comments from syslog-startup.conf
>   busybox: enable log level configuration in syslog-startup.conf and
>     script
>   busybox: change syslog default to log to a file
>   busybox: enable dropping of duplicates in syslog, off by default
>   distro-tracking-fields: claim responsibility for udev, dpkg, apt,
>     v86d
> 
> Khem Raj (4):
>   gnutls: Fix compilation on uclibc
>   uclibc: Upgrade to latest master
>   e2fsprogs_1.42.bb: Fix build fallout for uclibc
>   gnutls: Fix configure issue wrt to rm
> 
> Lianhao Lu (1):
>   adt-installer: install autoconf(/automake)-nativesdk
> 
> Nitin A Kamble (7):
>   site/ix86-common: fix an error
>   bdwgc: new recipe for autogen
>   libunistring: new recipe for autogen
>   guile: new recipe for autogen
>   autogen-native: new recipe for grub-efi-native
>   grub-efi-native: fix errors with automake 1.11.2
>   distro-tracking: add data for newer recipes
> 
> Saul Wold (10):
>   m4: A better refactoring
>   pango.inc: fix /etc/pango -> /${sysconfdir}/pango/*
>   pkgconfig: Move pkg.m4 from -dev to  package
>   gst-openmax: refactor packages for staticdev
>   liba52: refactor packages for staticdev
>   attr/acl: refactor packages for staticdev
>   db: refactor packages for staticdev
>   js: refactor packages for staticdev
>   boost: refactor packages for staticdev
>   enchant: refactor packages for staticdev

Merged to master, thanks. I tweaked the pkgconfig commit message.

Cheers,

Richard



