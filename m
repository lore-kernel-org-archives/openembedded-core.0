Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm75t-0002CX-OW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:40:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 10:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118567365"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2012 10:29:54 -0700
Message-ID: <4FF32C12.9080003@linux.intel.com>
Date: Tue, 03 Jul 2012 10:29:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341290500.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1341290500.git.lianhao.lu@intel.com>
Subject: Re: [PATCH V2 0/2] remaining ssh IMAGE_FEATURE fixings
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
X-List-Received-Date: Tue, 03 Jul 2012 17:40:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 09:43 PM, Lianhao Lu wrote:
> V2:
>    Please ignore the previous wrong patch set.
>
> These are the remaining patches to fix the bug [YOCTO #2605]
>
> It adds the "openssh-sftp-server" into the task-core-debug-tools so any image built with image feature "tools-debug" allow the user to use sftp.
>
> It processes conflicting IMAGE_FEATURES, i.e. ssh-server-dropbear and ssh-server-openssh.
>
> The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:
>    Richard Purdie (1):
>          package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib llu/ssh
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/ssh
>
> Lianhao Lu (2):
>    task-core-tools-debug: Added openssh-sftp-server.
>    image/core-image: Handle conflicting IMAGE_FEATURES.
>
>   meta/classes/core-image.bbclass                  |   11 ++++++++++-
>   meta/classes/image.bbclass                       |   17 +++++++++++++++++
>   meta/recipes-core/tasks/task-core-tools-debug.bb |    3 +++
>   meta/recipes-sato/images/core-image-sato-sdk.bb  |    2 ++
>   4 files changed, 32 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!


