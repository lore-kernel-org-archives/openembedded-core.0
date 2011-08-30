Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyVoI-0002gx-Hh for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:25:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULKYIY002152;
	Tue, 30 Aug 2011 22:20:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01344-05; Tue, 30 Aug 2011 22:20:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULKQ3M002138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 22:20:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314242316.git.kai.kang@windriver.com>
References: <cover.1314242316.git.kai.kang@windriver.com>
Date: Tue, 30 Aug 2011 22:20:15 +0100
Message-ID: <1314739215.5939.434.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] bug fix for 1231
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
X-List-Received-Date: Tue, 30 Aug 2011 21:25:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 13:43 +0800, Kang Kai wrote:
> From: Kang Kai <kai.kang@windriver.com>
> 
> Hi Saul,
> 
> qt4-tools-nativesdk needs set the gcc standard header searching paths because
> crosssdk.bbclass uses a undefined variable "includedir_nativesdk".
> 
> These commits are to fix it, and update qt4-tools-nativesdk and cmake-nativesdk
> bb files.
> 
> The following changes since commit 30381645eefe4e3222fd3ce45823f143ce2fa82c:
> 
>   rt-tests: use an explicit commit ID (2011-08-12 21:07:02 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib kangkai/distro
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
> 
> Kang Kai (3):
>   bitbake.conf: set includedir_nativesdk
>   qt4-tools-nativesdk: remove gcc standard paths
>   cmake-nativesdk: remove gcc standard paths

Merged to master, thanks.

Richard



