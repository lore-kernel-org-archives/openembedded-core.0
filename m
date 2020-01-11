Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE497FFC3
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 01:47:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00B1larv000814
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 10 Jan 2020 17:47:36 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 10 Jan 2020 17:47:35 -0800
To: Armin Kuster <akuster808@gmail.com>, <openembedded-core@openembedded.org>
References: <cover.1578544698.git.akuster808@gmail.com>
	<e6c4017727008ac2f665e843d59d53b584f3f1b3.1578544698.git.akuster808@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <682de25c-1484-196c-e9d3-e454f1306542@windriver.com>
Date: Fri, 10 Jan 2020 20:47:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e6c4017727008ac2f665e843d59d53b584f3f1b3.1578544698.git.akuster808@gmail.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [zeus 24/28] python3: RDEPEND on libgcc
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
X-List-Received-Date: Sat, 11 Jan 2020 01:47:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 1/8/20 11:49 PM, Armin Kuster wrote:
> From: Joshua Watt <jpewhacker@gmail.com>
> 
> =help>
> List-Subscribe:
>   <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
>   <mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
> Content-Type: text/plain; charset="us-ascii"
> Sender: openembedded-core-bounces@lists.openembedded.org
> Errors-To: openembedded-core-bounces@lists.openembedded.org
> X-Virus-Scanned: clamav-milter 0.101.4 at dan
> X-Virus-Status: Clean
> X-Evolution-Source: 1525863794.3857.16@hex
> Content-Transfer-Encoding: 8bit

A copy/paste error or something inserted extra text.
Please remove it up before merging.

../Randy

> 
> Python uses features of glibc that require it to dynamically load (i.e.
> dlopen()) libgcc_s at runtime. However, since this isn't a link time
> dependency, it doesn't get picked up automatically by bitbake so
> manually add it to RDEPENDS.
> 
> There is an outstanding bug in Python to make it explicitly link against
> libgcc at link time which would remove the need for this. See:
> https://bugs.python.org/issue37395
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit df107f3a149b1e88d9f869e7ff87950ccf5aaee0)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/recipes-devtools/python/python3_3.7.6.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
> index d3706cdf64..407c5a2bd9 100644
> --- a/meta/recipes-devtools/python/python3_3.7.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.6.bb
> @@ -322,6 +322,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
>   PACKAGES += "${PN}-man"
>   FILES_${PN}-man = "${datadir}/man"
>   
> +# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
> +RDEPENDS_${PN} = "libgcc"
>   RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
>   RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>   RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
> 


-- 
# Randy MacLeod
# Wind River Linux

