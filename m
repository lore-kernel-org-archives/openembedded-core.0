Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id CB6AD77BC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:54:45 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p64so4384577qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iXdKwlXSi85RlGN7PxZLrDelFmW2Y3rqTXdiG13Gg2M=;
	b=picZj6aILbRbT5WAmU3K8fQp8gp3K1O5aT1lgReVk3CSB9RM8dJ2lATN51JjzXn2Di
	ukPo5771DEO4yWjL9glKK+2vPS16JVMUZ4bAtCCgVQ8zxNczpzoTweujGacaL+m/nzMT
	uRGw3HHsy2R1fGtDguKHnBHWtJHE5AVAjDY54UMXXUhpuikre5i4FBnrfIY8zCOkrFlM
	i03zn6fnMEH4WbLrG5skR0IgLwX3FT4sPhDbyLtvpNM1r675FgNjfacbVnZ7HqounsGB
	BwP2OGNGyH7mk2cs5+H7yeAtyAbwzKtgJEorsStPgxOOhhn3oG4YqdEIYSF6+r4wM2/m
	5aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iXdKwlXSi85RlGN7PxZLrDelFmW2Y3rqTXdiG13Gg2M=;
	b=dJ5Dr1pqGHHtRTfyaDjeVjaX6VZQaRNmH8JEzwRFCy63mc26sXInSKeHNM4mlNjZbo
	GbxC41+tfOCGylDzCsXUy8djsdHcDSAIhm+YxjcAnOv0OH1MEfJH9G+f4jkoww//8TRH
	d4IAz3LYhLLEdMnNtxiC08C6jEp0SKl7sPl1wRcqcltGgw6yAHPD9ZgXnbIzCcExMKBy
	GUuHXXIVQbeQwc6s1aItr3F4yHk+JcGzADdQKD8iNxU/fVY+ZHV9oDWHq4TC7imDSenz
	qyTbFWwoeSXMePky0YcmCFo5Kpp6jFqmodwgkXXsa9fZl8p0zEDvnED1uRmOGHt+lUkM
	AJfg==
X-Gm-Message-State: AFeK/H12+LBrMEiI9M6bfVQMxcsUCovhQLT/Og6tgvPKEq0vSxRe7pATLHDgqX9Xfo5qaNQF5sHwHCDi0/OOt+FQ
X-Received: by 10.55.47.4 with SMTP id v4mr7896792qkh.77.1490367286449; Fri,
	24 Mar 2017 07:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 07:54:25 -0700 (PDT)
In-Reply-To: <1490367165-27529-1-git-send-email-maxin.john@intel.com>
References: <1490367165-27529-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 14:54:25 +0000
Message-ID: <CAJTo0Lb0u3QukoSwpko+byoxkoik6FTdW+kuwKusBWqMz7E5ag@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] fix valgrind ptest
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
X-List-Received-Date: Fri, 24 Mar 2017 14:54:46 -0000
Content-Type: multipart/alternative; boundary=001a114f4108b1b881054b7b2cc0

--001a114f4108b1b881054b7b2cc0
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 14:52, Maxin B. John <maxin.john@intel.com> wrote:

> Maxin B. John (2):
>   vg_regtest.in : fix perl script
>   do_diffs: correct the comparison logic
>

Both patches missing the valgrind: prefix.

Ross

--001a114f4108b1b881054b7b2cc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 14:52, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":vl" class=3D"a3=
s aXjCH m15b00cf1358ee21e">Maxin B. John (2):<br>
=C2=A0 <a href=3D"http://vg_regtest.in" rel=3D"noreferrer" target=3D"_blank=
">vg_regtest.in</a> : fix perl script<br>
=C2=A0 do_diffs: correct the comparison logic</div></blockquote></div><br>B=
oth patches missing the valgrind: prefix.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108b1b881054b7b2cc0--
