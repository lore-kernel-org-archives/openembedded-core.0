Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvAFA-0002s7-6A
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 16:15:08 +0100
Received: by wyb38 with SMTP id 38so1114802wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 07:13:39 -0800 (PST)
Received: by 10.216.160.84 with SMTP id t62mr962588wek.69.1299165219291;
	Thu, 03 Mar 2011 07:13:39 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c54sm626825wer.30.2011.03.03.07.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 07:13:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299163446-21791-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2011 16:13:36 +0100
Message-Id: <6D7BF2F9-2056-4FC3-9766-F2B2C09A42E1@dominion.thruhere.net>
References: <1299163446-21791-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
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
X-List-Received-Date: Thu, 03 Mar 2011 15:15:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 3 mrt 2011, om 15:44 heeft Martin Jansa het volgende geschreven:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/conf/bitbake.conf |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf99a81..5f5abb3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -523,8 +523,8 @@ export palmqtdir = "${palmtopdir}"
> ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
> APACHE_MIRROR = "http://www.apache.org/dist"
> DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
> -E_CVS = "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e" 
> -E_URI = "http://enlightenment.freedesktop.org/files"
> +E_MIRROR = "http://download.enlightenment.org/releases"
> +E_SVN = "svn://svn.enlightenment.org/svn/e"
> FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
> FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
> FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
> -- 
> 1.7.4.1
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



