Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 352046FF4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 08:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2P8sJPT025706; Fri, 25 Mar 2016 08:54:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BpViQyrR6I7Y; Fri, 25 Mar 2016 08:54:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2P8sG3E025703
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Mar 2016 08:54:17 GMT
Message-ID: <1458896056.3073.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 08:54:16 +0000
In-Reply-To: <1458887112-27434-1-git-send-email-net147@gmail.com>
References: <1458887112-27434-1-git-send-email-net147@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 08:54:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 17:25 +1100, Jonathan Liu wrote:
> Python support was not being enabled because of a conflicting
> --without-python configure argument in OE_EXTRACONF.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index ae97759..6fd3e3e 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk
> -python-lang nativesdk-python-
>  
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>  
> +EXTRA_OECONF_remove = "--without-python"
>  EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"

Would a PACKAGECONFIG += "python" have the same effect?

Cheers,

Richard
 



