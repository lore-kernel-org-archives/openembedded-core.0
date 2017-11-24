Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53B1A719A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:05:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r12so15659645pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XkwAYOzV1pwCcqeqWG0qpkqHLZDs+gH9+c5clvmGzJU=;
	b=lx6BP2gloEgl0WlScBNKLHrthOwe+CBL9qwpgC/G9hz7LOlIGi2HBtzkYuCPCuAicI
	8f3gBeBV+tjSPiKG3cJzK2ddi2zi0BPChCjqetc72f6iwBZEyeHuVlnqhthoTKXJDBAz
	RDXFoOr0ofAaQSyZ83heHAvRX4jLnrgdmQjw30AgO5TD7FzAo+0kRnzkhud3aS1pKD2/
	WxrmOLxvDg5AXOzH5ftRNenQRX+KXjzAvkTwX+G9DB4besUN9DYABtsy1JiE2rP2LINq
	1540sp2E+FwMNC2ZC4gaZlL56s4yNh2cvy5z9LrpjOTJGfzzAGZkJ3gZ/MScUxB0mZ69
	Le5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XkwAYOzV1pwCcqeqWG0qpkqHLZDs+gH9+c5clvmGzJU=;
	b=TUrJNbXp166l88EyMHi3/iagBr4dyIdvPa8oMSaZNQZ/6GPx95523ECgnHPq9B4G1T
	OlepBeDYxwxImNg/4ByzKtEt79zE2ZtMmYESpCc2s+lnmQ8wje1mK4kC4jttkaJv/CUm
	rpU/dNbWjCihPqYjhvt+E8uWpE5Qjy5KD0nO5A6PQO01PTpCgkbvmotPESy73babGnWO
	iKGhvPzq2TJtHdCOkaFErDkDMTlrVzVaYHRuej6YYBQRECT5+GS+AE7l/fG5l3qYnQeU
	s85xsUxzE8UpsdQmJOIXX+of+t07Pq78gxa836nK4MiiR5OAceYcIoJxxf8VIcGXXrhP
	VmWg==
X-Gm-Message-State: AJaThX6nZcFoA9piGSVFAIGS2LLdrNlj4oXEFvLBWdEMTSCJFC0e+TAu
	T/JTXeQ3Hgyw6kTffX+ZyV1KqQ==
X-Google-Smtp-Source: AGs4zMbADjYynHXnZD3yGwUGKRDkEFKZVOAKBiXp6ihp3zm2ESOOguidpd7b244E3cMUmRJf/OFqQw==
X-Received: by 10.101.83.5 with SMTP id m5mr28603094pgq.350.1511543132495;
	Fri, 24 Nov 2017 09:05:32 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:2178:58dc:281c:c010?
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	h69sm38389316pfk.166.2017.11.24.09.05.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 09:05:32 -0800 (PST)
To: Yi Zhao <yi.zhao@windriver.com>,
	openembedded-core@lists.openembedded.org, jackie.huang@windriver.com
References: <1510885133-25478-1-git-send-email-yi.zhao@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2e29c60e-d8e2-84c4-690c-4accc3fd4a75@gmail.com>
Date: Fri, 24 Nov 2017 09:05:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510885133-25478-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [morty][PATCH] ppp: include netinet/in.h before linux/in.h in pppoe.h
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
X-List-Received-Date: Fri, 24 Nov 2017 17:05:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

in akuster/morty-next


