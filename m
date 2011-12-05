Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXhQk-00059i-Ux for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 23:54:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5MlpEu027125;
	Mon, 5 Dec 2011 22:47:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25879-10; Mon,  5 Dec 2011 22:47:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB5MliVM027119
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Dec 2011 22:47:45 GMT
Message-ID: <1323125275.25960.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 22:47:55 +0000
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 00/11] recipe fixes for x32 toolchain
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
X-List-Received-Date: Mon, 05 Dec 2011 22:54:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-02 at 12:19 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> These commits fixes building of various recipes with x32 toolchain
> for x32 target/machines. And these do not affect these recipes for
> other non-x32 targets.
> 
> X32 is new ABI for x86-64 architecture.
> For more information refer: https://sites.google.com/site/x32abi/
> 
> Thanks,
> Nitin
> 
> The following changes since commit 9be6d59b78510443d0944513503d515df13caa45:
> 
>   dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/x32
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin.x32
> 
> Nitin A Kamble (11):
>   gst-fluendo-mpegdemux: rework the CC hack
>   mdadm: fix CC definition in the Makefile

There was some feedback on these which I haven't looked into fully.

>   openssl-1.0.0e: fix to wotk with x32 toolchain
>   gmp: fix the recipe for x32 target
>   mesa-dri, mesa-xlib: fix compilation with x32 toolchain
>   glib-2.0: fix compilatoin with x32 toolchain
>   libxt: fix compilatoin with x32 toolchain
>   liboil: patch source code for x32
>   xproto: fix compilation with x32 toolchain
>   libaio: patch source code for x32
>   libatomics-ops: patch source code for x32

These looked reasonable so I've merged them, thanks.

Richard



