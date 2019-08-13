Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 822527E830
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 15:35:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t12so18176150qtp.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uANeS1i57iKNm8LrdN3QNYNy7slEKAly1RPfM/7EbJM=;
	b=An6mxLujN2RStU9E6nXdL5+NlBJe/RqCW2QGInqodvpNblWG8TrM6ionLInXzBAxSa
	GlCZZV+2Xslyqn3c1aNS72ItYnkrXxCcBBSml2yxA7lg6E+xeMOtNt8YKJq3lrJqdp9H
	4WoBneMvsK92+QUDlwWkhgmZ0EYmAklCKjAQcQBNicIbsLr1NCtMcMhbrKMpICrDsdJp
	reNPctzBQ0dt6rK/UvLXAaebxVDQuU0pIygK9ZljF68Nr7GrWh0b4hoNA+rbFs6nIvwB
	g3SoXwhXNUAtvGCbc+purfzRTXLOEZKLeKAcNLYlcRDj9QTJv5QdkFH/+C8xAaIl/mip
	6gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uANeS1i57iKNm8LrdN3QNYNy7slEKAly1RPfM/7EbJM=;
	b=N9Sbk4IW/T5ty1710YH/YWIxR77NBEV1G8AuVIc5Kt0HHYtzPdDa06YSmVEkWnEPdD
	IphqYge8cBK6Xs3xuE1JZF1OkZSrUUlu0JLSnvr8XGL5v45P+y46V4Hz5w36W0euvqYA
	uuvftEVv3OQzW53ACVdhHe6G+GPw6EysfPVpFf1YqftZz1a2JmtxygSoZrdAjBBrxQCn
	fdoM+MdG58u2n9HORP5EtnLaUYtD94oRTRL4rIwmxUTuD4a86ins9EOM2dF/fD3MPfvN
	OAPiCrMdXRp+bAJG+NEd0tHSogVWbzZpZl3rysunhdwBbC2SCCkBr7iWCJniN6Dp3Gt+
	lofQ==
X-Gm-Message-State: APjAAAV565/tQGcTyoSoTdZ+5i+kiHWxB1vfK6FoBlXhgOMQ5SPnvVm0
	eflOp8iOmO1ljOAPIxBG2M3nXSGyFubO9YA8Vco=
X-Google-Smtp-Source: APXvYqz+19645zzbdQhuVKc1N9W4wyhG4yvM7p8F+JjtrNj3g9vxezF2hHWBCSyVjjNKxM5EGijUMMOhlUh1RHkTPO4=
X-Received: by 2002:a0c:c548:: with SMTP id y8mr5979038qvi.68.1565710555062;
	Tue, 13 Aug 2019 08:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
	<20190812134903.55045-2-alex.kanavin@gmail.com>
	<72c38e8826111b832afe9df09ab350b099918f8b.camel@linuxfoundation.org>
	<CANNYZj96rpe3di1jNa9d9N79YWE0Ax8_=wcG1kK5Z87H+dDOiA@mail.gmail.com>
	<ea008eaf-88a9-5551-7e57-fe45973ac6cc@linuxfoundation.org>
In-Reply-To: <ea008eaf-88a9-5551-7e57-fe45973ac6cc@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 08:35:28 -0700
Message-ID: <CAMKF1sp7BmgtiMpRBLiFDorbmQePhK2eyH35wreprETK+kPPtg@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Tue, 13 Aug 2019 15:35:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 8:34 AM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
>
> On 8/13/19 2:54 AM, Alexander Kanavin wrote:
>
> On Tue, 13 Aug 2019 at 10:34, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>>
>> This doesn't build on opensuse 42.3:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/907
>>
>> Its numpy-native and looks like it might be the old compiler :(
>
>
> That version of opensuse went end-of-life about a month ago. We can hold this off until the autobuilder is upgraded.
>
> Alex
>
> I'm ready to drop this worker at any time. opensuse-42.3 is still a SANITY_TESTED_DISTRO. Is it fine to go ahead and remove this?
>

sure, also a patch to drop it from SANITY_TESTED_DISTRO before disconnecting it

> --
> Michael Halstead
> Linux Foundation / SysAdmin
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

