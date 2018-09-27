Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6783579926
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 23:47:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q20-v6so2742962qkc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 16:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dj8KHVjJ08jI74oQHV0iW82IoXeQzmLFDK3IZNpVFrE=;
	b=FdwvwsL7lFoR6JtTPaAiM/RwfQwknoxT+vxW1dLlPljyR7+mCmOvW8aypUhZ/0EhPc
	D0qAj/NS11jWnVlWiMkS681U8qnXQLW5G7Gp3V8nO0ll2Vg6K3E+QMToYBvRACkSge/1
	z9dc/AIQhSS4iMXXe4JJV/Brxb9lEj0b5OITWD9GKWwqyiCAYZnjyGj51ICExVrMAG1A
	vFMk3WOivMyDmhrBJFTMtopV/fZRjlIBtDGas4+jI8DpNcmv4LKvULGoa5cYJgarrR4w
	9zpImQu1bx5D2ekliA8PqSggm1eLvsSZ+miybRLyRPPQagH8fYn5JNyGtwLv7OTst1NN
	Ic1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dj8KHVjJ08jI74oQHV0iW82IoXeQzmLFDK3IZNpVFrE=;
	b=QD8CYl9zu4i9HKKadIXqlTYDEFmNBO7dNTITH8/jrCQFz1EoedsYU2bgTQJkjluOVR
	Fb3ff/dCXR7t0FPOt0zxwFBP51gKb0j1uYkL/GImFZGFawnwWee5Il7zgmR/4lPqV4WS
	omawULnIVeiYFTqcPgVsoeUibQcLNYCz450phgDgCic4wZJCSgwKRI5usdLsbuepyLC6
	vxo57DfriwINISFhYmin3aMgZlu48vRxp/ImnzGdqCRYYGG0zKoZ0tPMTUKdf7ZWTCZ5
	Hk1HCNDZJlhmzHi12V5E65hozJcpg0hfHldxFa1zgh3Zefzz7uygKbyt1Kvyqz0zqvCB
	Zuwg==
X-Gm-Message-State: ABuFfohb1/T9Rq61VM+ed25cELZEIONssVP70Thv8zu3s7Vf+MmN1DSu
	QFMGmGMGhRLKdaE8BeoLlZSNTshpLZP2D18EPu4=
X-Google-Smtp-Source: ACcGV6243SFXwQ+g6lTvVfjp8e6kp4P06coiEw6XebOydrKv5VKVg6B/QkPkAq1WLXoeoy5TzRPogc6Sf8U0pxDp1hI=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr10004076qkm.2.1538092033179;
	Thu, 27 Sep 2018 16:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20180927224111.7607-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180927224111.7607-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 16:46:46 -0700
Message-ID: <CAMKF1srNKtuhY8ERfh+0LjuFWviJkGw4GRVLVG3xonMdBPhLOw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] layer.conf: Drop sumo from LAYERSERIES_CORENAMES
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
X-List-Received-Date: Thu, 27 Sep 2018 23:47:12 -0000
Content-Type: text/plain; charset="UTF-8"

will it result in hard error ?
On Thu, Sep 27, 2018 at 3:41 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Prepare for release and drop sumo for the compatible list of layer names.
> This will mean other layers need updating to continue to indicate compatibility
> with master but that is intentional at this part of the release cycle, we want
> layers to indicate compatibility and show they're up to date.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 0728c51e5fd..6221a057ce6 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
>  BBFILE_PATTERN_core = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_core = "5"
>
> -LAYERSERIES_CORENAMES = "sumo thud"
> +LAYERSERIES_CORENAMES = "thud"
>
>  # This should only be incremented on significant changes that will
>  # cause compatibility issues with other layers
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

