Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3F06371C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:27:01 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a72so129705003qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N40imBcQSjzi7tJMXqENme/jPHXnyRAJUtBCorcELf0=;
	b=kfYXK5kzdSAz6GMw6oBGmzvz1IQT5npxV3QSUM7FCubUQrpRGpHpK7VwR2tnpAAcQz
	rB38eK9u6zQwhFyIRYWtCldHJ+6qTkL7qjRM6z0hxy7h/uJDzDknS/jQQfiaZHq8pqkt
	naAWH6iyFlln1ICxgunUoSwGzqyyEpaXvspX0EzMyooxL79meQw3T3pW4Ry8c4YImAn+
	+MKUSZKVKYM5vDVQ1H3FqTqcNKbhvLmWnHV1n+wWUFIWW8wZW7+gPI10fJovx/Kew0bg
	38We0v7D1Y23js7aAYYT1pN1H+tvGwJUDi2rooSeQNAHqIOR7IErbX/7lnykULNwoEEv
	ZubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N40imBcQSjzi7tJMXqENme/jPHXnyRAJUtBCorcELf0=;
	b=W9HKPSywrtSK9xzubSHzKJSL+O6g5BgfpHl5RHqT3Hwo6hoRPNcX8L95lJAFuUGRzb
	iQKTwQPkhRQvPVXXkTWBnSSbTR7u2ye36PJJ9vgY0HsuUqh3cPXSWV4AYTQEZF/hkeoI
	YtxbpIslVJ8VRwcgzp/G1aaa82b1wZ6lt70d4aONV7k6mQHyDQn9kutNp6dRcBLsfxGs
	6oDWIQSUJqhYxFtIGOWIRpqdDAQgyEWtkAdvlRWorb+dMXYUjnBM4B1KcN7VM4lQnMr1
	N4d5JxcFUNQJAq4Z5DNpEEmef++K5efQsZRcG9Hu4cwTS2sBHtW4q97GIlzZIKwEu+PQ
	rAKg==
X-Gm-Message-State: AODbwcAWnkWZd7g+7jnLkik9sONBzwGvjDSkc1fDDRiWBlU3OL8LNQnR
	JmFU1j0MBRBlorOb4ytpffnScZiTmRWt
X-Received: by 10.55.140.65 with SMTP id o62mr24666708qkd.127.1495546023211;
	Tue, 23 May 2017 06:27:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 06:26:42 -0700 (PDT)
In-Reply-To: <c230f1be6916430ab80979215c6141b6@PLEXTEK-EXCH1.plextek.lan>
References: <62b9d549e24c4b989a50dc565324e7e7@PLEXTEK-EXCH1.plextek.lan>
	<CAJTo0LYzC5QfMm1zWZntwq9862_UpxdUp0zMLBz0V3OVLPqcNw@mail.gmail.com>
	<c230f1be6916430ab80979215c6141b6@PLEXTEK-EXCH1.plextek.lan>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 14:26:42 +0100
Message-ID: <CAJTo0LbsyDheS7wS=ByZkAvDiJFyaro44kjoOTY+LFmHh=Dn5g@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 May 2017 13:27:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c05430e758f5b055030f1b8"

--94eb2c05430e758f5b055030f1b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 23 May 2017 at 14:24, Alan Levy <alan.levy@plextek.com> wrote:

> Thanks for the advice. What I belatedly realised was that I was using HTM=
L
> format rather than plain text and that was losing some of the formatting =
in
> the process. I re-sent it in plain text and this time it hasn=E2=80=99t b=
een
> rejected (yet). Also, I wasn=E2=80=99t 100% certain whether the system wo=
uld accept
> a patch from an email address that wasn=E2=80=99t the same as the one the=
 patch was
> signed with. I can=E2=80=99t find any examples in the archive =E2=80=93 w=
ould it actually
> work?
>
>
I believe if you tell GMail that your work email is a valid alias it will
let you send from it though the SMTP server.

Ross

--94eb2c05430e758f5b055030f1b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 14:24, Alan Levy <span dir=3D"ltr">&lt;<a href=3D"mailto:=
alan.levy@plextek.com" target=3D"_blank">alan.levy@plextek.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&qu=
ot;;color:#1f497d">Thanks for the advice. What I belatedly realised was tha=
t I was using HTML format rather than plain text and that was losing some o=
f the formatting in the process.
 I re-sent it in plain text and this time it hasn=E2=80=99t been rejected (=
yet). Also, I wasn=E2=80=99t 100% certain whether the system would accept a=
 patch from an email address that wasn=E2=80=99t the same as the one the pa=
tch was signed with. I can=E2=80=99t find any examples in the archive
 =E2=80=93 would it actually work?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>I believe if you tell GMa=
il that your work email is a valid alias it will let you send from it thoug=
h the SMTP server.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c05430e758f5b055030f1b8--
