Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vn0-f52.google.com (mail-vn0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 97D7773BB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 18:47:32 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so19022853vnb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 11:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=9YcNK+89qX3fDpCghtQjwMdQWRw0aoTn5KgbH8129fg=;
	b=c2s1sO4ehMk12yqkAUfXy8JW6pkrsLoybC/U3jniGeGQX67xSscFMAu9VouwHLi7Lc
	OAmXCoWMgEpYEZupCTRBPAmsNH7gGXQ2QG5uHXQY9PYWxnj6gix5dBbPsAmEKCkxcYAK
	VJOPyxdzadaN0QVvThePrQvbnSekBuW/Iq+hH/pud5fSV09hPdSBQodv1JynavbfoGZK
	cO6wtQRDzpmga82jHlucMVXYkQJLLv0hUCdTt2gbC00NsBzabFbaWw1uz8h5XX4Svm9Z
	1vtLdMp6Q2vSCadpjO3N+BGWeTqMxLHvzshC7698EUGHuu1UUN2NZvVKffUBbTUoNG5v
	S0Ww==
X-Gm-Message-State: ALoCoQnFEU/L66hIUYe4+OEnIBHMLqhvOPQTutZOuxEOIfW8ivA1oNmPble1KHVrj9H7hy90zuRt
MIME-Version: 1.0
X-Received: by 10.52.135.4 with SMTP id po4mr33940486vdb.78.1433789253976;
	Mon, 08 Jun 2015 11:47:33 -0700 (PDT)
Received: by 10.52.233.105 with HTTP; Mon, 8 Jun 2015 11:47:33 -0700 (PDT)
In-Reply-To: <1433759139-9297-2-git-send-email-leimaohui@cn.fujitsu.com>
References: <1433759139-9297-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1433759139-9297-2-git-send-email-leimaohui@cn.fujitsu.com>
Date: Mon, 8 Jun 2015 19:47:33 +0100
Message-ID: <CAPhnLPCyaF9D58cisRxeO0dBR-2nwvJ8pkeN5V8eocU9cMcJJw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] licenses.conf: Modified parameters for new spdx.bbclass
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
X-List-Received-Date: Mon, 08 Jun 2015 18:47:33 -0000
Content-Type: text/plain; charset=UTF-8

On 8 June 2015 at 11:25, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> 1) Define new command line to get spdx file.
> 2) Define some mandatory fields for spdx 0.2
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/conf/licenses.conf | 77 +++++++++++++------------------------------------
>  1 file changed, 20 insertions(+), 57 deletions(-)
>
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index 629916b..1d37616 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -122,68 +122,31 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
>  #COPY_LIC_DIRS = "1"
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

Can we also get a prefix to these? LICENSELISTVERSION is hard to debug
if I happen to run across it. If you notice above and below we're
using SPDX_ or FOSS_. Can we decide on one of these for DATA_LICENSE
CREATOR_TOOL and LICENSELISTVERSION (which should be shortened
perhaps)?

> +
> +# FOSSologySPDX instance server.
> +FOSS_SERVER ?= "http://127.0.0.1/repo/ --noproxy 127.0.0.1"
> +
> +# The following commnd is suit for the FOSSologySPDX instance server in localhost.
> +# options:
> +# 1) noCopyright: true/false. Only when this option is set to "true", copyright information is scanned.
> +# 2) jsonOutput: true/false. Only when this option is set to "true", scanning result is output in JSON format.
> +#    Skipping this option equals setting to "false".
> +# 3) fullSPDXFlag: true/false. Only when this option is set to "true", low definition of full SPDX contents are output.
> +#    This option should be set as "true" when user want to generate SPDX file from command line.

There's some trailing whitespace above.

>
> -## Fossology scan information
> -# You can set option to control if the copyright information will be skipped
> -# during the identification process.
> -#
> -# It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.
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
> -
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
> -
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
> -
> -# FOSSologySPDX instance server. http://localhost/repo is the default
> -# installation location for FOSSology.
> -#
>  # For more information on FOSSologySPDX commandline:
> -#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
> -#
> -
> -FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
> -FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
> +# #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
>
> -FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
> +FOSS_CURL_FLAGS ?= "-F "mod=spdx_license_once" -F "noCopyright=false" -F "jsonOutput=false" -F "fullSPDXFlag=true""
>
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

