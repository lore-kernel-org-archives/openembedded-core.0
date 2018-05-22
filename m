Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31041605C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 10:33:41 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bi12-v6so10634840plb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+BfypqqcAMdRJR9E7csxNSLFqaQji6rc1PiAnW1VUJg=;
	b=rUb5+1C1hBZey/QQMkoJ8vDEz7ysrKZ4pE2bcuLUX0fTjNqXip07/7y2+flIHDUxgo
	sfHukuR6HAGUL9FrmtmZ3cFsYrcXTvXLnHeibIYkjxuynC947IYPIubSC85EI6swtgGx
	rOoI9GHDfjClrNFTtVNf/h57eUNMrAWxwAD+/Jjh8/kdAgKcI0mXlaXEgV8Mayu7E/B5
	NDNTk2IfkKv8AU7rq8un+1AWWe1ZIoSclNST3GsscWKvqvNjid2tS9ZAGmP3/d6vxc29
	1MCz+P0e2gXv6eyyS0Ijv6qLRnqJMxluFoALvf3wH7UXIJGwMoADb3kU+Me7tPsySaT2
	SPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+BfypqqcAMdRJR9E7csxNSLFqaQji6rc1PiAnW1VUJg=;
	b=jAf1vzExwAq2HNZ4ZFRYzLCdav1H4s+Rw//S3DHbfxXifNLrt88KBCCz4XeZzLCwR7
	hEcXbAHJt31fZ45YezF62N3sEfvNvQ7c6qPlvvMZe6GPHNhOhwiSpkqzzaaLxw15BNGq
	cb4a0Tm/uoHh/7USwjBcOYSesd7wH35Giut2p/WT4RXZyPeADj4pD5Y5SQgVQNiROhcl
	Oc+XJpowzt0jUBuiqd9UH8Jn9y+t2AecKkqOJO6TFI57AFiyKp2yCCrPUMRmDuGROgFf
	drNr0W5CDr36yPcyCwtrsarn+m6XputjUwuKwx/FKA4VBvsXod49afY2gt7Hm+DviOf9
	v1jA==
X-Gm-Message-State: ALKqPwejPqCR1vFkyKvaJNtBicyK8EI8vvPLIE+qQw1kF6jc8vYF+IJZ
	Em9ftO4V0lJ+1UPw9kXsl5FSlwxNj1Ee7s02IeQ=
X-Google-Smtp-Source: AB8JxZoU+cUtDS+VqHL90LjQ50rpX2eki//kW1Ghw/eFcHrj1gvCKu225xnrLvwhf5Ewx9j7PCJeq3oqSei18gZaDwE=
X-Received: by 2002:a17:902:b78a:: with SMTP id
	e10-v6mr24497563pls.260.1526985222780; 
	Tue, 22 May 2018 03:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 03:33:12
	-0700 (PDT)
In-Reply-To: <FAB9E48578194042BE5C63B8BE47610339CF54BD@MBX.NIKO.LAN>
References: <FAB9E48578194042BE5C63B8BE47610339CF54BD@MBX.NIKO.LAN>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 May 2018 06:33:12 -0400
Message-ID: <CAMKF1spXXQiP8vpgCt-MJEyXpssH7NQF4Vw+CZVyy6-F6K4a5A@mail.gmail.com>
To: Jef.Driesen@niko.eu
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Tue, 22 May 2018 10:33:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 5:58 AM,  <Jef.Driesen@niko.eu> wrote:
> Andre McCurdy wrote:
>> Although there may still be specific cases which can benefit from the
>> ARM instruction set, the Thumb2 instruction set is generally a better
>> default for armv7a class CPUs. Distros such as Debian and Fedora have
>> been targeting Thumb2 by default for some time.
>>
>> Note that setting ARM_INSTRUCTION_SET has no effect unless
>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
>> of tree machine configs may need to update their DEFAULTTUNE to take
>> advantage of this change.
>
> I recently ran into some major problems due to thumb vs arm. It turns out glibc doesn't support systems with thumb disabled anymore. See this bug report for details:
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=23031
>
> This might be useful input for this discussion also.
>

Thanks, this would be useful for us to check if kernel defconfig does
not disable CONFIG_ARM_THUMB
on armv6t2+ regardless of this patch. This patch however will require
this option enabled too.

