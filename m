Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9569972FE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:41:43 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u188so99624394qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d5392A5ZhmIsS2e/g19ha3LEDum0wV7vbXiSkAubfVo=;
	b=nGk8bR7ubz70v39aTOyybfNI4lQZf0+oTLVfItJE2+gms6MScciL2ynfAKHgjsJIjr
	PCuXh2XOahm1jwatcvodHNS9zWttAWbmCogSH0PpS/LcsLlay387KV04bOGNhKtL5WIe
	1xs8eZIg4u4WNCV6kIONRxvtDayvyoposPv6yIs+xGkBeb8HMr62QNBH7mYOumQ48LiS
	ItDi/94LJRVY6QSxat33bYdYb1+YQ2IdvKVj7ZeXaOvMo2FQnUKxE1ZUOcyFPVtndMKy
	xw9DzZM8kcbXOmECsXLCmNJu65bFWQ/oD5LsQg3HXMPAAbK9uIJiJfmUfysgX8pnw2JJ
	jU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d5392A5ZhmIsS2e/g19ha3LEDum0wV7vbXiSkAubfVo=;
	b=cDL+xjDtCqt7moLcc0MF5l0rvsKP8jXlyeF32wi5wIylfzAGSp34YZlTlOEj0Hq82T
	A1F9C/UKpTHwKEvQMmDyld8zCHHLCpo5FpyJThHNv2zpRYUnVTt98T8HOqENVVd0FY6q
	4wAl8OlrCnw2oaFxXLyQqD4WHZCt+BmQn3ajc8OaOqrfcUZTQc7qk5A8x69sH1ds96jw
	vwdfctsutOkk4BSTkVIqlunXmhchaEqN5H/vdLBn2QKaj9Okgj3eyroqvY4Du4/lIWfL
	mWrw0PFAk6aANOCqvEhVu26UHSDMWQrhR1MlkFEII8YeXTIcAcJvJeobhSMtJD7SJkEv
	GW6w==
X-Gm-Message-State: AMke39nyYvlK1s0KpOv9n4mr+aK4Tcp7qGtQrNnbXzYvogD229mRuJ1tDbixRNDpcv26rKVbG4YVtzsaQvyX1dBX
X-Received: by 10.200.2.150 with SMTP id p22mr12076209qtg.197.1488206504358;
	Mon, 27 Feb 2017 06:41:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 06:41:23 -0800 (PST)
In-Reply-To: <1488204355-15461-1-git-send-email-peter.marko@siemens.com>
References: <1488204355-15461-1-git-send-email-peter.marko@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 14:41:23 +0000
Message-ID: <CAJTo0LY7YEy_-EVroSHcMf-C-x7ZhNMXCZQD4m9Wxa7xbp3z8w@mail.gmail.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: Andrej Valek <andrej.valek@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib: Upgrade 1.2.8 -> 1.2.11
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
X-List-Received-Date: Mon, 27 Feb 2017 14:41:44 -0000
Content-Type: multipart/alternative; boundary=f4030435c2340bdfc7054984148a

--f4030435c2340bdfc7054984148a
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 14:05, Peter Marko <peter.marko@siemens.com> wrote:

> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>

ERROR: zlib-1.2.11-r0 do_populate_lic: QA Issue: zlib: The LIC_FILES_CHKSUM
does not match for
file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd
zlib: The new md5 checksum is 627e6ecababe008a45c70e318ae7014e
zlib: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=4 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

...
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

  Jean-loup Gailly        Mark Adler
  jloup@gzip.org          madler@alumni.caltech.edu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=23 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
zlib: Check if the license information has changed in
/data/poky-master/tmp/work/corei7-64-poky-linux/zlib/1.2.11-r0/zlib-1.2.11/zlib.h
(lines 4 through to 23) to verify that the LICENSE value "Zlib" remains
valid [license-checksum]

Ross

--f4030435c2340bdfc7054984148a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 14:05, Peter Marko <span dir=3D"ltr">&lt;<a href=3D"=
mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:6kl" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15a7ff84df31b2d7">Signed-off-by: Peter Marko &lt=
;<a href=3D"mailto:peter.marko@siemens.com">peter.marko@siemens.com</a>&gt;=
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
>andrej.valek@siemens.com</a>&gt;<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;</div></blockquote></div><br><div class=3D"gm=
ail_extra">ERROR: zlib-1.2.11-r0 do_populate_lic: QA Issue: zlib: The LIC_F=
ILES_CHKSUM does not match for file://zlib.h;beginline=3D4;endline=3D23;md5=
=3Dfde612df1e5933c428b73844a0c494fd</div><div class=3D"gmail_extra">zlib: T=
he new md5 checksum is 627e6ecababe008a45c70e318ae7014e</div><div class=3D"=
gmail_extra">zlib: Here is the selected license text:</div><div class=3D"gm=
ail_extra">vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=3D4 vvvvvvvvvvvvvvvvvvvvv=
vvvvvvvv</div><div class=3D"gmail_extra">=C2=A0 Copyright (C) 1995-2017 Jea=
n-loup Gailly and Mark Adler</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">=C2=A0 This software is provided &#39;as-is&#39;, wi=
thout any express or implied</div><div class=3D"gmail_extra">=C2=A0 warrant=
y.=C2=A0 In no event will the authors be held liable for any damages</div><=
div class=3D"gmail_extra">=C2=A0 arising from the use of this software.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 Pe=
rmission is granted to anyone to use this software for any purpose,</div><d=
iv class=3D"gmail_extra">=C2=A0 including commercial applications, and to a=
lter it and redistribute it</div><div class=3D"gmail_extra">=C2=A0 freely, =
subject to the following restrictions:</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">...</div><div class=3D"gmail_extra">=C2=A0=
 1. The origin of this software must not be misrepresented; you must not</d=
iv><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0claim that you wrote the =
original software. If you use this software</div><div class=3D"gmail_extra"=
>=C2=A0 =C2=A0 =C2=A0in a product, an acknowledgment in the product documen=
tation would be</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0appreci=
ated but is not required.</div><div class=3D"gmail_extra">=C2=A0 2. Altered=
 source versions must be plainly marked as such, and must not be</div><div =
class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0misrepresented as being the origi=
nal software.</div><div class=3D"gmail_extra">=C2=A0 3. This notice may not=
 be removed or altered from any source distribution.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">=C2=A0 Jean-loup Gailly =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Mark Adler</div><div class=3D"gmail_extra">=C2=A0 <=
a href=3D"mailto:jloup@gzip.org">jloup@gzip.org</a> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"mailto:madler@alumni.caltech.edu">madler@alumni.cal=
tech.edu</a></div><div class=3D"gmail_extra">^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ =
endline=3D23 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</div><div class=3D"gmail_extra">=
zlib: Check if the license information has changed in /data/poky-master/tmp=
/work/corei7-64-poky-linux/zlib/1.2.11-r0/zlib-1.2.11/zlib.h (lines 4 throu=
gh to 23) to verify that the LICENSE value &quot;Zlib&quot; remains valid [=
license-checksum]</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div></div>

--f4030435c2340bdfc7054984148a--
