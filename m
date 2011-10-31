Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RL0gc-0002ae-Fd for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 23:50:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMiTsJ022465
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:44:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21770-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:44:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMiLKt022459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:44:22 GMT
Message-ID: <1320101061.8579.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 22:44:21 +0000
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/18] Patches, QA & Bug Fixes
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
X-List-Received-Date: Mon, 31 Oct 2011 22:50:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 00:06 +0200, Saul Wold wrote:
> Khem Raj (1):
>   libtool: Upgrade from 2.4 -> 2.4.2

This didn't go in since it doesn't have the whitespace and SUMMARY
issues I previously mentioned fixed.

> 
> Paul Eggleton (3):
>   dbus: remove unused initscript
>   util-linux: split out mkfs into its own package
>   e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package
> 
> Saul Wold (12):
>   wget: Add recipe from OE

I've pushed a subsequent commit cleaning up a couple of things I noticed
later on this one.

>   dbus-glib: fix QA Packaging issues
>   libgcc: fix QA Packaging issues

The above patch has feedback directly.

>   at: fix QA Packaging issues
>   man: fix QA Packaging issues
>   mdadm: fix QA Packaging issues
>   libatomics-ops: fix QA Packaging issues
>   libproxy: fix QA Packaging issues
>   abiword: convert to svn
>   avahi: use useradd to create user
>   connman: create xuser
>   xserver-nodm-init: use useradd to create xuser

I didn't take these last three since the avahi dbus restart needs to
remain (but can be ignored at rootfs time with an exit 0), I think
you're going to change the xuser homedir and the xserver-nodm-init needs
to preserve the Xusername file since other scripts use it.

> 
> Scott Garman (1):
>   documentation-audit.sh: script for auditing documentation build
>     status
> 
> Wenzong Fan (1):
>   distro_tracking_fields: update packages tracking fields

I merged everything else.

Cheers,

Richard



