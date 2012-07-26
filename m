Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SuTqV-0000Dc-0z
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:35:39 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 12:24:06 -0700
Received: by pbbro8 with SMTP id ro8so3691760pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=aPtqtpvFX4waXolHnyhg2PwCfApIHaxxgLMQ+mM7bpE=;
	b=W931QZvX3l0+SmTDNAZ2r9w3qbZ2cNux8vdU/wEU5PXVVAAJ+3KgEAhL/VYXoZw663
	ZSEGS6CBqn6T3Em5UUQSzAsJtVoiN4/bph2QhyUXoSe3rXK3+Qcl0c/2seWVkIE1clGS
	MwHV+QEmEtaOSTeX7GpIbtDAsWOR7exU/BjN9yTnFvA084uK09RyBDb19m/DGLmE+661
	M+FMnKPvkYgQo+vHV1ilv6k3iYzOHNNQv81wYlX9xwwvhaoctS9HATjKsG5nBrF/vDAO
	/T9Y+R2xw21X90LVmYX2DvdzT5wR+iMCzb9Y8PPCvjGimq0FSDEUp0o9zI+tKqHtsu6z
	hu+w==
Received: by 10.68.138.169 with SMTP id qr9mr7822621pbb.27.1343330646399;
	Thu, 26 Jul 2012 12:24:06 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id oo6sm264791pbc.22.2012.07.26.12.24.03
	(version=SSLv3 cipher=OTHER); Thu, 26 Jul 2012 12:24:05 -0700 (PDT)
Message-ID: <50119952.9060405@intel.com>
Date: Thu, 26 Jul 2012 12:24:02 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343063241.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1343063241.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQloyzkyivdJUDrnGLIDizFUecrmvDaaXBUtny4aK06MvBqCUEOV0+VG9Hbiwu+BOexzHzps
Subject: Re: [PATCH 0/1] linux-yocto/3.4: -stable and -rt updates
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
X-List-Received-Date: Thu, 26 Jul 2012 19:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 10:10 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> A fairly simple refresh of the 3.4 kernel to pickup 3.4.6 and update
> the -rt patch to -rt14.
>
> Tested on qemu* locally. Updates to other layers will follow later.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 315d52934693b14f08b62f3f5f361d834484e180:
>
>    Pyphon-native: Fix typo (2012-07-22 14:20:57 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: 3.4.6 and 3.4.x-rt14
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
>   2 files changed, 12 insertions(+), 12 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!




