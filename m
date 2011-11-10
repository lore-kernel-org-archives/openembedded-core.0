Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1ROYU7-0000E5-Ix
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:32:19 +0100
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 10 Nov 2011 09:26:00 -0800
Received: by yenr11 with SMTP id r11so4923061yen.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 09:25:59 -0800 (PST)
Received: by 10.68.74.132 with SMTP id t4mr16167031pbv.130.1320945959406;
	Thu, 10 Nov 2011 09:25:59 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id 3sm22914751pbx.14.2011.11.10.09.25.57
	(version=SSLv3 cipher=OTHER); Thu, 10 Nov 2011 09:25:58 -0800 (PST)
Message-ID: <4EBC0925.3020900@intel.com>
Date: Thu, 10 Nov 2011 09:25:57 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320855978.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1320855978.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: config cleanups + romely rt support
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
X-List-Received-Date: Thu, 10 Nov 2011 17:32:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2011 08:28 AM, Bruce Ashfield wrote:
> The patch itself has all the details for this one. Just a minor update
> to the meta branch of the 3.0 kernel to pickup the latest BSP config
> updates from Tom and add -rt support from Kishore. These are also
> present in the -dev kernel tree.
>
> Cheers,
>
> Bruce
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
> cc: Kishore Bodke<kishore.k.bodke@intel.com>
>
> The following changes since commit 23d2eaf9d283cae47e52d1151f0d4ad53bbbe8a0:
>
>    python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:48:30 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto: config cleanups + romely rt support
>
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



