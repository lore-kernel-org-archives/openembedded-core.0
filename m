Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id A439B7D076
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:15:07 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id q9so8345090vsl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w2e9vD9dfLwXSZAgt8/CVfrg6RGZvyeJdHKOBwOcix8=;
	b=A+d1MEfjlCMoO7rrX7oK/YKoQab3xbz8RLjAyFTQLqmCWaITox89jZYjb6FpVvQnHh
	R9GdoakwPlvdpcakKE9rnWdkSuiqCnRShTlZ4zBTVt24eeK1JsN9NLRuD49WNfjeQXB9
	6YKUFF+TA7hOL2QRF99GxHd+Z0bT4iVZgVny0QaPz6/pd8qxyW3A0b6fnH7zBdL4iSJJ
	YfPqA+RYjZrVBX+p2khprb3VsJAYTTekgs9cdEQztDfPp7l1yooviqvmBbvq1eN3VfXz
	nL60rJrM7icf/f9uoIzY18jqzky8c5cYxp8/LVFbDdzqPKre680OcGBN0DjTgzMcQlaa
	IDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w2e9vD9dfLwXSZAgt8/CVfrg6RGZvyeJdHKOBwOcix8=;
	b=Gv9aH/DzebD2OfJh9Lf1n1U6cCaA+nBfStE6Qn/uKjFaWyPcJ9Ny1yigHEUjPrSkDk
	MhdkpG+zjt8g7KtVl24ITM5QWffJxRY9SN+xhJmYaNlSlhTVNeCue0++hIT1ToglfdPA
	XTojSuCBV0v10oTiXn08/RvtjcoWoVlWlCXTq8nPcTWrvUaUxPawZ4Y2YrLhRY155RWN
	wrwP6PEzWZAuxJ/aTWBZ/LmpQBtlk9kROZo8Pusee6SW0aUk2/Cox50ttqiT/1Rp4hD5
	bEOLs0JF2C3WSEvk3XkBf1PD7FkiT/KWzue3ML1/Vbdlq27PclIoyo5yCRC73nU/RkNv
	MgdQ==
X-Gm-Message-State: APjAAAXmgRV72MP+sIyzKH5mCTq42bGvkY68XoAyiKb9arNtH42wXVDn
	fBVdkEm1enNQLV04kQ496tp8Uy4wE9zRSxYHwZo=
X-Google-Smtp-Source: APXvYqzYAPcN34Ve6PVqXT6qlHW18l8AhAg4ICIi332uRvPd2qsYrkCZRq9KT0zCgSyMC6ehKM0H1wFY8SdQbhfBM1o=
X-Received: by 2002:a05:6102:1cb:: with SMTP id
	s11mr11156325vsq.25.1567620908623; 
	Wed, 04 Sep 2019 11:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
In-Reply-To: <20190904181009.8374-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 20:14:57 +0200
Message-ID: <CANNYZj-P2egu6X8-kVFKnNk_NHk6Z6Pme8BQZfh=AbCq-NJggw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:15:07 -0000
Content-Type: multipart/alternative; boundary="00000000000066ae390591be2f1e"

--00000000000066ae390591be2f1e
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:

>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "8.0.1"
>
> +# This should be bumped when python3 recipe's MIN_VER is bumped e.g. 3.7
> -> 3.8
> +PYTHON_BINABI = "3.7m"
> +
>

This is already set in python3-dir.bbclass, so please use the values from
there.

Alex

--00000000000066ae390591be2f1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr"><div dir=3D"ltr">O=
n Wed, 4 Sep 2019 at 20:10, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0# llvm version being used, so always bump it with llvm rec=
ipe version bump<br>
=C2=A0LLVMVERSION ?=3D &quot;8.0.1&quot;<br>
<br>
+# This should be bumped when python3 recipe&#39;s MIN_VER is bumped e.g. 3=
.7 -&gt; 3.8<br>
+PYTHON_BINABI =3D &quot;3.7m&quot;<br>
+<br></blockquote><div><br></div><div>This is already set in python3-dir.bb=
class, so please use the values from there.</div><div><br></div><div>Alex<b=
r></div></div></div>
</div>
</div>

--00000000000066ae390591be2f1e--
