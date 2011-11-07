Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RNTMw-0003yd-C1
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 18:52:26 +0100
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 09:46:11 -0800
Received: by wye20 with SMTP id 20so5182529wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 09:46:10 -0800 (PST)
Received: by 10.227.199.132 with SMTP id es4mr29982991wbb.5.1320687970014;
	Mon, 07 Nov 2011 09:46:10 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id e7sm28534928wbh.12.2011.11.07.09.46.06
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 09:46:08 -0800 (PST)
Message-ID: <4EB8195C.4020606@intel.com>
Date: Mon, 07 Nov 2011 09:46:04 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1320340081.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Mon, 07 Nov 2011 17:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2011 10:11 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from TomZ.
> These are destined for master and separate from any point updates to the 1.1
> release.
>
> In case anyone cares my -dev kernel also has these changes, and it will take
> them to the latest kernel shortly.
>
> This also doesn't bump the preempt-rt branches, since they'll be updated
> to the new -rt first, before taking the 3.0.x stable updates.
>
> Built and booted for all the qemu targets.
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
> cc: Darren Hart<dvhart@linux.intel.com>
>
> Cheers,
>
> Bruce
>
> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:
>
>    meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:28 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto_3.0: update base to v3.0.8 + meta config changes
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
>   2 files changed, 10 insertions(+), 10 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



