Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72AD47D68C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 05:00:17 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 145so5173401pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 22:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6wiwsgJPlHWfIUHp35xmZbariLloGayg+BEmKsNewD0=;
	b=ifaNqKclxzL7lvNYxT/0gm7qITQFPG8bYmZQBUUmS93YPyzLDlGhkwSjI3VGQuucAW
	af975keHMm2WQmFucBjIhLRuYz0E2T2Q1OE1O4TE+aimQfI5+/MNiJUnVzX2ugRSpqKu
	SEJOp2ddo/par+hi9J0a74uhn39ctQf+7CuvTjS1iuB75DmWXPyyQiLpw6nfKneCCUAK
	BSEhM7ulkHfuem0MNpPDvVkLhvy/U0gYyIZinWxknSWxX2fvoEaTCNJ6rOmJhow1LFn/
	dVKc56qlRtMSdvuyQTbmmv+YT7Jcp34ZiAZoI4Y/y/gZ2Gt+0iDviE5v5MX6AresBJa4
	HXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6wiwsgJPlHWfIUHp35xmZbariLloGayg+BEmKsNewD0=;
	b=WWtVZvfbSxTVeY66nTKK1AKOgIXZugHRMLED52Q/xcHhcrieiLFeA4uZl7h3uAGMfv
	xmtFxgVCSdHwHVfB7aL4AC7wVbCEiB1ik/fLJ7WaFG9Pt7YKpHuQyNhrurhRT349KG8I
	GyyqdyC1neiZdWN/GU/R6DwnQZYsvaIg4PHiLTqyLPvT8HquKGiv2M0ZQFbBXa8s30FT
	EI6YcyHFzlmqnqEaggzolzySm6kKAbR0UuThATYo8CCdYKN1e9Br8y3IhQsNM9gSYvBu
	VsNLkrn/qFe2WyCFaFq6UMt9h9AX5i28Qu4R8r1xWTeRrxYYqVDx03kZdjoorRCdgrys
	133w==
X-Gm-Message-State: APjAAAVTfCmXWlfzXudj9Tjgdugq2d4OXXsiMT13oWhFpqvH9fiavddU
	Y2Yp0IOc9jHjr+/Tm7ZRXkGOCX67ewY=
X-Google-Smtp-Source: APXvYqw33hV+JYh0BVECXXWhV8Rh/pAAsQysU7N43ASrn/UodjM1eLV5VWoC9NZt6PpHdOroerKnMA==
X-Received: by 2002:a62:7793:: with SMTP id s141mr6804517pfc.21.1558242017641; 
	Sat, 18 May 2019 22:00:17 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	u134sm20596333pfc.61.2019.05.18.22.00.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 22:00:16 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190518172136.11368-2-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c2bfa479-c46a-4d5e-d8d8-8b9c5bf02809@gmail.com>
Date: Sat, 18 May 2019 22:00:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190518172136.11368-2-bunk@stusta.de>
Subject: Re: [PATCH] nss-myhostname: Stop trying to build for musl
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
X-List-Received-Date: Sun, 19 May 2019 05:00:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/18/19 10:21 AM, Adrian Bunk wrote:
> There's no point in building an NSS module for a C library
> that doesn't support NSS.
> 

this patch is ok


> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   ...-Check-for-nss.h-presense-before-use.patch | 53 -------------------
>   .../nss-myhostname/nss-myhostname_0.3.bb      |  3 +-
>   2 files changed, 2 insertions(+), 54 deletions(-)
>   delete mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
> 
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch b/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
> deleted file mode 100644
> index 82f25743af..0000000000
> --- a/meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 30 Jan 2016 20:29:06 +0000
> -Subject: [PATCH] nss-myhostname: Check for nss.h presense before use
> -
> -We do not have nss.h on musl e.g. and configury is already checking for
> -nss.h presence, use this to define needed data structures if nss.h is
> -missing on a given libc implementation on a platform
> -
> -include stdint.h for uint32_h definition
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - nss-myhostname.c | 20 ++++++++++++++++++++
> - 1 file changed, 20 insertions(+)
> -
> -diff --git a/nss-myhostname.c b/nss-myhostname.c
> -index 293166c..6f287f5 100644
> ---- a/nss-myhostname.c
> -+++ b/nss-myhostname.c
> -@@ -21,7 +21,27 @@
> - ***/
> -
> - #include <limits.h>
> -+#include <stdint.h>
> -+#ifdef HAVE_NSS_H
> - #include <nss.h>
> -+#else
> -+enum nss_status {
> -+    NSS_STATUS_TRYAGAIN = -2,
> -+    NSS_STATUS_UNAVAIL,
> -+    NSS_STATUS_NOTFOUND,
> -+    NSS_STATUS_SUCCESS,
> -+    NSS_STATUS_RETURN
> -+};
> -+/* Data structure used for the 'gethostbyname4_r' function.  */
> -+struct gaih_addrtuple
> -+  {
> -+    struct gaih_addrtuple *next;
> -+    char *name;
> -+    int family;
> -+    uint32_t addr[4];
> -+    uint32_t scopeid;
> -+  };
> -+#endif
> - #include <sys/types.h>
> - #include <netdb.h>
> - #include <errno.h>
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> index de5b7cf598..244d9e204e 100644
> --- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> @@ -7,7 +7,6 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   
>   SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
> -           file://0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch \
>              "
>   
>   SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
> @@ -15,6 +14,8 @@ SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67
>   
>   inherit autotools distro_features_check
>   
> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>   # The systemd has its own copy of nss-myhostname
>   CONFLICT_DISTRO_FEATURES = "systemd"
>   
> 

