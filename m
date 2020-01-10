Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id D7D427F7E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 15:13:05 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i78so689695vke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S3KcDxyeOYcwbkYmRrYRd4WKXGghmH4OvAYZ1LNPYIk=;
	b=bUZtJrTxYWsza4vg78yRyALuydCJVu6nEXHT56qnKtbrrb4xX42qvVRCGpBBPgk9mL
	eRrVe0guDfGQXRgHnW4iuoDKaeUHiwM7+6Owk5RVsHy4m77kl0KsIuJfc17FTwAXOWbf
	W2yBgwFgry5zeOBAjLuKdem421a0IE6XwBLydBgfr9Yn6piV+d+ek7lP/ToYWwPUIitl
	JpStNSG0dQ7KriZbneoXxLdEdlpXWDbSDVgBXH9faeXD/6+W8IApsA69DFJYFkiW9qVN
	UR6M6krQIgrgDe7064YaUYJgWe6lQcntay90UCtN2I4z62ZjTvc6zKP1SrPyF0TNrcTy
	c+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S3KcDxyeOYcwbkYmRrYRd4WKXGghmH4OvAYZ1LNPYIk=;
	b=NW1Yd7CQfmApbw0nqRN7JtzyJDTBNvqQqYjQVZk9Qxhl9fV6VGiSYnsG+Z9xV6TFWL
	yyfRV4sRRFhk1hybpy1iKZZcS6TIZ3tA3zSUrCLwYxE2bzsXyhI8MN2+j4KQVAhBNpl+
	IrkQRoYEbAaw0H5bgPtNm/kJn5c8S8i5lllYN56i7GcESiSEv9XWnYZRQZYMt6vxpzOX
	3WtJHidlx6Z6wGZz/2/Fq7PQAmW98XjnsPIJ8zobKKLrxQ2N9uilb06NazuWG0rNgUPa
	tGC/5gtivt2+QlPnghIEj/hqGEtiD09UACjPiGVEB8EuS5Ph8qfrliFjqNxSrVuO8bkp
	wRHw==
X-Gm-Message-State: APjAAAUy2UvakBYTxT9o9Sif0F7Vmfd+MheV3RPO4uidgWgozxJT1OA0
	dOJDgoITmxsEC2CKcqHD9GcyVJkZe+S3nKnu9Wt00dYR
X-Google-Smtp-Source: APXvYqzHLTMiwWxHpRyWGus231MSj/ZZQD+zcLCEErbUT2aiTkHawUC+TlVEUJOqfkeT8RmAIYZq1EYcod8AW6+XN5o=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr2488154vkn.0.1578669186477;
	Fri, 10 Jan 2020 07:13:06 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
	<20200109150148.GC31026@bill-the-cat>
	<CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
	<20200109155506.GD31026@bill-the-cat>
	<CANNYZj_wZx-FCrLmsoBvRF8eP8JPxMHFd2TjMgbD_BjkHsNjJQ@mail.gmail.com>
	<20200110150040.GA29928@localhost>
In-Reply-To: <20200110150040.GA29928@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jan 2020 16:12:54 +0100
Message-ID: <CANNYZj8Rq_+W+x6HaJ2FperopxQ066nqVgaUY35PUVXz=xw8Lg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Fri, 10 Jan 2020 15:13:06 -0000
Content-Type: multipart/alternative; boundary="00000000000013f2d4059bca9027"

--00000000000013f2d4059bca9027
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2020 at 16:00, Adrian Bunk <bunk@stusta.de> wrote:

> Is musl runtime tested at all?
>
> ifupdown is one of these recipes where a musl build error was "fixed"
> with a patch that makes something do the wrong thing at runtime when
> using musl.
>

musl runtime is tested, just not with ifupdown, it's replaced by busybox in
all of the testing scenarios.

Alex

--00000000000013f2d4059bca9027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 10 Jan 2020 at 16:00, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Is musl runtime tested at all?<br>
<br>
ifupdown is one of these recipes where a musl build error was &quot;fixed&q=
uot; <br>
with a patch that makes something do the wrong thing at runtime when<br>
using musl.<br></blockquote><div><br></div><div>musl runtime is tested, jus=
t not with ifupdown, it&#39;s replaced by busybox in all of the testing sce=
narios.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000013f2d4059bca9027--
