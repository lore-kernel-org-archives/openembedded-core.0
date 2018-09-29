Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0756011C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:26:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCQAWm026090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:26:11 +0100
Message-ID: <9e2836e7ec7b062fe9bcf06a498eea30f983eb65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:26:10 +0100
In-Reply-To: <7e21f0e0a9d537ea22ccebab46ce5e4f4912d5ba.1538189779.git.Qi.Chen@windriver.com>
References: <cover.1538189779.git.Qi.Chen@windriver.com>
	<7e21f0e0a9d537ea22ccebab46ce5e4f4912d5ba.1538189779.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] glibc: refresh patch to also fix qemuppc
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
X-List-Received-Date: Sat, 29 Sep 2018 12:26:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 10:58 +0800, Chen Qi wrote:
> The patch 0031-sysdeps-ieee754-prevent-maybe-uninitialized-
> errors.patch
> did not take into consideration of qemuppc. Refresh it to also fix
> building for qemuppc.
> 
> The related error message is like below:
> 
>   ../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error: 'temp' may be
> used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...eee754-prevent-maybe-uninitialized-errors.patch | 41
> +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-
> prevent-maybe-uninitialized-errors.patch b/meta/recipes-
> core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-
> errors.patch
> index b02c4ec..1c5b254 100644
> --- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
> maybe-uninitialized-errors.patch
> +++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
> maybe-uninitialized-errors.patch
> @@ -1,4 +1,4 @@
> -From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00
> 2001
> +From 113241a738662854256c5e2e415397721b842862 Mon Sep 17 00:00:00
> 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Fri, 14 Sep 2018 23:23:03 +0000
>  Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
> @@ -21,13 +21,14 @@ Upstream-Status: Submitted [https://www.sourcewar
> e.org/ml/libc-alpha/2018-09/msg

I get nervous when we modify a patch submitted upstream. Was the patch
submitted accepted? Do we need to send this other piece upstream?

Cheers,

Richard


