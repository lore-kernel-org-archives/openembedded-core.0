Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2F4A70788
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:34:59 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gl10so1209660lab.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Jl8v38ISso7lPHKm0rcD8KOFatGZF9oVlVI5zqMvkIw=;
	b=x8FB/MmGxFscZzGcy81BqLBNdr/1srsN2cYW9+Ak8WZ+gOFu2AThUBut/W3JSMgdIX
	289nZNN9AMxPgoxydtazizGdpwe6hYRAHfkBYXBebHEvuMY0clCjqZRWMQSFtnj+KNnS
	Yg3Xv2Tzop3p8C6oW69Zn/uX0/bMFBKqaqOthc8LuJmWoBnEv7carvJpnSz/YGJt0CSX
	lVoFWmUZAogKQHnT2tuJDjkAD1wjFkLNLdOespy3Om8bNAi4qWpDEvHwnq3Hqx90lnnG
	CGno75BUNipL4IO3VjTL4uzmPbhdWteKC6wAd1I2F3i+1yo64uFT4X9xnv/2E04WRfeq
	aUKQ==
MIME-Version: 1.0
X-Received: by 10.152.37.71 with SMTP id w7mr3229959laj.90.1406136899769; Wed,
	23 Jul 2014 10:34:59 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Wed, 23 Jul 2014 10:34:59 -0700 (PDT)
In-Reply-To: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
References: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
Date: Wed, 23 Jul 2014 19:34:59 +0200
Message-ID: <CAPbeDCmQTX87xPSrfRxZP_96uH-Jg5uFTDv0iC-jV0n+6_znFA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] perf: split package
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
X-List-Received-Date: Wed, 23 Jul 2014 17:35:04 -0000
Content-Type: multipart/alternative; boundary=089e0160b5de6a9d5c04fedfc206

--089e0160b5de6a9d5c04fedfc206
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 21, 2014 at 4:03 AM, Chong Lu <Chong.Lu@windriver.com> wrote:

> Currently, perf can't split to perf-archive, perf-tests, perf-python and
> perf-perl. All files are included in perf package.
> Change the files paths to make split successfully and add perf package
> RDEPEND on the other four to keep it consistent.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 20968f9..9f9741e 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -157,6 +157,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>
>  RDEPENDS_${PN} += "elfutils"
> +RDEPENDS_${PN} ?= "${PN}-archive ${PN}-tests ${PN}-python ${PN}-perl"
>

Is this correct ? First RDEPENDS is appended "elfutils", won't this make it
pointless to add a default value in the line below ?

--089e0160b5de6a9d5c04fedfc206
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jul 21, 2014 at 4:03 AM, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Currently, perf can&#39;t split to perf-arch=
ive, perf-tests, perf-python and<br>
perf-perl. All files are included in perf package.<br>
Change the files paths to make split successfully and add perf package<br>
RDEPEND on the other four to keep it consistent.<br>
<br>
Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com">Chong=
.Lu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" target=3D"_blank"=
>perf.bb</a> | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" target=3D"=
_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" t=
arget=3D"_blank">perf.bb</a><br>
index 20968f9..9f9741e 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" target=3D"_blank"=
>perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" target=3D"_blank"=
>perf.bb</a><br>
@@ -157,6 +157,7 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python=
&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;elfutils&quot;<br>
+RDEPENDS_${PN} ?=3D &quot;${PN}-archive ${PN}-tests ${PN}-python ${PN}-per=
l&quot;<br></blockquote><div><br></div></div>Is this correct ? First RDEPEN=
DS is appended &quot;elfutils&quot;, won&#39;t this make it pointless to ad=
d a default value in the line below ?<br>
</div></div>

--089e0160b5de6a9d5c04fedfc206--
