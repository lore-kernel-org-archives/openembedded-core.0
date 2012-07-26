Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SuTVb-0007q4-1k
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:14:05 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 12:01:26 -0700
Received: by pbbro8 with SMTP id ro8so3666735pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=VDaQUhJW5dXhWHzRZScsTHWuKYtSJIYffeyBFgBCEhg=;
	b=PhHzrrlQwfAXnVqOSuuCRtujAtIFef9D8zt9h42QvBotP9o234w7zOxvlU7o4mhrn4
	fakguP74/GROwDuQCw7tr4X9y3EU2FY9+u9wILsEie+uRTZ2UtNuiE3DYhYxFM9wX1ku
	Col/0EG5rkIec7Ssu9JPuGaVjuMuHgUoV0cFTz4DOVllRBVosnYyfC2S6JaMTBtSL7iI
	HCYQ5Jf41Mgd8rxNWl3+YXUSvUSBHEud/6mHZaepJ1ydP4M+i9XpLuZB/MXnfaq5wHRg
	TGV4cPfvN6BHT45AVzNqG6Gs+2jdMemW5//Jd1IU6BdiljGKMPGGpLBii8ImJMQjWohS
	HQtw==
Received: by 10.68.238.68 with SMTP id vi4mr7192648pbc.123.1343329285497;
	Thu, 26 Jul 2012 12:01:25 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id qp6sm226084pbc.55.2012.07.26.12.01.23
	(version=SSLv3 cipher=OTHER); Thu, 26 Jul 2012 12:01:24 -0700 (PDT)
Message-ID: <50119403.9030505@intel.com>
Date: Thu, 26 Jul 2012 12:01:23 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343248324.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1343248324.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQlgxLw6GeidbrIHTVvWSBJ93QLy2BMWm2QRQ08XCF4TPlfg70Mw2Li+Ex8XtNWD1yL9szJp
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/1] linux-yocto/rt: update BSP preempt-rt.scc files to enable live boot
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
X-List-Received-Date: Thu, 26 Jul 2012 19:14:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 01:37 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here are some -rt updates from Darren for the x86 boards, nothing
> much to see here, just configuration changes.
>
> Note: these are stacked on my 3.4.6 and 3.4.x-rt14 which haven't
> been merged yet.
>
> Cheers,
>
> Bruce
>
> cc: Darren Hart <dvhart@linux.intel.com>
>
> The following changes since commit 246570852170f316aebedabff48bce84de0b95dc:
>
>    linux-yocto/3.4: 3.4.6 and 3.4.x-rt14 (2012-07-25 08:52:17 -0400)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-rt
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rt
>
> Bruce Ashfield (1):
>    linux-yocto/rt: update BSP preempt-rt.scc files to enable live boot
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!




