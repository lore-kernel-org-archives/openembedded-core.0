Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rzxm3-0002DO-6N for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:01:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LLr8LF020129;
	Tue, 21 Feb 2012 21:53:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19941-02; Tue, 21 Feb 2012 21:53:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LLqwfa020122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Feb 2012 21:52:59 GMT
Message-ID: <1329861178.20261.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 21:52:58 +0000
In-Reply-To: <1329851229-31625-1-git-send-email-steve@sakoman.com>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 22:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 11:07 -0800, Steve Sakoman wrote:
> Otherwise build fails with following error:
> 
> | In file included from libxml.h:36:0,
> |                  from xmlmemory.c:8:
> | ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No such file or directory
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/libxml/libxml2.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
> index 0979acd..6230f60 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
>                      file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
>  
>  DEPENDS_virtclass-native = "python-native"
> -DEPENDS =+ "zlib"
> +DEPENDS =+ "zlib binutils"
>  
>  SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
>             file://libxml-64bit.patch"

This sounds very wrong. It would have implications for libxml2-native
I'd imagine. What is it doing that needs binutils?

Its going to add considerable time to the build too.

Cheers,

Richard



