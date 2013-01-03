Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TqkM7-0006Nf-Qm for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:57:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r03Cg2ON012752;
	Thu, 3 Jan 2013 12:42:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32506-03; Thu,  3 Jan 2013 12:41:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r03Cfvhu012746
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 3 Jan 2013 12:41:58 GMT
Message-ID: <1357216919.28649.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Thu, 03 Jan 2013 12:41:59 +0000
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/15] denzil pull request 5
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
X-List-Received-Date: Thu, 03 Jan 2013 12:57:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-12-28 at 13:41 -0800, Scott Garman wrote:
> This is a pull request for denzil, it includes a number of security
> fixes and a few important bugfixes. The poky-based tree has been run
> through the autobuilder as follows:
[...]
> The following changes since commit d35560f33f257bd12a07c7c0be770319086d6ad9:
> 
>   squashfs: fix for CVE-2012-4024 (2012-11-30 14:51:10 -0800)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull5
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull5
> 
> Khem Raj (5):
>   coreutils: Fix build with eglibc 2.16
>   diffutils: Fix build with eglibc 2.16
>   gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
>   bison: Fix for gets being removed from eglibc 2.16
>   grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
> 
> Li Wang (1):
>   librsvg: CVE-2011-3146
> 
> Mihai Lindner (1):
>   sysklogd: removed tabs from syslog.conf
> 
> Richard Purdie (1):
>   boot-directdisk: Fix kernel location after STAGING_KERNEL_DIR change
> 
> Scott Garman (6):
>   psplash: new patch to fix segfault
>   build-appliance-image: Allow SRCREV to be overriden
>   gitignore: add generated doc files to ignore list
>   libxml2: patch for CVE-2012-2871
>   freetype: patches for CVE-2012-5668, 5669, and 5670
>   cups: patch for CVE-2011-2896
> 
> yanjun.zhu (1):
>   squashfs: fix CVE-2012-4025

Merged into denzil, thanks.

Richard



