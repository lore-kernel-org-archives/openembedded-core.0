Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3AF7FE6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:43:35 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id g23so3766800vsr.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=KDeRKiwH5ZuT79HAoPxN0iKbV0pzCywdMRuj+ufEsR8=;
	b=fl/5QBKScroO0VYGZMbHAnVPDLmuRTD4FVH+PCb7vzekS7gQg66iOdbRXVIwsTiu3s
	S4/Lf6RjcuntQf5JBuAUgsryi7f706P3IYnwvHsx0Pah31psRpd0e/eIhUJ+WNw2pVXs
	8HUNfS3OmAFhnrtjD5cTywpBPnbZqoNiNLrg+TQSvjnTO/lqL2yM11dGTc9dAeOaTmBD
	av/eAlfQ5Mj1QE/RRYyejnv4N9OYTWIK32UPfNo4g2piics9Mjy5TQDKRUkO/0jw9Q1Y
	2ljL63QDY9RrBpLq4AYU1ebLs6t7AgofNRxMmrtH9nWlcRXZHUH1+nXeHHXl9bTwQFqo
	D01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=KDeRKiwH5ZuT79HAoPxN0iKbV0pzCywdMRuj+ufEsR8=;
	b=lTCLlsCoNGX2Y4WBpCTm/32Y5RBD+aTDKgWGtKdI13xHU5DKoupw8UQdu9Oo14BAxq
	OHVeDDt/t/kenOQ2QAuXzFcCeGV1FCIA4uMgZJOIJju7n1Vy/GKDdv+Nj+L9SI9ETmEa
	HFq/FigM2b+80oO35v351IBgVbemwrOhvMR8+oQfbol8bbPqz5cKws0mMMuBnjhcqH0E
	qIwn3HMjTup39R8rM1Y623zSH/OIEuGcWBaUWLsWMh7ggr/RifmIoshjaWr+SLRsMCTp
	xD5qIY9HTdLkd82zSbBfa8i99GyCuiCaUwQDPZRrduMKZFm7uokzZDWc0dsN//G9DDYr
	SvJA==
X-Gm-Message-State: APjAAAUri/XK6AyBcVkBFxez6RZWbYpcl2gegQQ1YRK16vy4jWtuC4de
	3SYAnMV1l/Z/zL223FJNL7RAUdSL0ZCkJYlrLTs5wH+k
X-Google-Smtp-Source: APXvYqwKxCHc4bVEf3Oq+esPDTvNFNwmxZW1RX2OnCFpp2iyVYeq9wVCEH0e68aYJcqLGPxThh76L1Z+fmjPKUDXlG8=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr4858951vsa.25.1576763016011; 
	Thu, 19 Dec 2019 05:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
	<20191219133225.2273.96965@do>
In-Reply-To: <20191219133225.2273.96965@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2019 14:43:23 +0100
Message-ID: <CANNYZj-Ls=UkL7TdMUCVd1EBBO+MkUpEnkPqU2=gytRsZ7qjdg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJyZXNvbHZjb25mOiB1cGRhdGUgdG8gMS44MC4uLiIgYW5kIDE1IG1vcmU=?=
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
X-List-Received-Date: Thu, 19 Dec 2019 13:43:35 -0000
Content-Type: multipart/alternative; boundary="00000000000076e37f059a0ebf8f"

--00000000000076e37f059a0ebf8f
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2019 at 14:32, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at d6c62cc030)
>

False positive? The patchset is on top of my previous patches, but they do
not touch anything that this patchset contains.

Alex

--00000000000076e37f059a0ebf8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Dec 2019 at 14:32, Patchwork &=
lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org">patchwork@patchw=
ork.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at d6c62cc030)<br></blockquo=
te><div><br></div><div>False positive? The patchset is on top of my previou=
s patches, but they do not touch anything that this patchset contains.</div=
><div><br></div><div>Alex<br></div></div></div>

--00000000000076e37f059a0ebf8f--
