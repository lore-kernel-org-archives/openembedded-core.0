Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01D2476536
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:06:07 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id xm6so5248047pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jb8HFuNlTl23ss9j67Cq/mVZ2PjF1dAkYThEi1aIDFY=;
	b=vC7En8kAbqbzV/JdWmFTfAoOILVgTsBMMawyVJ25V+/u3Z+6/cRFjiWihAIWfyNs8I
	kkpSc1ydMcM728NkyevahDgCJr7WoZf/d2oO9o6mWFuLr3rAJPSrNgEBEN/XWS52AcWQ
	VXq6g/XGZ+ewnO1SV1XHn6yPvGPSee/2QIoPBkvxZZ7ZUOSGbDF4hKmoAfZmjoeczp4o
	pUmWrB+Jr+PbsH1bJQ/x6GMsm74zY6kTE1GL1iNiRhAuTAG0cVO42mBXkN4JccfOYtJr
	THWp64IHOFWm2u8S0mF2kgv/uae94MkbdzoYO4V4Xlds1uDRxZZtlM3IAHV4ZhXQrH+g
	LyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jb8HFuNlTl23ss9j67Cq/mVZ2PjF1dAkYThEi1aIDFY=;
	b=gRI7GffNgHN3OO/EZckL6bCdMcvH0Cka9TqtTb4FODiorKEV/euRbZbZxwbTAQpiQA
	Qj9tajuhoPjfHu6eyfnMXrpF9J4wRmPU5mVCC0Z+c/MCqm9z4MAGjBHidleIfMSXLtEf
	v7c9Vmew6hgJMjAkWvqsVj3YUdOfSokvutWcZJwJJwaeVDFiZBCB/gdIVmFCrZbaOP3P
	PJbGTA+g9c/lOP2ITLpK3jVpgLUmBgxrhTDfEZJtvFhHKRG7ia0iqRQflbmJdoRA3Eyk
	FdOPC121ocMf27BMHvB3yejmQvKL0zRD9FJ63TTFw7km2wDmrAGrF+JpKl8f6gxvIHSI
	/c2g==
X-Gm-Message-State: AOPr4FUbon/tBylysoa23Vwp5tHihBGyoXFf63uVo/zwJHtOGEPzafLEH8QT7zyhnWdk7w==
X-Received: by 10.66.7.69 with SMTP id h5mr12233921paa.11.1463587568358;
	Wed, 18 May 2016 09:06:08 -0700 (PDT)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	vg9sm13348913pab.35.2016.05.18.09.06.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:06:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f173.google.com with SMTP id y69so19885202pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:06:06 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.40.138 with SMTP id o132mr12319461pfo.98.1463587566258;
	Wed, 18 May 2016 09:06:06 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Wed, 18 May 2016 09:06:06 -0700 (PDT)
In-Reply-To: <CAJTo0LZv_VVm8dnS_nMcPSRJJS8z1t9C4daGnC5=OA3Y9UmqDw@mail.gmail.com>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
	<1463502985-5428-5-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZv_VVm8dnS_nMcPSRJJS8z1t9C4daGnC5=OA3Y9UmqDw@mail.gmail.com>
Date: Wed, 18 May 2016 13:06:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKok1hot=zC8KMm2fYqNFvVkcMqq8Vy7casfZfxkA1-dwA@mail.gmail.com>
Message-ID: <CAP9ODKok1hot=zC8KMm2fYqNFvVkcMqq8Vy7casfZfxkA1-dwA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: meta-freescale Mailing List <meta-freescale@yoctoproject.org>,
	Prabhu Sundararaj <prabhu.sundararaj@nxp.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-freescale] [oe-core PATCH v7 04/13] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Wed, 18 May 2016 16:06:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 1:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 May 2016 at 17:36, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> When the DISTRO has X11 and Wayland support enabled, XWayland ought to
>> be enabled by default.
>
>
> Can this also split xwayland into a separate package so its still possible
> to build a core-image-weston with the x11 DISTRO_FEATURE but without pulling
> in all the X libraries?

Sure; I can work on that.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

