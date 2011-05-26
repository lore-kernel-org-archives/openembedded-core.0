Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPkVv-0002tW-EY for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 02:02:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNxmHH028937
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:59:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28879-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:59:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNxdq7028931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:59:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306451124.git.sgw@linux.intel.com>
References: <cover.1306451124.git.sgw@linux.intel.com>
Date: Fri, 27 May 2011 00:59:34 +0100
Message-ID: <1306454374.27470.228.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 0/9] Fixes for M1 and build breakage
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
X-List-Received-Date: Fri, 27 May 2011 00:02:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 16:07 -0700, Saul Wold wrote:
> Darren Hart (1):
>   utils.bbclass: make FILESEXTRAPATHS colon delimited

Feedback to patch sent, can be simplified (I think).

> Koen Kooi (2):
>   dbus: clean up dbus-x11 packaging
>   x11-common: fix dbus-launch RDEPENDS

Merged

> Martin Jansa (1):
>   rm_work: keep all sigdata files in stamps dir

Merged

> Nitin A Kamble (1):
>   mesa-xlib: workaround gcc 4.6.0 ICE

Merged an update version Nitin provided

> Phil Blundell (1):
>   busybox: sync do_install() with oe master (mostly)

I want to check something with this one first so held back for now as
its late and I'd like to sleep :)

> Saul Wold (3):
>   bitbake.conf: change IMAGE_ROOTFS_EXTRA_SPACE to soft (?=) default
>   gnutls: Add libcap to DEPENDS
>   Revert "createrepo: Update to 0.9.9"

Merged.

Cheers,

Richard



