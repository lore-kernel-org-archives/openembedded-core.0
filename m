Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8718971D9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:13:03 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id f55so126938635qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=psI7TDcEZTZYDwgcZuYGvUCnCai9SntR4r1pUPZMVo4=;
	b=dLCRLjKkYCWQJAtIY+lVZE6s2lAew6DLeMm9imNwJcONzbl5dF3cPe/6jc2A+axDuo
	ENiEm+w8xHBWeAU8LzRRDj4txC2q3Jme9oBtxaJe7FuW3ITpEnHG1uD0R5zoftdnJIPg
	iPYPGJvsf1z3Z34XT15tjYe7IZflTeICWxTGdoFdPYT78NoX0dGCIuXPvnqNWNZpJWoh
	mg1U6cxtX5DDBwgVkZralwo7ha7Ns85i15OWV/jbaR2lI9aNmw8SMz66ZtgArrbGwrZP
	T8iFK8BdSW2TCpRYAxIfmpnFdVI7ds8IeAvClKF+jI33wfdIrEHe9kyN65/LBPBez3BC
	+EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=psI7TDcEZTZYDwgcZuYGvUCnCai9SntR4r1pUPZMVo4=;
	b=Y8YMWq/snwq+nFcV94TC0RvZprCgojM4lXraz8Ds1bR54QXu03DXKcSR2pFbpnz61n
	dbD7R5lYbpTcJ1Y3sni/3JO9oBH6AiTkVh6ppLsbnW+QMXCpoz93HPMi+CN7RcATKUhB
	SgSbyotPfFUiz4bxfMK7DJcG6/CgoysrzGtMUL9faFjX4zQXjj37JlAeRNTYLJBF9tx+
	IMwjoitSflt9B41jlEvDvOuc/ZXz6tJpmUlHQenLPKsC6tQMyumRakw/FMj9gh8WS4b4
	Lcb70aQLobiZaAxTsEXqNzAPJFjpQtTyqH2H47DNOmkXjukGX+72zFxLDZc/qFEiWqst
	cO9g==
X-Gm-Message-State: AODbwcDdzrn6SP1ArZ64ERQR2DyaNuY0mziw+SAyQgKOaVJxYWJYOcxl
	QXw9iahZkS7CKlHbmx3STEJqEktEDM/8
X-Received: by 10.200.43.99 with SMTP id 32mr27557612qtv.6.1495545184524; Tue,
	23 May 2017 06:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 06:12:44 -0700 (PDT)
In-Reply-To: <62b9d549e24c4b989a50dc565324e7e7@PLEXTEK-EXCH1.plextek.lan>
References: <62b9d549e24c4b989a50dc565324e7e7@PLEXTEK-EXCH1.plextek.lan>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 14:12:44 +0100
Message-ID: <CAJTo0LYzC5QfMm1zWZntwq9862_UpxdUp0zMLBz0V3OVLPqcNw@mail.gmail.com>
To: Alan Levy <alan.levy@plextek.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: FW: patchtest: failure
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
X-List-Received-Date: Tue, 23 May 2017 13:13:04 -0000
Content-Type: multipart/alternative; boundary="001a1146fb4678310b055030bf1a"

--001a1146fb4678310b055030bf1a
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 13:04, Alan Levy <alan.levy@plextek.com> wrote:

> The patch applies correctly on my Linux development system but I'm having
> to copy it to a Windows PC and use Outlook to submit it because the Linux
> system has no access to email. I can only suppose that's why I get these
> errors. How do I fix this?
>

Yes, the line endings being changed will be the problem.  You could
register a gmail account or similar and send through that (git send-email
can talk directly to GMail SMTP).

Ross

--001a1146fb4678310b055030bf1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 13:04, Alan Levy <span dir=3D"ltr">&lt;<a href=3D"mailto:=
alan.levy@plextek.com" target=3D"_blank">alan.levy@plextek.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":28c" class=3D"a3s a=
XjCH m15c3532aea796812">The patch applies correctly on my Linux development=
 system but I&#39;m having to copy it to a Windows PC and use Outlook to su=
bmit it because the Linux system has no access to email. I can only suppose=
 that&#39;s why I get these errors. How do I fix this?<br></div></blockquot=
e></div><br>Yes, the line endings being changed will be the problem.=C2=A0 =
You could register a gmail account or similar and send through that (git se=
nd-email can talk directly to GMail SMTP).</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146fb4678310b055030bf1a--
