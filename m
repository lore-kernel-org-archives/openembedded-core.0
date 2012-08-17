Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2LWH-0003hu-00 for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:19:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC7Hxt008483
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:07:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07451-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:07:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC74Cs008477
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:07:09 +0100
Message-ID: <1345205225.27428.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 13:07:05 +0100
In-Reply-To: <cover.1345199518.git.laurentiu.palcu@intel.com>
References: <cover.1345199518.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 0/3] Add support for relocatable SDK to ADT installer and some fixes
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
X-List-Received-Date: Fri, 17 Aug 2012 12:19:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 13:38 +0300, Laurentiu Palcu wrote:
> Changes in V2:
> 	- addressed Richard's comments and restored the spaces back to tabs in do_populate_adt
> 	  shell function;
> 
> Hi,
> 
> This patchset adds support for relocating SDK to ADT installer and a couple of
> fixes.
> 
> Thanks,
> Laurentiu
> 
> The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:
> 
>   bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_adt
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/relocatable_adt
> 
> Laurentiu Palcu (3):
>   populate_sdk_base.bbclass: fix SDK relocation issues
>   package.bbclass: change RPATHs for cross-canadian binaries
>   adt-installer: add support for relocatable SDK

Merged to master, thanks.

Richard



