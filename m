Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1Xp-0000xz-9n for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:06:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD1Y4l003057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:01:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17826-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:01:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD1SM4003051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:01:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
Date: Mon, 29 Aug 2011 14:01:20 +0100
Message-ID: <1314622880.5939.288.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5 v2][PULL] multilib: various fixes related with login, postinst, etc
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
X-List-Received-Date: Mon, 29 Aug 2011 13:06:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 15:52 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> This pull request contains several multilib fixes addressing issues like
> login failure, missing init/postinst/postrm scripts, missing package files, etc.
> 
> Please help to review and pull.
> 
> Chages from v1:
> Add a new patch that adds renaming logic for INITSCRIPT related variables, which
> fixes the issue of no response of mouse/keyboard in multilib sato image.
> 
> With those fixes, pure multilib sato image lib64-core-image-sato works fine with
> my current testings.
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 81aa4bfbde871af1d569b64499c34a315bf6218e:
> 
>   classes/sanity: enhance the network connectivity test (2011-08-25 08:49:12 -0700)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ml
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml
> 
> Dongxiao Xu (5):
>   base-passwd: Use BPN in FILES paths
>   bitbake.conf: Use BPN in FILES paths
>   multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
>   multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming
>     elements
>   multilib.bbclass: add renaming for INITSCRIPT related variables

Merged to master, thanks.

Richard



