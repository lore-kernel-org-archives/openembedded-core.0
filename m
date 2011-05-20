Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNOFd-0002sX-UF for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 13:52:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBnJ9t024709
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:49:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24627-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:49:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBnCR1024703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:49:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
References: <cover.1305848960.git.raj.khem@gmail.com>
	<0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
Date: Fri, 20 May 2011 12:49:06 +0100
Message-ID: <1305892146.3424.595.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 11:52:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 16:52 -0700, Khem Raj wrote:
> Remove headerfix.patch, its already applied upstream
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
>  meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
>  2 files changed, 1 insertions(+), 21 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
[...]
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
> index 5964a47..dfe71e5 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -34,7 +33,7 @@ do_install_append() {
>  pkg_postinst_${PN} () {
>  #!/bin/sh
>  if [ "x$D" != "x" ]; then
> -	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
> +	install -d ${D}/${sysconfdir}/rcS.d
>  	# this happens at S98 where our good 'ole packages script used to run
>  	echo "#!/bin/sh
>  opkg-cl configure

This needs to be $D, I didn't miss the brackets in my previous email :)

Cheers,

Richard



