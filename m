Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCDE77328
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 22:18:20 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZxMfk-0004x4-MC from Nathan_Lynch@mentor.com ;
	Fri, 13 Nov 2015 14:18:20 -0800
Received: from wedge.localnet (147.34.91.1) by svr-orw-fem-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Nov 2015 14:18:19 -0800
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1447432009-9129-1-git-send-email-otavio@ossystems.com.br>
	<1447432009-9129-2-git-send-email-otavio@ossystems.com.br>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <564661AB.9040201@mentor.com>
Date: Fri, 13 Nov 2015 16:18:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447432009-9129-2-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Fri, 13 Nov 2015 22:18:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/13/2015 10:26 AM, Otavio Salvador wrote:
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> similarity index 90%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_git.bb
> index 909acc3..17310ac 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>  DEPENDS = "liburcu popt lttng-ust libxml2"
>  RDEPENDS_${PN}-ptest += "make perl bash"
>  
> -SRCREV = "d522c1f14285e2e8b10b7c0cd011847696ffe779"
> +SRCREV = "d71e55a5f1f423eeaa47c08e5797e47ce8e825fb"
>  
>  PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
>                   am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
> @@ -23,13 +23,9 @@ PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-
>  PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
>  PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
>  
> -SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
> +SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
>             file://runtest-2.4.0.patch \
> -           file://extern-decls.patch \
> -           file://run-ptest \
> -           file://lttng-tools-Fix-live-timer-calculation-error.patch \
> -           file://0001-Fix-sessiond-disable-match-app-event-by-name.patch \
> -	  "
> +           file://run-ptest"
>  
>  S = "${WORKDIR}/git"

Does this recipe need a PV assignment now?

Also consider folding in
http://lists.openembedded.org/pipermail/openembedded-core/2015-October/112087.html


