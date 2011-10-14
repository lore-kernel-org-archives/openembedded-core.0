Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REkuK-0002oR-Mj
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:46:52 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:41:06 -0700
Received: by wwn22 with SMTP id 22so1025719wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:41:04 -0700 (PDT)
Received: by 10.216.230.83 with SMTP id i61mr3485620weq.54.1318610464581;
	Fri, 14 Oct 2011 09:41:04 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id p2sm15117306wbo.17.2011.10.14.09.41.02
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:41:03 -0700 (PDT)
Message-ID: <4E98661C.9060501@intel.com>
Date: Fri, 14 Oct 2011 09:41:00 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318452930.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1318452930.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: config cleanup and streamlining
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
X-List-Received-Date: Fri, 14 Oct 2011 16:46:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2011 01:58 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> This is a master only pull request (not that I need to
> tell you that) that contains some cleanups that Tom has been
> doing for various intel BSPs (although the changes will be
> useful elsewhere).
>
> I've also pushed these out to the dev kernel, in case anyone
> is interested.
>
> This incorporates the following meta branch commits:
>
>    353d43d fri2: cleanup bsp config
>    2a605e2 sugarbay: cleanup bsp config
>    47b76ed fishriver: cleanup bsp config
>    ad6edab jasperforest: cleanup bsp config
>    07f7e89 emenlow: cleanup bsp config
>    d32a651 crownbay: cleanup bsp config
>    ad2d621 meta: add vesafb feature
>    913facf features/drm-psb: add related config options
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 2cf9fb4df498fe0e4fa8356dc663fdfdec9a98cc:
>
>    hal/hal-info: This is unsed in OE-Core and deprecated, drop (2011-10-12 14:12:10 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto: config cleanup and streamlining
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



