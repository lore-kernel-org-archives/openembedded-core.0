Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD441610F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 08:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F8sJ6H018041; Fri, 15 Aug 2014 09:54:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6Bqot5blxAth; Fri, 15 Aug 2014 09:54:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F8sHXF018031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 15 Aug 2014 09:54:18 +0100
Message-ID: <1408092857.21596.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 15 Aug 2014 09:54:17 +0100
In-Reply-To: <2209793d9f1cb962c181308634d3c2f36f9869fc.1408092524.git.liezhi.yang@windriver.com>
References: <cover.1408092524.git.liezhi.yang@windriver.com>
	<2209793d9f1cb962c181308634d3c2f36f9869fc.1408092524.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gdb-cross-canadian: add nativesdk-ncurses-libncurses to RDEPENDS
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
X-List-Received-Date: Fri, 15 Aug 2014 08:54:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-15 at 01:49 -0700, Robert Yang wrote:
> We had nativesdk-ncurses in the DEPENDS, also need add
> nativesdk-ncurses-libncurses to the RDEPENDS, otherwise libncurses.so.5
> is not in the rdepends chain.

This doesn't make sense. Can you please give more information about the
problem you're solving here please?

If its a dynamically linked lib, the dependency should be detected
automatically.

Cheers,

Richard

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index e594bb1..2be427a 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -7,7 +7,9 @@ BPN = "gdb"
>  
>  DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readline nativesdk-python"
>  RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
> -                   nativesdk-python-codecs nativesdk-python-netclient"
> +                   nativesdk-python-codecs nativesdk-python-netclient \
> +                   nativesdk-ncurses-libncurses \
> +                  "
>  
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>  
> -- 
> 1.7.9.5
> 



