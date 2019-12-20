Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB7C7F3BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 11:27:06 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id t12so5805169vso.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Us87QVOJbGG7HY8FR7F/x3d5I0YLjmKC/VAbbu5fOLw=;
	b=PyKGz9Zg/EzGl0H0kcWh6SBBzpz2xZ3fkn7y9AxxFJHlPszdJY56bDNL//2Q1R1Hf+
	KT4E2h2H8pmWiQ8fLFb3RWfr2jbyM2Z5RPLjVJ+6uNBog7eIwDCTRIx2hFPvGhLdjs1O
	xM6W3sTqxNwRZFkIxlOTfb0Yfs0hVlcDuISJz+G3ektXvoK4e0zQEPiRXFKV+UojZLbk
	zhz43yVMmmgBsPDxvfDLqRdhfrg4kHLQNkEO/brsOuWFxVrJYznwv0K/uLK9ym2hUBJU
	RB4Fpbm1gCotftSziBTO5TDx/AclHhvvNX2c/59CCljigP02zTtCBsRnAbTLIpB/gwCh
	u4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Us87QVOJbGG7HY8FR7F/x3d5I0YLjmKC/VAbbu5fOLw=;
	b=HQcHwCi5s/w/OinTS7p1d26DC+o2iAvJZEKO1q0RZaz9TLtXOSsiYq26G491b+0Tfp
	xb4/KY7dghL+9fsQZea6yZiyXwtI21uOkQKfMDP3VWdLUc9k/khogRQICUW8ifFQKS/3
	drktwGMCKTNu2AiqOSic578KbCChEnpZz3EjZVKGHhqSfJE+8IwtReDW/tubZuxRYPFP
	UqqkGvm2IdXt97f88eolxGa3rqPClSLmxeKn+zs30P+bvct6Nr7UelkY/Be0SzWfDbiX
	KfQobljbc2MoNDfcEMtiWOR/F4OTab8uZpgXubIqb4e5e/wLdVuYEG/cKa0vU9P7j200
	Vo/w==
X-Gm-Message-State: APjAAAWy3lQeZmWd/2DxdsjoA4PNsNlMGXhRZX00qppDI10iMMXqC8vR
	baB+zUrJbJtIPfmryLWysqL36oU9g/ADSsi62vE=
X-Google-Smtp-Source: APXvYqyp5Ksr+fA3u7XPmwM7b+uVX23xrin24GReJwXvBilLX6/uW5EzFPUMgmHOI7r2X4ePYzqSyCZIHpOwHfsKSok=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr8022738vsq.94.1576841227387; 
	Fri, 20 Dec 2019 03:27:07 -0800 (PST)
MIME-Version: 1.0
References: <90324de7-7fd9-4861-bfe2-6f897e45607b@www.fastmail.com>
In-Reply-To: <90324de7-7fd9-4861-bfe2-6f897e45607b@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 12:26:56 +0100
Message-ID: <CANNYZj9dOo+iSEheSxSJLgBu7ySr0x2XSVQcUu0dGc11RNiRsg@mail.gmail.com>
To: fdk17 <fdk17@ftml.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Allow building the virgl driver to be configurable
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
X-List-Received-Date: Fri, 20 Dec 2019 11:27:06 -0000
Content-Type: multipart/alternative; boundary="00000000000039d653059a20f51d"

--00000000000039d653059a20f51d
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2019 at 12:21, fdk17 <fdk17@ftml.net> wrote:

> If a .bbappend file sets GALLIUMDRIVERS then virgl is always being
> appended to the list of drivers to be built. Make virgl an optional
> component.
>
>
Please also add it to PACKAGECONFIG defaults for the target then, as we do
rely on it being enabled by default in testing.

Alex

--00000000000039d653059a20f51d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 20 Dec 2019 at 12:21, fdk17 &lt;<=
a href=3D"mailto:fdk17@ftml.net">fdk17@ftml.net</a>&gt; wrote:<br></div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
u></u><div><pre>If a .bbappend file sets GALLIUMDRIVERS then virgl is alway=
s being
appended to the list of drivers to be built. Make virgl an optional
component.</pre></div></blockquote><div><br></div><div>Please also add it t=
o PACKAGECONFIG defaults for the target then, as we do rely on it being ena=
bled by default in testing.</div><div><br></div><div>Alex<br></div></div></=
div>

--00000000000039d653059a20f51d--
