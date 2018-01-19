Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id B03DE78695
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:02:47 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m11so5119949iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W2Ijomi7zgogxzvfXbuSTnv2YDkGNRY8L9rs3CGksGE=;
	b=T9xRK6FhL3hY3gjL/oPOeFoLJcj7b3D3foTI5jo05f0OCE0tsARs10RqJcuz7yXRX2
	BPM6Jct6dljrWQlKLmiWoESQIJUB0F2r6oDzhPDKDzh9kxXyEyOjP81ZQCJPJOCzT/47
	K2vuJgtPviJnIB6FFYdRW6nvAxu/aTtv0zI49Y8Nbv37JzV0sHwgqp1Q7aVztewdxdUt
	BPGaRl9UzL/69n0G2xfQXGrkpOPXfzeH9IsINBiqpfKnPPzM/vMMREVaRZRTLI8CWbta
	+R/A5hcs6U1olu/Hhue3l/OSwMdPM10Sy5BghTmT6NuVuH7omf/aQySHo5j7SdAhrfaD
	XcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W2Ijomi7zgogxzvfXbuSTnv2YDkGNRY8L9rs3CGksGE=;
	b=Bmlgmf81VvFJ+ocs0nmWwazbrt/bKkL7dCfjxpuMzu4GrCAkicACiurEkEDCOw4Xd3
	4kKfEq1YIDK6QUd0+V5h+jcZoQ9cxpTukJUYT9BbnJWRhrZOq3QLe7y6aouOOAgl59+9
	BxtzIN11TMuHMSbZ5TiYBMtltXo5xpobu0cp22F9Sp6zX188AQgEFbyPdj6WQeAQgue2
	NfxygetRX1p4/PSP5iNrSY6ktHMuQUx42wjBCTSeMXoY1sRzehqVNnFaW18jt0O6CJaP
	Sn0emWpK2SzUaFFbf/TTj18+tzqWqkEQVd8qwuNn0rQrGg5ddQ5iu7V8AfkKn5P+8M9K
	SVfw==
X-Gm-Message-State: AKwxytdFgdh49hJtkANg/G5p3sRYpeG2zEJlDNaCYfwO965Hl46yzr/L
	3O3tI4u0PlBtSA+aUA+tCDqMbW4mZbvvLYCcRGvpkQ==
X-Google-Smtp-Source: ACJfBosx4FHntgb9mvl3Jjc6R4phf3gAwEiqr8/gJoZPFk/uU0lFFDu9tHin7PV05tKhmDZnVhz3XpiorQYh9JjkWxQ=
X-Received: by 10.36.215.69 with SMTP id y66mr30988275itg.10.1516370568828;
	Fri, 19 Jan 2018 06:02:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 06:02:28 -0800 (PST)
In-Reply-To: <CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 14:02:28 +0000
Message-ID: <CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 14:02:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc441a7aa30563218936"

--94eb2c0afc441a7aa30563218936
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 13:58, Martin Jansa <martin.jansa@gmail.com> wrote:

> It fails here since this upgrade, maybe the 0001-Do-not-disable-gobjec
> t-introspection-when-cross-comp.patch is still useful and wasn't
> completely merged upstream?
>

The patch was to let G-I work when cross-compiling, so it's unrelated.


> FAILED: json-glib/Json-1.0.typelib
> json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper
> json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use
> --includedir
> error parsing file json-glib/Json-1.0.gir: Failed to parse included gir
> GObject-2.0
> If the above error message is about missing .so libraries, then setting up
> GIR_EXTRA_LIBS_PATH in the recipe should help.
> (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
>

What MACHINE?

Ross

--94eb2c0afc441a7aa30563218936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 13:58, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>It f=
ails here since this upgrade, maybe the=C2=A0<span style=3D"font-size:12.8p=
x">0001-Do-not-disable-</span><span style=3D"font-size:12.8px">gobjec<wbr>t=
-introspection-when-</span><span style=3D"font-size:12.8px">cross-<wbr>comp=
.patch is still useful and wasn&#39;t completely merged upstream?</span></d=
iv></div></blockquote><div><br></div><div>The patch was to let G-I work whe=
n cross-compiling, so it&#39;s unrelated.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div>FAILED: json-glib/Json-1.0.typeli=
b=C2=A0</div><div>json-glib/1.4.2-r0/recipe-<wbr>sysroot/usr/bin/g-ir-compi=
ler-<wbr>wrapper json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib=
</div><div>Could not find GIR file &#39;GObject-2.0.gir&#39;; check XDG_DAT=
A_DIRS or use --includedir</div><div>error parsing file json-glib/Json-1.0.=
gir: Failed to parse included gir GObject-2.0</div><div>If the above error =
message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH=
 in the recipe should help.</div><div>(typically like this: GIR_EXTRA_LIBS_=
PATH=3D&quot;${B}/<wbr>something/.libs&quot; )</div><div>ninja: build stopp=
ed: subcommand failed.</div><div>WARNING: exit code 1 from a shell command.=
</div></div></blockquote><div><br></div><div>What MACHINE?</div><div><br></=
div><div>Ross</div></div></div></div>

--94eb2c0afc441a7aa30563218936--
