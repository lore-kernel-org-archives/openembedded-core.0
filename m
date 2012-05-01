Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPD8j-0005dd-3V for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 15:29:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41DJUbA014613
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 14:19:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13377-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 14:19:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41DJObB014607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 14:19:25 +0100
Message-ID: <1335878367.7415.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 14:19:27 +0100
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10] uclibc updates
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
X-List-Received-Date: Tue, 01 May 2012 13:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 10:46 -0700, Khem Raj wrote:
> This patchset updates uclibc git and 0.9.33 recipes to latest git commits
> Some recipes needed fixing for new posix_spawn feature in uclibc_git
> fixed some recipes to let them build on SH4 architecture
> 
> The following changes since commit b8dc9182ed8959ce5a6aa285c3c7f78df2432ac3:
> 
>   qt-4.8.1: Fix compile failures on qemux86 (2012-04-30 10:42:07 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-update
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-update
> 
> Khem Raj (10):
>   uclibc-git: Update to latest git tip
>   uclibc-0.9.33: Update to tip of 0.9.33 branch
>   glib-2.0: Dont disable iconv for uclibc
>   gettext,m4: Add -lrt to LDFLAGS for uclibc
>   musicbrainz: Specify libpthread on cmdline for uclibc
>   gdb: Dont need lttng-ust for SH4
>   gcc-cross.inc: Fix cross testing script
>   pcmanfm: Add sh3/sh4 to supported hosts
>   gdb: Add support for building gdb target for SH4
>   busybox: Pass HOST_CC_ARCH through CONFIG_EXTRA_CFLAGS

Merged to master, thanks.

Richard



