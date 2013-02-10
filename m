Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U4KeK-0000ES-DV for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 01:20:05 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1A08Fah000782; Sun, 10 Feb 2013 00:09:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JhPPKYWcmZFN; Sun, 10 Feb 2013 00:09:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1A09ahH000809
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 10 Feb 2013 00:09:39 GMT
Message-ID: <1360454631.10722.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Sun, 10 Feb 2013 00:03:51 +0000
In-Reply-To: <1360431352-29452-1-git-send-email-andrei@gherzan.ro>
References: <1360431352-29452-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc: Add missing dependency of gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2013 00:20:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-02-09 at 19:35 +0200, Andrei Gherzan wrote:
> /bin/bash: msgfmt: command not found
> | make[2]: *** [be.mo] Error 127
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-core/eglibc/eglibc_2.17.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
> index fb49ac4..03e0ea4 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
> @@ -1,8 +1,8 @@
>  require eglibc.inc
>  
> -PR = "r3"
> +PR = "r4"
>  
> -DEPENDS += "gperf-native kconfig-frontends-native"
> +DEPENDS += "gperf-native kconfig-frontends-native gettext-native"
>  
>  SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22064.tar.bz2 \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \

This will seriously hurt build times :(

I'm not saying this is wrong but I would like to understand how we've
managed for as long without it...

Cheers,

Richard



