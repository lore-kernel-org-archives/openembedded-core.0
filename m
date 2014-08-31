Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 444BE60E49
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 12:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7VC6Jro026692; Sun, 31 Aug 2014 13:06:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3_SM66HY81d5; Sun, 31 Aug 2014 13:06:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7VC6Eqf026688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 31 Aug 2014 13:06:15 +0100
Message-ID: <1409486775.29296.224.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Sun, 31 Aug 2014 13:06:15 +0100
In-Reply-To: <22d5fe07fe0d4d2245931dccbb69218bca7c6954.1409331937.git.cristian.iorga@intel.com>
References: <cover.1409331937.git.cristian.iorga@intel.com>
	<22d5fe07fe0d4d2245931dccbb69218bca7c6954.1409331937.git.cristian.iorga@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] alsa-lib: upgrade to 1.0.28
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
X-List-Received-Date: Sun, 31 Aug 2014 12:06:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 20:06 +0300, Cristian Iorga wrote:
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
> similarity index 86%
> rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
> rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
> index fc0847d..d509da2 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
> @@ -14,16 +14,15 @@ BBCLASSEXTEND = "native nativesdk"
>  #FIXME: remove the following
>  ARM_INSTRUCTION_SET = "arm"
>  
> -SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
> +SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
>             file://Check-if-wordexp-function-is-supported.patch \

This breaks the fetch of alsa-utils-alsaconf. I've reverted this part of
the change.

Cheers,

Richard


