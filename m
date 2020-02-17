Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
	[209.85.222.44])
	by mail.openembedded.org (Postfix) with ESMTP id D284361234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 15:37:39 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id 59so6277590uap.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HTurHFs/Ay4DvuPmAx/vKXxdqjeJVIwJUGKLem8d7fs=;
	b=KZhNzGcIm46gfyroTWymf9As7WUzlYrY9yO7uIJhWuIT3RVSrs4f8p7z9tH8cD2vba
	wAezE3+w84zG3D/GuOZ4S0DRHfCXc5P9gp6Y8mlScbzQMtpLiuWOpkVEdK2bMPBhwEjA
	g9RcNpU6laxb1xyNrVlkw3Kdl069yLozwl4PULWYla1456gLy6NGKgmjUHqJ57R+X66y
	uEFeX0lbpAO3LYQFes/WvRi4Ek5fXMx8guonGS6uNbSo3gx/6arLFGfIRuAbzGglWKiL
	hzbXsqDuyBQMqs6UMuOLpVEdpzMmAs2bJ6Yz9wldezsHK7HyvyFaf9ofKXKuzDKvtxwY
	9S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HTurHFs/Ay4DvuPmAx/vKXxdqjeJVIwJUGKLem8d7fs=;
	b=clqgH17WpH93fHpGvXg3AV1GZVOAPZF80wW281by/lfOm+BWazNmANRK2Qe13w06gT
	7dN6xTqgV9F4Trb0ifpoKCLpOQKrd0kbv9QnXT03pQBGI2YqyMTyr2ZVWRA6B5tJoVNm
	ukvMn28ov5USxijIwL8JO3Q12B9cwcsmWLqhBpRjvh4nOeksF4XOyz5mZj/aAqS9tp3b
	wjzAVoseQQ6xWlRV6HzOFGWrnGxiamF9arEyNSV05cmojscqilHLWHy7sNuy193HF9Jn
	QHiy+RstmgaEo9A9LOTdnXNJvzo3jAYwRGpF+ozK6mUiQxTuyZ+UZmduSY52pGAHfz8n
	tM+w==
X-Gm-Message-State: APjAAAX/ReX3nrVpfRQz9InJ87u4XC0Lh8Qci2nPm2pE0SwWXX0eEuHU
	DHfhi4FmKqERM2ZH3S7GgLwc/qwwRrd9Zgb5qFI=
X-Google-Smtp-Source: APXvYqz1ooiot/Fw5QinIbD6s9DM1NfwD8zu12t2B8IXMwGnjcNbfOVe95JR4o7VN85Nx/CId9DQ99IsXHQ9Lq/rQQU=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr7590839uap.93.1581953860613;
	Mon, 17 Feb 2020 07:37:40 -0800 (PST)
MIME-Version: 1.0
References: <CAF2baFd0bA5ePtywQH5ZW0aSE=UH+e8r2V4SpUBgD8Ms5V3E=w@mail.gmail.com>
In-Reply-To: <CAF2baFd0bA5ePtywQH5ZW0aSE=UH+e8r2V4SpUBgD8Ms5V3E=w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 16:38:06 +0100
Message-ID: <CANNYZj_iDtpjwKoDg2XG8zAX95XDt4BvjAOQcTjeQ5sw6moPPQ@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 15:37:40 -0000
Content-Type: multipart/alternative; boundary="000000000000e9b946059ec7550b"

--000000000000e9b946059ec7550b
Content-Type: text/plain; charset="UTF-8"

Thanks, please send the babeltrace2 recipe when it is ready.

Alex

On Mon, 17 Feb 2020 at 14:32, Anders Wallin <wallinux@gmail.com> wrote:

> 1. I will create a new version with 1.5.7 removed
>
> 2. Babeltrace and Babeltrace2 are different and can coexist. I have a
> recipe for babeltrace 2.0.1 ready to be submitted, but I wanted to make one
> more test.
>
> Regards
> Anders Wallin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e9b946059ec7550b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, please send the babeltrace2 recipe when it is read=
y.<div><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, 17 Feb 2020 at 14:32, Anders Wallin=
 &lt;<a href=3D"mailto:wallinux@gmail.com">wallinux@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">1. I will create a new version=
 with 1.5.7 removed<div><br></div><div>2. Babeltrace and Babeltrace2 are di=
fferent and can coexist. I have a recipe for babeltrace 2.0.1 ready to be s=
ubmitted, but I wanted to make one more test.</div><div><br></div><div>Rega=
rds<br clear=3D"all"><div><div dir=3D"ltr">Anders Wallin</div></div></div><=
/div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e9b946059ec7550b--
