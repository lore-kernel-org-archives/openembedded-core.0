Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8CE7607E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 14:32:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8NEWTM1003591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 07:32:29 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 07:32:28 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190923140129.19981-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4991261d-ed78-3fe9-8218-7e2ef1061a45@windriver.com>
Date: Mon, 23 Sep 2019 10:32:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923140129.19981-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] ffmpeg: update from 4.2 to 4.2.1
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
X-List-Received-Date: Mon, 23 Sep 2019 14:32:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/23/19 10:01 AM, Randy MacLeod wrote:
> This update corresponds to 68 commits to the ffmpeg git repo.
> 52 of these commits are oss-fuzz bug fixes. The remainder include
> improved codex handling and some rpi performance tweaks.
*codecs ?

Also FYI, this includes a fix for CVE-2019-15942
https://nvd.nist.gov/vuln/detail/CVE-2019-15942
as tracked by:
https://trac.ffmpeg.org/ticket/8093

$ git log -1 c1dc4d2d501
commit c1dc4d2d501cd926ce698df86a8cf1d0b77606eb
Author: James Almer <jamrial@gmail.com>
Date: Mon Aug 26 00:54:20 2019 -0300

avcodec/h2645_parse: zero initialize the rbsp buffer

Fixes ticket #8093

Reviewed-by: Andreas Rheinhardt <andreas.rheinhardt@gmail.com>
Signed-off-by: James Almer <jamrial@gmail.com>
(cherry picked from commit af70bfbeadc0c9b9215cf045ff2a6a31e8ac3a71)

$ git tag --contains c1dc4d2d501
n4.2.1

../Randy
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../ffmpeg/{ffmpeg_4.2.bb => ffmpeg_4.2.1.bb}                 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.2.bb => ffmpeg_4.2.1.bb} (98%)
> 
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb
> similarity index 98%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb
> index 307e37e3fe..7f1452e6d0 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.1.bb
> @@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>   SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>              file://mips64_cpu_detection.patch \
>              "
> -SRC_URI[md5sum] = "fb33a9110251873002869664686b2a3f"
> -SRC_URI[sha256sum] = "023f10831a97ad93d798f53a3640e55cd564abfeba807ecbe8524dac4fedecd5"
> +SRC_URI[md5sum] = "67da904cf9fddeeb10a1308fc0dc39de"
> +SRC_URI[sha256sum] = "cec7c87e9b60d174509e263ac4011b522385fd0775292e1670ecc1180c9bb6d4"
>   
>   # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>   ARM_INSTRUCTION_SET_armv4 = "arm"
> 


-- 
# Randy MacLeod
# Wind River Linux

