Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 39677776C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:40:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 07:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="74827870"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 13 Mar 2017 07:40:25 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<b88fa585fc5fd8da7983efd4dbd86a0ed4cc86d9.1489144807.git.alexander.kanavin@linux.intel.com>
	<9e8e04e8-07c9-d7db-d96b-fc54bd14c7ed@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cdee0dc7-8fde-b66b-ea24-921af4c86263@linux.intel.com>
Date: Mon, 13 Mar 2017 16:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <9e8e04e8-07c9-d7db-d96b-fc54bd14c7ed@windriver.com>
Subject: Re: [PATCH 41/44] bash: package bashbug separately
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
X-List-Received-Date: Mon, 13 Mar 2017 14:40:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2017 07:13 PM, Mark Hatle wrote:
> On 3/10/17 5:24 AM, Alexander Kanavin wrote:
>> It's a machine-specific script, which is causing conflicts
>> when multiple versions of bash are installed in multilib setting,
>> and it also does not really make sense for embedded systems anyway.
>
> Out of curiosity what is machine specific here?

--- 
./tmp/work/x86_64-pokymllib64-linux/lib64-bash/4.3.30-r0/packages-split/lib64-bash-bashbug/usr/bin/bashbug 
2017-03-09 16:10:27.000000000 +0200
+++ 
./tmp/work/i586-poky-linux/bash/4.3.30-r0/packages-split/bash-bashbug/usr/bin/bashbug 
2017-03-09 16:03:49.000000000 +0200
@@ -26,14 +26,14 @@
  # configuration section:
  #	these variables are filled in by the make target in Makefile
  #
-MACHINE="x86_64"
+MACHINE="i586"
  OS="linux-gnu"
-CC="x86_64-pokymllib64-linux-gcc  -m64 "
-CFLAGS=" -DPROGRAM='bash' -DCONF_HOSTTYPE='x86_64' 
-DCONF_OSTYPE='linux-gnu' -DCONF_MACHTYPE='x86_64-pokymllib64-linux-gnu' 
-DCONF_VENDOR='pokymllib64' -DLOCALEDIR='/usr/share/locale' 
-DPACKAGE='bash' -DSHELL -DHAVE_CONFIG_H   -I.  -I../bash-4.3.30 
-I../bash-4.3.30/include -I../bash-4.3.30/lib   -O2 -pipe -g 
-feliminate-unused-debug-types 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-bash/4.3.30-r0=/usr/src/debug/lib64-bash/4.3.30-r0 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-bash/4.3.30-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-bash/4.3.30-r0/lib64-recipe-sysroot= 
  -DNON_INTERACTIVE_LOGIN_SHELLS"
+CC="i586-poky-linux-gcc  -m32 -march=i586 "
+CFLAGS=" -DPROGRAM='bash' -DCONF_HOSTTYPE='i586' 
-DCONF_OSTYPE='linux-gnu' -DCONF_MACHTYPE='i586-poky-linux-gnu' 
-DCONF_VENDOR='poky' -DLOCALEDIR='/usr/share/locale' -DPACKAGE='bash' 
-DSHELL -DHAVE_CONFIG_H   -I.  -I../bash-4.3.30 -I../bash-4.3.30/include 
-I../bash-4.3.30/lib   -O2 -pipe -g -feliminate-unused-debug-types 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/i586-poky-linux/bash/4.3.30-r0=/usr/src/debug/bash/4.3.30-r0 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/i586-poky-linux/bash/4.3.30-r0/recipe-sysroot-native= 
-fdebug-prefix-map=/home/ak/development/poky/build-multilib/tmp/work/i586-poky-linux/bash/4.3.30-r0/recipe-sysroot= 
  -DNON_INTERACTIVE_LOGIN_SHELLS"
  RELEASE="4.3"
  PATCHLEVEL="46"
  RELSTATUS="release"
-MACHTYPE="x86_64-pokymllib64-linux-gnu"
+MACHTYPE="i586-poky-linux-gnu"

  PATH=/bin:/usr/bin:/usr/local/bin:$PATH
  export PATH


Alex


