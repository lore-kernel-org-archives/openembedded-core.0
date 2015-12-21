Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1D465CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 22:21:00 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p187so87860246wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EGISyvYPeDl5xvxEKTqOkDd2ngvkm6XOvO+bXXucUtk=;
	b=OlXjsuVIyoVTIdf2JL9D5Uy9o7+N6QLAnZOp24AGGQQfk8RqlNRLolJOGhk4zZhpJA
	R297Wt8b0eqQofcFQQa9cwt6x7Hdgm9LTxDw5vcRlNu/YkRVPaXpkWqoh8w25xnILMyD
	rtEY4Owft8GoFo2uLg9qGeLubkLvfj3lZdpckHy5uB/2Y0mMN17CkIFdivHlxsQsi1Dg
	gTLDUJzGIa/PWnFFoD5UngzGcw3ykYcROfJ6vsGe5JaUPG6GkvhrfOBR12fU0DrDzrgQ
	b4T0JQk3MyuT/k8iRtzuVpqxRAuo6NpxFO64tz4ENO00mPOsUJ3zfds5kfcuHDeuZ3Xp
	xn6g==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr23719902wjc.3.1450736461099;
	Mon, 21 Dec 2015 14:21:01 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 21 Dec 2015 14:21:01 -0800 (PST)
In-Reply-To: <91b12be58798efa4bcd8742b50d48077aa3ae6bd.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<91b12be58798efa4bcd8742b50d48077aa3ae6bd.1449671297.git.alexander.kanavin@linux.intel.com>
Date: Mon, 21 Dec 2015 14:21:01 -0800
Message-ID: <CAJ86T=Uo0tAtbNYXYkmcvm2bqMUeq79it_cH5aSChgtNsBdsNA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] mirrors: replace references to archive.apache.org
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
X-List-Received-Date: Mon, 21 Dec 2015 22:21:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 6:40 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> archive.apache.org does not contain current releases, only historical ones,
> so upstream checks aren't accurate. It's replaced with official mirrors
> containing current versions.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/mirrors.bbclass | 2 +-
>  meta/conf/bitbake.conf       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index b96c071..0f98479 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -40,7 +40,7 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/ \n \
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
> -http://www.apache.org/dist  http://archive.apache.org/dist \n \
> +http://www.eu.apache.org/dist  http://www.us.apache.org/dist \n \

Is this change correct? Shouldn't mirrors.bbclass provide a fallback
to the historical releases URL (so that things keep working if the
oe-core version of an apache.org package is no longer a current
version) ?

>  http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
>  ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
>  ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 06971da..3491b12 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -567,7 +567,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
>  # Download locations and utilities.
>  ##################################################################
>
> -APACHE_MIRROR = "http://archive.apache.org/dist"
> +APACHE_MIRROR = "http://www.eu.apache.org/dist/"
>  DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
>  GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
>  GNOME_GIT = "git://git.gnome.org"
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

