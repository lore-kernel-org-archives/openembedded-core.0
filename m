Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB18738AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:34:33 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so5793892wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=41NlL8MYugVX9MQoarNfugmwaAHcH36k8gpuAeyK/0A=;
	b=OmHe+8ho1GlM/c4mFJSffeOqWfmIjGmPsoppDgtyEsxNo3jwwq5mOggOX2ZJctvUYE
	sIB1ujKcFvjB3cKGm1cvC8218/9sdkxk4uRc48021w3Xj90+9fjVNxyvcMosj6aG6dOB
	5PevFeHli/Vj1xZ8vfPs+f8kM/Q16nBYZTb14m6lfouf/veWzKThSC4xbE8dzTvZVcQc
	L4YWXD2L9+d5+tA4zYXcKMVIKPbhPcc3BfE2+JGNfnbcmydnjESWICwOM4yf0WkbNNGr
	LIwbWNZxrGar9m5S37Cm2pcKcdaf5R2C05hXKeON8mNSZixnQKYyatHIMR5Mom1HKAi2
	PKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=41NlL8MYugVX9MQoarNfugmwaAHcH36k8gpuAeyK/0A=;
	b=jHHcFLWSa1eoThxusgsVhpLkxLr+c+8Bbx5UB8gfliWAtVPaQsQJmTdxLmUvZoyXSP
	I13iAp71e5KKMJCjNHyLkd0YQpal2oZD/ZZRHAo0VQVYeLcfgFb1Lck0T+UuvkGTmW0v
	7Bt8VbsZgOSPVBQAAZBI104vQWNogGgBb4B8eVEtn0GWPSPRplWhU+63YLocu1wDajXI
	UjO8jGW7TEOnc7Pa1/R8oho0XwxPdUSn2vimE5IioWN2QhShfeRxaS5fzI2lXymje48h
	9mN08OiVdiWCnyx5bD/W2vph9+bk//Ip+Gv/tcIE9X5ltv24+ycovI21qE4ee3wY68P5
	GcDA==
X-Gm-Message-State: AD7BkJKDFEs+sdXh/q4VgHuIwMqkzuBQ0A+zAAzxGN1CdobtghDD8l6eV4QV7EEzrOUphDe3KmbucAFhiwWCBQ==
MIME-Version: 1.0
X-Received: by 10.194.246.35 with SMTP id xt3mr5491575wjc.57.1457037274058;
	Thu, 03 Mar 2016 12:34:34 -0800 (PST)
Received: by 10.27.219.20 with HTTP; Thu, 3 Mar 2016 12:34:34 -0800 (PST)
In-Reply-To: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
References: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
Date: Thu, 3 Mar 2016 21:34:34 +0100
Message-ID: <CAHvQdo2rkgTNaZgC8fK6NfxNnKvxULUSGhfVdP1WnqhcWL+wLg@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [yocto][xcursor-transparent-theme][Patch 0/2] Convert recipe to git
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
X-List-Received-Date: Thu, 03 Mar 2016 20:34:34 -0000
Content-Type: text/plain; charset=UTF-8

Sorry I messed up the subject, I'll resend it

2016-03-03 21:31 GMT+01:00 Johannes Pointner <h4nn35.work@gmail.com>:
> This patchset converts xcursor-transparent-theme recipe to git
>
> Johannes Pointner (2):
>   xcursor-transparent-theme: Add new recipe for git repo
>   xcursor-transparent-theme: Remove old recipe and related patches
>
>  .../fix_watch_cursor.patch                         | 17 ---------------
>  .../use-relative-symlinks.patch                    | 25 ----------------------
>  ...e_0.1.1.bb => xcursor-transparent-theme_git.bb} | 15 +++++++------
>  3 files changed, 8 insertions(+), 49 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
>  delete mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
>  rename meta/recipes-graphics/xcursor-transparent-theme/{xcursor-transparent-theme_0.1.1.bb => xcursor-transparent-theme_git.bb} (51%)
>
> --
> 2.7.2
>

