Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9CAC7D3E6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 08:04:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g135so12830547wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1yR7zta1A0QrFr3fL/L3JYn/f1Uwa/YOtlw5gHGzqqQ=;
	b=NBZLuvoQEmg1uoc+6V7U1QXH/4guv945paOWJUzeNkNvLke8Mq5htAlxH3arTk9nY+
	niwX1uMIX8GUr6Xr4mg53opWF0VjhlQkdl2E2k+dWqawVMFoJny4MWGB/t3uJQSXiT71
	RypVfVZDJ/ODmsu/OACybA1Ui6F5vwhyWhMzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1yR7zta1A0QrFr3fL/L3JYn/f1Uwa/YOtlw5gHGzqqQ=;
	b=WchU5rsrTAi8Oo+XZHcz1wlkS2VhhF+PAeVIAxA5EBjt9jHobKJrZ0R9mYBJEFCAEr
	hy13xjRQqrGeGK4+bPoy2s3Fv2JxHKdZhHQ7scT2wVy3crgl4qMA1rl74pFjS2+c3op9
	kFNbjonaGfw3ggXsqcG8hL45LR0a46LEsuCdFVYkiK1HS6SQkBBuYjNWipnnTBzOiZVk
	6g6VFFHsY49+YlkTDfda7sLoOjOcEqCnKj1O2HRfzBLU4Absf/UmecFEEdBd2IMKFf6R
	TFmtQDO3jRfpKltNPwQMjUbFnEBAUs0gd5qRPt7akniX7c/eTqWpEhnnABHUomnT+aT9
	2IAQ==
X-Gm-Message-State: APjAAAUa8xVOEYn8noG5lIttj+C0ja5s9zg99cIeaXNvw9lGg0OrFOxd
	CuScvLZHD/RBi31wXWB70WDlXceHh9k=
X-Google-Smtp-Source: APXvYqyE00LFvhZzOaYMkhLF0fnorKeQVECbijMTJ06oB+cPZdyEGgbLe7VWFV+/HaERlMlnvOcb1A==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr13626244wmc.62.1561881884059; 
	Sun, 30 Jun 2019 01:04:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d24sm3022456wra.43.2019.06.30.01.04.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 01:04:43 -0700 (PDT)
Message-ID: <d3c2fc6e48254b073b9c1f828246dcc575694330.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 09:04:42 +0100
In-Reply-To: <8ed4c92b7a1618a5bc2781e7af04889f65b0baa7.1561724112.git.liezhi.yang@windriver.com>
References: <cover.1561724112.git.liezhi.yang@windriver.com>
	<8ed4c92b7a1618a5bc2781e7af04889f65b0baa7.1561724112.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] devupstream.bbclass: Disable devupstream when multilib is enabled
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
X-List-Received-Date: Sun, 30 Jun 2019 08:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 20:15 +0800, Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> PREFERRED_VERSION_lttng-modules = "2.10.10+git%"
> 
> $ bitbake world
> 
> NOTE: preferred version 2.10.10+git% of lttng-modules not available
> (for item lib32-lttng-modules)
> NOTE: versions of lttng-modules available: 2.10.10
> ERROR: Multiple versions of lttng-modules are due to be built
> (/path/to/lttng-modules_2.10.10.bb
> virtual:devupstream:target:/path/to/lttng-modules_2.10.10.bb). Only
> one version of a given PN should be built in any given build. You
> likely need to set PREFERRED_VERSION_lttng-modules to select the
> correct version or don't depend on multiple versions.
> 
> This is because 2.10.10+git% will be built for non-multilib lttng-
> modules since
> the PREFERRED_VERSION is set, but this version doesn't provide
> lib32-lttng-modules, so 2.10.10 will be built, then the error
> happens.
> 
> Bitbake can't extend an extended recipe, for example:
> virtual:multilib:lib32:virtual:devupstream:target
> 
> Or in a reverse order:
> virtual:devupstream:target:virtual:multilib:lib32
> 
> So disable devupstream when multilib is enabled.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/devupstream.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/devupstream.bbclass
> b/meta/classes/devupstream.bbclass
> index 7780c54..25403da 100644
> --- a/meta/classes/devupstream.bbclass
> +++ b/meta/classes/devupstream.bbclass
> @@ -19,6 +19,12 @@
>  CLASSOVERRIDE .= ":class-devupstream"
>  
>  python devupstream_virtclass_handler () {
> +    # bitbake can't extend an extended recipe, for example:
> +    # virtual:multilib:lib32:virtual:devupstream:target
> +    # So disable devupstream when multilib is enabled.
> +    if d.getVar('MULTILIBS'):
> +        raise bb.parse.SkipRecipe("Disable devupstream when multilib
> is enabled")
> +
>      # Do nothing if this is inherited, as it's for BBCLASSEXTEND
>      if "devupstream" not in (d.getVar('BBCLASSEXTEND') or ""):
>          bb.error("Don't inherit devupstream, use BBCLASSEXTEND")


This is a bit of a serious problem with devupstream as it means we
can't rely upon it for default recipes. We need to file a bug about
this and find a way to fix it, perhaps teaching multilib about
devupstream so it can set BBCLASSEXTEND accordingly.

Cheers,

Richard


