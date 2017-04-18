Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 963EF600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:30:48 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id m36so128248774qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AkXnOlSfOeXaWPuUZnVjlpSMSfobM65OHcVl73XbU34=;
	b=CsOrakDelcgx2PQc21El72MRrPNXRUJKPdjieROBfKzVTT7BhDe6ho2+/VwCg0upCl
	+WEp656eoAcrh4Zt6aGKwjEPMVFiw/DXAk/ud7wG37L+gsubzWkxjTEvQyvNK9TmHkJ6
	oec3PcxeVWLv8L+XR7rnJ1cwagiNPk6m9OMICAocelEsDWbY6BI+/xH0IOhF4RYCFmj5
	j6LrhbdQ3GZ/D7BDzbWhAd9Q3jSWx5/4zcvTGw99MRpu6/r8q1BiPCOvTMLXcmD/wcxj
	kKcMTIGL+D4L1vrF2FEWSpP3pt+KrBTUKh7OS62jabivc3/jj3GmZE2Dt7zLfkTEXxCk
	wwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AkXnOlSfOeXaWPuUZnVjlpSMSfobM65OHcVl73XbU34=;
	b=Un1n1NfsvLQh3kbdK2Z5R4GDaA9PODTqqVcsA6aGsx1nmsRqG2LEt5YgLmI8sh6kGM
	aMoUQaK9p2LMd706WOYop3PfjbtvT7kVr+psTtlJkb7cgSwnrEiT7Vgxiw5EZiMFe4n6
	cCGnbY4N0Mk/xI4px97+i+akXITUC5UfSoAucagC1oh4qv8W2jl9Uke+oArGPXIQLixh
	dzi9qz1iEEUMGDGR9DN83nk9I5TD2hsOqcM1wAxPkbJEzGTlQGsKTkuYB7HQDWKGjvrW
	tomdZBonSfKhxQeX/W/QTqpvL69/yr8INISvRcwOzVRANDmx9MgfAKgl93oHoQKRfpJ1
	L5Vg==
X-Gm-Message-State: AN3rC/6YsnlEGlbo04BmQb0rl4l6jIpTaoFuccxrYVRJIMO6ZJTS3PGF
	NA5kNk/rpfkH4MSHvIxXFpPEOzBSf3zp
X-Received: by 10.200.34.162 with SMTP id f31mr15343586qta.65.1492529450332;
	Tue, 18 Apr 2017 08:30:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 08:30:29 -0700 (PDT)
In-Reply-To: <20170410031440.32220-1-kai.kang@windriver.com>
References: <20170410031440.32220-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 16:30:29 +0100
Message-ID: <CAJTo0Lb9cc3wnpM=8up0OsCmrKyGVKSgv9seg-uFJD47nNu4gA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Tue, 18 Apr 2017 15:30:49 -0000
Content-Type: multipart/alternative; boundary=001a114027ecb45048054d729751

--001a114027ecb45048054d729751
Content-Type: text/plain; charset=UTF-8

On 10 April 2017 at 04:14, <kai.kang@windriver.com> wrote:

> |   CC     build/SDL_blit_N.lo
> | .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.0.5/src/video/SDL_blit_N.c:
> In function 'calc_swizzle32':
> | .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.
> 0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids
> | mixed declarations and code [-Werror=declaration-after-statement]
> |      const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00,
> 0x00, 0x00,
> |      ^~~~~
>

Upstream has already fixed this: http://hg.libsdl.org/SDL/rev/5184186d4366.

Ross

--001a114027ecb45048054d729751
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 April 2017 at 04:14,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.kan=
g@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div id=3D"gmail-:f4" class=3D"gmail-a3s gmail-aXj=
CH gmail-m15b55dd39685d96b">|=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0build/SDL_b=
lit_N.lo<br>
| .../tmp/work/ppc7400-wrs-<wbr>linux/libsdl2/2.0.5-r0/SDL2-2.<wbr>0.5/src/=
video/SDL_blit_N.c: In function &#39;calc_swizzle32&#39;:<br>
| .../tmp/work/ppc7400-wrs-<wbr>linux/libsdl2/2.0.5-r0/SDL2-2.<wbr>0.5/src/=
video/SDL_blit_N.c:<wbr>127:5: error: ISO C90 forbids<br>
| mixed declarations and code [-Werror=3Ddeclaration-after-<wbr>statement]<=
br>
|=C2=A0 =C2=A0 =C2=A0 const vector unsigned char plus =3D VECUINT8_LITERAL(=
0x00, 0x00, 0x00, 0x00,<br>
|=C2=A0 =C2=A0 =C2=A0 ^~~~~</div></blockquote></div><br>Upstream has alread=
y fixed this: <a href=3D"http://hg.libsdl.org/SDL/rev/5184186d4366">http://=
hg.libsdl.org/SDL/rev/5184186d4366</a>.<br></div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114027ecb45048054d729751--
