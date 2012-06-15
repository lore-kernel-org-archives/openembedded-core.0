Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfXT6-0006eY-OE for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:25:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FEF59s014192
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 15:15:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13116-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 15:14:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FEEwcN014181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 15:14:59 +0100
Message-ID: <1339769698.4471.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 15:14:58 +0100
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 00/17] bug fixes and updates
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
X-List-Received-Date: Fri, 15 Jun 2012 14:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 12:27 -0700, Saul Wold wrote:
> Andrei Gherzan (1):
>   coreutils: Fix a typo in v6.9 (bracket not braket)
> 
> Bogdan Marinescu (1):
>   libpcre: updated to version 8.30
> 
> Bruce Ashfield (2):
>   linux-yocto/3.4: update yaffs2 and drop rc6
>   linux-yocto/3.4: create linux-yocto-rt recipe
> 
> Robert Yang (6):
>   pybootchartgui: add the original code
>   pybootchartgui: remove the original examples
>   pybootchartgui: make the build profiling in pictures
>   pybootchartgui: split the output chart into multiple ones
>   pybootchartgui: Fix the filename and add a default format
>   opkg 0.1.8: do_fetch failed since no checksum specified
> 
> Saul Wold (7):
>   distro_tracking_fields: move to meta-yocto as seperate files
>   busybox: Add check for wifi/bluetooth to enable rfkill
>   curl: enable ssl support
>   quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
>   eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS
>   gcc-target: ensure target packages have the correct virtual package
>     names
>   beecrypt: add patch for build issue on Fedora 17

I merged these. Can open a bug to track improving the ssl situation
though please?

I also merged the "add original code" and "remove examaples" patches,
there is little point in adding and then removing those files.

Cheers,

Richard



