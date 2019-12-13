Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id BADAE7F91B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 15:20:50 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id 59so905564uap.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NgS5C9jqxRP4ng/hQWJ3GB/fAt4djW54BVNOFH4B7Eo=;
	b=o/LZsvssiyGQgLmYLwCG0g1nRjOjYpOu53KKFDONQGCOMq/GdDWNMXLw6TsH5JQgp9
	j7MMHeKc/qfNPwkkdsVgfRPQ2P1K8b4Yp61rWJvfRUSZQiiMNZckFZjieWl97NWr+8aN
	CjJNgX6Ekx8KpOUK0ZnlWw1TK6/0kM7vYUIGZsFC+lS59eHmVwV7dieAy5CYgp38VHdm
	+sZpJhwf3/azl8hq3uxXZJaB5PCFTZvjHRuVe5i1Qc6T3RJHJpNdwhi8HqNsDc8GTz8l
	gQdzg2WigEopGw/+KyVw/eHmBErIo8O/C3dxsMamG+P0StUR50yryOLopNDubWOeXeOa
	UGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NgS5C9jqxRP4ng/hQWJ3GB/fAt4djW54BVNOFH4B7Eo=;
	b=N5HqWjSaZUVEhKsUQOyVSYom7kjkHKCB0dGaFF5WgCvtnaNa5oikQQOLeATwYbGmI5
	UaAQeZQD3u4f60SktqqoIFMh+XU+f2gZB2ecjWAJwppNNcVRAkairjTRvOB3NrYOPX1g
	qlHVqeX2Mzrd0a67V6cqXlbZJMAGjSxmaKA1r6sGkgluYb0c9fOs3iL9YLGmBiiBzTa/
	fl2+ih1grHV31WUc3/wNvkjTh64c0EEPev/vlczlVnVA9/BWwC/vT52mmj+4TNBAVvkr
	kmrPW/FXBmUV8WPNGYzzjNC+IN6lHjFZ9FehgbFcgb58NbunuRHSBigjTMm3sX6NCYnH
	5FRA==
X-Gm-Message-State: APjAAAXq3ZSuVzhY0Cwx+fzgzuY4938Eq2QUdDiP/QbkQzXMNpZ7QX0W
	7zlA/14lPX29j63gpHL3xNE3MzcYME8VLKcnENk=
X-Google-Smtp-Source: APXvYqyf/ji+Y/QsyehHU+kiWrqE4Nc4pRcqyWIhVAi/ML7NZ3IxbuxcYTYnBIaxIgH2ZBc0kJbLAL6u72Hufq23LZU=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr13127804uak.22.1576250451475; 
	Fri, 13 Dec 2019 07:20:51 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
	<CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
	<CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
In-Reply-To: <CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2019 16:20:40 +0100
Message-ID: <CANNYZj_-MimTZeueDybg87q=CrDGs5FTo07EH7DoBu-1gWjVxQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jon Mason <Jon.Mason@arm.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Fri, 13 Dec 2019 15:20:50 -0000
Content-Type: multipart/alternative; boundary="0000000000003cc38405999768a2"

--0000000000003cc38405999768a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Dec 2019 at 15:46, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> >> Fails on beaglebone:
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1327
> >
> >
> > I had a look into this: the issue is that new versions of nss require
> hardware crypto capabilities on ARM (both 32 and 64 bit).
> Do you have an link for this?
>

Yes. We are using plain Makefiles to build (and not gyp), so the link is:

https://github.com/nss-dev/nss/blob/4703a817f8b90cc3423620e5c7606bdbcedbcf2=
e/lib/freebl/Makefile#L782


> I think we should not do that because:
>
> Build log says:
> | cc1: error: switch '-mcpu=3Dcortex-a8' conflicts with '-march=3Darmv8-a=
'
> switch [-Werror]
> | cc1: all warnings being treated as errors
>
> Nss sets '-march=3Darmv8-a'. Checked in their sources and found that
> this is done in lib/freebl source path [1]. With latests sources from
> gihub-shadow they introduced 'disable_arm_hw_aes' [1]. Have no idea if
> 3.47.1 already supports that but we should use it as packageconfig.
>

This option is only available with gyp, and not plain Makefiles
unfortunately. And the way I read it,
it's not actually possible to disable :-/

Alex

--0000000000003cc38405999768a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 13 Dec 2019 at 15:46, Andreas M=
=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gma=
il.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;&gt; Fails on beaglebone:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders=
/65/builds/1327" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/typhoon/#/builders/65/builds/1327</a><br>
&gt;<br>
&gt;<br>
&gt; I had a look into this: the issue is that new versions of nss require =
hardware crypto capabilities on ARM (both 32 and 64 bit).<br>
Do you have an link for this?<br></blockquote><div><br></div><div>Yes. We a=
re using plain Makefiles to build (and not gyp), so the link is:</div><div>=
<br></div><div><a href=3D"https://github.com/nss-dev/nss/blob/4703a817f8b90=
cc3423620e5c7606bdbcedbcf2e/lib/freebl/Makefile#L782">https://github.com/ns=
s-dev/nss/blob/4703a817f8b90cc3423620e5c7606bdbcedbcf2e/lib/freebl/Makefile=
#L782</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">I think we should not do that because:<br>
<br>
Build log says:<br>
| cc1: error: switch &#39;-mcpu=3Dcortex-a8&#39; conflicts with &#39;-march=
=3Darmv8-a&#39;<br>
switch [-Werror]<br>
| cc1: all warnings being treated as errors<br>
<br>
Nss sets &#39;-march=3Darmv8-a&#39;. Checked in their sources and found tha=
t<br>
this is done in lib/freebl source path [1]. With latests sources from<br>
gihub-shadow they introduced &#39;disable_arm_hw_aes&#39; [1]. Have no idea=
 if<br>
3.47.1 already supports that but we should use it as packageconfig.<br></bl=
ockquote><div><br></div><div>This option is only available with gyp, and no=
t plain Makefiles unfortunately. And the way I read it,</div><div>it&#39;s =
not actually possible to disable :-/</div><div><br></div><div>Alex<br></div=
></div></div>

--0000000000003cc38405999768a2--
