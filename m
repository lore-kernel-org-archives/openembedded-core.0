Return-Path: <cjp256@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7F856D6DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 16:03:21 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so9821946ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z3KnsfwgxcIzRnw1iS7NwS/nIhSaKv02Us71dgh4xV0=;
	b=A79zQbbL/Z/UdII2JkwE2k1YSQw5+fOb8ZyumVroyjFdcZBRoJ3dXVXUqdmuU2vMfC
	Gd99xLXV1bI2n8K0rCqB1B/xKIdrm90R6oXmvAeb1J6P7Pl0CHM2q/gIoc+lOaDODhGe
	4rlyi1wH09qngzK7HOzfrYgINEWfED8IoVzM7YuxGNyTNbrfrhi1swLnjxpB1gELBt1s
	aPVA51tUFIFvaDj1cK/7jEzOKv7pLAVkUgUajVAVDrrCuBfYlmDx7W0eVruR9V61Fb2s
	e9XnaviB5kEdtN3GiMKhP61ZRhCcyvEVewbXJk7SpQqpmYQBBdk48WwvjjTIyHvtwwdU
	oISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z3KnsfwgxcIzRnw1iS7NwS/nIhSaKv02Us71dgh4xV0=;
	b=LegZJpoW3CfPv4XIHejeSBp1dVg4GkymeI9QHsoQ5F5bM7tLkJNJ5xOAKJqxKqFRof
	PAn/9Wgiv5N8AL5wS521buiyIeqk30vp/duz6M3ViMFZjzQ4Gm9039GBXnKD/0+cpTcx
	2jzdnsYaxbZF31MFGU3gRtlHk/07Bx7gwUcIqk1m61yJ7on2LNoDJYut8noNQoAjsKNd
	pMkVGTrBCP9dWTuWc645mUi0DlusGgOpSiyYRMYm0z5tUDqLmKbpm1K6zlEEgXAju8P5
	hZJlxJQ8Qib8N+/8n4744Br4JLjb5e7HM/bAlwfjbiwM9fGgQGR46ALbkMoiC9grXHZX
	zcBg==
X-Gm-Message-State: AA+aEWbxR3JkxhI2lCbd5nsXtebGHH/o0TsfAcoVDUdf9v0htOUKH8Nn
	y4Mpfru2hGFW+mE4R2dPt2ik1swFZD7OkwFzpv0=
X-Google-Smtp-Source: AFSGD/W+q8w1o/scHLcl+453ePwu3j1h9h9x/sP1vcPvivcEJXmX9Spuzs42uFVZD9rtQp76crjoSYMz6Of62tarzgE=
X-Received: by 2002:a24:50ce:: with SMTP id
	m197-v6mr5199599itb.11.1543593802488; 
	Fri, 30 Nov 2018 08:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20181127234359.2682-1-chanudete@ainfosec.com>
	<CAJTo0LZRVNddaEXh7+y2ZY+XDh3rtCWyRn=YpkZ924ONp+O9Zw@mail.gmail.com>
	<20181128164943.px4djfs5xqpgpvfj@legion>
In-Reply-To: <20181128164943.px4djfs5xqpgpvfj@legion>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 30 Nov 2018 11:03:11 -0500
Message-ID: <CABZSBQdhHMBa-L0y-CD2G_ztpHBrF3gJz8LDyWtgJP2x+2VgTQ@mail.gmail.com>
To: chanudete@ainfosec.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] licence: Add license file CC-BY-SA-4.0
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
X-List-Received-Date: Fri, 30 Nov 2018 16:03:21 -0000
Content-Type: text/plain; charset="UTF-8"

I was able to apply the patch and mbox found at:
https://patchwork.openembedded.org/patch/156676/

However, I was unable to apply the mbox from this email directly,
getting the same error as Ross.  Whatever the issue is, patchwork
seems to fix it.
On Wed, Nov 28, 2018 at 11:49 AM Eric Chanudet <chanudete@ainfosec.com> wrote:
>
> On 28/11/18 at 10:45am, Burton, Ross wrote:
> >Your mail client has mangled the patch, can you resend this using
> >git-send-email?
> I used git-send-email for this, following the wiki[1]'s instructions. I
> am confused.
>
> I tried applying the change from the ml post both with `git am` and
> `patch` and could not get the error you mentioned.
>
> My apologies for the inconvenience,
>
> [1] http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> --
> Eric Chanudet
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

