Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q37Uv-0008S0-5m for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 14:56:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDYgvq019265;
	Fri, 25 Mar 2011 13:34:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17996-07; Fri, 25 Mar 2011 13:34:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDYaw3019255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Mar 2011 13:34:36 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <AANLkTik_K3kuEfaSoSfNqVxyKpmbvYWXh80gfc8DySNX@mail.gmail.com>
References: <cover.1300732395.git.raj.khem@gmail.com>
	<2a46643e032d11e07f6dfec471cadea8e9dba827.1300732395.git.raj.khem@gmail.com>
	<1300899232.3018.31.camel@rex>
	<AANLkTik_K3kuEfaSoSfNqVxyKpmbvYWXh80gfc8DySNX@mail.gmail.com>
Date: Fri, 25 Mar 2011 13:34:29 +0000
Message-ID: <1301060069.3018.127.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] scripts/poky-qemu-internal: Add call to stty
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
X-List-Received-Date: Fri, 25 Mar 2011 13:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 11:13 -0700, Khem Raj wrote:
> On Wed, Mar 23, 2011 at 9:53 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2011-03-21 at 11:34 -0700, Khem Raj wrote:
> >> When qemu is booted into console with -nographics
> >> then after exiting the terminal line settings are messed
> >> up. This patch calls stty sane to restore the terminal
> >> settings to default.
> >>
> >> stty is part of coreutils which is installed on all
> >> host distros hence there is no need to warn about it
> >> being available or not
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  scripts/poky-qemu-internal |    1 +
> >>  1 files changed, 1 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
> >> index 8fd1834..556ce69 100755
> >> --- a/scripts/poky-qemu-internal
> >> +++ b/scripts/poky-qemu-internal
> >> @@ -189,6 +189,7 @@ cleanup() {
> >>          echo "poky-export-rootfs stop $ROOTFS"
> >>          poky-export-rootfs stop $ROOTFS
> >>      fi
> >> +    stty sane
> >>  }
> >>
> >>  n1=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
> >
> > With the recent change to the script to run:
> >
> > $QEMUBIN -kernel $KERNEL $QEMUOPTIONS $SERIALOPTS -no-reboot $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT --append "$KERNCMDLINE $SCRIPT_KERNEL_OPT" || stty sane
> >
> > is the above change still needed?
> 
> this will only execute if the command fails I guess. But the problem
> happens even if qemu ran well.

Ok, I'll take your version but can you update it to remove this other
stty call please? :)

Cheers,

Richard



