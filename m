Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Ruyzj-0005bW-2P
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:18:59 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Feb 2012 20:09:49 -0800
Received: by iabz7 with SMTP id z7so266097iab.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 20:09:48 -0800 (PST)
Received: by 10.50.34.202 with SMTP id b10mr30364963igj.30.1328674188478;
	Tue, 07 Feb 2012 20:09:48 -0800 (PST)
Received: from [10.6.18.245] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ub10sm24554933igb.7.2012.02.07.20.09.45
	(version=SSLv3 cipher=OTHER); Tue, 07 Feb 2012 20:09:46 -0800 (PST)
Message-ID: <4F31F588.9060306@intel.com>
Date: Tue, 07 Feb 2012 20:09:44 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328423023.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1328423023.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 08 Feb 2012 04:18:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2012 10:31 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> This is a follow on to the 3.2 tree and src_patches changes that I sent
> last week.
>
> The ability to specify out of tree BSPs via single .scc files is not
> possible, as well as any automatic BSPs following the naming conventions
> of the 3.2 tree.
>
> The meta branch changes are routine, with the exception being that I got
> a report that 3.0 -rt wasn't patching. That report turned out to be true,
> and I've fixed it here.
>
> Cheers,
>
> Bruce
>
> The following changes since commit cb89d43473a91ff4cb2447d642fcd9308d7366e3:
>
>    libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:34 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (5):
>    linux-yocto: locate and use out of tree features specified on the
>      SRC_URI
>    linux-yocto: meta updates for sys940x and cleanup
>    linux-yocto: rt compiliation fix
>    kern-tools: remove explicit 'yocto' references from auto-bsp handling
>    linux-yocto: fri2: use emgd-1.10
>
>   meta/classes/kernel-yocto.bbclass                  |   21 ++++++++++++++++++++
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
>   5 files changed, 25 insertions(+), 4 deletions(-)
>

Merged into OE-core with updated patch set

Thanks
	Sau!



