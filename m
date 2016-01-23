Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 295EE6FF76
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 09:40:02 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 77so110690042ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=e+iMP0l7S7Z/iFsYEkbecLCbBbXWAay1WSWmHQLlwMc=;
	b=GhwTr03HnBttouHtuX0zFD9lPcNU7B8vHpY2/A3Gg3zFizPey4JfDaNvEjqu0w8kJ1
	JXfk9ES4f8Ox2+eTYpQGWS8yQ8ryDkH2s12wDyjBHvPeKf/fpQo4VTGjS9wx7oHXPajm
	iQsT93FIrYak5oDomkZiwZF7LsdCl8/1fB5n8JAt0+pmObFGaZHo1BdDNxsCwCyOvagQ
	A8qvbVRVoqaD1t3RX3AtlOFnKUhD7qywG9jar2I33h+2d7NEfZGbf26eXe826MKhxQbi
	i+RJdlp2yNac/etUb5Wm0oF587ULx4bU2NggSzOavfUZccFlDM4XQzzgsXnI+4+1h6eh
	jbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e+iMP0l7S7Z/iFsYEkbecLCbBbXWAay1WSWmHQLlwMc=;
	b=EMp9fzGF+KwZU4OUaGfxhNnROe384C6hBCsyqar/KfmEqKv4T6QdUFkcZ+bm/dNoyF
	iEO+BT6tK1qeA5M9Jx5edss+uoapN5T3Q4N9OTkooCi2clDgSZN/FYGi0jDe85aRn0A7
	MJbkGO8Tp2pxaldovR6CCCkpZM+fk9LfPEXoXLasMw7nL/EJl2K2SQubgSUnyfrYpap6
	H+gaoQZU9hIMkCvvKJMRcVPgQMSd3rMY62XkshqKzqk5KF482y9OHKVjpOWyshzG0+Rg
	QClTXvFGc9CQq9VDYWDpJ31s4ArJwqTkteetUqiUgKkgi82kfE0/fWl/c6RA0IFquTIU
	udUA==
X-Gm-Message-State: AG10YOTjJCXuW3xKi7yHe0BDA7gYHQxkfSU4FlJ+3pNoYDiLedgKJ99lKPsu4BYcqehebWGoT6giD5NOrlyTqgt8
X-Received: by 10.107.164.161 with SMTP id d33mr7067492ioj.148.1453542003631; 
	Sat, 23 Jan 2016 01:40:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 23 Jan 2016 01:39:44 -0800 (PST)
In-Reply-To: <CAMKF1sobhDsXQ1ag9ZfrdHQyka7Y88C-thvzvMADa_V5C=9rqg@mail.gmail.com>
References: <cover.1453427632.git.Qi.Chen@windriver.com>
	<2123a9457649d41670e9c35ad4b77a80064c95ed.1453427632.git.Qi.Chen@windriver.com>
	<CAMKF1sobhDsXQ1ag9ZfrdHQyka7Y88C-thvzvMADa_V5C=9rqg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 23 Jan 2016 09:39:44 +0000
Message-ID: <CAJTo0LYPF=bkqU_OGwCU5NZOgDja70Xsr338xJo6rJCf6MNpxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: work around the boot problem on qemuarm64
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
X-List-Received-Date: Sat, 23 Jan 2016 09:40:04 -0000
Content-Type: multipart/alternative; boundary=001a1141c976caff4a0529fd1ece

--001a1141c976caff4a0529fd1ece
Content-Type: text/plain; charset=UTF-8

On 23 January 2016 at 04:52, Khem Raj <raj.khem@gmail.com> wrote:

> This is general aarch64 problem, so make this across all aarch64
> this is the original problem
>
> https://github.com/systemd/systemd/pull/1190#issuecomment-166294683
>

And according to that link, is a binutils problem.  Can't we just fix that
instead?

Ross

--001a1141c976caff4a0529fd1ece
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2016 at 04:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":10kq" class=3D"a3s" st=
yle=3D"overflow:hidden">This is general aarch64 problem, so make this acros=
s all aarch64<br>
this is the original problem<br>
<br>
<a href=3D"https://github.com/systemd/systemd/pull/1190#issuecomment-166294=
683" rel=3D"noreferrer" target=3D"_blank">https://github.com/systemd/system=
d/pull/1190#issuecomment-166294683</a></div></blockquote></div><br>And acco=
rding to that link, is a binutils problem.=C2=A0 Can&#39;t we just fix that=
 instead?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1141c976caff4a0529fd1ece--
