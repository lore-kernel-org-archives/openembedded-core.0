Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1j8Z-0001QE-PN for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 18:43:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHfbju025896
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:41:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25742-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:41:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHfTju025889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:41:29 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299163446-21791-1-git-send-email-Martin.Jansa@gmail.com>
References: <1299163446-21791-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2011 17:41:04 +0000
Message-ID: <1300729264.30423.3951.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: replace unused/broken E_CVS/E_URI with E_MIRROR/E_SVN used in OE
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
X-List-Received-Date: Mon, 21 Mar 2011 17:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 15:44 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf99a81..5f5abb3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -523,8 +523,8 @@ export palmqtdir = "${palmtopdir}"
>  ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
>  APACHE_MIRROR = "http://www.apache.org/dist"
>  DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
> -E_CVS = "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e" 
> -E_URI = "http://enlightenment.freedesktop.org/files"
> +E_MIRROR = "http://download.enlightenment.org/releases"
> +E_SVN = "svn://svn.enlightenment.org/svn/e"
>  FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
>  FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
>  FREESMARTPHONE_GIT = "git://git.freesmartphone.org"

Applied, thanks.

Richard



