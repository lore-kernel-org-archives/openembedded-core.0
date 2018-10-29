Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE9175264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:01:30 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x4so7837680otg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ejf1GfFgFuAkPtpGSGrfH2VX6FdtjgSovvYdLtvNwGo=;
	b=UwebKBdkf5Ws6aqZDmrtLztVfXgerHJ3auZMweet7yZnZnXy1EoxWG55Hnbq+bOP75
	oPlRmzLN+CCE2+ftqKhpePicI/6sjrx1tLZogrXCHUrq+j/l2T2bChiunChLLyc1Qe3t
	Lesi6ThqyPaUt5Y4SRz7F2tqVETj6/CO+paQtASPHp9ILhyy36vhpkxP2HuYgMz+jDfT
	fPwV6TZmoFDcFMsNg7wuulYoXrwxRdkxXPWIpSn8oYAm66QfLlPvNxbEu7vnk1MdeWOb
	94wvq+75zTVBQ78XUV3jfWGgYIpGxVe7VGHUsdgXjSoaMhe7oJf7cMGcctMU2TLigXa+
	O0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ejf1GfFgFuAkPtpGSGrfH2VX6FdtjgSovvYdLtvNwGo=;
	b=IOzD3bLpHSwsbUW+xtkuBYAPaBvmyPQSQ8JrwDOO71crO5e7UeKdEPLz/G1uU+YE+T
	96+lRxKqSTpHASnf5CSLBm+UoCx5XpknIeBFCg1fN1VyG71B596nn1R1LjtA02ep8Vjb
	+tqlGyrxarAQku48C7QkQQqrZw4hcjXn+L8Fz91Zql3imxlyDmKGmuHHdewK1Pn3DEgN
	riVaRWr3C5SsxK+BWJ0MhNy1bZR0g1bY/9W1HPC68YvEVVZQqHdvqYahTzwdK3XkIY4T
	h30LDiuyCco50JcPTfsmjpCMqRDMX/L5TkcuE2pfjK1V12s4K2VbFAx4tCeETLYcLJP2
	cshw==
X-Gm-Message-State: AGRZ1gLgpSEr1hFu/Q2FRtVP4LgQaswdCrjF2suSV9L74aZCFUDIWKqd
	fEahtH+coFzIQJFyuAPBSdnaob8+DAEURU1PRe1eoQ==
X-Google-Smtp-Source: AJdET5caa2NjMQzlULG7nDj4/a11ZQ7P0CmxwoQYGp78F5G65sjzz7o09dfXQc5gBhiIvIrSrYuFnqSYqBBz3WqPi00=
X-Received: by 2002:a9d:39c2:: with SMTP id y60mr1875629otb.147.1540825291122; 
	Mon, 29 Oct 2018 08:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <1540794783-29850-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1540794783-29850-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 15:01:20 +0000
Message-ID: <CAJTo0LbVOY0RQQ4wFbvrTd+KomP2dGeFJHrfHogX6qMMdD+pPA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcrypt: tweak branch from master to develop
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
X-List-Received-Date: Mon, 29 Oct 2018 15:01:30 -0000
Content-Type: text/plain; charset="UTF-8"

Note that release branches also need updating.  CC Armin.

Ross
On Mon, 29 Oct 2018 at 06:22, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> The master branch does not exist any more, use develop to replace.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> index 61ea22e..465aa96 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
>  inherit autotools pkgconfig
>
>  SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
> -SRCBRANCH ?= "master"
> +SRCBRANCH ?= "develop"
>
>  SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
>             "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

