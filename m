Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2047738A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:26:52 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hb3so14574579igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/YJF1trFyJlGZ4ztyG/+YaXgVx2smVjWgGKhiW8w0h0=;
	b=iBZDtTkMfPMJSWTfCj75callXZsoc8C/7BDvfN1Oj191qQ8jZN8rfL9p1PfobVWB/1
	jywUqL97+orThjY26I/4mnXxlTSuNA1oY5jIuDhT7MXB3a0p1rW3StYvuqn7lZGkv3UW
	EPE20+JbE9GP+FT9RxS1/3OH7X9cwyk91yu4cyZR/yjZh/mUZoM10+Hp3tkMbSxc2sgE
	YRR8eUbDt56PxTxe3TPHBMCpGQ7Qq3uB34YLe3EW7MFU1RdYEcncxrrTA0b5Y+u9D+Cf
	xPQXDfBTDFmjUjTys3Qd2KsC340HgCKZc7MxxTf1dGRAsoDIWl9c8b9vabgJIP24ukaF
	r5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/YJF1trFyJlGZ4ztyG/+YaXgVx2smVjWgGKhiW8w0h0=;
	b=f6Y9aq8thaWaPNu5xQjnV5bsixuzrVSnuemCb+OGd9fbA0klccaAilDaTPchiFixmc
	QI/NfMW9c6RBqcKwfNMrN1a9iF+v9zDkO8agBipEmf/RXLgFgTxzYLQwl+tcxwGMc/7F
	xocbGAQbEO8aHXxPmhdEP8BE2RGUEG4gN0+Cocd0qZV1+dngVAQON3sKzg4zSGbkvzlW
	6OM8cxzKuiPDAWT6/iDosGUhjUcYOKHWLVD+J08oU0uCb+Ttxhi52qk0tsLWJyB/jlN/
	cNeXjrSZeVgtXZFJ6etzdTcc6NC/s0znXPCv5Mk5cWsgxXzT3zSRIOTyOVYaDo7/cTwA
	1T3g==
X-Gm-Message-State: AG10YOQba+HyGy9xo5CvR/YoXh70/Lj27z8My4s0NoxAXXhsRbm5XejWwR7wGvyBbeWB1o8ULtSoHf1t941Lc7Ae
X-Received: by 10.50.23.108 with SMTP id l12mr16351922igf.78.1454682413278;
	Fri, 05 Feb 2016 06:26:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 06:26:33 -0800 (PST)
In-Reply-To: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
References: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 14:26:33 +0000
Message-ID: <CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Fri, 05 Feb 2016 14:26:53 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe8814158052b06a40f

--089e0149cbe8814158052b06a40f
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 10:25, Jens Rehsack <rehsack@gmail.com> wrote:

> Add patch from commit 96b1b5c127e9e0e637aaf7948cf3330a94a5cd57 to
> cross-localedef-native
> to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set to 1:
>

This impacts master too, so I've merged this into ross/mut and endorse it
for Jethro.

I've also a filed a bug against QA so we notice this breaking on the
autobuilder...

Ross

--089e0149cbe8814158052b06a40f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 February 2016 at 10:25, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":dah" class=3D"a3s" s=
tyle=3D"overflow:hidden">Add patch from commit 96b1b5c127e9e0e637aaf7948cf3=
330a94a5cd57 to cross-localedef-native<br>
to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set to 1:=
<br></div></blockquote></div><br>This impacts master too, so I&#39;ve merge=
d this into ross/mut and endorse it for Jethro.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">I&#39;ve also a filed a bug again=
st QA so we notice this breaking on the autobuilder...</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149cbe8814158052b06a40f--
