Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFEA7DFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 16:00:23 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id g71so21143150ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U5RkrYf3tiQatIUo3XN32r7or/7iH4X80pI4Y28fWZk=;
	b=Hbl/H+OwyQ1SB5ewkfPwhZ3go3TFiwOhtRMjuNrnTsj/y14fBDLFwsRlW1uE1kZ4LN
	OXrqi3BecyQxPTjvVtcJsKNCZaibxELVRo9nIYsxSvrHbbDsXpeMSx4kbTn/O6ERj5/M
	zy+vU5JMc7dmRWaUELmfT0SipZHOESaBV4JndNScZkf8hjDKM8wHi8NgD0fxR/tC9mkN
	hOFrM4vT5novKa8HhDm6omcKX51LJinPKcMClTylO/W3eell+HqzEJ4SM0XfPoZsbADa
	TNKyPS58bADsd3nozPq+FOa5h0dWWhxSI9R/5dozRyb1eXI1jrHm+3JYw2JecDjw5fia
	Fibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U5RkrYf3tiQatIUo3XN32r7or/7iH4X80pI4Y28fWZk=;
	b=tBp5G0/0vDXaxt/Pc7wDuQIdMmtguowc4AZQu8hcrvCgNm2qCdFvrpP/nJ1QtMkrT+
	ifg5LiEc6+0QfbkJis/4zI+B7DkUvuLIfURZtJI4u0hx3vXQMgeUNXqlBM7QUZO8u/cg
	Z1htvecYh3Q9inRfUG+okbTRlHrE0+YR90NpiQRdgiiC9svoOAJe90/gb7R78iRNb1/u
	Uwt2XkBGkEKVc0d3XoJ2XEHzleEd8k4JOycZ6cMXfsV/GGfQ7fvi/nGMmjTh4p23DuMV
	iO2mKbhTcwI2Nf8XqTIlq/yMyb2trT0ZXceySL3IcBjptffYbtgjSQKeiUQQZOFSkJLd
	OOUQ==
X-Gm-Message-State: APjAAAURo4Op6bquyaBFqSGz+6Ae+IVfCOYZ1vr6jgtG6mtVjbFRcued
	eM+IKdSxXKexVBJ8QWw2A4Ew5WTERVzjidcz2UJMAA==
X-Google-Smtp-Source: APXvYqxyq1V7A+d8YpXtINDh4zvmgP31CQnMyJOoC8UVin1RH3J7LdnLM3QTr6qx427b8WIL5Uxq12aXAdtpUovx0s0=
X-Received: by 2002:a02:a812:: with SMTP id f18mr19860795jaj.31.1557763224463; 
	Mon, 13 May 2019 09:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
In-Reply-To: <CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 09:00:13 -0700
Message-ID: <CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 16:00:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 08:55, Khem Raj <raj.khem@gmail.com> wrote:
> While I like this change I also worry if we are leaving out any significant x86 implementation out there in embedded space x86-64 is relatively newer compared to 32 bit which was long stable

core2duo isn't exactly a modern chipset though, first released in
2006.  Does anyone *know* of any significant 32-bit x86 deployments
which are using significantly older hardware?

Ross

