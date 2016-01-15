Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B8BA66FF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 18:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FIHH6K006006; Fri, 15 Jan 2016 18:17:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cICXAXYbFBO8; Fri, 15 Jan 2016 18:17:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FIHEXi006002
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 15 Jan 2016 18:17:15 GMT
Message-ID: <1452881834.27999.0.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Jian Liu <jian.liu@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 18:17:14 +0000
In-Reply-To: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
References: <1452754008-158464-1-git-send-email-jian.liu@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] linux-libc-headers: set ALLOW_EMPTY
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
X-List-Received-Date: Fri, 15 Jan 2016 18:17:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-14 at 14:46 +0800, Jian Liu wrote:
> If setting IMAGE_INSTALL += "linux-libc-headers", do_rootfs will
> cause
> error.
>   ERROR: linux-libc-headers not found in the base feeds
> 
> This is because that there is no linux-libc-headers.rpm generated.

There is no point in generating an empty package just for the sake of
it. Surely you just shouldn't put that in IMAGE_INSTALL?

Cheers,

Richard

> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> 
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
> -headers.inc
> index 2ba6ed5..403360b 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
> ${EXTENDPKGV})"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> +
> +ALLOW_EMPTY_${PN} = "1"

