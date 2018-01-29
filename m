Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9A66B78678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:21:24 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d13so8418361iog.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Eja3ZipcGTRQd1KkrXSnbNZq0On9XRU3553xnnNV3k0=;
	b=AH1OBWk2xwQLBn/RIaUAg/oGHrqJUF4UOVOwpnwuKl8q2XbL3fbzzOkb3A1QgE8KYI
	OgNJXe8HhUO+9DYRJ9Dg7e2gwV43bhkmf642fg7xhezziwV2RYiFy5EzjlKNKy0C1JW1
	yEw8sVtMSYe4+bU707cM66ANQ4e59YAuuU5mX3OeL+eJG8ITWPn3FfGQxzg9HxWZciXc
	li/eb8kp7oLRHToaP7G9LAYpIi1/BumLJP8jqh5JxPCe5Sbzj3h3Z/l3+zwOG0xOu30x
	ts3oRgT486+j+AE9gNfOPLmdyFKC8a4vrxHSdbH7hVKFvgJ/em9b+k7sqyr4OuHzoSeE
	WROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Eja3ZipcGTRQd1KkrXSnbNZq0On9XRU3553xnnNV3k0=;
	b=ZteRocXDtlPiIQDR3UAjIfwDkkwGUnAnNTeTVuxNW7jlTgZH4SpnISJ6E+r7fE9YYg
	lTtPAw77fmQMjM+oih9oWBig5rNJ7I+ItCDUBDNQ/wGH/VtJ5+UZA5vt5gfzKAyjpTEq
	Jl+6agS6mAH1uZpkc/u2HOPdX58k9Vz9e8FpNNKdDmbbmWEQyWT2hf5upWGYw6GbnIwP
	gIjfMckS2HjK/LgsTaZkofBv8NjkjIzVNwwmVVWa+LlWDIc8GqQZH0VQckqKlrJVMIPz
	v8EY7dNNmdYdYR0Qo//Zo+aofnuElMz/IuxXbdQLy+A+/EUL9PwNUhW8sLN44C4Tx9e4
	4XOg==
X-Gm-Message-State: AKwxytfS40STpCkZ+v5yBA1OwOgRdzxv4dSaNhpS8rW6qz8MLxC+KXmj
	yJW3ZbeGCN5/wnp2yP6NaQenxpQ0GwxFutLglPlxoQ==
X-Google-Smtp-Source: AH8x227wcAQ47mhDF+WPR88jUiQWhBF9QOlk8FDuig5U9KhL4AnofqJ8dmQxlPCigvG90NCjloxdpGMW0wuOtodCwHg=
X-Received: by 10.107.133.75 with SMTP id h72mr26232886iod.227.1517246485502; 
	Mon, 29 Jan 2018 09:21:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 09:21:05 -0800 (PST)
In-Reply-To: <20180127070626.27581-1-raj.khem@gmail.com>
References: <20180127070626.27581-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 17:21:05 +0000
Message-ID: <CAJTo0LZ=m04zzX5XunL3Ht4t=b9dAiAfwdfkARcH6nyFTL1Y1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson: Adjust for clang compiler
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
X-List-Received-Date: Mon, 29 Jan 2018 17:21:24 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e4ce8f300563ed7920"

--001a113ec5e4ce8f300563ed7920
Content-Type: text/plain; charset="UTF-8"

On 27 January 2018 at 07:06, Khem Raj <raj.khem@gmail.com> wrote:

> Remove hardcoding c/c++ compiler to be gcc alone, its
> possible to use clang as replacement for cross compilers
> from meta-clang, therefore set clang/clang++ if
> TOOLCHAIN = "clang"
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/meson.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 91ac652651..cd3497a802 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -40,6 +40,11 @@ EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
>  MESON_CROSS_FILE = ""
>  MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>
> +CCOMPILER ?= "gcc"
> +CXXCOMPILER ?= "g++"
> +CCOMPILER_toolchain-clang = "clang"
> +CXXCOMPILER_toolchain-clang = "clang++"
> +
>

Can we do this in bitbake.conf instead of repeating ourselves?

Ross

--001a113ec5e4ce8f300563ed7920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 January 2018 at 07:06, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Remove hardcoding c/c++ compiler to be=
 gcc alone, its<br>
possible to use clang as replacement for cross compilers<br>
from meta-clang, therefore set clang/clang++ if<br>
TOOLCHAIN =3D &quot;clang&quot;<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
index 91ac652651..cd3497a802 100644<br>
--- a/meta/classes/meson.bbclass<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -40,6 +40,11 @@ EXTRA_OEMESON +=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;=
<br>
=C2=A0MESON_CROSS_FILE =3D &quot;&quot;<br>
=C2=A0MESON_CROSS_FILE_class-target =3D &quot;--cross-file ${WORKDIR}/meson=
.cross&quot;<br>
<br>
+CCOMPILER ?=3D &quot;gcc&quot;<br>
+CXXCOMPILER ?=3D &quot;g++&quot;<br>
+CCOMPILER_toolchain-clang =3D &quot;clang&quot;<br>
+CXXCOMPILER_toolchain-clang =3D &quot;clang++&quot;<br>
+<br></blockquote><div><br></div><div>Can we do this in bitbake.conf instea=
d of repeating ourselves?</div><div><br></div><div>Ross=C2=A0</div></div></=
div></div>

--001a113ec5e4ce8f300563ed7920--
