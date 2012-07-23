Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1StNDz-0005Ep-Fq
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 20:19:19 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 11:07:51 -0700
Received: by pbbro8 with SMTP id ro8so11218692pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=WkbPceB9XC3sB+hVWD8SUbzDOMuddNcd/YnTlZPrTgE=;
	b=GQ6B0MzAXdX1OwPxfUAK8/l2GlI9EIgtnItO8HPZc7Qe/SENcXmyWjeVOZEwslKnMH
	u+/exG/L2FzBpGk+mfIjVy3caEqOyCw/MVz9ZLxcnR3E7kjtycm1KuDz9a8nyPDNqoCh
	dskmNNsDA4sCsB04fiF+f67PBuzL6vOHHTcKrG9kCGHFPN8xHw6Zm628aLAlTuA4J71L
	+r2NC8SOO9C5ZQztGyO8CAzzuTykKGDzKN6QatMF2eNnrcfF5PGSMIHB7LNtbnlPSCQJ
	3c6BlrXyP5z3+RVYd6LxxMQi/atC3WZVdV+XqIKMDyHb6qVbv6oxFPCbQnfxMImghgPb
	hUcg==
Received: by 10.68.217.100 with SMTP id ox4mr37200201pbc.87.1343066869144;
	Mon, 23 Jul 2012 11:07:49 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id qd2sm6794101pbb.29.2012.07.23.11.07.47
	(version=SSLv3 cipher=OTHER); Mon, 23 Jul 2012 11:07:47 -0700 (PDT)
Message-ID: <500D92F2.3090707@intel.com>
Date: Mon, 23 Jul 2012 11:07:46 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkxfpFlfqRGqg8saAYM9sHGRQrN5aIS5AT8l72p3hBkhRwP9kf6qLs0Wg9SD4Jff2/hbaZu
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull
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
X-List-Received-Date: Mon, 23 Jul 2012 18:19:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 08:19 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> I've got some -stable updates, -rt updates and other changes
> that are almost done, but I wanted to get these smaller patches
> out of my queue first.
>
> We have some cleanup patches from Robert P. J. Day and a meta
> branch update for EMGD, CONFIG_MTD_NAND_VERIFY_WRITE and kmemcheck.
>
> I've gone ahead and pushed the emgd update from Nitin, if it requires
> re-work, we'll just add more commits to the branch.
>
> Tom/Nitin: speak up if there's a problem with this!
>
> Cheers,
>
> Bruce
>
> cc: Nitin A Kamble <nitin.a.kamble@intel.com>
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Andrea Adami <andrea.adami@gmail.com>
> cc: Robert P. J. Day <rpjday@crashcourse.ca>
>
> The following changes since commit 98a1fd1e734db50380a3a37d35767ccb4cc21f7c:
>
>    documentation: Config fragment sections updated (2012-07-20 12:32:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes
>
> Robert P. J. Day (2):
>    kernel-yocto.bbclass: Fix some obvious typoes in comments.
>    kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git
>      directory
>
>   meta/classes/kernel-yocto.bbclass               |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
>


Merged into OE-Core

Thanks
	Sau!


