Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0707E9A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:54:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p11so3732581wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=B3UNgX2gomGG2gFMFg1tdJYfXmVvM60wojZNo13PgqE=;
	b=e3Hp1qv0cC5IEQV5vyq58lqS/Ijz0gfD1l1GASvnYgls3kP79nIH+FQj8yhdQ+LA15
	OvUWvVRw1TiU8ZhuY+vlQIOLlSgslm5C1JfMnBcJu6aqhrVyCABFucpdRSSNC457YSOO
	daUjgzHW+V15PMWlzftLmOUX1gz2ehLiWsiGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=B3UNgX2gomGG2gFMFg1tdJYfXmVvM60wojZNo13PgqE=;
	b=Z29UNI96j34fKRvtkFijZzbcPSJrtCj3XH5sTUUHl5Maf6ABcv+DYnyFcXLVyBA9Ez
	EIvfJyjGbGp4/t3fYUwb6Hu5aFlKh4mrrxn80xzpmYo60nDimMJbqfztMk1DjOCWdxhe
	fTYJrPl6lNdrc8fCyKJ6HXovEebdWP2rSx7rQ43mbXY/eP/K/oPgjMNVOGCSug+2/I9d
	FnvYraKOtd+ZxBda25kUuVksTAa44vo5VJxvypFvpjEAZmiidhbvAS+rtJ6OYLKKGy6T
	wpAFyqUTpkU+p/EKiAb1VeqXezff2uCxW8qXE/qn93hnJi/Q0DmF2f4i2aR8KBbPRO8j
	6DzA==
X-Gm-Message-State: APjAAAX/FLHXlz2g/6Jx881nEfKkyJGchtMFaNkairhsrnMQM/SiVfRf
	h3xvr99aaMd3nj5RktTZYYcbTOSP+dY=
X-Google-Smtp-Source: APXvYqwZJkDScfsi/2y5pTa8zP/Vc8gGLI//epinf55ThGBHtxxr1tsSO2sHYzGGhBPHtBYoz723Cw==
X-Received: by 2002:adf:90c3:: with SMTP id i61mr68261052wri.48.1560956060867; 
	Wed, 19 Jun 2019 07:54:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm17040614wrt.49.2019.06.19.07.54.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 07:54:20 -0700 (PDT)
Message-ID: <ca30326670f001b5521526db8677465964bdc5dc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:54:19 +0100
In-Reply-To: <20190619132450.130226-3-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
	<20190619132450.130226-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/9] dnf: upgrade 4.2.2 -> 4.2.7
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
X-List-Received-Date: Wed, 19 Jun 2019 14:54:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 15:24 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.7.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/dnf/{dnf_4.2.2.bb => dnf_4.2.7.bb}
> (98%)
> 
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-
> devtools/dnf/dnf_4.2.7.bb
> similarity index 98%
> rename from meta/recipes-devtools/dnf/dnf_4.2.2.bb
> rename to meta/recipes-devtools/dnf/dnf_4.2.7.bb
> index c77773332c1..f22af64125a 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.7.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-
> management/dnf.git \
>             file://0030-Run-python-scripts-using-env.patch \
>             "
>  
> -SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
> +SRCREV = "11910fcb0fc0ef13838230dba4f719be3540fbdc"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>  
>  S = "${WORKDIR}/git"


https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/959
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/953

and probably a lot more but I'm stopping the build.

Cheers,

Richard



