Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBgVT-0007OC-P3 for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 06:56:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I4rorZ008117;
	Mon, 18 Apr 2011 05:53:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07333-08; Mon, 18 Apr 2011 05:53:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I4rfAZ008111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Apr 2011 05:53:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
Date: Mon, 18 Apr 2011 05:53:34 +0100
Message-ID: <1303102414.5518.30.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Mon, 18 Apr 2011 04:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-15 at 23:54 -0700, Saul Wold wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
> 
> Fixes [YOCTO #968]
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  .../gnu-config/config-guess-uclibc.patch           |    2 ++
>  .../gnu-config/gnu-config_20080123.bb              |    6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
> index f820cef..f862c83 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
> +++ b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Pending
> +
>  Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-guess-uclibc.patch.
>  
>  updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> index e0a8155..897984d 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
> @@ -3,12 +3,14 @@ DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a direc
>  SECTION = "devel"
>  LICENSE = "GPLv1+"
>  LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
> -DEPENDS = ""
> +
> +DEPENDS_virtclass-native = "perl-native"
> +
>  INHIBIT_DEFAULT_DEPS = "1"
>  


I haven't taken this. Having looked at the shear number of horrible
perl-native issues, I'd like to take the same approach we took with the
toolchain staging and place perl into its own bin directory we add to
PATH when needed. I commented on at least one of the bugs in this
respect.

Cheers,

Richard



