Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2A81F774A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:22:45 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id 34so22544861uac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OgPfA4iWiglx/LmEdr8ZtP2AaNFJ49/whKJZPunVm3c=;
	b=Oa3rIEppIlITUJFlaYjNJ81HyebiKK9Y4bRx54CA+hreMcMyLNhaVby90paUYYAbz6
	nZPCruXcmmUZr8YIgAT6L0hxQnDQ/tNuc3kft+T4uFyWC95OOyAoXfUB1kg4V5bI4ghh
	OMHORz4TCbG3AxgjP78nSgRKBVfKEjXLG/EjkoyWzWRgJl9gC6IDp4MSw75PZCkKaEQb
	9PkwSq8WxKtZzF8Fos084dosXTQ6FRMNwi5GKHa1idxhy5v9sQ+VL+92BG1C5BvgXPN1
	18oo0oBfI67Wpkba2N5KwgH+s+s5Pj2Ue5kDM0JZfbPpbtoFFn2OzIjvaGZ6GypNfFhk
	2E5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OgPfA4iWiglx/LmEdr8ZtP2AaNFJ49/whKJZPunVm3c=;
	b=fvMM0XVDcSUoyJCBdsa7P5jZgL9eE7PMlsu5c8b5MicdEkGAr0xso1qA/hiIuqPGJb
	5qPjeXQmxOUqK8nhR4JioLSvBUdKl3o0+XJc78LYF2Mu7ATZAtYEGo15valiKfL0Mjxp
	7dK9bhWSJnZrbqaGFTOa4kQQ7WtUEjEbrKm6wo3kok9pMkefhzxHB42YMpDyzaCJz9yQ
	CzoR6eRVtNkyM9kLyi9NrkY4eNLJqN523eOAyG/MmCaRHlKf07KS8MGHHn21LCPjiNZM
	fCqa1KjNjpGHgT58JBHOSY4+mtZodCVNeId6IqYwKQOw7eynYNfPFij+6T+4f12nhBdp
	NSpg==
X-Gm-Message-State: AIkVDXI2MMS7Gl4j9X30IM4BBXMdbbhRSwT/v0dfGwMw6rsKKizbV8dOKDB/Y5OuP3hyRcXRQXAfxfvRx6PHsw==
X-Received: by 10.176.84.8 with SMTP id n8mr4509231uaa.29.1482340967142; Wed,
	21 Dec 2016 09:22:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 21 Dec 2016 09:22:16 -0800 (PST)
In-Reply-To: <0e2947f3-9729-a463-3bb8-a11062749ac2@linux.intel.com>
References: <20161221070238.8554-1-raj.khem@gmail.com>
	<0e2947f3-9729-a463-3bb8-a11062749ac2@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Dec 2016 09:22:16 -0800
Message-ID: <CAMKF1sr4dn-J_6kTp=pS5cTGWpd7QeZbLdmtpMNJEuMQzhvqKw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: Upgrade to 1.10.2
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
X-List-Received-Date: Wed, 21 Dec 2016 17:22:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 4:16 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 12/21/2016 09:02 AM, Khem Raj wrote:
>>
>>  .../gstreamer/gstreamer1.0-omx_1.10.2.bb           | 10 +++++++
>
>
> You should remove the file with previous version, so it becomes a file
> rename like the others.

Old version is still used by some users.

>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

