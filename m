Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 565536011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 21:32:59 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id c3so21088206igl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t0SP7Uv+zP08YqJlJnQAeoCeKgo35P2ZXrzGX23UvSk=;
	b=dJWIUv79u0JR1nw7RVBqc8jPSKVLMm1XzRncjpdMrOGe48vOaWHTnIGf8PWV0Q6c4T
	7NUHkZMgeonHWO/1rVEXkY0KU9qSL0uF0JK5bhUgTY0pRVvsIXoBYw+z6H8Vk0S8vZoa
	ygDU97cRUjPgkM4fJOElMwRyk56/cwX06yzlnkxJyD25fvSQDBJlTbVZjs/8kUdfXasw
	OHKW8xXKx0wCtPkgWaeu+Lx9zlfTUE8Cj6pdiyahzMvSx5+QA2iMCcenw0a5B5RHyfFw
	SZdhvpTgXJRUAJyMOYLCZuLgGtrkbHj1hpV2dQ9GAfcizBHgueZXvOjhto2qtRLeFRY9
	ZLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t0SP7Uv+zP08YqJlJnQAeoCeKgo35P2ZXrzGX23UvSk=;
	b=QKk8GgXQFOcc3/+wPPVEkzpnCD9531jtcIo5QCfG8K6M5qpnmOK7HVbHSEpTJ8F3Ic
	RHHaATHoxmnbawH5LAZQ6AnTObuss9MHK0u56wpFdWeGcZqwpjfP3YNSRUSdKzJVLyHL
	qUyZLgROjMgYuyrEDcm4QczdTlexYeSpECLpxYScAecAWSCUB1iEBgtpowNBeF5ETlaz
	75Fjo0Gyn6xtDSh5YIGEgY2aa8UEKXyfy3m1oJVKlUWu/d2Jw9RKHH3NHX2Yr1y3jIWV
	fC4b5jdD1w5ZiIVrCDDswDxEezrakfbxXRwbuKWqL+q3Q7vMWKmh97M/YAGBBw0o9eeA
	phcg==
X-Gm-Message-State: AOPr4FVwAeiXEB3Knj8qJePo3enhaBsv3E6CsCs9Dockdrp7X8igy1EfVF2PN91FR+FtwZrKTsQ0Oc74szWkhxrJ
X-Received: by 10.50.119.67 with SMTP id ks3mr373108igb.78.1462915979901; Tue,
	10 May 2016 14:32:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 10 May 2016 14:32:40 -0700 (PDT)
In-Reply-To: <1462824426-19768-1-git-send-email-tom.hochstein@nxp.com>
References: <1462824426-19768-1-git-send-email-tom.hochstein@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 May 2016 22:32:40 +0100
Message-ID: <CAJTo0LamyW7i_byya7HY3bi4uLYga1nFUTs7yvkpz42XXyMVtA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
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
X-List-Received-Date: Tue, 10 May 2016 21:33:01 -0000
Content-Type: multipart/alternative; boundary=089e011847f6519803053283abf7

--089e011847f6519803053283abf7
Content-Type: text/plain; charset=UTF-8

On 9 May 2016 at 21:07, Tom Hochstein <tom.hochstein@nxp.com> wrote:

> +Upstream status: Pending
>

This is a machine-readable tag, so please use the correct form
Upstream-Status: Pending.

We're collecting quite a list of patches, should we simply ensure they're
all upstream and switch to git?

Ross

--089e011847f6519803053283abf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 May 2016 at 21:07, Tom Hochstein <span dir=3D"ltr">&lt;<a href=3D"mail=
to:tom.hochstein@nxp.com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3i1" class=3D"a3=
s aXjCH">+Upstream status: Pending<br></div></blockquote></div><br>This is =
a machine-readable tag, so please use the correct form Upstream-Status: Pen=
ding.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
We&#39;re collecting quite a list of patches, should we simply ensure they&=
#39;re all upstream and switch to git?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--089e011847f6519803053283abf7--
