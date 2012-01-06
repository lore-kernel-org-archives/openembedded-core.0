Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjClA-0002Sb-Jr for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:35:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06GRrRE023242
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 16:27:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23022-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 16:27:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06GRluj023236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 16:27:48 GMT
Message-ID: <1325867267.14746.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 16:27:47 +0000
In-Reply-To: <cover.1325840092.git.dongxiao.xu@intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Fri, 06 Jan 2012 16:35:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 17:04 +0800, Dongxiao Xu wrote:
> Hi Richard,
> 
> This pull request is the hob2 related oe-core changes.
> Please help to review and pull.
> 
> Note that this pull request has dependency on the hob related bitbake changes.
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
>   Richard Purdie (1):
>         image-mklibs/package_ipk: Remove bashisms
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes
> 
> Dongxiao Xu (6):
>   bblayers.conf.sample: Use ?= to set BBLAYERS
>   image.bbclass: Use ?= to set LINGUAS_INSTALL

I merged these.

>   packageinfo.bbclass: add a new bbclass to pass package information

I still have quite a strong dislike of this code, its rather nasty to
require this and I wish we could come up with a less ugly way to collect
up this information.

>   hob.bb: Add a empty image template
>   hob-toolchain: add a new recipe hob-toolchain
>   layers: add a new folder to put user added layers

I don't like these three. They're horribly hob specific and IMO
shouldn't be in the general metadata. If there is no way to avoid them,
they should perhaps go into a meta-hob layer directory to keep them
separate from the rest of the system.

I'm still puzzled how the layers directory helps. We deliberately
support generic layer locations so forcing the user to place them in a
particular place seems like a bit of a backwards step? :/.

Cheers,

Richard




