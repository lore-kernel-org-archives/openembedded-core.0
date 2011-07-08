Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDJX-00027J-Tl for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:50:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fk804021434
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:46:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:46:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fk1qs021428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:46:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310090994.git.dongxiao.xu@intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
Date: Fri, 08 Jul 2011 16:45:23 +0100
Message-ID: <1310139923.20015.899.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
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
X-List-Received-Date: Fri, 08 Jul 2011 15:50:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 10:11 +0800, Dongxiao Xu wrote:
> Hi Saul,
> 
> This pull request fixes the alsa-tools recipe build error.
> Please help to review and pull.
> 
> [YOCTO #1038]
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:
> 
>   pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/alsa-tools
> 
> Dongxiao Xu (2):
>   fltk: add this recipe for alsa-tools build
>   alsa-tools: Fix recipe build error.

I'd like to understand whether we need gtk and fltk tools from
alsa-tools at this point in time?

Could we just disable those?

Cheers,

Richard



