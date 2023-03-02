Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EE8C7EE30
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:55:48 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.10676.1677747345260710680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [172.31.28.27] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 3AFB880B4D696;
	Thu,  2 Mar 2023 17:55:43 +0900 (JST)
Message-ID: <5c4e7c1b-1e77-0f71-b1b3-aabbbcd106e0@lineo.co.jp>
Date: Thu, 2 Mar 2023 17:55:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 30/52] bind: upgrade 9.18.10 -> 9.18.11
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
 <20230208072143.2930292-30-alex@linutronix.de>
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <20230208072143.2930292-30-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 08:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177958

Hi All

The following CVEs have been FIXed in this upgrade
CVE-2022-3094 ,CVE-2022-3736 and CVE-2022-3924

https://bind9.readthedocs.io/en/v9_18_11/notes.html#notes-for-bind-9-18-11


On 2023/02/08 16:21, Alexander Kanavin wrote:
> License-update: copyright years
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../0001-avoid-start-failure-with-bind-user.patch             | 0
>   ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
>   ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
>   .../bind/{bind-9.18.10 => bind-9.18.11}/bind9                 | 0
>   .../bind/{bind-9.18.10 => bind-9.18.11}/conf.patch            | 0
>   .../bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh  | 0
>   .../init.d-add-support-for-read-only-rootfs.patch             | 0
>   .../make-etc-initd-bind-stop-work.patch                       | 0
>   .../bind/{bind-9.18.10 => bind-9.18.11}/named.service         | 0
>   .../bind/{bind_9.18.10.bb => bind_9.18.11.bb}                 | 4 ++--
>   10 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-avoid-start-failure-with-bind-user.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/bind9 (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/conf.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/generate-rndc-key.sh (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/init.d-add-support-for-read-only-rootfs.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/make-etc-initd-bind-stop-work.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.10 => bind-9.18.11}/named.service (100%)
>   rename meta/recipes-connectivity/bind/{bind_9.18.10.bb => bind_9.18.11.bb} (96%)
> 
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-avoid-start-failure-with-bind-user.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/bind9 b/meta/recipes-connectivity/bind/bind-9.18.11/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/bind9
> rename to meta/recipes-connectivity/bind/bind-9.18.11/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/init.d-add-support-for-read-only-rootfs.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.10/named.service b/meta/recipes-connectivity/bind/bind-9.18.11/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.10/named.service
> rename to meta/recipes-connectivity/bind/bind-9.18.11/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.10.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
> similarity index 96%
> rename from meta/recipes-connectivity/bind/bind_9.18.10.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.11.bb
> index cb0e251d51..55a06eae5f 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.10.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
>   SECTION = "console/network"
>   
>   LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9a4a897f202c0710e07f2f2836bc2b62"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d8cf7bd9c4fd5471a588e7e66e672408"
>   
>   DEPENDS = "openssl libcap zlib libuv"
>   
> @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>              file://0001-avoid-start-failure-with-bind-user.patch \
>              "
>   
> -SRC_URI[sha256sum] = "f415a92feb62568b50854a063cb231e257351f8672186d0ab031a49b3de2cac6"
> +SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
>   
>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>   # follow the ESV versions divisible by 2
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176869): https://lists.openembedded.org/g/openembedded-core/message/176869
> Mute This Topic: https://lists.openembedded.org/mt/96825781/3617373
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ito@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Takayasu Ito
Yocto Project Ambassador
Solution Department Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp


