Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 767527F9B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:02:12 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id i31so1199802uae.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u8G6cQr++QCotFpo0K0VBWocw5ZfPi3M5O2edaIYYes=;
	b=eGrMHmJB8U5i8j1VKoEWMNYieBcielFCyYPyCV8L8fmqxP4uLjCggKPp76O1gIMOxs
	Ih7J85qPr45m55qIXphS/eOxLAvZp/rzeUU0qV2jppRGzoy2ON5fvu8KPUq4dJ3gV6fI
	q1JTAvpg1fUqtC/5ueDczWVxW8RJWu/iBRLjpPz4MGiX1kK7IpijTddXdEMH5OFzC466
	/W03ZlHjkjBX0SVUkwkmt/G+IXqjiRygrW0Z620PNUh8E4OJ27fPYb8EnWyrH1W36ruD
	Bl53XLp5/PLOYEchHJJMHnBlkA9bRnLhKn8j0PcLIkwJXv/aT3yWbhGNcET9V/kRUpi7
	VUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u8G6cQr++QCotFpo0K0VBWocw5ZfPi3M5O2edaIYYes=;
	b=OKSZ5snFeHYiXIZFhJgA4Mw77KZxtQ0C01gNEyrJHvufZFRIC7SHio19xAQo6pfaS3
	3l1zPaDmYPQLafEMevqOzVYbcKXYCrCt/Ki5Qb0idKPimg+yWImKZdnWjyKV8OW9KqKH
	ckjXTh8usrbXzw4owfkFACzqVxTns9VCS/JZcPBfmLocIlhIIItHb9dtoIkxsHbpnNFU
	W70CWvlxDF/jg4sRnhp9/NwkAdTG/X70UyMY2vuqGhGMHBaM4neXulv9MI61do4CYEDL
	tY8plXfhHqqDutYPmnkidQzHCOJNWGzlsUOOw745zmSCB46BAyeFotZscfjobLGT1sMb
	6HPA==
X-Gm-Message-State: APjAAAUzpniUtjr//xkcWCF4YdF61eZiHOgLFaVA2lJ3c7RuTGcuaNNL
	AO0gC/fLxB3gs8nlWSdxWU+eze6mNV6djEGK//Y=
X-Google-Smtp-Source: APXvYqwV0rXp3rNI2lUUcR32WT6jwAz7oxlGi/rwNfSiyZg2k0tzvfT4JSXp2iSK+kxdZgGXxUIz8Us+9bGmApkZT78=
X-Received: by 2002:ab0:6545:: with SMTP id x5mr6528433uap.89.1574355733140;
	Thu, 21 Nov 2019 09:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
	<20191121150207.3657-3-richard.purdie@linuxfoundation.org>
	<20191121155018.GB28013@localhost>
	<ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
In-Reply-To: <ec0c2ab6397acc54c64cc4f8927eed97e82a9509.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2019 18:02:01 +0100
Message-ID: <CANNYZj-7XGYwBGqM-Rq9Hh+E28ak9JF=ga1YrYifWSwLkzL-dg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 3/3] sanity: Add check for tar older than 1.28
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
X-List-Received-Date: Thu, 21 Nov 2019 17:02:12 -0000
Content-Type: multipart/alternative; boundary="000000000000395b370597de4207"

--000000000000395b370597de4207
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2019 at 17:54, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Unfortunately a newer tar isn't in EPEL.
>
> I don't have a solution yet, I do know that silently creating empty
> packages is much worst than telling a user something won't work though.
>
> Any suggestions on how we fix it?
>

 Centos 8 is now out, and it does have 1.30 version of tar, so maybe we
should retire centos 7 from the autobuilder and update the list of
supported distros?

Alex

--000000000000395b370597de4207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr"><div dir=3D"ltr">O=
n Thu, 21 Nov 2019 at 17:54, Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
Unfortunately a newer tar isn&#39;t in EPEL.<br>
<br>
I don&#39;t have a solution yet, I do know that silently creating empty<br>
packages is much worst than telling a user something won&#39;t work though.=
<br>
<br>
Any suggestions on how we fix it?<br></blockquote><div><br></div><div>=C2=
=A0Centos 8 is now out, and it does have 1.30 version of tar, so maybe we s=
hould retire centos 7 from the autobuilder and update the list of supported=
 distros?</div><div><br></div><div>Alex<br></div></div></div>
</div>

--000000000000395b370597de4207--
