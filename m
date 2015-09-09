Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id E970B76DF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 16:01:09 +0000 (UTC)
Received: by qgt47 with SMTP id 47so11593972qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 09:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LA3xU7jTcZMOtbugFr5w1QuqGzUpUtAdm/KI4m1JBtU=;
	b=WYT2SgHex6gJAT3cx0k8xvWHbNy54dpHj4lXRiwdmkQe3NQxnxcrCr8tRLNREWudiI
	GIVsck3eQmJPDxtBVyRRH1zicC7fDVPDKzOWdoQ9q8cOslPO563iy+tR/hzrZ/9CHYXR
	lbfctfPv+gKv3I4pqB5e0RINBALirxNFdedTF87Ow7ckT2cZUQgTRFHzwjakzX/DuJDz
	jgxt9XcPNxz0EJ2LO/8/KnwS4GhPwZDe6MxQOh8ss8NVHZ8GGqdSprkctAzkbM97RFYW
	c0jD5Qg9L85W0k+SFiNkbNESh4Ast+9ErT+dHGBh2rCn75ZBM3RCGu4EB5mtX0SHj3Hf
	z9gQ==
X-Gm-Message-State: ALoCoQksGDx5QQ3Y5jby04efifnuZn2qjglJTZEcTMHpoJEsnQvJKl5FpCh77Nl0qToUnBE2csAp
X-Received: by 10.140.133.67 with SMTP id 64mr47620343qhf.52.1441814469628;
	Wed, 09 Sep 2015 09:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Wed, 9 Sep 2015 09:00:50 -0700 (PDT)
In-Reply-To: <CAP71WjzWEfWq-7NL3Qu-HVCHFXCvrDK=H06qRcSkPZajO4ztUw@mail.gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
	<c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
	<CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
	<92D7A469-14E6-4E5F-835E-C90FF3300346@gmail.com>
	<CAP71WjzWEfWq-7NL3Qu-HVCHFXCvrDK=H06qRcSkPZajO4ztUw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Sep 2015 18:00:50 +0200
Message-ID: <CAP71Wjygsr3dTph2-cg2pZv4G5g_B6ymu1B9DWjxb0BDFOjyng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Wed, 09 Sep 2015 16:01:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 10:07 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Wed, Sep 9, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> why are you adding a patch sent to freedreno mailing list (so I would
>>> assume against xf86-video-freedreno), in the xf86-video-omap recipe,
>>> is that a typo?
>>
>> thats where it was sent to. since thats the same list omap driver is using as well.
>>
>>
>
> hmm. really? I can't find any info about that. how did you figure this out?
>
> Note: I saw your patch on the freedreno ML, and actually the patch
> also exists on the -freedreno driver as well... probably that file was
> just copy/pasted.. in any case, from your email sent to freedreno it's
> not obvious at all that you are targeting -omap driver. so if you can
> confirm that -omap patches need to be sent on the freedreno list, then
> at least you might want to resend with [omap] in subject to avoid
> confusion..  I will test/submit the same patch for -freedreno on my
> side.

i talked to Rob, he merged the patch in both -omap and -freedreno. 2
for the price of 1..

nico

