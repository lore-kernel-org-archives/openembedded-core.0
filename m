Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 929446D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:59:48 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id g8so6548494pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9dy+UEjAQ+v0IP/MbT+EruUDTfYcXbKBV9yAcY2+dUk=;
	b=hVkVHPvxhTGDLQ6plzqGgo6jdbVGMjHOQIa5T4vVSOBm15zy9IDmelzAgqutOzF6kp
	uZz/Irl8sfgfyXFgt3jUzCN16CXLTgQ55FWpiJWI4aiIIExuHC8GIwWLKarFzOSjpn5S
	seo+iv+GissOi6jAJ1gey8ctyqHx87nRa2+QWYLEO0f3V+hmG4rXWXMdgjrijPMC5vsD
	hCg/TYftPWwiy3PJtCOFo8BLvTKmTJRABYyUUZ0H3IQyktt1HteeesHuw8B1A030dB9v
	dqIeXRqggk9ULIUIknDCq975Lq+Nh4stJVgMlBeyCuTCLvFnDdPbFIdfEXW0WGIFnp0z
	HyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=9dy+UEjAQ+v0IP/MbT+EruUDTfYcXbKBV9yAcY2+dUk=;
	b=k0/clJOk92N6LyC+qbpyfAIqBYMHQM5cFRupE3Q/8PxvgAQyOsmPHlU40SWyFPFetu
	fbCjgvvKG5BleFfCxHY4Oo09NckLud/pxwXVN+zc72oIJ7h30L4ATINAUBph9eZEJuyl
	1WzPEgXmkxpObcx/46Y/z38uiFrIH8YmnyHKiC5GnhyGiMj7N6R7U4vJfslqmYd/0+BF
	AEXJXUlrTiN/xBrF2ycTZpMZvczsMESCewPw7KeZuJDyDsOqUIxsrlZF9RB170DHi2sU
	2tn4YFg6RG9WNJ6tSk3kiHugu7ug9hikshOxxUIc61jngxADgR6e/KGE5XTv9ZJT8SYV
	4BMg==
X-Gm-Message-State: APjAAAUnVXkbxhy+lGmcLd0H1Qnn/Y8aZ8c3NGe2Xl6umXfKt1z6df02
	xC3isBQUwxy5/C0jhiXM/gO8aP3z
X-Google-Smtp-Source: APXvYqzmjpszXOlWmS3RoDKoacWoB0tLGhq4RNG6s4WeoJPHTmNdRTPdIgtkKn8AbXogmBfNLaBWYg==
X-Received: by 2002:a63:170b:: with SMTP id x11mr21422364pgl.186.1555973989496;
	Mon, 22 Apr 2019 15:59:49 -0700 (PDT)
Received: from [192.168.0.33] (75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	t5sm18027484pfh.141.2019.04.22.15.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:59:48 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190422214204.7775-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6911cbdb-d726-ebcf-ab5d-a5816e6d729e@gmail.com>
Date: Mon, 22 Apr 2019 16:59:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422214204.7775-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-oe] git: update to 2.21.0
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
X-List-Received-Date: Mon, 22 Apr 2019 22:59:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/22/19 2:42 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Errr, check your subject lines. meta-oe is not this list and may confuse
the patchwork.

- armin
> ---
>  meta/recipes-devtools/git/git_2.20.1.bb | 11 -----------
>  meta/recipes-devtools/git/git_2.21.0.bb | 11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.21.0.bb
>
> diff --git a/meta/recipes-devtools/git/git_2.20.1.bb b/meta/recipes-devtools/git/git_2.20.1.bb
> deleted file mode 100644
> index 877fb05e58..0000000000
> --- a/meta/recipes-devtools/git/git_2.20.1.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> -                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> -                 "
> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> -
> -SRC_URI[tarball.md5sum] = "7a7769e5c957364ed0aed89e6e67c254"
> -SRC_URI[tarball.sha256sum] = "edc3bc1495b69179ba4e272e97eff93334a20decb1d8db6ec3c19c16417738fd"
> -SRC_URI[manpages.md5sum] = "78c6e54a61a167dab5e8ae07036293ab"
> -SRC_URI[manpages.sha256sum] = "e9c123463abd05e142defe44a8060ce6e9853dfd8c83b2542e38b7deac4e6d4c"
> diff --git a/meta/recipes-devtools/git/git_2.21.0.bb b/meta/recipes-devtools/git/git_2.21.0.bb
> new file mode 100644
> index 0000000000..434ff8f3d4
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.21.0.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> +                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> +                 "
> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> +
> +SRC_URI[tarball.md5sum] = "b8e00c2997774c5d4aaf26fd9d9aaf64"
> +SRC_URI[tarball.sha256sum] = "85eca51c7404da75e353eba587f87fea9481ba41e162206a6f70ad8118147bee"
> +SRC_URI[manpages.md5sum] = "8a168697b99a9a3f04f29f7d4bacd70b"
> +SRC_URI[manpages.sha256sum] = "14c76ebb4e31f9e55cf5338a04fd3a13bced0323cd51794ccf45fc74bd0c1080"


