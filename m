Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B7DEF610EF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 10:19:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c84so13513062wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=izeqectc3+goix3mCSXLtrJoQdtenM9QwmmH/UPEai0=;
	b=IYyT9p3ok8DnWODW+OmR+NeTUTdQ+m+7T1Z7p+sBrWCR/abp/ZQbgdHLQlb8Z/vtZJ
	zemKi+ayf14GxxYYUeGTPb2E8z7lAfC5M8jcFJooMt3XAM0CbyxW3BxCMDudTIgW1eKz
	32XTH/W+IHgcXacFiPDRpoe0CpQPPWDo8i/fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=izeqectc3+goix3mCSXLtrJoQdtenM9QwmmH/UPEai0=;
	b=ECczhiHkEVGI6V02JQYncM/Fxil2ovgmXeXuFPkNlLLcY+TADhobSp11HnPlCRI89l
	5dgYD5+hxu+Qz0wI90Io2+FDTeoNuq+X8EzMIr0V22V8b4QbxiIN7ChMtYm9ik/JHKmE
	tYZ5YXuRy37qyhLD4zEmLfD8QIvY2ssjFh2F5xu7K/ogM1cXFpTHzG4cqdQArh9XIN/m
	S0FXzhl1D/1YTG7lpQrrBiYvmlZSkz9uMQduIGtnC9o3XW9WBoGuOE3ykL2o6bL9qgAY
	QxT2n6zZm28nWPBkWIRlARzzdaPQPg4Wx0W2pq+Skppe05T5w5Jt0F1vTPnGNAlWiSHc
	jAwQ==
X-Gm-Message-State: APjAAAUXesPqZBXUBE8W2H6fIl9E/eSw7tDfcqwDDgfPkC2FxIR6B6mL
	24/+jdu9eyGrofQqC/RJh8v3UGjlj/k=
X-Google-Smtp-Source: APXvYqya8lxURXtLubg9SL9HtaXQoNvCsrur17RLXRUdtPYId+N9dGnosOta8/+grQeZIxbuMjaV8A==
X-Received: by 2002:a1c:a947:: with SMTP id s68mr10532492wme.61.1581761970379; 
	Sat, 15 Feb 2020 02:19:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j5sm10748587wrb.33.2020.02.15.02.19.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 02:19:29 -0800 (PST)
Message-ID: <c0b0a4094d4abbdc319138d3d31be77467bdd269.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 10:19:28 +0000
In-Reply-To: <1581723869-21232-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723869-21232-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] icu: upgrade 64.2 -> 65.1
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
X-List-Received-Date: Sat, 15 Feb 2020 10:19:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 15:44 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-support/icu/{icu_64.2.bb => icu_65.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/icu/{icu_64.2.bb => icu_65.1.bb} (88%)
> 
> diff --git a/meta/recipes-support/icu/icu_64.2.bb b/meta/recipes-support/icu/icu_65.1.bb
> similarity index 88%
> rename from meta/recipes-support/icu/icu_64.2.bb
> rename to meta/recipes-support/icu/icu_65.1.bb
> index 44caa43..bd932d7 100644
> --- a/meta/recipes-support/icu/icu_64.2.bb
> +++ b/meta/recipes-support/icu/icu_65.1.bb
> @@ -28,8 +28,8 @@ SRC_URI = "${BASE_SRC_URI} \
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[md5sum] = "a3d18213beec454e3cdec9a3116d6b05"
> -SRC_URI[sha256sum] = "627d5d8478e6d96fc8c90fed4851239079a561a6a8b9e48b0892f24e82d31d6c"
> +SRC_URI[md5sum] = "d1ff436e26cabcb28e6cb383d32d1339"
> +SRC_URI[sha256sum] = "53e37466b3d6d6d01ead029e3567d873a43a5d1c668ed2278e253b683136d948"
>  
>  UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
>  UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"

This breaks webkitgtk:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1548
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/272

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1563
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1567

Cheers,

Richard


