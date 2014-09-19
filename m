Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D3873605BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 22:59:04 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y10so796091pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=te3xAMeLPiQFt7TU2HSPphA3dPMIoIGnK+lqwzVSjgo=;
	b=DKHj190Al0GcY1WNBxsqwhXsn6PexEv+5b6jeY41ZlXyu2331UIfgv1gBoy0xrIKC5
	UBWywFu4khkDnfNFAbRERCEOqsNm4JuG099arbuSX2vjQcYjohHpOpXeL00gSrA3Eldu
	sOHfz5ZjKTjhWSSPrCTD1+KNCEBsystlX9Yhhfsd/IZpQfpYFwkTV4Xn5pgC8tui7XIz
	PqAGs886FvMqBsHYeJT+gnxl0IQdzhIsEDRgoBsjeK8QotHtMPy18t721Q2cYJLW6Mco
	X2dp/M4wbcoPhgPvl8vMjRH+vKRGQ2HHZymYSS1yEx0vxE1mSB6Y52+542mBBRF8PXU7
	fhdA==
X-Received: by 10.67.3.162 with SMTP id bx2mr5305014pad.57.1411167545106;
	Fri, 19 Sep 2014 15:59:05 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:6d19:1bc3:1ce1:5191?
	([2601:c:9380:601:6d19:1bc3:1ce1:5191])
	by mx.google.com with ESMTPSA id k8sm2799712pdo.64.2014.09.19.15.59.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Sep 2014 15:59:04 -0700 (PDT)
Message-ID: <541CB535.9040405@gmail.com>
Date: Fri, 19 Sep 2014 15:59:01 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH 1/2] pinentry: add recipes
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
X-List-Received-Date: Fri, 19 Sep 2014 22:59:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This recipe already resides in meta-securty.

so I take it it should be removed from that layer?

- Armin


On 09/18/2014 11:49 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> gnupg 5.0 needs pinentry to work, refer to
> [http://rdist.root.org/2007/04/26/gpg-now-requires-pinentry-package/]
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-support/pinentry/pinentry_0.8.4.bb |   31 +++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta/recipes-support/pinentry/pinentry_0.8.4.bb
>
> diff --git a/meta/recipes-support/pinentry/pinentry_0.8.4.bb b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
> new file mode 100644
> index 0000000..e20ebb3
> --- /dev/null
> +++ b/meta/recipes-support/pinentry/pinentry_0.8.4.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Collection of simple PIN or passphrase entry dialogs"
> +DESCRIPTION = "\
> +	Pinentry is a collection of simple PIN or passphrase entry dialogs which \
> +	utilize the Assuan protocol as described by the aegypten project; see \
> +	http://www.gnupg.org/aegypten/ for details. \
> +	This package contains the curses (text) based version of the PIN entry dialog."
> +
> +HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
> +
> +DEPENDS = "libcap ncurses"
> +
> +inherit autotools
> +
> +SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
> +	"
> +
> +SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
> +SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
> +
> +EXTRA_OECONF = "--disable-pinentry-gtk\
> +		--disable-pinentry-gtk2 \
> +		--disable-pinentry-qt \
> +		--disable-pinentry-qt4 \
> +		--with-ncurses-include-dir=${STAGING_LIBDIR}/.. \
> +		--disable-rpath \
> +		--disable-dependency-tracking \
> +		--disable-glibtest \
> +                --with-libcap=${STAGING_LIBDIR}/.. \
> +               "
>

