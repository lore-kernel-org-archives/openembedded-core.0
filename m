Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6E171AD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 07:32:55 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id l24so951259pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 23:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DOYYHeTFZUbnLK+dFOtyxm5OCC/66A1AI6tH1FSjL/A=;
	b=P9QJKOFPp8rxiKKoamMuc6kspnFP8PWMAXy4eIH8xtpC+iTcfAlg3qybZHENmKvOYk
	SXR1KD4U+vaCtuoBb85w1fP1vQBmJjsdus/vkXx1TqSVWBrV1pziide3Ig+0AtQNAWpF
	o58tjHOlN19CZbhapfbe7gbnNfBPKfmU1bt8ewsGL8QVXLXCETiPMpFZeXG9f1RTm5/5
	hVWNjauNtECDMqx32hqNKFg3evlgmRSHTHdvVuSqffzuIs4rqu2kQfgbjgkbQ+2GvUhC
	wLfNhy61rU+ipKHzSc9cA2J58fV2Xx+MC7Z8moH4hx/ANV6yC9pGa7dwxx8sbVi8zBlW
	73tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DOYYHeTFZUbnLK+dFOtyxm5OCC/66A1AI6tH1FSjL/A=;
	b=lIlA5b9qg/xnqIJ533Z+BXEqagCJiSlfPMcHL1UWSl5LtN39rPrSugwqAwrXzItJYx
	xhBoJ0k86RAlbjXRjBnY9hnj8bm3eKzmuSNSJO+OK0lHrGzKzc0+ymj7QJNBNv0FdC+2
	jme98T/APVYrijqgr/bBBMKFxhg6+1Z4VSvLCco4PYOlb27nI9eXvK2bBTS0Gw4Ioiny
	URp/xLg/9InGx4hpIeQLUG9NixlBgE332/BkWe6qez4uGT7KpglHsUilxd0d1Q0WJqBc
	kPvxwvavyOQ4iYKWU+LzOwo+4/7vyk+WdU4QITNb+VeqU3aQE1BaFGfSECe9QVXB4LcL
	jXiA==
X-Gm-Message-State: APf1xPAsLbh+44/Y1yF7Bks4izS8XGLgJjdgwJUMfE53ZdajRYLinK5l
	+Y7ZTRK7agNcyxVVftsxDJQI490f6k5E/dWEDfQ=
X-Google-Smtp-Source: AH8x225S623VwkUwIFL08KSyPA9MZgSJllYJ0VqDu/9E7QDjf4q/i6mnuMazqqNIebxLAYyf6bwvo+ePH+iEbtBqmfM=
X-Received: by 10.98.131.139 with SMTP id h133mr10767060pfe.155.1518420777048; 
	Sun, 11 Feb 2018 23:32:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Sun, 11 Feb 2018 23:32:26 -0800 (PST)
In-Reply-To: <CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Feb 2018 23:32:26 -0800
Message-ID: <CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Mon, 12 Feb 2018 07:32:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Getting there: https://autobuilder.yocto.io/tgrid
>
> Just two actual problems:
> - The non-gplv3 build failed as the make fix needs to be backported to
> meta-gplv2
> - The eSDK selftests all failed with en_US.UTF-8 problems, the new glibc
> shouldn't be causing a problem with uninative so this is interesting, maybe
> the new one is behaving slightly differently.  Should be easy to replicate.
> The same problem caused selftest to fail.
>

is the UTF error like this one
https://gist.github.com/25a84d23618824f0e5e6857a960eaca4

> Ross

