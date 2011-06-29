Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvAy-0003Yf-C7 for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:51:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDlplR004734
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:47:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04529-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:47:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDlg4D004728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:47:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
Date: Wed, 29 Jun 2011 14:47:26 +0100
Message-ID: <1309355246.20015.382.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6 v4][PULL] 3G network support
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
X-List-Received-Date: Wed, 29 Jun 2011 13:51:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 10:59 +0800, Dongxiao Xu wrote:
> Hi,
> 
> This is the 4th version of 3G patches, please help to review and pull.
> 
> Changes from v3:
> 1) Use DISTRO_FEATURE to handle the dependency of ofono.
> 2) Adopt ofono 0.50 version which could work with Ericsson modem.
>    (ofono's commit d99ca17 fixed the crash issue)
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:
> 
>   u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ggg-v4
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ggg-v4
> 
> Dongxiao Xu (6):
>   connman: Upgrade to version 0.75
>   wpa-supplicant: remove the 0.6.10 version.
>   ofono: upgrade to version 0.50
>   connman-gnome: Add 3G configuration support
>   initscript: Change some order of init scripts
>   task-base: add 3G into DISTRO_FEATURE

These look good to me, merged to masterm thanks!

Richard



