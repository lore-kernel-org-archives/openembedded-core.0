Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3D8751D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 23:13:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t5so234433wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 16:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fJylPJQuWS6F1Lh3J/RBZ9VQhUL1TG9xY/uVEtbj3CA=;
	b=QLGGqe5S6qDM+dJD5OtFnwcxmRzb/dGnSL+TlKPpeAvVLOY0DG7FmW/F0mgToRWDmo
	qaVstgyTvwZ5Km3druXApAGtdWZPEiILrNLBJzEHfnWouV/b36HucYZ1cm+A5ajmxDGb
	6tV1ciiJ81WXp4i5JIkH/qjZGaFaK4jHnmxPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fJylPJQuWS6F1Lh3J/RBZ9VQhUL1TG9xY/uVEtbj3CA=;
	b=N5SWIwiGX2gvlgVlJwkT1vqCaqUtOmPTIuNNBKx+9sRBrYmU7XdO4EH8DHRybwBJyA
	ReA/VuIuvHg664C6dqz0SxZrHqQSxLQE6/bxISnNiH7lTsWxAsMlN6ahZhjUEuyag0tX
	Y4Q6wqHoVivN4rM+c700/1LmGF7uUSYESqlaVfZwcbcd4cbUJPk296crxSt9adbELTs2
	oWgj+M2bPGIPzJg2aR1x9pzAURYJBzu9y7Fy6ArR35IGcYrGosgVt3aFaDsILqJse9xF
	0c7dCnkM7AsGUVx7GWmuakKVwBCShbmv0OJjZhptgyhVSZFbWE+oSAKy5XyymWXfojlE
	/tZg==
X-Gm-Message-State: APjAAAWbHShgc4VsmcmRgaXEyWV9e5yYbWpBTXD4CN77t47P+PImVq+Q
	N+ri5gImpqPUe+Sk9KF5MSBvRGhzhP4=
X-Google-Smtp-Source: APXvYqwTbYRR6OPCJHHbo/w5SD+1mWJooY9BDj2fySbW7hQDTSsDppeVxgbfhC5HUdPOzqFxWhvukQ==
X-Received: by 2002:a1c:7c07:: with SMTP id x7mr4399586wmc.60.1559085214206;
	Tue, 28 May 2019 16:13:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w3sm13502381wrv.25.2019.05.28.16.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 16:13:33 -0700 (PDT)
Message-ID: <df74915db04e0cdf9648a95e23435db3c8aa4684.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 00:13:30 +0100
In-Reply-To: <1559016116-139663-4-git-send-email-changqing.li@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
	<1559016116-139663-4-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] bootchart2: add initscripts-functions as rconflict
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
X-List-Received-Date: Tue, 28 May 2019 23:13:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-28 at 12:01 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> bootchart2 rdepend on lsb, lsb rdepend on lsbinitscripts,
> lsbinitscripts rconflict with initscripts-functions. so also add
> rconflict for this one.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> index 396d0ec..36092e6 100644
> --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> @@ -143,6 +143,7 @@ RDEPENDS_pybootchartgui = "python3-pycairo
> python3-compression python3-image pyt
>  RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURE
> S', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
>  RDEPENDS_${PN}_class-target += "lsb"
>  DEPENDS_append_class-native = " python3-pycairo-native"
> +RCONFLICTS_${PN}_class-target = "initscripts-functions"

If lsb and initscripts-functions have the conflict, why do we need this
in bootchart2 as well?

Cheers,

Richard


