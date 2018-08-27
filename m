Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05D8C78EEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:50:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7RFoJXN015120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 08:50:19 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 27 Aug 2018 08:50:19 -0700
To: Jens Rehsack <sno@netbsd.org>, <openembedded-core@lists.openembedded.org>
References: <20180827095429.4949-1-sno@netbsd.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <38867489-0ef0-cb02-843c-b259ae4489b5@windriver.com>
Date: Mon, 27 Aug 2018 23:50:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180827095429.4949-1-sno@netbsd.org>
Subject: Re: [PATCH] distutils3.bbclass: improve error messages
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
X-List-Received-Date: Mon, 27 Aug 2018 15:50:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

1. There are other tasks have the similar bbfatal_log invoking, such as
distutils3_stage_all/distutils3_do_install, why not update them all.

2. Would you please update python2's in distutils.bbclass also?

//Hongxu

On 2018年08月27日 17:54, Jens Rehsack wrote:
> For non-python developers it's difficult to identify where start
> searching in case of errors. Fixing and marking the string to
> grep for might help finding some root causes of issues slightly
> quicker.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>   meta/classes/distutils3.bbclass | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> index 1d0c54a513..9e31505f0c 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -23,14 +23,14 @@ distutils3_do_compile() {
>           STAGING_LIBDIR=${STAGING_LIBDIR} \
>           ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
>           build ${DISTUTILS_BUILD_ARGS} || \
> -        bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
> +        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
>   }
>   distutils3_do_compile[vardepsexclude] = "MACHINE"
>   
>   distutils3_stage_headers() {
>           install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>           ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> -        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
> +        bbfatal_log "'${PYTHON_PN} setup.py install_headers' execution failed."
>   }
>   distutils3_stage_headers[vardepsexclude] = "MACHINE"
>   



