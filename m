Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 098826C131
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 11:43:56 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id x124so11115656itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 03:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=apNajs1gvXPs1Z9lZ0Xa9Cu1gTYA9RZ2BBVziSKXzsQ=;
	b=oT5iYRZ8kIeH2c9ca06fjOtSmH8uAB1b7oq4H+gXAn6WvT7gE2UW7JLSrtKHir9Bco
	nWr3lIFjZxAR8hwQVa2y+vP/Nk5iuzpJ59ory/AX2hdFuDSfkF5S0T81FfxdC+r7Qxr1
	eBpGJTVe5HJrKf99kHo03BWoI7CjemsI86v0i7iPE0c3UnegpUkQz4+cNjYCDA1yQ/cV
	xGZboRJ/mEAeIljCYDk/vfa7+WTAIZgistiiHIUn/kYHZ21UXVitqVcHKdzzdPnKbLW1
	oEuy6+w4tJE3MsTLVKKnIc8yD60VnR5HJJLOTIGoW5QNxvRaqb10PxVg7iEjbWy6qzbM
	u6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=apNajs1gvXPs1Z9lZ0Xa9Cu1gTYA9RZ2BBVziSKXzsQ=;
	b=I3ifFVmswNlkIHEaaPJzkFe3PVGPHxnh++6b9rEAabV67gsbQJ7sG49+aVy4gQjyrp
	FdnZlpuKkibIxEiJoY9BA5DClEcjp82gWysoAyvdp8l4ti4nXgkAD1toDFa3nAOGaokI
	pP0BNEsAM5ZPUlUqR4p3rwylJVwVccbbjH4yVqlOjxFEpRng4Qn2tGFvCOPX9KKh2Sno
	O5EzLhX2HZF9ePluughujmYHe0x+OxfIQUHG2ni6tmLK9F3Ez6KHGZubrtlufC3kPvWz
	j4ZLi1Ww+7Q8w4OKKcbQw2oINXTspu0kruGf+tfTnfel1K+rOTcfxZ91Yx1ssZjmQBSi
	sAJQ==
X-Gm-Message-State: AA+aEWb4/TvaLcDUP7HI0SYUJ0yHM6H4Z8TSDgIJFfTiMMuWts4xdkw1
	G3UmjcQTWW894kEyAEQ7q9dn6jzhlhocUj9iDqmgLw==
X-Google-Smtp-Source: AFSGD/VRiTRcO1H+8WKWmZ5m2XvBdC9rcfBKAuyGGG2ga5kbh3QmsIW4bs1lGw8pfSTXpNvX+prWSr+oh+m2c8HPU9k=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr10449719itj.62.1543923837972; 
	Tue, 04 Dec 2018 03:43:57 -0800 (PST)
MIME-Version: 1.0
References: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 11:43:46 +0000
Message-ID: <CAJTo0LYsnuRBTeWZAStDNHzZHTnZt3+SH4XKgPydzDfrKF7yFA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-docutils: Fix shebang path to point at python3
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
X-List-Received-Date: Tue, 04 Dec 2018 11:43:57 -0000
Content-Type: text/plain; charset="UTF-8"

Interestingly if you build docutils outside of bitbake, the hashbangs
get rewritten automatically as part of the build...
On Tue, 4 Dec 2018 at 10:49, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> By default we get a shebang path pointing at python; when building the
> python3 version, ensure we use python3.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/recipes-devtools/python/python3-docutils_0.14.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-docutils_0.14.bb b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> index 81a449d64604..a2880a9601d7 100644
> --- a/meta/recipes-devtools/python/python3-docutils_0.14.bb
> +++ b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> @@ -14,5 +14,8 @@ S = "${WORKDIR}/docutils-${PV}"
>
>  inherit distutils3
>
> -BBCLASSEXTEND = "native"
> +do_install_append() {
> +    sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' ${D}${bindir}/*
> +}
>
> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

