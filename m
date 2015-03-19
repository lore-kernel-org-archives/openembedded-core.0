Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D964165CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 07:45:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2J7jQtG006531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 00:45:26 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Mar 2015 00:45:26 -0700
Message-ID: <550A7E94.9010500@windriver.com>
Date: Thu, 19 Mar 2015 15:45:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Li Zhou <li.zhou@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1425292222-2756-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1425292222-2756-1-git-send-email-li.zhou@windriver.com>
Subject: Re: [PATCH] libtool: put libltdl.la in the right package.
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
X-List-Received-Date: Thu, 19 Mar 2015 07:45:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping.

// Robert

On 03/02/2015 06:30 PM, Li Zhou wrote:
> The libltdl libraries are put in libltdl-* packages, but libltdl.la
> is packaged in libtool-dev. This change puts libltdl.la in libltdl-dev
> package instead of libtool-dev.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   meta/recipes-devtools/libtool/libtool-2.4.6.inc |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> index ff5abcb..2125de3 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> @@ -45,6 +45,7 @@ FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
>   #FILES_${PN}-dev := "${@oe_filter_out('${datadir}/aclocal', '${FILES_libtool-dev}', d)}"
>   FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
>   FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
> +FILES_libltdl-dev =+ "${libdir}/libltdl.la"
>   FILES_libltdl-staticdev = "${libdir}/libltdl.a"
>   FILES_libltdl-dbg = "${libdir}/.debug/"
>
>

