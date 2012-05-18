Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVOOv-0001MA-KR for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:43:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEXQXQ017534
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:33:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17518-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:33:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEXH1n017528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:33:19 +0100
Message-ID: <1337351596.28145.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:33:16 +0100
In-Reply-To: <cover.1337246557.git.lianhao.lu@intel.com>
References: <cover.1337246557.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Misc fixes for multilib
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
X-List-Received-Date: Fri, 18 May 2012 14:43:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 17:25 +0800, Lianhao Lu wrote:
> This patch set added a package QA function to detect the potential incorrected
> package dependencies for multilib packages.
> 
> It also fixed the locale related package name in multilib case reported by the
> new package QA function.
> 
> The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:
>   Andrei Gherzan (1):
>         fotowall: Add #include ui_wizard.h to ExportWizard.cpp
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/multilib2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib2
> 
> Lianhao Lu (3):
>   (libc-)package.bbclass: Added MLPREFIX to locale packages.
>   multilib.conf: Added multilib support for kmod.
>   multilib.bbclass: Added multilib specific package QA.

Merged to master, thanks.

Richard



