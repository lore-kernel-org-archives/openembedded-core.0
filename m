Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U6KXH-0001Da-NT for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 13:37:11 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1FCR1h2029153; Fri, 15 Feb 2013 12:27:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JhDPevmxrJ4p; Fri, 15 Feb 2013 12:27:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1FCQtJP029078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 15 Feb 2013 12:26:58 GMT
Message-ID: <1360930840.11225.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 15 Feb 2013 12:20:40 +0000
In-Reply-To: <cover.1360914386.git.sgw@linux.intel.com>
References: <cover.1360914386.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/22] Package Updates & Fixes
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
X-List-Received-Date: Fri, 15 Feb 2013 12:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-14 at 23:48 -0800, Saul Wold wrote:
> Richard,
> 
> This is mostly a set of package updates with a couple of fixes 
> fro systemd from Khem and Ross.
> 
> Please review Peter's rename patch.
> 
> I have build and booted sato locally with most of the udpated pacakges,
> the Auotbuilder is currently running with Master under Test.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 6c6568e47d6b3b0edaba569bfa4e38f9d72b5122:
> 
>   tzcode/tzdata: Update to 2012j (2013-02-14 23:17:18 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Constantin Musca (1):
>   qemu: upgrade to 1.3.1
> 
> Cristian Iorga (1):
>   alsa-lib: upgrade to 1.0.26
> 
> Cristiana Voicu (1):
>   sanity.bbclass: when bblayers.conf is updated, it invokes a reparse
> 
> Franklin S. Cooper Jr (1):
>   scripts/bitbake: Remove all instances of paths to a layer's scripts
>     directory.
> 
> Khem Raj (1):
>   systemd.bbclass: Dont use libdir and base_libdir for units

The whitespace was corrupt in this. I've fixed it up.

> Laurentiu Palcu (7):
>   xf86-video-intel: upgrade to 2.21.0
>   xf86-input-vmmouse: upgrade to 13.0.0
>   libdrm: upgrade to 2.4.42
>   xkeyboard-config: upgrade to 2.8
>   xf86-input-synaptics: upgrade to 1.6.3
>   xf86-video-vmware: upgrade to 13.0.0
>   xev: upgrade to 1.2.1
> 
> Marko Lindqvist (4):
>   webkit-gtk: update to upstream version 1.8.3
>   gtk+: update to upstream version 2.24.15
>   harfbuzz: update to upstream version 0.9.12
>   libpng: update to upstream version 1.5.14
> 
> Peter Seebach (1):
>   libc-common.bbclass: rename ALL the packages

There is something bothering me about this one, its held for now.

> Ross Burton (4):
>   systemd: add udev-extraconf and USB/PCI IDs to RRECOMMENDS
>   package_ipk: check CONFFILES exist before adding them to metadata
>   xserver-xf86-config: don't ship empty xorg.conf
>   xserver-xf86-config: empty generic xorg.conf

I didn't take the last two due to failures in the MUT build. Ross is
aware of the issue.

> Saul Wold (1):
>   gnupg: fix CVE-2012-6085

Cheers,

Richard



