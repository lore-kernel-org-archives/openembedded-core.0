Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7eY4-0001dj-2l
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 04:06:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2012 19:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117470882"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 13 Mar 2012 19:57:05 -0700
Message-ID: <4F600901.1050108@linux.intel.com>
Date: Tue, 13 Mar 2012 19:57:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
	<404febfffd308c4a39682210456761c6bdbc8edb.1331642569.git.xiaofeng.yan@windriver.com>
In-Reply-To: <404febfffd308c4a39682210456761c6bdbc8edb.1331642569.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 6/7] local.conf.sample: Add set for archiving packages
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
X-List-Received-Date: Wed, 14 Mar 2012 03:06:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 05:52 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> User can use these variables to get atchiving packages they want.
>
> [YOCTO #1977]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta-yocto/conf/local.conf.sample |   25 +++++++++++++++++++++++++
>   1 files changed, 25 insertions(+), 0 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index 38507e3..6f16c9a 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -121,6 +121,31 @@ DISTRO ?= "poky"
>   PACKAGE_CLASSES ?= "package_rpm"
>
>   #
> +# Archiving packages configuration
> +#
> +# The following variables lists which files to archive and the package type to archive.
> +# One bbclass of them (archive-original-source.bbclass,archive-patched-source.bbclass
> +# and archive-configured-source.bbclass) should be inherited in a globale bbclass, for example,
> +# intherit archive-original-source in packages_rpm.bbclass
> +#
> +# SOURCE_ARCHIVE_PACKAGE_TYPE = {'tar','srpm'}
> +#SOURCE_ARCHIVE_PACKAGE_TYPE ?= 'tar'
> +#
> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS = {'logs_with_scripts', 'logs'}
> +# String 'logs_with_scripts' include temp directory and .bb and .inc files
> +# String 'logs' only include temp
> +#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
> +#
> +# PATCHES_ARCHIVE_WITH_SERIES = {'true', 'false'}
> +# Strings 'true' means that patches including series files(series + non-applying)
> +# String 'false' means that no series and only archive applying patches
> +#PATCHES_ARCHIVE_WITH_SERIES ?= 'true'
> +#
Why the distinction?  Also, you seem to translate this to all or 
applying, so why not just use those terms here and always include the 
series file?

The PATCHES_ARCHIVE_WITH_SERIES does not really make sense when 
non-applying is added in.

> +# Archive packages for copyleft(GPL*,LGPL*)
> +#COPYLEFT_COMPLIANCE ?= 'true'
> +#
> +
> +#
>   # SDK/ADT target architecture
>   #
>   # This variable specified the architecture to build SDK/ADT items for and means


