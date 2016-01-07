Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 31DE66FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:32:35 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id h5so16695611igh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ox7ykPSHmaqJK7Pg1zCOcasRi26smnO0gFS2TGnWHg4=;
	b=rfOmqvggLUvNQO3n2S6VQfLBuMKsi/ZqvFrLb271Y5IDTPFywSSDM2KtP+1zUBnbCg
	lEjPxTP11sj6GyhnEiAphkvghT4LFNjifKoLRnooagMxvdYLOKWfq3WdQic909W29NOV
	4Y/+g4aVoS4iurNEba3IGs/N67zJIk5pjNga5rv7yWh45dNgw3JRSN3DRUzPdtlT2JTd
	VIC5vbSZifOvXQK7aUJ/d/M+NFf+W+WIdMFo0lPBHu3WCcsXzPWj0KnICuQGK+e3RvVe
	4u1k/aV+0bHJUHJLrQfkr8dkArXGIXeSfKryYQbhOEP9f6IHTlFzFX50Q8lDi1aJTxB2
	5FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ox7ykPSHmaqJK7Pg1zCOcasRi26smnO0gFS2TGnWHg4=;
	b=DIsBznjAl4cZ1wHGqTGE5jW9Z51rkrSQbP5Q2TKZXarE7gO1wYh0CMogg5h90uLBei
	QFuzFM7eDdIgV+5CtieZ6WvyIhGPwfVjSJO6I65aZUNdW+UB+JfcvvM7p7x+VoFTid68
	jkJmKr2EVnJ+cv864nW/fSPmAu7zfCdBaRLY48kSNyGmB1LLpcSMC5PIRY4x3jfQbTE0
	3uh6pLunY3tiE/xuNsh0ULgfwC1EmVvGpAmljlmvoM+eYlZo39Q6tja0BgMmvON0GS1r
	e21WfB3vYsePewqU6PrAiMoTg92xBm7SHUQVaXuh5oJi0q8Mli8LXSNS5oM46e4WxbcF
	vKZg==
X-Gm-Message-State: ALoCoQmksohOipfuEJRabPHts1U5ZQSBzvJto4modjCyHHg6QdIbyybO9YLFZf5K8yEDsP6n1WNQpmnwrcdXDGPZoKSYnrDaQxciw2smN6mpASA8kQozOEo=
X-Received: by 10.50.111.111 with SMTP id ih15mr14429753igb.78.1452180756249; 
	Thu, 07 Jan 2016 07:32:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 07:32:16 -0800 (PST)
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 15:32:16 +0000
Message-ID: <CAJTo0LbtH+=faMv7DpSbhsmaB6A9DmXkDSwAk6YA4cvGi7c_qg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] musl fixes phase 2
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
X-List-Received-Date: Thu, 07 Jan 2016 15:32:37 -0000
Content-Type: multipart/alternative; boundary=089e0149be34205b540528c02ef0

--089e0149be34205b540528c02ef0
Content-Type: text/plain; charset=UTF-8

Hi Khem,

I just reviewed this series again and there's still some patches that need
tweaking:

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> Khem Raj (17):
>   powertop: Include right headers for timval struct
>

Missing Upstream-Status.


>   dhcp: Include sys/types.h for u_int* defs
>

Missing Upstream-Status.


>   blktrace: Include <sys/types.h for dev_t
>

Missing Upstream-Status (Status doesn't count, there's machinery about this
tag now)


>   fts: Add recipe
>

Every patch is missing patch explanation / signed-off-by / upstream-status.

  libcgroup: Add dependency on fts when building on musl
>

The U-S is Pending but the commit isn't from you - was this actually a
backport or just a patch that eg buildroot is carrying?

  linux-libc-headers: Port patches for linux-headers for musl
>

Patches are missing signed-off-by.


>   gdk-pixbuf: Fix latent build  issue exposed by musl
>

This is a test that uses glibc features, so simply changing it to use
malloc isn't right.  This is already fixed upstream properly:
https://git.gnome.org/browse/gdk-pixbuf/commit/tests/pixbuf-lowmem.c?id=205a3b04e1216c1df199aec95185f7f48b8e0491

The rest are merged into ross/mut so can you please rebase onto that.

Ross

--089e0149be34205b540528c02ef0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">I just reviewed this series =
again and there&#39;s still some patches that need tweaking:</div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 December 2015 at 23:=
52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
"><span class=3D"">Khem</span> Raj (17):<br>
=C2=A0 powertop: Include right headers for timval struct<br></blockquote><d=
iv><br></div><div>Missing Upstream-Status.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex">
=C2=A0 dhcp: Include sys/types.h for u_int* defs<br></blockquote><div><br><=
/div><div>Missing Upstream-Status.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
=C2=A0 blktrace: Include &lt;sys/types.h for dev_t<br></blockquote><div><br=
></div><div>Missing Upstream-Status (Status doesn&#39;t count, there&#39;s =
machinery about this tag now)</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=C2=A0=
 fts: Add recipe<br></blockquote><div><br></div><div>Every patch is missing=
 patch explanation / signed-off-by / upstream-status.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex">=C2=A0 libcgroup: Add dependency on fts when building on mu=
sl<br></blockquote><div><br></div><div>The U-S is Pending but the commit is=
n&#39;t from you - was this actually a backport or just a patch that eg bui=
ldroot is carrying?</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex">
=C2=A0 linux-libc-headers: Port patches for linux-headers for musl<br></blo=
ckquote><div><br></div><div>Patches are missing signed-off-by.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">=C2=A0 gdk-pixbuf: Fix latent build=C2=A0 issu=
e exposed by musl<br></blockquote><div><br></div><div>This is a test that u=
ses glibc features, so simply changing it to use malloc isn&#39;t right.=C2=
=A0 This is already fixed upstream properly: <a href=3D"https://git.gnome.o=
rg/browse/gdk-pixbuf/commit/tests/pixbuf-lowmem.c?id=3D205a3b04e1216c1df199=
aec95185f7f48b8e0491">https://git.gnome.org/browse/gdk-pixbuf/commit/tests/=
pixbuf-lowmem.c?id=3D205a3b04e1216c1df199aec95185f7f48b8e0491</a></div><div=
>=C2=A0</div><div>The rest are merged into ross/mut so can you please rebas=
e onto that.</div><div><br></div><div>Ross</div><div><br></div></div><br></=
div></div>

--089e0149be34205b540528c02ef0--
