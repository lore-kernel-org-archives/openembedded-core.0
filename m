Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe2tF-0005X2-85 for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:30:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65AQCDG029733
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:26:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29515-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 11:26:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65AQ5Ya029726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:26:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Date: Tue, 05 Jul 2011 11:25:35 +0100
Message-ID: <1309861535.20015.682.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Various QA fixes
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
X-List-Received-Date: Tue, 05 Jul 2011 10:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-04 at 17:46 +0100, Richard Purdie wrote:
> The following changes since commit 2b3bf5350861f62435e2fdf1c56c8a02f4b1b4ac fix
> a number of QA warnings/errors. There are a couple of RFC style commits in this mix:
> 
> A key change is that functionality is added to insane.bbclass to allow 
> skipping of individual QA tests by name. It needs two existing users (elfutils and u-boot)
> to specify which QA tests they want to skip (I'm working on a patch). Any external 
> layer using that variable would need to update and I can't decide if that is a 
> drawback or a feature.
> 
> Also a gettext change I'm testing to see which approach performs best
> is included. A final decision on that will depend on the performance
> test results (thanks go to paul for hightlighting the impact of that
> git-native depenedency).
> 
> Also included is a gcc libiberty fix (yocto #1199).
> 
> They are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib rpurdie/master
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master
> 
> Richard  Purdie (5):
>   gcc: Fix removal of libiberty.a
>   gettext: Disable both git and cvs for autopoint's archive format.
>   gcc: Remove unneeded module .la file and .so link
>   insane.bbclass: Allow INSANE_SKIP to work on a per test basis
>   lttng-viewer: Fixup various QA warnings and a false positive
> 
> Richard Purdie (3):
>   oprofile: Fix QA warnings
>   libgsmd: Fix QA warnings
>   gcc-package-cross: Switch to using pattern matching to detect when to
>     stash libgcc into the sysroot

I've merged these to master. Whilst not a 10% build time improvement on
my test machine, the gettext change did show a clear 2% gain.

I also added the INSANE_SKIP tweaks for db, qemu, u-boot and elfutils so
the majority of QA warnings should be squashed apart from some issues
with ldflags which I'll discuss in another email...

Cheers,

Richard



