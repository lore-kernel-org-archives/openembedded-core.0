Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0036003C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:38:04 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id o8so22803283qtc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/4QlPEAlTg8BX7mBLx3J7R0Ic6M76OqmjYgrr4/+edA=;
	b=PjseW0CumT0dx9YnyqCMdb9kUH2XrUMR/qe4Im4aAu/b5gN+37tcg/pc5nT+MZP/+5
	f5B+5iWLqKOwpZZRQDXfy7lGNW592F6+0kBMBNZ8Cg8fq0yPrV2TzeZ7fRtAygogeUk/
	MGrdDJCMVCx9MlM3k+7HQzjfixNHwLjh/0Oqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/4QlPEAlTg8BX7mBLx3J7R0Ic6M76OqmjYgrr4/+edA=;
	b=W3b5AjhsXLxjyXuKNxqVCPlJnQYD/mG4CpH0cp071F2QSHZPHMpE+r42s/fw+cVIZk
	kc/Y6xOI1mxQAK/p129IKsEHOarZAYhgS8z5d4G7iKc6yV5fnRqIvuMIh/Z9WvksqDm9
	6tKgxVIHAlfjvf0O+oGCeXnD5iXs2LJLlPefRI93/DpFwK0gr93aRSfyzvacjaegv8oZ
	vJfDflYkEAiH+XPlmjVV3XJTlkLewWFaB2xjfO+SnG8ZE9GMjJ6/X5M0wD1G05cb/4WW
	FOnF639J4GYRP+WGDM4FH7dIQZZrn3jaMrScDxC5XGrIHQZzYxLsemp1DA2wPGjcFuw1
	4zsA==
X-Gm-Message-State: AIVw111Mmhb/EmVzSwf9JqB1DV7mge2ZZ7P9yaEEQc+eXTOFXLf3vvJv
	Mv9MunLXWUcxXx0f7Gd+pZNW5SIx0AwfXCg=
X-Received: by 10.237.39.135 with SMTP id a7mr5205940qtd.164.1500557886109;
	Thu, 20 Jul 2017 06:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.194 with HTTP; Thu, 20 Jul 2017 06:37:45 -0700 (PDT)
In-Reply-To: <CAJTo0LaKDgomugkgS0uirpirJPOLSu=-OXyEDQcGSuF6PTP8HQ@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAP71Wjz2gS1PYWZzZ2FYb72F_T2dP30266Xcy70eRJvftjsKUA@mail.gmail.com>
	<CAJTo0LaKDgomugkgS0uirpirJPOLSu=-OXyEDQcGSuF6PTP8HQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jul 2017 15:37:45 +0200
Message-ID: <CAP71WjzwRpC92KED-8k=xmdouRi8TfaNYbWGJyMkc7PBf1KFHQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 13:38:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 3:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 13:58, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> and it would make this patch a no-op instead. the patch would only
>> 'fix' the pkg-config mistmatch. and we can fixup the xcb dependencies
>> as a follow up patch instead. i am opened to suggestions..
>
>
> Enabling those is good, although there should be a packageconfig so ffmpeg
> still builds without x11.

but do we want to make these changes as 1 patch with the pkg-config
fix, or as a follow up patch? I have other patches to fix sdl -> sdl2
and add ffplay support.

>
> Ross

