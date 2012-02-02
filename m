Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Rt154-00016s-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:08:22 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Feb 2012 09:53:50 -0800
Received: by iabz7 with SMTP id z7so3679160iab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 09:53:50 -0800 (PST)
Received: by 10.50.213.41 with SMTP id np9mr1779115igc.21.1328205229929;
	Thu, 02 Feb 2012 09:53:49 -0800 (PST)
Received: from [10.6.18.218] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id gw1sm851005igb.0.2012.02.02.09.53.48
	(version=SSLv3 cipher=OTHER); Thu, 02 Feb 2012 09:53:49 -0800 (PST)
Message-ID: <4F2ACDAB.5060103@intel.com>
Date: Thu, 02 Feb 2012 09:53:47 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 0/3] linux-yocto: 3.2.2 and 3.0.18 updates
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
X-List-Received-Date: Thu, 02 Feb 2012 18:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 12:02 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Two kernel updates in this pull request. The bigger change is the
> introduction/release of the 3.2 kernel repository. I've had this
> under test in one form or another for nearly two months now. It
> no only brings in a new kernel, but introduces some branching changes
> and audited kernel configuration fragments. This needs head to the
> servers now to allow add-on work to be completed.
>
> I've built and booted sato on all the emulated targets for the 3.2
> kernel.
>
> There is an associated set of kern-tools changes to support the
> branching in the 3.2 kernel repository, and the changes are fully
> compatible with the existing 3.0 tree.
>
> The second update is a refresh of the 3.0 tree to pickup 3.0.18, and
> to merge a set of pending features to that tree. The commit itself
> tells the story.
>
> I've built and booted this for all the emulated targets as well.
>
> The following changes since commit b719d7e10bdb5bb4fc9ef70256eb93f925fbda4b:
>
>    useradd: Ensure dependencies are only added for target recipes, not native or nativesdk (2012-01-27 16:59:56 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (3):
>    kern-tools: import config audit and branch manipulation updates
>    linux-yocto: add kernel 3.2.2 support
>    linux-yocto: update to v3.0.18 + features
>
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 ++--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   37 ++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   19 ++++-----
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   41 ++++++++++++++++++++
>   5 files changed, 92 insertions(+), 15 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb
>
Merged into OE-core

Thanks
	Sau!


