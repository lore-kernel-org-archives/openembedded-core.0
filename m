Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVOQX-0001Oi-SD for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:45:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEZ602017560
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:35:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17487-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:35:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEYvsv017539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:34:59 +0100
Message-ID: <1337351696.28145.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:34:56 +0100
In-Reply-To: <cover.1337265813.git.jiajun.xu@intel.com>
References: <cover.1337265813.git.jiajun.xu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Add test script to re-execute tasks
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
X-List-Received-Date: Fri, 18 May 2012 14:45:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 22:48 +0800, Jiajun Xu wrote:
> Hi Richard,
> This patch is to address bug 2123. Please help to review it.
> It is based on the patch you posted on bugzilla. A similar function is
> added into the script to remove sstate files only.
> 
> Thanks,
> Jiajun
> 
> The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:
> 
>   fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 07:33:15 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib
> 
> Jiajun Xu (1):
>   test-reexec: Add script to address issues when task re-execution

Merged to master, thanks.

Richard



