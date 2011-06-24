Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qa4Tj-0002we-Nf for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 13:23:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OBJdm0030259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:19:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29635-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:19:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OBJSF5030253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:19:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308902622.git.jiajun.xu@intel.com>
References: <cover.1308902622.git.jiajun.xu@intel.com>
Date: Fri, 24 Jun 2011 12:19:25 +0100
Message-ID: <1308914365.20015.154.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] update cvs and iptables to newer version for toolchain test
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
X-List-Received-Date: Fri, 24 Jun 2011 11:23:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-24 at 16:11 +0800, Jiajun Xu wrote:
> The old versions of cvs and iptables may meet compile error under some architecture
> - cvs 1.11.23 fails on x86-64 host and iptables 1.4.9 fails on arm host. Update them
> to latest version could solve these build error.
> Meanwhile, 240s timeout is set for sudoku becasue 120s is not enough to finish
> compile.
> 
> The following changes since commit 7cd2ac0e40d854bab9a32512018aff6172500c0e:
> 
>   common-licenses: Additions and corrections (2011-06-23 23:44:49 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib jxu49/master
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/master
> 
> Jiajun Xu (1):
>   qemuimagetest: update cvs and iptables to newer version for toolchain
>     test

Merged to master, thanks.

Richard



