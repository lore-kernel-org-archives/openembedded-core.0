Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 284596080F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:02:00 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z8so17005946ige.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8+WmruQhmtEgZcSOAViLYrgdZDGdKWx9Igk4MRCy9w0=;
	b=erJe9DJVBwyL38bijrC/2IqE+HbHggGBk+vd6HvrJ321i+jlyYxOSkG9qCmNxkAQQr
	l0uDna4kfAaS165RpnAaZJtD+HAqokQIDdJVfwLN/etCKb25FzaOcsox6LfXdE0sY7gw
	p+J55CcnWWpI6x/1V6mJ8RaW+tYiXbHrVWJCaL77G4vas9Tg8HHLTaj1Pwp8nCycC2iC
	Q3Ds/OaCvCtjlo1StRuXNbwYGIvRV4ucZ7ZLY8pZRFJV+jl5jJObYV1kpQItgKC9vW8D
	n5/flywTWCsNRrJdsPeau2GoN0V95AB9hWtz+WdpYn7FNiWqFAIDgYG0ohodGDAEV30b
	7xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8+WmruQhmtEgZcSOAViLYrgdZDGdKWx9Igk4MRCy9w0=;
	b=dyC9C9A8NjizZc1hpMlPkyZ4X4p0ilZ6nCvH7AwdtdV4+BoouFkT6+yuu+M76Mdgfq
	s+krPZJiyXd2cRm4K3jj1aOQJa/ENrlefRhuvGEa0vdufIsYWlKrJIpLMEoa1jgU98zA
	oykqEG6PC6hDkgvSRlieMD/5QGYIP98nGiDfYfM57NdolUn3OgZeHr5XsNoSoeG2iCcK
	pl5PbIyqL+ZaPD7TbD55BdYklvFxH2AoX7VekGIHneq650TkCehMc3A3Q1EaXWlWTFgm
	emYkz58S35GZx4jETR6AHRMVnz2DbxdCDiRm7FKvZbStAHUcc8yC8vHtEMm9RyCWgzam
	jPEw==
X-Gm-Message-State: AD7BkJKXNkd27GdB+olNgo8eQ37zGKlPaS9KmOC5qSIbsM3XOU2yZ7nI52ZNFphMsCxYih8FO1hx6eUNaCaOH7KS
X-Received: by 10.50.126.8 with SMTP id mu8mr4761256igb.52.1457100120931; Fri,
	04 Mar 2016 06:02:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 06:01:41 -0800 (PST)
In-Reply-To: <20160304140212.GD2557@jama>
References: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
	<20160304140212.GD2557@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Mar 2016 14:01:41 +0000
Message-ID: <CAJTo0LbSj6gZRtzQBun0+bfzY2tkQHAY82foU7suGVQ-0eN6CQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: fix builds with internal readline and no static libraries
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
X-List-Received-Date: Fri, 04 Mar 2016 14:02:02 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf1c9cfe052d398fc6

--047d7b1635bf1c9cfe052d398fc6
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 14:02, Martin Jansa <martin.jansa@gmail.com> wrote:

> Somehow this caused hardfloat builds to fail
>

Can you verify that removing --disable-static from gdb fixes this?

Ross

--047d7b1635bf1c9cfe052d398fc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 14:02, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":16t" class=3D=
"a3s" style=3D"overflow:hidden">Somehow this caused hardfloat builds to fai=
l<br></div></blockquote></div><br>Can you verify that removing --disable-st=
atic from gdb fixes this?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--047d7b1635bf1c9cfe052d398fc6--
