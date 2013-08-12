Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 592E16B110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 07:08:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7C7JIpH011053; Mon, 12 Aug 2013 08:19:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l99q2r02oHCx; Mon, 12 Aug 2013 08:19:18 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7C7JAPY011047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 12 Aug 2013 08:19:12 +0100
Message-ID: <1376291285.27470.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Mon, 12 Aug 2013 08:08:05 +0100
In-Reply-To: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: denys@ti.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nativesdk-qt4-tools: remove nativesdk-libx11 for qt-embedded
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
X-List-Received-Date: Mon, 12 Aug 2013 07:08:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-08-11 at 14:36 -0700, Eric Nelson wrote:
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>  meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> index cfc6fd8..6ec3225 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> @@ -1,5 +1,8 @@
>  DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
> +DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native"
> +OVERRIDES="${QTNAME}"
> +DEPENDS_append_qt = " nativesdk-libx11"

I'm afraid we can't do this since you just broke any other kind of
override which might get used anywhere by any recipe using this .inc
file. I'd also be wary of adding something as simple as "qt" into
overrides since it can match things more widely than you might want.

Cheers,

Richard

>  SECTION = "libs"
>  HOMEPAGE = "http://qt.nokia.com"
>  LICENSE = "LGPLv2.1 | GPLv3"



