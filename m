Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 542DC60069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 16:52:30 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id x190so26136617qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+OiheBD+Xc/OIDzG4kw7uW4Cp5xSkqnYR/PUYjRtnps=;
	b=eaQ3rJ1ExIvFl6JgZRGftLnqJFpDn+GQKV6u7K4hQsIghbwfU7R9Gjvhcgf1SswI9A
	L4/QPBPr2lxraOl3bMqmBxDBA9QqA89rgqqccGFZs662B4fgkz6cPFhRK1iG1Y1BaslR
	OLTW0ViyyOXEWXfo8QKDGZcIR5MzUt6KVlWHxILwRAAwgdXI427juJ0hPAnUnX1MgVeF
	sOTwCObD7xX6qGH2TmX0FjU7+WuOY0TbHTsf/9FB7AJwHu7OPcNIrnICIsgQxjFbjyYE
	0iRyff5KVD4Ckl9iEikpxbZITbG56M9Yr+ehQvcnPkrCVYeD1J+1HiwLnSdKyn5RR/CH
	mBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+OiheBD+Xc/OIDzG4kw7uW4Cp5xSkqnYR/PUYjRtnps=;
	b=ZBQw/UQnUVonN3EcUbyCnLUvE7Xr+1KTjo9DIzz+ehNyXYkpKIvF55eEJTHhzJgeb8
	hduEwcTuMEPrbw00mm2NzqjIGzF8XBM/7S7gBIRKchfqaLSZb/SfU70DSMGEPqhRbooZ
	mwjYzxrZw2s+BSKMvaWhmTApPPA8bRCUncDy0ObOO9bg/wVUGwnqjQWjpAVv2ZluJYc8
	0TLWAoFcOJbzxVdyiXSfjZc5pnig/vVepQely4MaDHwUeHZ9DPzWdkuI/PVtZaU55faR
	G68SRJAoqt5D7PpZhxTIN4ErqlN2HounJQ9i8AG/LnzloYke119k/3ZhvgvFuiYMcdcc
	4qhQ==
X-Gm-Message-State: ABUngvfGIc226opENpL0oedAzA8gRl7VhFrfXehGbjwJAeiDWOlHYEqfAvQTHJXrsCWfdprrQA/YgjWNRHwd2woX
X-Received: by 10.55.106.134 with SMTP id f128mr4640638qkc.121.1478883152106; 
	Fri, 11 Nov 2016 08:52:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 08:52:11 -0800 (PST)
In-Reply-To: <CAMKF1sou_spk+SLREA6v8TBynki-2Au+x+sNXM0cMniJYpOA9w@mail.gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
	<CAMKF1sou_spk+SLREA6v8TBynki-2Au+x+sNXM0cMniJYpOA9w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 16:52:11 +0000
Message-ID: <CAJTo0LZ9XW9JgphfqRJoGgGG3g5Rn3xrsL2OBtfayeGiWybR6A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 16:52:34 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6f236fe05410950e1

--001a114fddf6f236fe05410950e1
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 16:02, Khem Raj <raj.khem@gmail.com> wrote:

> Nothing thats enabled in OE-Core depends on go yet, however, thats not
> always the reason
> for something to be in OE-Core, if you look out, you will see there is
> no single layer for golang ( I see atleast 5 )
> support, each one of them is done differently, some are better than
> others depending upon what you need,
> This causes a lot of confusion for users who have golang needs.
>  golang is a fast growing language being adopted in verticals where OE is
> used,
> This would offer a consolidated place for golang in OE ecosystem.
>

I'm not a massive fan of throwing everything into oe-core, attempting to
stop the proliferation of go layers and having everyone agree that a single
layer hosted at git.yp or whatever is canonical (even if they decide to
copy and paste from it, meta-virtualisation I'm looking at you...) seems
more logical.

Ross

--001a114fddf6f236fe05410950e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 16:02, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":mg" class=3D"a3s aXjC=
H m158543a73aeac59d">Nothing thats enabled in OE-Core depends on go yet, ho=
wever, thats not<br>
always the reason<br>
for something to be in OE-Core, if you look out, you will see there is<br>
no single layer for golang ( I see atleast 5 )<br>
support, each one of them is done differently, some are better than<br>
others depending upon what you need,<br>
This causes a lot of confusion for users who have golang needs.<br>
=C2=A0golang is a fast growing language being adopted in verticals where OE=
 is used,<br>
This would offer a consolidated place for golang in OE ecosystem.</div></bl=
ockquote></div><br>I&#39;m not a massive fan of throwing everything into oe=
-core, attempting to stop the proliferation of go layers and having everyon=
e agree that a single layer hosted at git.yp or whatever is canonical (even=
 if they decide to copy and paste from it, meta-virtualisation I&#39;m look=
ing at you...) seems more logical.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114fddf6f236fe05410950e1--
