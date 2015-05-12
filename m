Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 02A6C73FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 15:15:13 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so5765341qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=I0rHkygP+hQk2Xyx5tHxMjPBQzPuhwn2t+j4oKoPz4o=;
	b=y/lKeF05c+8qWvElEKyzUcg18iK3/0/26bIHoKJWEMwUvTRZno1DMW3LaH+kAL+2L2
	x/hWFKlXgZ1WTC5Z81GbZ25XMQq5oVpHUxlm0z751q0RMexeBBHNACCBgqOWH89i70tV
	ekci4kf5V9mnO1WfgPlSLNVodPEMNj/6rOwEgopHRZpnnor7XHC28sGerxw9Ei4OX6TD
	Y+JbwML/2v/7xGCPqKk24QAGoiT6AtobhmM4swxG5a1IgJ2CP5dW0moeg+nHukL5uvos
	yFfDCgXeGj6gANKlgqE8lHfRYFrPWSWfZKmeFwP9f8TvNPCulQlFJ/TTdm4rcM5qtgUI
	lLGA==
MIME-Version: 1.0
X-Received: by 10.140.202.4 with SMTP id x4mr21441541qha.27.1431443714841;
	Tue, 12 May 2015 08:15:14 -0700 (PDT)
Received: by 10.96.203.231 with HTTP; Tue, 12 May 2015 08:15:14 -0700 (PDT)
In-Reply-To: <CAP9ODKocHho1K+zDbnEVsM5Lq_wFhJD59cD6o0c2R_99oZrmjQ@mail.gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
	<CAP9ODKocHho1K+zDbnEVsM5Lq_wFhJD59cD6o0c2R_99oZrmjQ@mail.gmail.com>
Date: Tue, 12 May 2015 09:15:14 -0600
Message-ID: <CACS+7ZRfedi6ZQwVP8MMa1WeymJ4Df6kQ6V9Lvow1qWZN+ynFw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Schmitt <richard.schmitt@freescale.com>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Tue, 12 May 2015 15:15:17 -0000
Content-Type: text/plain; charset=UTF-8

On 12 May 2015 at 08:57, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Tue, May 12, 2015 at 4:06 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sun, 2015-05-10 at 23:03 +0100, Richard Purdie wrote:
> ...
>> Otavio: Could you see what our options are with meta-fsl-ppc and
>> metafsl-arm?
>
> Yes. I foresee some challenges especially the old kernels.
>
> fsl-arm has 2.6.35 for some platforms and fsl-ppc has 3.12.
>
> I am adding FSL people to also take a look on these failures.

I found one simple hack is to set the C standard to gnu89 for kernel
builds. I just added

KERNEL_CC_append = " -std=gnu89"

to my local.conf and my wandboard kernel built and booted. Haven't
tried the PPC kernels yet, though.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

