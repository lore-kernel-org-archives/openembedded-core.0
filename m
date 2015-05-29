Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 331C4606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TBBmct008318; Fri, 29 May 2015 12:11:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HZEd0c0P4ToE; Fri, 29 May 2015 12:11:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TBBYQD008296
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 May 2015 12:11:46 +0100
Message-ID: <1432897894.404.134.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Date: Fri, 29 May 2015 12:11:34 +0100
In-Reply-To: <1432892712-25356-3-git-send-email-leimaohui@cn.fujitsu.com>
References: <1432892712-25356-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1432892712-25356-3-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] licenses.conf:Modified parameters for new spdx.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2015 11:11:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-29 at 17:45 +0800, Lei Maohui wrote:

There is no longer description of the changes here which makes it very
hard to decide if you intended to change some of the things below. They
don't all look to be related to the new class.

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/conf/licenses.conf | 65 +++++++++++--------------------------------------
>  1 file changed, 14 insertions(+), 51 deletions(-)
> 
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 629916b..b732451 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -115,75 +115,38 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
>  # LICENSE_PATH += "${COREBASE}/custom-licenses"
>  
>  # Set if you want the license.manifest copied to the image
> -#COPY_LIC_MANIFEST = "1"
> +COPY_LIC_MANIFEST = "1"

Did you mean to change these defaults?

>  # If you want the pkg licenses copied over as well you must set
>  # both COPY_LIC_MANIFEST and COPY_LIC_DIRS
> -#COPY_LIC_DIRS = "1"
> +COPY_LIC_DIRS = "1"
>  
>  ## SPDX temporary directory
> -SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
> -SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
> +SPDX_TEMP_DIR ?= "${WORKDIR}/spdx_temp"
> +SPDX_MANIFEST_DIR ?= "/home/yocto/fossology_scans"
>  
>  ## SPDX Format info
> -SPDX_VERSION = "SPDX-1.1"
> +SPDX_VERSION = "SPDX-1.2"
>  DATA_LICENSE = "CC0-1.0"
> +## If your fossylogy server is from 2.4.0 to 2.6.1,the LICENSELISTVERSION is 1.19
> +## Reference to http://www.fossology.org/projects/fossology/wiki/Release_Notes
> +LICENSELISTVERSION = "1.19"
> +CREATOR_TOOL = "yocto+fossology-spdx"
>  
>  ## Fossology scan information
>  # You can set option to control if the copyright information will be skipped
>  # during the identification process.
>  #
>  # It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.

You've left this comment in but removed all the example variables?

> -# FOSS_COPYRIGHT = "true"
> -#   NO copyright will be processed. That means only license information will be
> -#   identified and output to SPDX file
> -# FOSS_COPYRIGHT = "false"
> -#   Copyright will be identified and output to SPDX file along with license
> -#   information. The process will take more time than not processing copyright
> -#   information.
> -#
> -
> -FOSS_NO_COPYRIGHT = "true"
>  
> -# A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
> -# used to control if FOSSology server need recursively unpack tar.gz file which
> -# is sent from do_spdx task.
> -#
> -# FOSS_RECURSIVE_UNPACK = "false":
> -#    FOSSology server does NOT recursively unpack. In the current release, this
> -#    is the default choice because recursively unpack will not necessarily break
> -#    down original compressed files.
> -# FOSS_RECURSIVE_UNPACK = "true":
> -#    FOSSology server recursively unpack components.
> -#
> -
> -FOSS_RECURSIVE_UNPACK = "false"

This is another removed option. Why?

> -# An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is used to
> -# control what kind of SPDX output to get from the FOSSology server.
> -#
> -# FOSS_FULL_SPDX = "true":
> -#   Tell FOSSology server to return full SPDX output, like if the program was
> -#   run from the command line. This is needed in order to get license refs for
> -#   the full package rather than individual files only.
> -#
> -# FOSS_FULL_SPDX = "false":
> -#   Tell FOSSology to only process license information for files. All package
> -#   license tags in the report will be "NOASSERTION"
> -#
> -
> -FOSS_FULL_SPDX = "true"

and more removed functionality?

> -# FOSSologySPDX instance server. http://localhost/repo is the default
> -# installation location for FOSSology.
> -#
> +# FOSSologySPDX instance server.
>  # For more information on FOSSologySPDX commandline:
>  #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
> -#
> +# 
>  
> -FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
> -FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
> +# The following commnd is suit for the FOSSologySPDX instance server in localhost.
>  
> -FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
> +FOSS_SERVER ?= "http://127.0.0.1/repo/ --noproxy 127.0.0.1"
> +FOSS_CURL_FLAGS ?= "-F "mod=spdx_license_once" -F "noCopyright=false" -F "jsonOutput=false" -F "fullSPDXFlag=true""

This appears to hardcode some things which used to be configurable?

Cheers,

Richard



