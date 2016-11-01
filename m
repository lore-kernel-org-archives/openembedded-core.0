Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 91BAB71C40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 17:45:48 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id p16so98517023qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GPo3HaOZgVbBUzflrHnL8EbSxsA4gHU0Y16BMxptb/g=;
	b=wsmNbGsaV27WaY81XLLZULpyMjionmCJ/xF26ABpzBN7b/a8kyoWej8EmvH9Qor7s8
	QuIhCqlPu5TfYGVyE3od/bQosFLqKLc0g7Wik+WIz3RzU2kah/PhI/ednhJ6Qlh8DpU1
	l3bzs9Gf0YaCM7d3tpbmxfmbJDba/bhex349PJbsVY4SkAdKx0om9Z6kGY78O549kuwg
	fJjUJUOAL0ZCLRmVXo7QGIsc1JAAaf9DZCys9/Znfvh8mvDK7os6qZ+ntIgMvOrqVOyR
	y86VF3GCapwLgPBwm9YpGJE+OxU4BWgzOjLfaRT6radlRj6keUZ3J/8etpBf53c+NSal
	iKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GPo3HaOZgVbBUzflrHnL8EbSxsA4gHU0Y16BMxptb/g=;
	b=VYGqUvrZjuZGcgTWqR6wmSh8/nO1k565MxfupgnUnZtih/dy6zWrCCRPVKpiLvtdvn
	0HzMnwAjcIalOB9JsWVfy3qmwxjfEQD7KaIgqk6paUj0oQg5zzKcp0RXRpIsq2EblWyl
	m8xhtBfv3bhN8D0ljtV0YDXFyJKjJLnIKL9d9bqrC4NBE/qloevPRO8WedUUNhUtAJrw
	Tm+zOizIcoD8VPYvYhqeRP3mQ3KKTrXgh8GEw8Q+hVNKQTR3gxiYYndsqeBbvXtJfkzL
	uY77iDHc0ikeOj+uEUGYQe8IsqTCduwCu0vTuLnXrSPqKCPYN2qSx8BwbQ9k99WmCYkP
	+jGA==
X-Gm-Message-State: ABUngvdxs32VN4QrKTd/8z8Sl5dGg6FPRzJM5TJswDVeLS8RLNazrpzaWuXHHKcxee0BndxvFrqA6Idk6EpVGvnp
X-Received: by 10.200.50.35 with SMTP id x32mr25960852qta.78.1478022349722;
	Tue, 01 Nov 2016 10:45:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Tue, 1 Nov 2016 10:45:29 -0700 (PDT)
In-Reply-To: <1477464673-6184-1-git-send-email-michael.blaettler@siemens.com>
References: <1477464673-6184-1-git-send-email-michael.blaettler@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Nov 2016 17:45:29 +0000
Message-ID: <CAJTo0LavsVSZTR7M_9Ph3g5dfgKV-qc6a83H2H0YimsYFh-VfA@mail.gmail.com>
To: =?UTF-8?Q?Michael_Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] package.py: New EXTRA_STRIPFLAGS variable
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
X-List-Received-Date: Tue, 01 Nov 2016 17:45:51 -0000
Content-Type: multipart/alternative; boundary=001a1143e1da204ce6054040e535

--001a1143e1da204ce6054040e535
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 October 2016 at 07:51, Michael Bl=C3=A4ttler <michael.blaettler@sieme=
ns.com
> wrote:

> +++ b/meta/lib/oe/package.py
> @@ -10,7 +10,7 @@ def runstrip(arg):
>
>      import stat, subprocess
>
> -    (file, elftype, strip) =3D arg
> +    (file, elftype, strip, extraflags) =3D arg
>

This causes sysroot_strip to fail:

File: '/home/ross/Yocto/poky/meta/classes/staging.bbclass', lineno: 164,
function: sysroot_strip
     0160:            elf_file =3D int(elffiles[file])
     0161:            #bb.note("Strip %s" % file)
     0162:            sfiles.append((file, elf_file, strip))
     0163:
 *** 0164:        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)

Ross

--001a1143e1da204ce6054040e535
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 October 2016 at 07:51, Michael Bl=C3=A4ttler <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:michael.blaettler@siemens.com" target=3D"_blank">michael.bl=
aettler@siemens.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gm=
ail-:18y" class=3D"gmail-a3s gmail-aXjCH gmail-m157ffca7583f50b0">+++ b/met=
a/lib/oe/<span class=3D"gmail-il">package</span>.py<br>
@@ -10,7 +10,7 @@ def runstrip(arg):<br>
<br>
=C2=A0 =C2=A0 =C2=A0import stat, subprocess<br>
<br>
-=C2=A0 =C2=A0 (file, elftype, strip) =3D arg<br>
+=C2=A0 =C2=A0 (file, elftype, strip, extraflags) =3D arg<br></div></blockq=
uote></div><br><div class=3D"gmail_extra">This causes sysroot_strip to fail=
:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">File=
: &#39;/home/ross/Yocto/poky/meta/classes/staging.bbclass&#39;, lineno: 164=
, function: sysroot_strip</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=
=A00160: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_file =3D int(elffiles=
[file])</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A00161: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#bb.note(&quot;Strip %s&quot; % file)</di=
v><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A00162: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0sfiles.append((file, elf_file, strip))</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A00163:</div><div class=3D"gmail_extra">=
=C2=A0*** 0164: =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.utils.multiprocess_exec(sfile=
s, oe.package.runstrip)</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div></div>

--001a1143e1da204ce6054040e535--
