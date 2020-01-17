Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B075E7FA44
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:51:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so7115291wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 02:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=e/HFHszpgutmdCZYuPTfZwvVosp91g615w+qR52v828=;
	b=XzS3d1xnhUsiH7Hnoe38nbPQ/SG4l6zPap3B016fBaSa0rd2KDhvuUw8pfjJRxUNZL
	v7xe/NjYNflZVfI5d2zlk2++9YSZjSD1nmcdcKh6ST8OtuR8Li9j73qAsgXh3OOnG9C0
	rW1q8R3eNO+ot60htrX8Fd3c1zcO4bJFyNBco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=e/HFHszpgutmdCZYuPTfZwvVosp91g615w+qR52v828=;
	b=OB8e3VlK+sCtIsVmIeTVcQ8SpOig8oWKcnokXH8bMteFQdJ+POIYn8z4LTnE1OJvFI
	6fcAGwN5pVU4cM27aeC8we9Tdh95sdGk6ZhIK6qLf8i/7gbgjgTW552ahY8tr3OQad43
	WUORWT/gCxK0aRKO4gM2U+U2zPqM84KDsJbpwPuT6tcHO3jroGFf7LmYfL2jdAKNoJ+T
	nTkKOWS3/Dtut70Gh/F9WuUl4HTs0MuaDn4LnXkLExnvADyJ1htwK6E0M08GVUTisHzb
	ReNZrRmtt9zjYoRgnPkiAxSYHFb/8qAM5ZmsEF2EF+JtPK+RU2Mcej2W5jSOBjvyrq96
	xRhA==
X-Gm-Message-State: APjAAAWAYjykhwoV/mMko+qboOHX78VqQ5yQ6nBUSRjB4EGf6VVtJDDj
	Ct13yE67AUvCqrL21mER6MsGAg==
X-Google-Smtp-Source: APXvYqz42la/5hCZGkS1LrUKc3b3ifR7GWOdat/I0mV28/XTe9A9PNMRftzc/o6joh2lHrACVUHlLQ==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
	x6mr3921841wmj.177.1579258318406; 
	Fri, 17 Jan 2020 02:51:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x11sm4524321wmg.46.2020.01.17.02.51.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 02:51:57 -0800 (PST)
Message-ID: <b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sumit Garg <sumit.garg@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 10:51:56 +0000
In-Reply-To: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 10:51:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-17 at 12:29 +0530, Sumit Garg wrote:
> Some native tools dependency issues were seen while building with
> external GCC tool-set rather than source GCC tool-set. While building
> with source tool-set these dependencies were implicitly met which is not
> the case with external tool-set. So explicitly state these native tools
> dependencies.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta/classes/autotools.bbclass                     | 2 +-
>  meta/recipes-extended/man-db/man-db_2.9.0.bb       | 2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 3d22ad0..4c71be2 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -10,7 +10,7 @@ def autotools_dep_prepend(d):
>      deps += 'autoconf-native automake-native '
>  
>      if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
> -        deps += 'libtool-native '
> +        deps += 'libtool-native xz-native '
>          if not bb.data.inherits_class('native', d) \
>                          and not bb.data.inherits_class('nativesdk', d) \
>                          and not bb.data.inherits_class('cross', d) \

Where does autotools depend on xz? I don't really understand that
dependency. What kind of failures was this causing?

Cheers,

Richard


