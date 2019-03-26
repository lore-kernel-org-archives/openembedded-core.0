Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 943836BC19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 10:01:02 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u12so10204563iop.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n64CuiLgNJahvSR7dJx1RvZXalBtC5cnrxZeA0tQD3E=;
	b=TejHq2LsnpyXvCxhA7BHp2mOcO08VPo1AP/hfkB6kwszDaFB5GjphWL8hYTMIskzq3
	+2HP7QIm3G86WR3qBZ/kZRz26s1TeUIscvoF7hN7XPR4MiatL5slS040ye5hOfuh9TuK
	rwEwVc6yVSQwzp+1sQXdPHQy4xpDFD+vglzzLKpjG0NtRPObb3uC1MUZ5KkEh1P/vKMA
	slNVwvKqGn6NolQVr3/GyAWYGuwfOF99SdsHkkRpeRD/Yx+6zBCQngiGE0z04954z3os
	+tMP1BOrKJTRejiSXjHnGjk7IJ0hVKtJErX9S8jIzY2GBbfFsv6M+fes9LRVlyVZ0CWt
	wwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n64CuiLgNJahvSR7dJx1RvZXalBtC5cnrxZeA0tQD3E=;
	b=HJ55k45ok2lYC2W7nNNQjuEFuJr73c1Ta2kQ4/nwx8sioq6hE4iGps171mtqSodbTm
	2N7thF19Q+Uw6kIgt5RVIAs/nhAvnXMXp9Qg7pvojzS3ni6C7eV08Fm+seMg09aNm2Pj
	KFW9RjTnV7+YH19szpsy79PBznh5kKmSOWmEox9byrEwcHR9MmR+i0jVcUxskiELMHYk
	QJ9MhqOI5OXRqSl2f6KbXIB08cvTtAiEw6FBvL0NMKb5wEnYusaD0dltmdjT1Wxj0g1t
	hhsR+gm28h2OpRAd4rrIJAbStROriPYNsV0k1t9Tu4g66KPMUahgZnANdiM/vbHwq1S0
	CNcQ==
X-Gm-Message-State: APjAAAWNW7vbQe4WOKJ4xrpqM6E5pT0ZeIdifAHDwJ4co2x61l/jROHf
	eTeYbzKJ/tN8oPGs+pdAu1d9mZ2xFoDy95Px0s6KDA==
X-Google-Smtp-Source: APXvYqxPpn28b4HMkW5MLzQquD/WGRyKa2u2DVWra+psWdGzZVtZ0FCc/1S0pndScU737QnGNNa6MsJuHtyN2mj97lk=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr19905305ion.20.1553594463552; 
	Tue, 26 Mar 2019 03:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
In-Reply-To: <CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2019 10:00:52 +0000
Message-ID: <CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 10:01:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2019 at 01:39, Khem Raj <raj.khem@gmail.com> wrote:
> > This isn't a git snapshot recipe but a release that is fetched over it.  For
> > clarity, put the PV in the filename.
>
> I think its better to keep it as it is. since its easy to trace git log history.

So should I be renaming gcc-8.3.bb to gcc_http.bb?  If the argument is
that the filename should contain the transport protocol and PV is
embedded in the recipe so that git log is easier, we should be
applying that rule consistently.

Ross

