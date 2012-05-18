Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVG6O-0007Dw-MI
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 07:51:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2012 22:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144721527"
Received: from unknown (HELO [10.255.13.133]) ([10.255.13.133])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 22:41:43 -0700
Message-ID: <4FB5E115.6030800@linux.intel.com>
Date: Fri, 18 May 2012 08:41:41 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337157396.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1337157396.git.xiaofeng.yan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] archiver.bbclass: Add two default set for avoiding error when missing assignment
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
X-List-Received-Date: Fri, 18 May 2012 05:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2012 11:59 AM, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> This is V2.
>
> Add two default set(SOURCE_ARCHIVE_LOG_WITH_SCRIPTS, SOURCE_ARCHIVE_PACKAGE_TYPE) to archiver.bbclass for avoiding building error when forgetting to assign to them.
> Make some modification according to clarson's suggestion. Thank him correct my fault.
>
> The following changes since commit d4e265661517f8dd4e1648fdc56bac5973f986f6:
>    Saul Wold (1):
>          poky.conf: Change WARNS ->  ERRORS
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib xiaofeng/archiver
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/archiver
>
> Xiaofeng Yan (1):
>    archiver.bbclass: Add two default set for avoiding error when missing
>      assignment
>
>   meta/classes/archiver.bbclass |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
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


