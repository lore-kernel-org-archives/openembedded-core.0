Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHzRi-0006D9-Iw
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 17:26:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2012 08:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129668720"
Received: from unknown (HELO [10.255.12.89]) ([10.255.12.89])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2012 08:17:27 -0700
Message-ID: <4F85A087.9000604@linux.intel.com>
Date: Wed, 11 Apr 2012 08:17:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334124374.git.xiaofeng.yan@windriver.com>
	<c029961dba1927336453127d856d38961a52b641.1334124374.git.xiaofeng.yan@windriver.com>
In-Reply-To: <c029961dba1927336453127d856d38961a52b641.1334124374.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] archiver.bbclass: Amend the problem for moving tarballs in ${DL_DIR} to ${DEPLOY_DIR}/source when enable archiver
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
X-List-Received-Date: Wed, 11 Apr 2012 15:26:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2012 11:15 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> When running "bitbake core-imamge-minmal", the error information like the following  will appear:
> ERROR: Error executing a python function in
> /buildarea2/yzhao-test/poky-test/meta/recipes-core/zlib/zlib_1.2.6.bb:
> IOError: [Errno 2] No such file or directory:
> '/buildarea2/yzhao-test/poky-test/build-archive/downloads/zlib-1.2.6.tar.bz2'
>
> An absolute path from variable "file" pointed to tarballs in ${DL_DIR} \
> cause this problem. So return base-name of "file" for fixing this bug here.
>
> [YOCTO #2272]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/classes/archiver.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 4e4e964..59b58f4 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -173,6 +173,7 @@ def archive_sources(d,stage_name):
>   	file = get_source_from_downloads(d,stage_name)
>   	if file:
>   		shutil.copy(file,work_dir)
> +		file = os.path.basename(file)
>   	else:
>   		file = archive_sources_from_directory(d,stage_name)
>   	return file

Merged into OE-Core

Thanks
	Sau!


