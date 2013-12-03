Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5D816D84A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 00:59:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB30xaO9021916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 16:59:36 -0800 (PST)
Received: from [147.11.117.81] (147.11.117.81) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 2 Dec 2013 16:59:35 -0800
Message-ID: <529D2CEB.5030306@windriver.com>
Date: Mon, 2 Dec 2013 19:59:23 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
	<d0f1d19cffaedaec7200ca118fac58494232d172.1385728901.git.Qi.Chen@windriver.com>
In-Reply-To: <d0f1d19cffaedaec7200ca118fac58494232d172.1385728901.git.Qi.Chen@windriver.com>
X-Originating-IP: [147.11.117.81]
Subject: Re: [PATCH 13/18] gzip: explicitly rdepend on bash
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
X-List-Received-Date: Tue, 03 Dec 2013 00:59:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-29 07:48 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Make gzip explicitly rdepend on bash so that the rootfs task will
> not fail for the reason of implicit runtime bash dependency.


Can you explain why bash is needed?

Same question for the other cases where you add
bash as an RDEPEND but don't explain why busybox's
/bin/sh will not suffice.

../Randy

>
> [YOCTO #5555]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-extended/gzip/gzip.inc |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
> index 6ec1dae..a4eddaa 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>
>   SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
>
> +RDEPENDS_${PN}_class-target = "bash"
> +
>   inherit autotools
>
>   do_install_append () {
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

