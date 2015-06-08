Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 063C6732B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 18:43:46 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so19006470vnb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 11:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nKqHsr8ODSIzT5U5TaAVciXG6drU31fQ9OGM4yAcrls=;
	b=f20gZ354YCBX5OInf+ecf3uW+XdV60q82bdiIVYyJ4de1nhr16iAFsBoKC+37GKiwV
	j1Wjp+uydm1xdrJ7XRCjQ+bwcwWX8scF8spYo4nF+vx7ni14Tq5JHxeryjwBkixfZ3A2
	ApJhOwlJU6ncAT6gUnJfzv53bZ3xPvOr7TriWE0tm778I7XcfsqAtKUwsQviCIMoIecN
	bBKENjA6uCBngv0KyR6P5zi6B14cu6vdqZekIu3+A5UhbdwxLMN6Duurh7vMgpFhOsgS
	mRziH3cLTyEQadWpQzX9/5ybZer+usrGwHSitvj1w9ny7D/rAyEjzQ32Sh3y+DtphoVs
	ty1w==
X-Gm-Message-State: ALoCoQn7MdVqjFykyXxV1+jJ+ZBFRc5xwZp6eI7hKi9fDrv5hshPpcuDLP3tELCpvIkTBcxnm+Uq
MIME-Version: 1.0
X-Received: by 10.52.190.131 with SMTP id gq3mr25181102vdc.70.1433789027269;
	Mon, 08 Jun 2015 11:43:47 -0700 (PDT)
Received: by 10.52.233.105 with HTTP; Mon, 8 Jun 2015 11:43:47 -0700 (PDT)
In-Reply-To: <1433759139-9297-2-git-send-email-leimaohui@cn.fujitsu.com>
References: <1433759139-9297-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1433759139-9297-2-git-send-email-leimaohui@cn.fujitsu.com>
Date: Mon, 8 Jun 2015 19:43:47 +0100
Message-ID: <CAPhnLPBkLmj2-7XW=Ntud1VdWnjvaGdL=gWLmf2JjECoH6QyoA@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 Jun 2015 18:43:47 -0000
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

We should probably find a relative path here for where to put the
manifest that isn't /home/yocto/. I'd suggest
${TMPDIR}/fossology_scans or something like that.

>
>  ## SPDX Format info
> -SPDX_VERSION = "SPDX-1.1"
> +SPDX_VERSION = "SPDX-1.2"
>  DATA_LICENSE = "CC0-1.0"
> +## If your fossylogy server is from 2.4.0 to 2.6.1,the LICENSELISTVERSION is 1.19
> +## Reference to http://www.fossology.org/projects/fossology/wiki/Release_Notes
> +LICENSELISTVERSION = "1.19"
> +CREATOR_TOOL = "yocto+fossology-spdx"
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

