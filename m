Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id BFC296AE73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 16:29:31 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id va2so1832182obc.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6l/tLipK5A1Xmuxl8Bi/aZ9LSnAAc6B1xJkh8wIzV4g=;
	b=OZsI0hX4lgzzkiJux9eOM69vGPkPUMzGVgFaUrkKzssKpIz7uRnGqwEWtGsqOEqBIR
	WQrSwVB45MPh7C9FL67yzDe4do6NGUf9PmvtziL5Fv18/7Hde5xMTme7PwSJ6uyOamQy
	UTdDWoxfTOFrD4P9MNVKDvf4nz+/kol0NP0mhIyFskH3r7cWmxP/V+4pm5Dz1Cj+xVV6
	UYmgr4Q+kS9QKkaUohMwv08fJZZzBhXP6NDS8I99FiHX8+z49q4gQVDgon0nIyyCkKnP
	pBuEU6zSslF0Bhovz9Sq07zw5PvgaDS0Yr5ztWsiOZhd4rAktCt33hZMlReyGuqxP1Va
	OlfQ==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr1850454oep.32.1389716972516; Tue,
	14 Jan 2014 08:29:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 14 Jan 2014 08:29:32 -0800 (PST)
In-Reply-To: <1389716791-22080-1-git-send-email-otavio@ossystems.com.br>
References: <1389716791-22080-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 14 Jan 2014 14:29:32 -0200
X-Google-Sender-Auth: _V_n-wZmUxaXNb4jeS7sZxhVv9E
Message-ID: <CAP9ODKptsDqbRyYJq8NcvBMAK1QZ8rAkks575owrvbmMMZkQRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [for-dora][PATCH] gcc-4.8: Backport PR c++/57532 fix from 4.8.2
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
X-List-Received-Date: Tue, 14 Jan 2014 16:29:31 -0000
Content-Type: multipart/alternative; boundary=001a11c253807c3c8b04eff0b26f

--001a11c253807c3c8b04eff0b26f
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am adding Khem and Robert in Cc so they can review the patch...

On Tue, Jan 14, 2014 at 2:26 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57532
>
> Log:
> r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines
>
>         PR c++/57532
>         * parser.c (cp_parser_ref_qualifier_opt): Don't tentatively parse
>         a ref-qualifier in C++98 mode.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c253807c3c8b04eff0b26f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hello,</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">I am adding Khem and Robert in=
 Cc so they can review the patch...<br><br><div class=3D"gmail_quote">On Tu=
e, Jan 14, 2014 at 2:26 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Bug: <a href=3D"http://gcc.gnu.org/bugzilla/=
show_bug.cgi?id=3D57532" target=3D"_blank">http://gcc.gnu.org/bugzilla/show=
_bug.cgi?id=3D57532</a><br>

<br>
Log:<br>
r200836 | jason | 2013-07-09 14:52:17 -0300 (Tue, 09 Jul 2013) | 3 lines<br=
>
<br>
=A0 =A0 =A0 =A0 PR c++/57532<br>
=A0 =A0 =A0 =A0 * parser.c (cp_parser_ref_qualifier_opt): Don&#39;t tentati=
vely parse<br>
=A0 =A0 =A0 =A0 a ref-qualifier in C++98 mode.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br></blockquote></div><div><br></div>-- =
<br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">=
http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossys=
tems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-311" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (3=
47) 903-9750</span></span><br>
</div></div>

--001a11c253807c3c8b04eff0b26f--
