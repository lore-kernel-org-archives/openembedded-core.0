Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E405673219
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:29:34 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id z14so63010560igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D2GS8Lc6J5FDgZ0z7Z10yui12uBftsUVjGKXaP8dvyQ=;
	b=L3banL9pNCupeTuyvnHPFYhpG76Rc3AE6+pj4ThbdxHWKr7K8TlGQ69fqR0FEkNzXL
	XQaYWUCyaVsTAwSQ3nNJwWxf/cqlRCWH92gyZ4eO2NrI45Q8Qv6X0SIFDUYg9QqtwZL0
	CUGgN5ScEsKlU3Vx17Rx/Zy48Ox4F8E7274fWkygGEzgMbtMnnx6sReA1o04d7V1Cn1F
	FgQLEs94Qo2jdiveFaBIC1MzIkjZec7eTn2xweMLunScZVNskT5I6CUqWAv2T7tzhSkI
	NloFjp+VhDh1+OzdTzxZGh1OD2NGGRmve9p/QWp6wgg33WrrqArvsBYxv3iyBCtM3Prw
	Z1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D2GS8Lc6J5FDgZ0z7Z10yui12uBftsUVjGKXaP8dvyQ=;
	b=f6gvdUrx+4Z4moopDR22VoSDbXZ3dzKE4QmDKAsSQxgvvfiDqD7Pc/IN7JsvOtT2a5
	HNhKDnQKcq7U/fQP9Mxz2QN8NU9se7KZistpgUGG1SzF6TIgEwp+xyD9nE7B/EZk7sAm
	ebTzonnw55Xrj5jgFBNXzc1f+5OG0dNL7POF0CSiQlx3DSxNNa1rHnyJvhx7XhWFO4EF
	b2q93woL+ec48Q+vPOmJWVkwhoIVqoZ2blmC7cHJm1s6LNw12SxDcWv/nT3m171zaOb7
	3EJNhH6JN7QCVEnneKyvCw2M3tXx5VZx5uW9O78pVDGi3rEOWz9WIbGfPDuFCnggmMoI
	2rQA==
X-Gm-Message-State: ALoCoQnUrS/EYP1thTUXWUNNYggnbJYhK/jmgHDrV7K7zzPBPqDRzs4+xoXE4GxCzUmNLRE7dMCjOqUvSKDQfOpTF2lMiEF607J3y0sS27S89B5FtQUQhwM=
X-Received: by 10.50.13.100 with SMTP id g4mr329289igc.64.1452277774867; Fri,
	08 Jan 2016 10:29:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 10:29:15 -0800 (PST)
In-Reply-To: <CAMKF1so8xuy9Q8YjRynpgV68cjt-9KHae4TBTjKvn5EU0UzD+g@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAMKF1so8xuy9Q8YjRynpgV68cjt-9KHae4TBTjKvn5EU0UzD+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 18:29:15 +0000
Message-ID: <CAJTo0LZ=wzVPAi3OuScYX7kmJNXhsLif+FCUfjm9ZdyogZm-Ng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 18:29:35 -0000
Content-Type: multipart/alternative; boundary=089e013c6614e2f6ee0528d6c4cb

--089e013c6614e2f6ee0528d6c4cb
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:

> systemd does not work with musl. I have patches in my tree to fix the
> build but then it does not run :(. musl and systemd has different
>

I wonder if we can/should raise a SkipPackage for systemd if musl is
enabled?

Ross

--089e013c6614e2f6ee0528d6c4cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 17:43, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":4uz" class=3D"a3s" styl=
e=3D"overflow:hidden">systemd does not work with musl. I have patches in my=
 tree to fix the<br>
build but then it does not run :(. musl and systemd has different<br></div>=
</blockquote></div><br>I wonder if we can/should raise a SkipPackage for sy=
stemd if musl is enabled?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--089e013c6614e2f6ee0528d6c4cb--
