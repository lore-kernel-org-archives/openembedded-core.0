Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A7A7C77209
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:17:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 07:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="755265801"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.11.10])
	by orsmga003.jf.intel.com with ESMTP; 29 Feb 2016 07:17:12 -0800
Message-ID: <1456759026.3164.19.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org, akuster@mvista.com
Date: Mon, 29 Feb 2016 15:17:06 +0000
In-Reply-To: <cover.1456278327.git.akuster@mvista.com>
References: <cover.1456278327.git.akuster@mvista.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH 00/11] Fido Security fixes #2
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
X-List-Received-Date: Mon, 29 Feb 2016 15:17:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-23 at 17:48 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> please consider these changes for the next fido update.
> 
> This is to meet our obligation for Yocto compatibility
> 
> The following changes since commit
> 9037f2c7c797367c2d09b87f344ecf749d28cb41:
> 
>   gdk-pixbuf: Security fix CVE-2015-7674 (2016-02-22 19:08:53 -0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fi
> do_cve_fixes
> 
> Armin Kuster (10):
>   busybox: Security fix CVE-2011-5325

This doesn't appear to actually fix anything, it just adds this patch
which notes a potential security issue:

https://git.busybox.net/busybox/commit/?id=a116552869db5e7793ae10968eb3
c962c69b3d8c

>   libpng: Security fix CVE-2015-8126
>   libpng: Security fix CVE-2015-8472
>   libgcrypt: Security fix CVE-2015-7511
>   curl: Security fix CVE-2016-0754
>   curl: Secuirty fix CVE-2016-0755
>   bind: Security fix CVE-2015-8461
>   nettle: Security fix CVE-2015-8803 and CVE-2015-8805
>   nettle: Security fix CVE-2015-8804
>   git: Security fixes CVE-2015-7545
> 
> Li Zhou (1):
>   rpcbind: Security Advisory - rpcbind - CVE-2015-7236

Queued in joshuagl/fido-next

Regards,

Joshua

