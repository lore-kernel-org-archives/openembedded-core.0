Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B68A171ABF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 13:32:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u23so5151888wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9cBP6StjN/3WTralwktD4IEXWhhCu61EPjNhFYeT9E=;
	b=YMbhf1LuHyaoHmD8lQm2ijJ6fqfe3sQhap25FY4NkXCELrNS9dJDoZzFM6lxpjaV8z
	gotMnuDsHAdETndd1JGQm4wvNa00RgHMOn0pBY4n1vzDpJukhxWr2vfpQKibuOjx+yFI
	EWDUi68PvZ6gAH71HD4YpMeW9nkISCp72TNdvtC3U2Uw8QvfE13j6M+PRxGC2azCI+CJ
	J7e3wVZEp3LYEQ/Ykhk+WdeviACX3wpjmpuUQZ6xUTFEdzFvLrSZw9jawegGXOnGYwua
	efbFf9fnliEMvfpp20Oo172Zr3SSIZNJFUWdtHyAA2ymF+xs5sGQ7EfSe3yLOzZjdsue
	HP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9cBP6StjN/3WTralwktD4IEXWhhCu61EPjNhFYeT9E=;
	b=bd4DWc0XuGFxR3jrPzyb40IVmjNYsmCknzaL9lA4YYBbaUR1ghhmtLfY3571IVY856
	QL6CdQKbeAHrHTgTpXkzBO17AVPK5+yevyFTQDvXMcOoFG8ZjsWZ7u/o/mzOppR6YG7J
	bsvaj9CNYXvwdfn2kHqVlRRlMvqCQtPzcOKiQIKy0plLB/MxYSJ4uEed0stsvJcngSAV
	AEFqfCYUlQaFkGt05dqUzBEDETIjaxUI1W047tsRDEloM42qW9z0kgkdmqCM68ionM5E
	s83d5dB3hi60oXAUHDEZ1RR+/DqfsDOhRv5V11mmH8MnCA+7Te1Kl9eL4F7gqU/8qIpI
	TEfg==
X-Gm-Message-State: AIVw110/h+HTXjFa1olOw0L+qp3woolPTwr0arI8HEZhGI96SvvQDJab
	zeFYqIEo3FQk7tnG7b/3CVHtQ7MKqw==
X-Received: by 10.80.164.185 with SMTP id w54mr3038769edb.76.1499952775186;
	Thu, 13 Jul 2017 06:32:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Thu, 13 Jul 2017 06:32:24 -0700 (PDT)
In-Reply-To: <d0951f29-90f0-e982-0c94-2045af7211c3@windriver.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LZ75z8kjoBKLGKhF6dOpSDQFmRx=pepc_uPZ87QCVSwoQ@mail.gmail.com>
	<CAJTo0LZJ89-Zdp6=YkRXwtvFvNx25MbGxBHir-GcdTnWHx5EaQ@mail.gmail.com>
	<d0951f29-90f0-e982-0c94-2045af7211c3@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jul 2017 06:32:24 -0700
Message-ID: <CAMKF1srL1qxLZZn3XJxfmT6FkhJZHBSE=Tf0qmrDTfN3Cf_2AA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libbsd: 0.8.3 -> 0.8.5
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
X-List-Received-Date: Thu, 13 Jul 2017 13:32:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 13, 2017 at 4:10 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 07/13/2017 05:45 PM, Burton, Ross wrote:
>>
>>
>> On 13 July 2017 at 10:40, Burton, Ross <ross.burton@intel.com
>> <mailto:ross.burton@intel.com>> wrote:
>>
>>     Determining if any of those can be applied always would be good.
>>
>>
>> FWIW it looks like the __BEGIN_DECLS patch still isn't upstream, but the
>> other
>> two may have been resolved.
>
>
> Sorry, fixed it in the repo, I update 0002-Remove-funopen.patch, and drop
> 0003-Fix-build-breaks-due-to-missing-a.out.h.patch since the a.out code is
> gone in the source, so I think that the patch is not needed any more. Add
> Khem who is the author in the CC list.
>

if a.out.h is removed then we should be ok

> Tested build on qemux86-64 and qemuarm.
>
>
> Repo:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/PU
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU
>
> Robert Yang (6):
>   automake: 1.15 -> 1.15.1
>   cryptodev: 1.8 -> 1.9
>   debianutils: 4.8.1 -> 4.8.1.1
>   git: 2.11.1 -> 2.13.2
>   gnu-efi: 3.0.5 -> 3.0.6
>   libbsd: 0.8.3 -> 0.8.5
>
> // Robert
>
>>
>> Ross
>>
>

