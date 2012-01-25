Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq29D-0008S8-Ht for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 13:40:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PCWYKS009072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:32:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09047-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:32:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PCWOfZ009065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:32:25 GMT
Message-ID: <1327494745.19643.222.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 12:32:25 +0000
In-Reply-To: <3fb1ade006bc2d93226724eab047b9ecd49e2525.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
	<3fb1ade006bc2d93226724eab047b9ecd49e2525.1327426808.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/7] gdb-common: Drop elfutils from DEPENDS
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
X-List-Received-Date: Wed, 25 Jan 2012 12:40:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 09:42 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index d728139..930a71b 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "gdb - GNU debugger"
>  HOMEPAGE = "http://www.gnu.org/software/gdb/"
>  LICENSE="GPLv3+"
>  SECTION = "devel"
> -DEPENDS = "ncurses readline elfutils ${LTTNGUST}"
> +DEPENDS = "ncurses readline ${LTTNGUST}"
>  
>  LTTNGUST = "lttng-ust"
>  LTTNGUST_libc-uclibc = ""
> @@ -11,7 +11,7 @@ LTTNGUST_mipsel = ""
>  LTTNGUST_mips64 = ""
>  LTTNGUST_mips64el = ""
>  
> -INC_PR = "r4"
> +INC_PR = "r5"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>  		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
> @@ -40,7 +40,7 @@ EXPAT = "--without-expat"
>  
>  EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
>                  --with-curses --disable-multilib --with-system-readline --disable-sim \
> -                ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
> +                ${GDBPROPREFIX} ${EXPAT} \
>                  ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
>                 "

very good, but why?

Cheers,

Richard
 




