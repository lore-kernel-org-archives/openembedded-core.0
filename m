Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sf7KZ-0001R0-FC for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 12:31:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EAKYrZ032205
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 11:20:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32033-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 11:20:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5EAKPmg032199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 11:20:26 +0100
Message-ID: <1339669225.24333.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 11:20:25 +0100
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: [PATCH 00/16] denzil pull request 2
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
X-List-Received-Date: Thu, 14 Jun 2012 10:31:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-12 at 13:36 -0700, Scott Garman wrote:
> Hello,
> 
> This is the second pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
> 
> I'm submitting this as an RFC so the community can offer feedback as
> soon as possible. I'm planning on running this through the Yocto
> autobuilder tonight and will reply to this thread with test results.
> Assuming we get green builds, the goal is to get this pull request
> merged into oe-core's denzil branch fairly quickly, so please speak
> up if you have any comments or concerns with these commits.
> 
> Thanks,
> 
> Scott
> 
> The following changes since commit d7bf94647f17c0382caad8af0bdda837b14b22dc:
> 
>   fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 16:20:31 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-testing
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull2
> 
> Jesse Zhang (1):
>   beecrypt: disable java
> 
> Joe Slater (1):
>   shared-mime-info: fix build race condition
> 
> Joshua Lock (1):
>   sanity.bbclass: copy the data store and finalise before running
>     checks
> 
> Laurentiu Palcu (1):
>   freetype: upgrade to 2.4.9
> 
> Mihai Lindner (1):
>   sudo: fixed wrong `chmod` path
> 
> Paul Eggleton (1):
>   classes/sanity: send sanity check failure as a separate event for Hob
> 
> Paul Gortmaker (1):
>   gitignore: add wildcard to match toplevel patch files
> 
> Richard Purdie (2):
>   bitbake.conf: Improve wget timeouts
>   image.bbclass: Ensure ${S} is cleaned at the start of rootfs
>     generation
> 
> Robert Yang (1):
>   rpm 5.4.0: respect to the arch when choose the alternatives
> 
> Scott Garman (1):
>   runqemu-ifup: enable arp proxying
> 
> Song.Li (1):
>   groff: Fix build on Fedora 17
> 
> Tom Zanussi (2):
>   gnupg: add libusb to DEPENDS
>   gnupg: disable CCID driver
> 
> Xiaofeng Yan (1):
>   ncurses: Avoid occasional builling failure when having parallel
>     processable task
> 
> Zhai Edwin (1):
>   webkit-gtk: Use glib as unicode backend to avoid browser crash

Merged into denzil, thanks.

Richard



