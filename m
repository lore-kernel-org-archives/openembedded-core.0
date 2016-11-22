Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id A8D82719BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:44:36 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w33so7937729qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nmJNxTtu9pbBRTKdLFi4i8SYzUWkTNU+LBUIo0/gGNs=;
	b=x/ZPmSLyOTWcWLXaWoBVZlPXFxV6d95HtlLq8/j6bs7sIQhxwHB/UXrdp8neM5qR/p
	5axUoZsu4kRKD8zO56Dm3+on5xMISHv8mp7DTqI7xF4849sWCjLwbayMTXLmbpEwXOTX
	wyhD8H6/3LCtoh+js7UTEd0aa4Jfs56Me1h3+JGC3ZFfM5wXxkIo7jfrAUqo2l3Aca6c
	Dpd3KCGla868quVJKtdt4WJsPjO8xL+3gyC7845sZeaYidFoN4+eAYuR/uAacRs7eyRj
	MyJlvSoOugnZNyQGNJ5vPFPjoYumWnwBowo5rSHrm1FZUdUk0fzdC0F6J1uE6MR/IhPu
	mBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nmJNxTtu9pbBRTKdLFi4i8SYzUWkTNU+LBUIo0/gGNs=;
	b=YZ5R7E/3rgjN1EFiAUlj7XShCUQX54F8F8CEOnuofipop6QkX+qhMkfEKhNIqzeFFY
	gbL7PIEgjw8JCmfYMKbE6+He3rbqRKgYkrRgV3TI0qUms5v9shfDKXr9RrWjJ0sfJYjQ
	rIGTAi8K28xxb5NLvJwnsb1jc5c6M2xSjW9xSXBz6YAv36X4ycvqAd8sCTqhCArcadki
	nTV30nxyBGVT2FDJTaUDRdBmnuOhJeLm7ffEc1j6e/DvcxC69L9cUyWsa8Pt9O6f29Kq
	P7osUh4jfhPnEx0KpkD+tf9l9mzCNpTwPob1+e0HJ3kjRZGOyUaaI3CqpgKpBY4GWRBP
	pDuA==
X-Gm-Message-State: AKaTC033bwUYzI2RbMR5awRauKi5871S67MezGOoO1RJliVMiWYhnZ/AMnxHnXl+PbT6/UN65ktPGK0c6+FtecKr
X-Received: by 10.237.34.46 with SMTP id n43mr12165127qtc.105.1479811478242;
	Tue, 22 Nov 2016 02:44:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 02:44:17 -0800 (PST)
In-Reply-To: <eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<20161116174748.26994-2-raj.khem@gmail.com>
	<CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
	<eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 10:44:17 +0000
Message-ID: <CAJTo0Lb7jorMUq-8D-tkBTK0bP45AOtP_tBS2PTGGxPrUWbc8g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Tue, 22 Nov 2016 10:44:37 -0000
Content-Type: multipart/alternative; boundary=001a11377e187f3a200541e1759b

--001a11377e187f3a200541e1759b
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 03:46, Khem Raj <raj.khem@gmail.com> wrote:

> its a build time dependency. Do we have a usecase/images where taglib is
> used
> and boost is just pulled into build because of taglib ?
>

No but I've an example where boost doesnt build at all and this breaks
core-image-sato (IA x32)...

Building all of boost just for a macro seems rather unfortunate.

Ross

--001a11377e187f3a200541e1759b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 03:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2gk" class=3D"a3s aXj=
CH m1588a246718df4be">its a build time dependency. Do we have a usecase/ima=
ges where taglib is used<br>
and boost is just pulled into build because of taglib ?<br></div></blockquo=
te></div><br>No but I&#39;ve an example where boost doesnt build at all and=
 this breaks core-image-sato (IA x32)...</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Building all of boost just for a macro s=
eems rather unfortunate.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a11377e187f3a200541e1759b--
