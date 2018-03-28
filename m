Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEB778432
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 13:29:02 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id j143-v6so2094021oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p1sGXGMIGdU/3las4IsCznj/6jwQr9WzDwSzg9yDFzM=;
	b=rGSPC5RoYgQ8Xq+2bZ2EpAro7EPyYTQXVS12B3WUEP6DI6JKd0K2BbF+pKWGS+WzP8
	a3EaAJ9NQwtkQH6OdD06H3D/mfZ6TgUnZ5SNc66+MAPEHg/50qPfqatyOntey/FBwouW
	lj5BObHQuDHfRKsqf+7eaI5jLZGCZiJ75iP39KWtFWc30t3NSdL3KNkARHUNCZXAVEiA
	zW9WksjHTQa0MtzewK7sMCTfDBDlOMhknvYuVAkKaqK1VI3ndE0P/lc3URSnT4b/ISvF
	KLcFl67vrpJjQVN8j53e85tXCdHYcDUmETlO25LrZJYg2+0QfgFi1CZiAxy59/fdJL6M
	vF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p1sGXGMIGdU/3las4IsCznj/6jwQr9WzDwSzg9yDFzM=;
	b=Xba/VgR4HO1pAypod8bPmouXjpplcu8ruEEWqN2bqBA4XvbwsHlGTSNrSxnt6Lkm+y
	0Ku7Sly404qWpvRC/50887VKm7ylQ119QjQNk6odPvrSL3vrnsXjmEs5fzi/VZi46iVN
	6/GhGXmZGBnYfU5fs6jt+/EcfakPNxJbA5LLnurJHt6QRMizvk0VZO8DVEvoMeK4osQz
	ypcZofFT9iKc9gYInLS1uaHphDGLDcU/1tDXi2AgTwL8lDvZBVWJWwVSoYfhSgZpuDcc
	TJe1yIzo9svQE0yFbCYua5AXQMjNygc7X0tQy6Xrx88wvOcLX6UruGXKPpC/CHbzyMIL
	aRsA==
X-Gm-Message-State: ALQs6tAK+p6vV/y4MQm/Ws+0sGVp53LmtMrairBSSqiEa/C3vtaxHsnB
	Egog8EstxskY2WmF4iqVttZIARn905WKqG9/Qh1udg==
X-Google-Smtp-Source: AIpwx48BXyJoi1ZbLQcS+9pP2Zvb25pWxPMi7Uc6kLiKniQA7Xqq53l5UsZbpz3WMeEvAWaO4d1Z1eJTxfLklKuwIFw=
X-Received: by 10.202.105.140 with SMTP id e134mr2195835oic.18.1522243743485; 
	Wed, 28 Mar 2018 06:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 06:28:42 -0700 (PDT)
In-Reply-To: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
References: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 14:28:42 +0100
Message-ID: <CAJTo0LbtXddCvi1dF1WMWQffAei0e4J5QB4GOsGHUr_ikTx=-g@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] logrotate: update to 3.14.0
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
X-List-Received-Date: Wed, 28 Mar 2018 13:29:02 -0000
Content-Type: text/plain; charset="UTF-8"

This is causing one of the sanity tests to fail:

https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/906/steps/Running%20Sanity%20Tests_2/logs/stdio

Cut the url at /906/ and you'll be able to find the build configuration.

Ross

On 21 March 2018 at 08:36, Yi Zhao <yi.zhao@windriver.com> wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/logrotate/{logrotate_3.13.0.bb => logrotate_3.14.0.bb} (95%)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
> similarity index 95%
> rename from meta/recipes-extended/logrotate/logrotate_3.13.0.bb
> rename to meta/recipes-extended/logrotate/logrotate_3.14.0.bb
> index 990cf91..8a6d407 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.13.0.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
> @@ -25,8 +25,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
>              file://disable-check-different-filesystems.patch \
>              "
>
> -SRC_URI[md5sum] = "78ef24d6fddcc4df8e412dd75c551b4c"
> -SRC_URI[sha256sum] = "3222ca032f99be8d7a4a8c6ad69f3dcc49b9511bfe384bd5a271ebcd9bd3e52c"
> +SRC_URI[md5sum] = "1c0f6e6e490c4bcac0a1e77ad1310683"
> +SRC_URI[sha256sum] = "4703bdc0e2df3b322f9dff0aafc99aa9172c9e4acae28b7c924cc7d4e5b29d55"
>
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

