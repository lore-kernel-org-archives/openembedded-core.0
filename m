Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SgfGf-0001qY-Vz
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 18:57:34 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 18 Jun 2012 09:46:32 -0700
Received: by dano14 with SMTP id o14so7071819dan.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 09:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=cQdGU8GqsVQzSoGzwmLM6dAhwVH6mlr80jmUgCFYegA=;
	b=iLVyBp6yq3C983mGsWjw4ZUzR+A40t1Pfz7wrkvTkOX+lXNxjMe9hZLV46WaEBzfqg
	pm/b0p97pJnK7ZDtqeUDDT1FAcNxxnfQdeBouT/QlrLPNuaOnWrrqafujLKK5euz4JZd
	6c6iSZf+r2geNFiUrYpTFF67JkOwD80aZXR5m6vjswNPQ2bHGHhx4NqgR7yBijh78F7U
	ecle1cjfkQu/Zh0FHpkA8h06njULALDNwIYlmWA9WFbhLKHWu6AFcPSgXKNub/bjVL/U
	1DEA3ZadLf0s7Wo1MyQywtWkzKWwU7PJiUed+dXCiUtiKigmXbrd44PYxVcbw5srSz+3
	UIZA==
Received: by 10.68.219.166 with SMTP id pp6mr53528403pbc.35.1340037991582;
	Mon, 18 Jun 2012 09:46:31 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id og4sm24423508pbb.48.2012.06.18.09.46.29
	(version=SSLv3 cipher=OTHER); Mon, 18 Jun 2012 09:46:29 -0700 (PDT)
Message-ID: <4FDF5B63.1030005@intel.com>
Date: Mon, 18 Jun 2012 09:46:27 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339777686.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339777686.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQluj6NJ54xRkYrwvYUWtgWBpWByP2fFNpaleDZglKM3CEA90FqJ9X5Nzc3XK0NwuiwNmiyT
Subject: Re: [PATCH 0/1] meta-skeleton: add linux-yocto-custom reference recipe
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
X-List-Received-Date: Mon, 18 Jun 2012 16:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2012 09:30 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> There have been some korg and custom recipes that use the linux-yocto
> tools on top of other git repositories in poky-extras for quite some
> time.
>
> To increase the visibility, I've clean linux-yocto-custom and moved
> it to meta-skeleton. All relevant documentation on how to use this is
> within the recipe itself (and hence the patch that follows this
> pull request).
>
> Cheers,
>
> Bruce
>
> The following changes since commit 4bb7ef94fca392bcd389ed7069280c238f8fe094:
>
>    directfb: added missing Upstream-status (2012-06-15 15:44:39 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/skeleton
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/skeleton
>
> Bruce Ashfield (1):
>    meta-skeleton: add linux-yocto-custom reference recipe
>
>   .../recipes-kernel/linux/linux-yocto-custom.bb     |   46 ++++++++++++++++++++
>   .../0001-linux-version-tweak.patch                 |   26 +++++++++++
>   .../linux/linux-yocto-custom/feature.scc           |    1 +
>   .../linux/linux-yocto-custom/smp.cfg               |    1 +
>   4 files changed, 74 insertions(+), 0 deletions(-)
>   create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>   create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
>   create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/feature.scc
>   create mode 100644 meta-skeleton/recipes-kernel/linux/linux-yocto-custom/smp.cfg
>

Merged into OE-Core

Thanks
	Sau!