On 11/16/2017 06:18 PM, Yi Zhao wrote:
> The patch ppp-fix-building-with-linux-4.8.patch tries to fix build error
> with 4.8 or newer linux headers, but it would break building with kernel
> < 4.8. There is a better solution to fix this issue in upstream.
> Backport the upstream patch and replace the old one.
>
> [YOCTO #10457]
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...oe-include-netinet-in.h-before-linux-in.h.patch | 54 ++++++++++++++++++++++
>  .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ------------------
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  2 +-
>  3 files changed, 55 insertions(+), 45 deletions(-)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
>  delete mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
> new file mode 100644
> index 0000000..9362d12
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/0001-pppoe-include-netinet-in.h-before-linux-in.h.patch
> @@ -0,0 +1,54 @@
> +From 50a2997b256e0e0ef7a46fae133f56f60fce539c Mon Sep 17 00:00:00 2001
> +From: Lubomir Rintel <lkundrak@v3.sk>
> +Date: Mon, 9 Jan 2017 13:34:23 +0000
> +Subject: [PATCH] pppoe: include netinet/in.h before linux/in.h
> +
> +This fixes builds with newer kernels. Basically, <netinet/in.h> needs to be
> +included before <linux/in.h> otherwise the earlier, unaware of the latter,
> +tries to redefine symbols and structures. Also, <linux/if_pppox.h> doesn't work
> +alone anymore, since it pulls the headers in the wrong order, so we better
> +include <netinet/in.h> early.
> +
> +Upstream-Status: Backport
> +[https://github.com/paulusmack/ppp/commit/50a2997b256e0e0ef7a46fae133f56f60fce539c]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + pppd/plugins/rp-pppoe/pppoe.h | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
> +index 9ab2eee..c4aaa6e 100644
> +--- a/pppd/plugins/rp-pppoe/pppoe.h
> ++++ b/pppd/plugins/rp-pppoe/pppoe.h
> +@@ -47,6 +47,10 @@
> + #include <sys/socket.h>
> + #endif
> + 
> ++/* This has to be included before Linux 4.8's linux/in.h
> ++ * gets dragged in. */
> ++#include <netinet/in.h>
> ++
> + /* Ugly header files on some Linux boxes... */
> + #if defined(HAVE_LINUX_IF_H)
> + #include <linux/if.h>
> +@@ -84,8 +88,6 @@ typedef unsigned long UINT32_t;
> + #include <linux/if_ether.h>
> + #endif
> + 
> +-#include <netinet/in.h>
> +-
> + #ifdef HAVE_NETINET_IF_ETHER_H
> + #include <sys/types.h>
> + 
> +@@ -98,7 +100,6 @@ typedef unsigned long UINT32_t;
> + #endif
> + 
> + 
> +-
> + /* Ethernet frame types according to RFC 2516 */
> + #define ETH_PPPOE_DISCOVERY 0x8863
> + #define ETH_PPPOE_SESSION   0x8864
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> deleted file mode 100644
> index f77b0de..0000000
> --- a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 3da19af53e2eee2e77b456cfbb9d633b06656d38 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Thu, 13 Oct 2016 13:41:43 +0800
> -Subject: [PATCH] ppp: fix building with linux-4.8
> -
> -Fix a build error when using the linux-4.8 headers that results in:
> -
> -In file included from pppoe.h:87:0,
> -                 from plugin.c:29:
> -../usr/include/netinet/in.h:211:8: note: originally defined here
> - struct in6_addr
> -        ^~~~~~~~
> -In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
> -                 from ../usr/include/linux/if_pppox.h:26,
> -                 from plugin.c:52:
> -../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
> - struct sockaddr_in6 {
> -        ^~~~~~~~~~~~
> -
> -Upstream-Status: Submitted [1]
> -
> -[1] https://github.com/paulusmack/ppp/pull/69
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - pppd/plugins/rp-pppoe/pppoe.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
> -index 9ab2eee..96d2794 100644
> ---- a/pppd/plugins/rp-pppoe/pppoe.h
> -+++ b/pppd/plugins/rp-pppoe/pppoe.h
> -@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
> - #include <linux/if_ether.h>
> - #endif
> - 
> --#include <netinet/in.h>
> -+#include <linux/in.h>
> - 
> - #ifdef HAVE_NETINET_IF_ETHER_H
> - #include <sys/types.h>
> --- 
> -2.8.3
> -
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index 56dbd98..ec9947f 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -30,7 +30,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
>             file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
>             file://ppp@.service \
>             file://fix-CVE-2015-3310.patch \
> -           file://ppp-fix-building-with-linux-4.8.patch \
> +           file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
>  "
>  
>  SRC_URI_append_libc-musl = "\


