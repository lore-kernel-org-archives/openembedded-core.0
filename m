Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqnB8-0008PH-EL for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:21:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EGfel014194
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:16:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14042-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2011 15:16:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p79EGYaG014188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 15:16:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
Date: Tue, 09 Aug 2011 15:16:02 +0100
Message-ID: <1312899362.14274.301.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2][PULL] Multilib: Fix bug 1340
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
X-List-Received-Date: Tue, 09 Aug 2011 14:21:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 15:35 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> The following two commits fix the issue that, some normal packages are
> built out when building pure multilib image "lib32-core-image-sato".
> 
> Please help to review and pull.
> 
> [YOCTO #1340]
> 
> The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:
> 
>   bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ml2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2
> 
> Dongxiao Xu (2):
>   gnome-doc-utils: Avoid RDEPENDS on bash in native case.
>   module-init-tools-cross: Clean the RDEPENDS value

Merged to master, thanks.

Richard



