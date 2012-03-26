Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC7ha-000138-0E for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:03:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QAs7ve024447
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:54:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17410-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:54:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QArvgq024441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 11:53:59 +0100
Message-ID: <1332759236.28414.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 11:53:56 +0100
In-Reply-To: <cover.1332745722.git.lianhao.lu@intel.com>
References: <cover.1332745722.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fixed gcc-cross-canadian packaging warnings.
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
X-List-Received-Date: Mon, 26 Mar 2012 11:03:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 15:10 +0800, Lianhao Lu wrote:
> Fixed gcc-cross-canadian packaging warnings:
> WARNING: For recipe gcc-cross-canadian-i586, the following files/directories were installed but not shipped in any package:
> WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/i586-poky-linux
> WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/i586-poky-linux/lib
> WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/lib
> 
> The following changes since commit 647595821870693186c9ecad1bdfa12fe4ea334d:
>   Robert P. J. Day (1):
>         core-image-minimal-mtdutils.bb: Simple DESCRIPTION grammar fix.
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/warningfix2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2
> 
> Lianhao Lu (1):
>   gcc-cross-canadian: Fixed packaging warnings.

Merged to master, thanks.

Richard



