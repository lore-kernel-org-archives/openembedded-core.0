Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 83EB7731A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 22:15:45 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id h190so30676446ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F1LcOmHfajM8t5KDsgobHb7q/SfOwdxeOQ80/CqKJew=;
	b=X1iiCUNVdf3TD7NqA0Y+pz19XSiAXfdQ6L6VHdb0+nmp3g+yqayB/USgVzq2g4M6OF
	be3orvw2J/+umy6gjDlyp3uDTyjYQTWoTrYT0dOS1JYuzvPLyX8kw1ZUSfM5RWzKUdK1
	9neEH+WZe64iXM0qmAcpJqXBH56zmzO1zR/DGDwknWq08c8xTL/TfTHwvA42H5lglwCX
	BVsZoh++I+H/HZQUd/8VNEC0qKInu5PTIg4ztYRIS+rjWozEt2+D3DF1TblHFyf/uFA8
	njdtRsGsDyVP4sDzykpsNC/f86kvzfRTww73Kt0O3iktlgJtkd5eg5QgKHHvR67NmF8G
	CWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F1LcOmHfajM8t5KDsgobHb7q/SfOwdxeOQ80/CqKJew=;
	b=K+lqt5dACJwNNLZdcmsqbHJd54KUFZ0snHqUwSzfImFKerdxvmylVCQkuy6ob14Ofq
	e4JpyWA422Fb+PwzgitEvCHuyGQAH2Y9LQQqlNYe1rejBxtFgkLtlx0LZVkfE1PKOtey
	F5xIm62RjjqDR9jcBuwbcDpsaoBobi7wXgUwgM7bV1mIFnVIcGeE5nJUrPQ8Bl+rxCOj
	PcuzPpobYrjl70rQfIDeNPmOGBizooMMWW9rM/ixojhbhCs2dbqRr4XjHm5lgBa2uJ5k
	RV1zlK/XNk2OzM/J1Vg/EXQ2YQVenJ/cpaha+hYnvuHATlQrzwp9mzgNC55JtueARc5w
	MXrQ==
X-Gm-Message-State: ALyK8tLCON6hevUWtVA6/un8FtLviaGbMHtfTD9JFBUjC8PQ2HfyLzTA2F3in7h8gZJQMvRVPoZPNhSU2K0ZpPA9
X-Received: by 10.36.121.21 with SMTP id z21mr24910017itc.38.1468620945558;
	Fri, 15 Jul 2016 15:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 15 Jul 2016 15:15:26 -0700 (PDT)
In-Reply-To: <25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Jul 2016 23:15:26 +0100
Message-ID: <CAJTo0La03=kJ14FYFFpNYzbpmUnC5vzy4R+XKzm3naqycAEZ7A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Fri, 15 Jul 2016 22:15:50 -0000
Content-Type: multipart/alternative; boundary=001a114a95a0c52e3d0537b3f50a

--001a114a95a0c52e3d0537b3f50a
Content-Type: text/plain; charset=UTF-8

On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>

This breaks with musl:

| ../wayland-1.11.0/src/scanner.c: In function 'find_enumeration':
| ../wayland-1.11.0/src/scanner.c:811:2: error: unknown type name 'uint'
|   uint idx = 0, j;

Ross

--001a114a95a0c52e3d0537b3f50a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2016 at 11:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":3i8" class=3D"">Signe=
d-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">ju=
ssi.kukkonen@intel.com</a>&gt;<br></div></blockquote></div><br>This breaks =
with musl:</div><div class=3D"gmail_extra"><br>| ../wayland-1.11.0/src/scan=
ner.c: In function &#39;find_enumeration&#39;:<br>| ../wayland-1.11.0/src/s=
canner.c:811:2: error: unknown type name &#39;uint&#39;<br>| =C2=A0 uint id=
x =3D 0, j;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a114a95a0c52e3d0537b3f50a--
