Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 296AC60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:50:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAU5oM35021740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 29 Nov 2015 21:50:22 -0800
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 29 Nov 2015 21:50:21 -0800
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Alejandro del Castillo
	<alejandro.delcastillo@ni.com>
References: <1447430355-17813-1-git-send-email-alejandro.delcastillo@ni.com>
	<CAP71WjwrFqt0OuN9omYdwiOtO10-ruxp0pbtAD8T7dK2KF4UgA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <565BE39B.5090304@windriver.com>
Date: Mon, 30 Nov 2015 13:50:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjwrFqt0OuN9omYdwiOtO10-ruxp0pbtAD8T7dK2KF4UgA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: add cache filename length fixes
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
X-List-Received-Date: Mon, 30 Nov 2015 05:50:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/27/2015 05:53 AM, Nicolas Dechesne wrote:
> hi,
>
> +Robert.
>
> On Fri, Nov 13, 2015 at 4:59 PM, Alejandro del Castillo
> <alejandro.delcastillo@ni.com> wrote:
>> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>> ---
>>   ...ng_util-New-file-with-bin_to_hex-function.patch | 122 +++++++++++++++++++++
>>   .../opkg/0002-md5-Add-md5_to_string-function.patch | 110 +++++++++++++++++++
>>   ...0003-sha256-Add-sha256_to_string-function.patch | 110 +++++++++++++++++++
>>   ...4-opkg_download-Use-short-cache-file-name.patch |  85 ++++++++++++++
>>   meta/recipes-devtools/opkg/opkg_0.3.0.bb           |   4 +
>>   5 files changed, 431 insertions(+)
>>   create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
>>   create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
>>   create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
>>   create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
>
> Can this patch be backported to jethro? My jethro builds fail without
> it.. I can carry in my layer, but I believe this would be better in OE
> core.
>
> If needed, I can prepare and test the patch.

Thanks, fine to me to backport it.

// Robert

>
> thanks
>

