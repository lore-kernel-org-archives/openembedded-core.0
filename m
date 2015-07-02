Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D64C8607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 08:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6285qwS008802; Thu, 2 Jul 2015 09:05:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EmDLxrEDleti; Thu,  2 Jul 2015 09:05:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6285bOx008778
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jul 2015 09:05:48 +0100
Message-ID: <1435824337.7287.273.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong.fan@windriver.com
Date: Thu, 02 Jul 2015 09:05:37 +0100
In-Reply-To: <1435800300-6257-1-git-send-email-wenzong.fan@windriver.com>
References: <1435800300-6257-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Yue.Tao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] man: replace ',' with '#'
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
X-List-Received-Date: Thu, 02 Jul 2015 08:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-02 at 09:25 +0800, wenzong.fan@windriver.com wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
> 
> Sometimes, the parameters of CC contains the ',', which
> cause the sed command failed, so replace the ',' with '#'

What about BUILD_CC? Not sure if there are any linker parameters in
there?

Cheers,

Richard

> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  meta/recipes-extended/man/man/configure_sed.patch | 22 ++++++++++++++++++++++
>  meta/recipes-extended/man/man_1.6g.bb             |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-extended/man/man/configure_sed.patch
> 
> diff --git a/meta/recipes-extended/man/man/configure_sed.patch b/meta/recipes-extended/man/man/configure_sed.patch
> new file mode 100644
> index 0000000..6c047ac
> --- /dev/null
> +++ b/meta/recipes-extended/man/man/configure_sed.patch
> @@ -0,0 +1,22 @@
> +man: replace ',' with '#'
> +
> +Sometimes, the parameters of CC contains the ',', which
> +cause the sed command failed, so replace the ',' with '#'
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> +---
> +diff --git a/configure.old b/configure
> +index 9f62cf9..b439055 100755
> +--- a/configure.old
> ++++ b/configure
> +@@ -1321,7 +1321,7 @@ do
> +   echo "Creating $infile from $infile.in"
> +   sed -e '
> + s,@version@,$version,
> +-s,@CC@,$CC,
> ++s#@CC@#$CC#
> + s,@EXEEXT@,$EXEEXT,
> + s,@BUILD_CC@,$BUILD_CC,
> + s,@INSTALL@,$INSTALL,
> diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
> index d4a4b26..6a4c734 100644
> --- a/meta/recipes-extended/man/man_1.6g.bb
> +++ b/meta/recipes-extended/man/man_1.6g.bb
> @@ -52,6 +52,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
>             file://man.conf \
>             file://manpath.5.gz;unpack=false \
>             file://man-1.6g-whatis3.patch \
> +           file://configure_sed.patch \
>  "
>  
>  SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
> -- 
> 1.9.1
> 



