Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNZDX-0001GX-VH for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:34:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KNVtU9030899
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 00:31:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30475-07 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 00:31:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KNVmeX030893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 00:31:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
Date: Sat, 21 May 2011 00:31:42 +0100
Message-ID: <1305934302.3424.679.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 23:34:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 16:19 -0700, Khem Raj wrote:
> We enable gtk/gnome in distcc that code uses loadavg()
> a function unimplemented in uclibc. Therefore for uclibc
> we disable gnome and gtk+ features in distcc
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
>  1 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> index 1f5c2af..a15858c 100644
> --- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> +++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
> @@ -6,7 +6,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  PR = "r6"
>  
> -DEPENDS = "avahi gtk+"
> +DEPENDS = "avahi ${GTKDEP}"
> +GTKDEP-libc-uclibc = ""
> +GTKDEP = "gtk+"

return -ENOTTESTED;

;-)

Cheers,

Richard



