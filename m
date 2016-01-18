Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id E49F36FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:05:50 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id py5so189330758obc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=PK15/W/e1TcNMO7bPX2k+LegQ4Jgez5WYcXYsr7wA/s=;
	b=WlV+okhD4KQnAGzqLq2T+U+hwxMv0+0APAzqINXVQBq5NL/exabay5ZCi5s0rwMxKp
	z4FRdRKcPbO9SuEHiU7s0jvZkG6opKPQ+hTixzSOaVkbnmaUUYn0mQzQr0RpmzmUDT2R
	rCiig25QkP82Zd+AtXHMTkep+BGNzlHWtBcxlCB7XQ/CyOYUm89GzqTf+le8mTfPSDAR
	4h+uFn5o9EgYlZAVQsjBKnaGoI/0Cxl7WORZLsrgl/Tofk4RJ8SThdWbPaFPEWTnpRT7
	thxqHyjNJcO6x7LgNnYA83ZdYtcwaeJbBtVPIuuiyyCQ4byNv7jTkXZyHUoBFEo6JAKk
	DtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=PK15/W/e1TcNMO7bPX2k+LegQ4Jgez5WYcXYsr7wA/s=;
	b=La8xMzVPJjNeS5eg5ths7H7xB0uBXbH91xs2zJ/J1zGowjC9P26gWsED6udSkLAVrE
	03qQX/sp76M5LJniPuDibKL54BiuOwrLUvEGxt5qpFwdWVd9QIS4YoQROgWdI0FBaaDC
	zmNVPeD4hSY3S8nHmCvpDnXUURCLkBrt6YehoBbo5nR1MkBWxdMV09KbODhkNZW05lvN
	LIRFJ5Isp2br58sdJTXstByn4B0FJ1pO5NjXM7eS/IIxeKOSW7YVO/lPj6+8bHvryz5m
	ci+iLjX2Spv1Z5txcJOMELrPQQQCmKuEiOLd4fpmI5tQ233Y3RvxIpbBEdBJbCZj57Lg
	TEvw==
X-Gm-Message-State: ALoCoQnqLZtDevKaUOAP2NtmlJEnA3QKq24+gWzLNwSF8UIA/EFiWhDZc3U3bVPvAgQR93SqXmzkoAGozNZXrHmGSgVHEdpiQHDEJRm0dnM02A0zvn63gbY=
X-Received: by 10.182.200.162 with SMTP id jt2mr18667049obc.55.1453107950776; 
	Mon, 18 Jan 2016 01:05:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Mon, 18 Jan 2016 01:05:21 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 18 Jan 2016 11:05:21 +0200
Message-ID: <CAHiDW_HkT_KaN=1b93+CRoEQ7V5SS4e6DUe757546VMVd2CMfw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master][jethro] openssh: CVE-2016-1907
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
X-List-Received-Date: Mon, 18 Jan 2016 09:05:51 -0000
Content-Type: multipart/alternative; boundary=001a11c239303a0f6b0529980fc5

--001a11c239303a0f6b0529980fc5
Content-Type: text/plain; charset=UTF-8

Fixed the typo (jetrho instead jethro) in title, so the thread shows up in
the right searches/filters.

 - Jussi

On 16 January 2016 at 02:59, Armin Kuster <akuster808@gmail.com> wrote:

> Found two more commits for this CVE.
>
> Armin Kuster (1):
>   openssh: CVE-2016-1907
>
>  .../openssh/openssh/CVE-2016-1907_2.patch          |  65 ++++
>  .../openssh/openssh/CVE-2016-1907_3.patch          | 329
> +++++++++++++++++++++
>  .../openssh/CVE-2016-1907_upstream_commit.patch    |  33 +++
>  meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +-
>  4 files changed, 431 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c239303a0f6b0529980fc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fixed the typo (jetrho instead jethro) in title, so the th=
read shows up in the right searches/filters.<div><br></div><div>=C2=A0- Jus=
si</div><div><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
6 January 2016 at 02:59, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mail=
to:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">Found two more commits for this CVE.<br>
<br>
Armin Kuster (1):<br>
=C2=A0 openssh: CVE-2016-1907<br>
<br>
=C2=A0.../openssh/openssh/CVE-2016-1907_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 65 ++++<br>
=C2=A0.../openssh/openssh/CVE-2016-1907_3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 329 +++++++++++++++++++++<br>
=C2=A0.../openssh/CVE-2016-1907_upstream_commit.patch=C2=A0 =C2=A0 |=C2=A0 =
33 +++<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_7.1p2.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_7.1p2.bb</a> |=C2=A0 =C2=A05 =
+-<br>
=C2=A04 files changed, 431 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016=
-1907_2.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016=
-1907_3.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016=
-1907_upstream_commit.patch<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div></div>

--001a11c239303a0f6b0529980fc5--
