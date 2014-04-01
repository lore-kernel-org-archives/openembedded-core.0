Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 68F0A6E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:53:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31Aqso5015944; Tue, 1 Apr 2014 11:52:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YMcO1VC561KI; Tue,  1 Apr 2014 11:52:53 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31AqniD015940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:52:51 +0100
Message-ID: <1396349564.1432.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: b40527@freescale.com
Date: Tue, 01 Apr 2014 11:52:44 +0100
In-Reply-To: <1396332774-31033-1-git-send-email-b40527@freescale.com>
References: <1396332774-31033-1-git-send-email-b40527@freescale.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool: Add depends on binutils-cross
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
X-List-Received-Date: Tue, 01 Apr 2014 10:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 14:12 +0800, b40527@freescale.com wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
> 
> When use command bitbake -c populate_sdk <target-rootfs> to
> generate toolchain. a race issue may occur. in this case need
> to add binutils-cross to depends.
> 
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.2.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index d26982d..0868dd7 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -36,7 +36,7 @@ do_compile_prepend () {
>  inherit autotools
>  EXTRA_AUTORECONF = "--exclude=libtoolize"
>  
> -DEPENDS = "libtool-native"
> +DEPENDS = "libtool-native binutils-cross"
>  
>  PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
>  FILES_${PN} += "${datadir}/aclocal"


You're patching the .inc file here so this dependency is being applied
to multiple different libtools. Can you perhaps explain the problem you
were seeing with a step by step how to reproduce the problem?

I'd like to understand the real problem here, I don't doubt it exists
but I'm not sure this is the correct fix.

Cheers,

Richard


