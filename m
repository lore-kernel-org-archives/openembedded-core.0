Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC19E7F23C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 15:07:56 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id m62so4007979vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZfbhRGiNwKzfWJh7OL6lQ7Ajxvesen6i+aDPGaQ8lwU=;
	b=U6VYd0Dl/mzbzQkR0JoA4vey1TGrhovguLqjvmH2UIlBkUoTQPyJzhVsZ6FwSeTu41
	o+xNkq35pFcoqaU50FKAHBnSgVkH4pffd+UVDlysgp/oRJDOE+4JN0ZKxTO3F+KPIie3
	qj+QgHAvzmKICzBuomJ8YUnirbTeFklwFSJHPF5x2zFr44x/bO9dNIWm4uAvzPSgWJ0V
	ze1rKcCGmnQ+0gKLB8tP4W9EM383MQ2A7LXmIIq7wB0K4YOEj9LE97D14I45dTfiU6xo
	fXNcqas2HQ/FZRFjkNFMT3ADFz/SCLgKZCnYVERilvkhYDRIWjt0KDjM8E1zyg7/mW5k
	dIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZfbhRGiNwKzfWJh7OL6lQ7Ajxvesen6i+aDPGaQ8lwU=;
	b=jOQV+lsJZnrRfpYaRPbiI7HtyXQFOnAcyRNHzTZ3c7985LrKerwbzaIa0NkZBQU08h
	jfrxWd4Axts9tS3OWVS4qsSV14LyxslZNPvCOLJEKW+Q4OrzSnrMkCymACMuPbhETfiy
	gCQBu02RvMT9tfEJZYUJQr8u4nDG65sNRmgpKU7BnSEmiEK6OA0SfjA7wN21eCL4qR6b
	ku5bV1zh8d8Ok24elM5gaYrr2kvgfVt1CJk+oCkRFnoJB8MAPYWt9Hfj78Cd+adaOSMj
	mF8NKJ4tGZZ6LocaZ7ncmDQOZLCzuZUi8zBND/o5Qf1TuAsh/YIWHVSZ4SgNRrHLFirw
	moZw==
X-Gm-Message-State: APjAAAWAaZJgjAFbqRvue+zKYIEbotJO0yZoWS8CE8li0RZ7yjZ96Ezz
	2olRKfJpKjRx7OHyUB0lHNjuqmjyLpjs0VSJqa7q2amA
X-Google-Smtp-Source: APXvYqz4QGeUV1o5E/utwDltFd8d21bOnW6ubXTHyNHC8Qq0oRWeJyWmW+EyTFrjtNDnRrBBPYHvKNh6Dvhx/Uoc5+k=
X-Received: by 2002:a67:fd66:: with SMTP id h6mr25411671vsa.83.1566486477791; 
	Thu, 22 Aug 2019 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
	<20190820153219.62435-4-alex.kanavin@gmail.com>
	<182613b04a933f2ff2183ff9c4b2b183f15ac156.camel@linuxfoundation.org>
In-Reply-To: <182613b04a933f2ff2183ff9c4b2b183f15ac156.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Aug 2019 17:07:46 +0200
Message-ID: <CANNYZj8OyYFAbMPA957NnNMxKDR-Q=dT8U6Zs7482+ZE5Ja+yg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] python3-numpy: update to 1.17.0
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
X-List-Received-Date: Thu, 22 Aug 2019 15:07:57 -0000
Content-Type: multipart/alternative; boundary="0000000000000de88b0590b60e5e"

--0000000000000de88b0590b60e5e
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Aug 2019 at 15:33, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> >  create mode 100644 meta/recipes-devtools/python-numpy/files/0001-
> > numpy-random-setup.py-remove-the-detection-of-x86-ta.patch
> >  rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.3.bb
> > => python3-numpy_1.17.0.bb} (100%)
>
> The -native version doesn't build on centos7:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/941
>

Thanks, fixed version sent.

Alex

--0000000000000de88b0590b60e5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 22 Aug 2019 at 15:33, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 create mode 1006=
44 meta/recipes-devtools/python-numpy/files/0001-<br>
&gt; numpy-random-setup.py-remove-the-detection-of-x86-ta.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/python-numpy/{<a href=3D"http://pyt=
hon3-numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.=
16.3.bb</a><br>
&gt; =3D&gt; <a href=3D"http://python3-numpy_1.17.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-numpy_1.17.0.bb</a>} (100%)<br>
<br>
The -native version doesn&#39;t build on centos7:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/941" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/52/builds/941</a><br></blockquote><div><br></div><=
div>Thanks, fixed version sent.</div><div><br></div><div>Alex<br></div></di=
v></div>

--0000000000000de88b0590b60e5e--
