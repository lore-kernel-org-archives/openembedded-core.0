Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SwyZ3-0005jS-N7
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:47:57 +0200
Received: by lags15 with SMTP id s15so4703517lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=dPghoVqgFYFwKOCl65b+7DoaxCsa3CyC6QK42NcX/HM=;
	b=dtw/0QGj+JKoPh+cTv0Zt2tk3zHSVWEd6rW7FHn4bWEstWmpW4ZZzb2YDgzmBaqbIx
	F9OY6DXWffdX/Ge7hu6jiOmBNvJMjOwm8pnkAtkoJ9g/w94XeNZvanxcREdEdN7Pm3p3
	AdALG57xY1JjMLewLIEiHoPlPaOy9IhnKvwxiWY02YEd/S2h5dhuOBc1DChO+BN5+fV3
	9iGdApCpy9Q/A6CQyBDw8zF4dJD+DgT4Gmb7pWJquWjkeFKS79Fjh1qwy58YMEUb9YgM
	xV06+/Vrz5DwKLEGIwCK+13+iK+f97IuvuTZVISrT2Zbf0AVvl/4WLuPb744C9EUdDy2
	xnOA==
Received: by 10.112.42.225 with SMTP id r1mr9754659lbl.102.1343925377945; Thu,
	02 Aug 2012 09:36:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Thu, 2 Aug 2012 09:35:57 -0700 (PDT)
In-Reply-To: <1343925096-22020-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120802163001.GW16306@jama.jama.net>
	<1343925096-22020-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 2 Aug 2012 09:35:57 -0700
X-Google-Sender-Auth: -rkQL4ndDsezqbDlNz3GmP7Tdpg
Message-ID: <CABcZANmT9RqSX=sBfzoBtVFcU5B+5wxA=FOVDP_rOVgE39YEvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFCv2] bitbake.conf: store cooker logs in TMPDIR subdirectory
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
X-List-Received-Date: Thu, 02 Aug 2012 16:47:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 2, 2012 at 9:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * we should probably wait until
>   http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf18570be629d9
>   is in next required bitbake version, but error message if the directory doesn't exist is quite clear
> * people with new enough bitbake could just change this in their local.conf
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/bitbake.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d5a43e9..8074684 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -753,8 +753,8 @@ DISTRO[unexport] = "1"
>  # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
>  TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
>
> -# Complete output from bitbake, if you're changing it, make sure to use existing directory
> -BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
> +# Complete output from bitbake
> +BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"

I'd recommend rewording the commit subject. It's not 100% clear that
it refers to 'the tmpdir subdir' or 'a subdir of tmpdir', until you
read the patch :)
-- 
Christopher Larson


