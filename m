Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ss82T-0004Fk-Mb for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:54:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6K7gq4e010393;
	Fri, 20 Jul 2012 08:42:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06231-10; Fri, 20 Jul 2012 08:42:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6K7gihF010387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 Jul 2012 08:42:46 +0100
Message-ID: <1342770168.21788.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 08:42:48 +0100
In-Reply-To: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
References: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Khem Raj <kraj@juniper.net>
Subject: Re: [PATCH 1/3] cmake-native: Fix build on ubuntu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 07:54:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 22:22 -0700, Khem Raj wrote:
> From: Khem Raj <kraj@juniper.net>
> 
> Fixes errors like
> 
> /yocto/poky/build/tmp/work/x86_64-linux/cmake-native-2.8.5-r2.1/cmake-2.8.5/Utilities/cmlibarchive/libarchive/archive_entry.c:56:55:
> fatal error: ext2fs/ext2_fs.h: No such file or directory
> 
> Signed-off-by: Khem Raj <kraj@juniper.net>
> ---
>  meta/recipes-devtools/cmake/cmake-native_2.8.5.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
> index 3fe0c2e..98ae300 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
> @@ -1,7 +1,9 @@
>  require cmake.inc
>  inherit native
>  
> -PR = "${INC_PR}.1"
> +DEPENDS += "e2fsprogs-native"
> +
> +PR = "${INC_PR}.2"
>  
>  SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
>  SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"

Does cmake really need e2fsprogs? Can we disable that dependency
instead? What would we lose?

Cheers,

Richard



