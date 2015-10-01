Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 37B09770AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 22:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91MS2Dl011260; Thu, 1 Oct 2015 23:28:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3_YB8UHhdPNa; Thu,  1 Oct 2015 23:28:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91MRnAF011197
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Oct 2015 23:28:01 +0100
Message-ID: <1443738469.14733.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Thu, 01 Oct 2015 23:27:49 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84919260DD@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84919260DD@ALA-MBB.corp.ad.wrs.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: PIXBUFCACHE_SYSROOT_DEPS (librsvg)
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
X-List-Received-Date: Thu, 01 Oct 2015 22:28:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 19:24 +0000, Slater, Joseph wrote:
> This variable is used by librsvg_2.40.10.bb, but I can't find anybody
> who processes it, at least not a bbclass.
> 
>  
> 
> Without adding an explicit do_populate_sysroot_setscene[depends] to
> the recipe, gdk-pixbuf-native
> 
> will install from sstate after librsvg-native and clobber the svg
> loader.  At least it does for my configuration.

Did you have
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=00f0d2bfa0a05232a2926f21ef8fe533f436185d applied?

Cheers,

Richard



