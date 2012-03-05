Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4gWX-0007sc-1r
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:36:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Mar 2012 14:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="73905781"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2012 14:28:20 -0800
Message-ID: <4F553E04.3040306@linux.intel.com>
Date: Mon, 05 Mar 2012 14:28:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Christopher Larson <kergoth@gmail.com>, 
	Mark Hatle <mark.hatle@windriver.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1330771239.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/3] Realize archiver.bbclass
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
X-List-Received-Date: Mon, 05 Mar 2012 22:36:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2012 02:53 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> archiver.bbclass is for archiving sources , patches and logs including .bb and .inc files by configuring  archiver_configure.bbclass which control what a archiving package should include.
> For archiving a source rpm package, I add some functions to package_rpm.bbclass.
> I also merge source_pkg.bbclass to archiver.bbclass due to their similar functions.
>
Are you going to deprecate/remove the other classes sourcepkg.bbclass, 
src_distribute.bbclass, src_distribute_local.bbclass and 
copyleft_compliance.bbclass

I am still reviewing this and would like to get ACKs from Chris and Mark.

This is going to require some review and testing.  I also sent and email 
about the archiver_configure class.

Can you please let us know how you tested, this is an important change 
and we would like to get it close to correct the first time through.

Thanks for your effort on this.

Sau!

> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/1977
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1977
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (3):
>    package_rpm.bbclass: Add srpm function
>    archiver.bbclass: archive sources, patches,logs to tarball
>    archiver_configure.bbclass: configure the content for archiving
>      package
>
>   meta/classes/archiver.bbclass           |  393 +++++++++++++++++++++++++++++++
>   meta/classes/archiver_configure.bbclass |   35 +++
>   meta/classes/package_rpm.bbclass        |   54 ++++-
>   3 files changed, 479 insertions(+), 3 deletions(-)
>   create mode 100644 meta/classes/archiver.bbclass
>   create mode 100644 meta/classes/archiver_configure.bbclass
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


