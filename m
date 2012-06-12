Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SeVey-0008GA-Hb
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 20:17:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Jun 2012 11:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155387886"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2012 11:07:08 -0700
Message-ID: <4FD7854C.6030204@linux.intel.com>
Date: Tue, 12 Jun 2012 11:07:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339034063.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1339034063.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] archiver.bbclass: Reduce some duplication for function get_licenses
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
X-List-Received-Date: Tue, 12 Jun 2012 18:17:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2012 07:01 PM, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> The content to modify this bbclass is as follow:
> - Use the existing functions to get license as a directory instead of
>    rewriting it for avoiding code duplication.
> - Use SPDXLICENSEMAP to map licenses
>
> The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:
>    Cristian Iorga (1):
>          ltp: Add patch to correct failing build
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib xiaofeng/2473
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2473
>
> Xiaofeng Yan (1):
>    archiver.bbclass: Reduce some duplication for function get_licenses
>
>   meta/classes/archiver.bbclass |   23 ++++++++++++-----------
>   1 files changed, 12 insertions(+), 11 deletions(-)
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


