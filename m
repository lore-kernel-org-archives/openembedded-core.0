Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3A10A7BE3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:47:31 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id b16so16868046vso.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KNA07msUDkGUmgL3S6yvh27qM+x9VaaQZp+pz+RJdAs=;
	b=JlyxyD/G/Hotc3ebb1QbYgv2jKSkxld1Rh6YFp687KnIq+Ut35hENjlOvjFl5p+4qS
	CZAf9bJanCO+8ba4KvUsgezmBUYiz7nI/WcViBxw9jkoZycWR1+NfH11rCvjKWP9Hta4
	NchoKtsHEhrBQ91kQ5aILpjWFB1LpBhDFDQfbhJRnjT/8LfHY8FBkmFH5wVfxrAZ2QSy
	tt56U5+Ss1IkYG+4W5uzyXrmWhbwdQE3qB86HBp7sqQDiLfg4hG2XBRZ1pv4HYvNzfyG
	Q0Nz4OEhHfykCKxMJLeMVqHOD4z3luAqmKhZoqY+CK6zmwbywowLi2N4mVaweV1sVvC4
	xc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KNA07msUDkGUmgL3S6yvh27qM+x9VaaQZp+pz+RJdAs=;
	b=ZfnSqFbEENoGVOohVN0bPSn5hapdYvGUiJFBWLgE5F1XFjdePYdgDo2SZBqsHSZqes
	fJRHt3W/ianFcTkt90Wuqm2dIN2fqUaHIoavoGR1U28x/tU6qN/BXwIGx8+kP+KmyFr9
	3doNcklD9ZgrbBEZzgu9kdGNyCF0MPI6S8EHMDvrhKiKOr7Nf7EDJgkv3R0ig4a0w+bA
	z1dV2sSLmvb0TgFv5VwfvvVexrC7a5Kh0abv/HMiT40x9BrLmNqFyC3LHtdcnSfzRWEZ
	yWmzJ/fYC2wwFscaxp7VZR86FoOrXyD74Sl8mgw2UtR4tfc1ILBgQRiZ2Bo6tfSSZy53
	3iXg==
X-Gm-Message-State: APjAAAVPwf2P1wieFAk7M/+oA0nHlOM7PNusLwSTytshRAQuhqo8g0Xa
	vFv4rv7GwQbhJTfKmeXnnCRiltVWkblJi63ygGbK9w==
X-Google-Smtp-Source: APXvYqyoYhu1GVOE5+cymzIVFecT6n/SJDgZdZD7m97JeIXUo/61vxTlSbnujFHVtkkyexzr8Q6S8Cb0ZX8bNlNVCK4=
X-Received: by 2002:a05:6102:4ab:: with SMTP id
	r11mr1588555vsa.25.1574257652108; 
	Wed, 20 Nov 2019 05:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<20191120125602.GZ19317@bill-the-cat>
In-Reply-To: <20191120125602.GZ19317@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 14:47:19 +0100
Message-ID: <CANNYZj-EUQb2gjw923rv-fMDOaGn+fe59AnA7B9oSkgk6de_xQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Wed, 20 Nov 2019 13:47:31 -0000
Content-Type: multipart/alternative; boundary="0000000000002392550597c76ce5"

--0000000000002392550597c76ce5
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 13:56, Tom Rini <trini@konsulko.com> wrote:

> I would _really_ like to see someone move master to using v2020.01-rc3
> or so for U-Boot as that should not have any Python 2 dependencies left.
>

rc3 means the final release is very soon, so we'll gladly update to that.

Alex

--0000000000002392550597c76ce5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 13:56, Tom Rini &l=
t;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I would _really_ like to see someone move master to using v2020.=
01-rc3<br>
or so for U-Boot as that should not have any Python 2 dependencies left.<br=
></blockquote><div><br></div><div>rc3 means the final release is very soon,=
 so we&#39;ll gladly update to that.</div><div><br></div><div>Alex<br></div=
></div></div>

--0000000000002392550597c76ce5--
