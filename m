Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2806F8B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:45:40 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id y1so3099162lam.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1FHwP40pGgQ3xXssP/bgQgfQWTieTtKIAdDbC6dgM68=;
	b=VBM7wkt/MBKjWpIGVPWmtLrr5cl5XNCaK1ym1thiHDsVwYcL9Gci3YcpRh4rEkVLQl
	JuW83ffcB05rGy99B050bKbTioqUaZbyYFY/pgxKlMqiGM24/EGnooTHr+6iMgwyfRi5
	1B+nN3w1x5UvEWwfGCpXCeFaVV70U55A2zua5Ttwr6lmeJume8Z3B4CYAKGjWn01MkkR
	YdrWxa/C607VwKhiH7QCpXi8oaF3UkPotwJZxUcXAFFCal8aEJtHrnYMaHlPnso98asZ
	itGaXvwDgMFwcu0GKaTpxpdWmrDdneUim46bHGrbj8q3+j4Ifw1CAwAHGz6EOuCPGNIM
	klXg==
X-Gm-Message-State: ALoCoQmO9yHCRxBR6cT5i0Z6q14/1kee7Xho73FmS3Tv8fIqW2IBT1BqiCsHOmDOfqSfgbZiamtT
MIME-Version: 1.0
X-Received: by 10.112.143.99 with SMTP id sd3mr2218387lbb.11.1395953140520;
	Thu, 27 Mar 2014 13:45:40 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Thu, 27 Mar 2014 13:45:40 -0700 (PDT)
In-Reply-To: <CAMKF1sougoA=ioTvWBiC+b1pOs+sf=dRu3OYTc92CMVwvnpUhA@mail.gmail.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
	<CAMKF1sougoA=ioTvWBiC+b1pOs+sf=dRu3OYTc92CMVwvnpUhA@mail.gmail.com>
Date: Thu, 27 Mar 2014 22:45:40 +0200
Message-ID: <CAGNsrLCgk_6xphvh4oqFJJ2fZFLjnOp3Z0M76Ps5VgevQx7Sew@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gummiboot: add COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 27 Mar 2014 20:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 March 2014 18:08, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Mar 27, 2014 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The gummiboot depends on gnu-efi which had set:
>>
>> COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>>
>> We also need set this for gummiboot, otherwise there would be build
>> failures for other non-x86 archs.
>
> isn't gnu-efi supported on arm too now ?

on ARM, Tianocore EDK II is used with GRUB for the boot manager.
I haven't heard about using EDK II with gummiboot... yet.

