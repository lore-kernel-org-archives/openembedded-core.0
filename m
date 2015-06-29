Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 347B560670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T75xbJ022612; Mon, 29 Jun 2015 08:05:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KiBj3twrOjPm; Mon, 29 Jun 2015 08:05:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T75i2f022582
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Jun 2015 08:05:56 +0100
Message-ID: <1435561544.7287.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Mon, 29 Jun 2015 08:05:44 +0100
In-Reply-To: <1435546323-11539-1-git-send-email-rongqing.li@windriver.com>
References: <1435546323-11539-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mklibs-native: avoid failure on symbol provided by application
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
X-List-Received-Date: Mon, 29 Jun 2015 07:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-29 at 10:52 +0800, rongqing.li@windriver.com wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
> 
> Undefined symbols in a library can be provided by the application
> that links to the library, such as `logsink' in libmultipath.so.0.
> This fix checks the type of object in which the symbol is needed
> and the existence of the symbol in application, when a symbol
> cannot be provided by libraries. It prevents false alarm on absence
> of symbols.
> 
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  ...failure-on-symbol-provided-by-application.patch | 100 +++++++++++++++++++++
>  .../mklibs/mklibs-native_0.1.40.bb                 |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> 
> diff --git a/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> new file mode 100644
> index 0000000..798212a
> --- /dev/null
> +++ b/meta/recipes-devtools/mklibs/files/avoid-failure-on-symbol-provided-by-application.patch
> @@ -0,0 +1,100 @@
> +From f172101130604e4a9efa5746f4d8d30de99a0fdc Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Fri, 17 Apr 2015 14:48:20 +0800
> +Subject: [PATCH] avoid failure on symbol provided by application
> +
> +Undefined symbols in a library can be provided by the application
> +that links to the library, such as `logsink' in libmultipath.so.0.
> +This fix checks the type of object in which the symbol is needed
> +and the existence of the symbol in application, when a symbol
> +cannot be provided by libraries. It prevents false alarm on absence
> +of symbols.
> +
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>

No Upstream-Status?

Cheers,

Richard


