Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 58DEF7729D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 23:18:53 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l127so154504395iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 15:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0K8KxLF0lCqvs/qDpAaXf99lbl+IaTmTMmlfN8uk7Cw=;
	b=dFM2G4jboaT2cVbDrr5DsWIBVuO+/3mwRyo60/yXq7i3UcpJztSKse3rqPKqZrBQSg
	bRa5U73Tl1CmIMHlvnNWUNs2BDZBTJZHiaWdJdG5PJjJ/8cTZQbtGVF9QeSLjknizty9
	ZwpvIyysC6fXQZOOQ7ViKMe//kIuVjqlF+wNKeLYG3rc9g/35RhObOSdkOUkT9GMX2/A
	flsyt6fv7b6hSxPecjjFSLdiqAagOIs2IVK8uHTD1XTlPQobOLrzZDm8iARmsRjV+wK8
	ucUbs825XnAMEqyLvS+2qL7ivHQHPoHqkUSn1DdwJBUGpAx4l0z77bqNHC5+Tzy5JR6d
	shPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0K8KxLF0lCqvs/qDpAaXf99lbl+IaTmTMmlfN8uk7Cw=;
	b=mAyI6bInX0ZwZPIfNwfv3ko6hBOLaEdeHYM0XqxvVNpqFu+B9DE7AsDu87TpQYApvQ
	Bee3thNiXplwlLjhDxfoel9L+ugermSFIjri6oqCVoODN7FErUxp77XdYsPMFvwq48j/
	+CT7txGrFxvvFlZ/1wK0uSKiuNL4NclUYcB9rdocdQCUmtRA29Sl3hl0aJAzK66KSDa7
	0B1vINVfotczYp8Ahz9GU8yC1dzRD5hV4U84ENjUsHeLLe1bxxHcb8ErV/TBvSvgSwwk
	2j8ZGa4Ir4IYbuq85oTZVa7vd7BLw2JJP1oRPfDZO8iZ+/JoKqIkrZns8A73hBnEUAin
	C4LA==
X-Gm-Message-State: AG10YOQ0itxedgOMTB1/749+1OftQr/LXIoEo0Au0u0J4pBpLjQEWHr/cLJBkVhAl/alQjF6k/VZbjIF4v1rgFFD
X-Received: by 10.107.164.15 with SMTP id n15mr12683454ioe.148.1456615133942; 
	Sat, 27 Feb 2016 15:18:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 27 Feb 2016 15:18:34 -0800 (PST)
In-Reply-To: <1456562074.11498.125.camel@linuxfoundation.org>
References: <1456441355-13599-1-git-send-email-joseph.lutz@novatechweb.com>
	<1456562074.11498.125.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 27 Feb 2016 23:18:34 +0000
Message-ID: <CAJTo0Lbjf1LRSZf1DnKg-iiTu5Yc=rn7kO8nzZvL5Tdbgmvtdw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] automake: remove patch
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
X-List-Received-Date: Sat, 27 Feb 2016 23:18:53 -0000
Content-Type: multipart/alternative; boundary=001a11377682a22915052cc8a3a7

--001a11377682a22915052cc8a3a7
Content-Type: text/plain; charset=UTF-8

On 27 February 2016 at 08:34, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This breaks the builds:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/bui
> lds/652/steps/BuildImages/logs/stdio
>

I've just sent a small patch to allow *.pyc to get packaged into cracklib
so this should be resolved.  I'll test again when mut next runs.

Ross

--001a11377682a22915052cc8a3a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2016 at 08:34, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":22z" class=3D"a3s" style=3D"overflow:hidden">This breaks =
the builds:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-mips-=
lsb/bui
lds/652/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/bui<br>
lds/652/steps/BuildImages/logs/stdio</a></div></blockquote></div><br>I&#39;=
ve just sent a small patch to allow *.pyc to get packaged into cracklib so =
this should be resolved.=C2=A0 I&#39;ll test again when mut next runs.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a11377682a22915052cc8a3a7--
