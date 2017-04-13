Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6A72A77E25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:06:21 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id v3so46445879qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=685YhvfM7U6DtMc4mxAKtc8xmeLGhRBhtd3azeFjRGw=;
	b=XMloquge++gz1Re3eEcm22bEP3zvtfbxmpAvF/5rrJIhb8rhaFLtlWZdctPzPAGL+v
	vs5eOLCC7rovww02rlhFyM+N/iGCM6oe8LCG3xqxumNICzuMlc9ciERYiGhh1rbHZ8gR
	eZ3Tww2QXOmrVMzqtMGyypzeUixg93eG8jPnYhednxvZy/AzdFFD1LGTRkWu1TWUsE7c
	9w/yzlStFQzIN9a1CMkTTLSF2FKBvUCpPKswZPxBKfbl3evd2ZZKKBOa8ZPHEEKX5KzR
	63dgeXpp2gpvShiOi97ilD6r+wDCxukjXA6n6jc/mUlovtYM0Tq1azcKxgqCJUKz6o6v
	A3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=685YhvfM7U6DtMc4mxAKtc8xmeLGhRBhtd3azeFjRGw=;
	b=BVX5pwl4n/u9ZZj8OaXwVFfrDhHXfYYFB7q/ov0vbyYzJOnLDnqdoLboqmxDu+ytxC
	cXFCHmfeoq4XJRS+2BM1PKz62Oz/mzSb3qiCcBeN9nyCfTGr8Ba/wV3NFb4oxq8wbHzu
	5AdIj9fpYCEaS0/ACYNvG2CA5FpNzpD88VWbT3LsdK9lTF+rNysSelwDCP7Am5kT7hOi
	A4cCaMXTnKkeE2pySAkBRPL81MsJZitWTK8Ns1Ibzq2sKyGTvH8gAdQSGM53dyyAzjOt
	vhfX4hB0hX3yXNJCyw6cJtz1kJ+QcupXsMmFc2/PVR25u/+NSGsIpwwcC7DCsOIFJ0gH
	4ulA==
X-Gm-Message-State: AN3rC/4Ta3go91mgInVcREVFjZU27PA9i8gcreovf3h7KJaioHAetAk2
	r4OMA4MrrpvinA49259cWZFWU+B05ULG
X-Received: by 10.200.46.26 with SMTP id r26mr2988157qta.197.1492092383320;
	Thu, 13 Apr 2017 07:06:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 07:06:02 -0700 (PDT)
In-Reply-To: <1492074678-128188-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1492074678-128188-1-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 15:06:02 +0100
Message-ID: <CAJTo0LYjwh8KD-h+gXpVkqm4utT6i2_TBZdEaTCeLF5xN_cm3Q@mail.gmail.com>
To: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: separate objarch.h based on architecture
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
X-List-Received-Date: Thu, 13 Apr 2017 14:06:22 -0000
Content-Type: multipart/alternative; boundary=001a114708cc7b45a5054d0cd43c

--001a114708cc7b45a5054d0cd43c
Content-Type: text/plain; charset=UTF-8

On 13 April 2017 at 10:11, Rebecca Chang Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

> +ARCHFILE ?= ""
> +
> +ARCHFILE_aarch64 = "file://objarch.h"
> +
> +ARCHFILE_arm = "file://objarch.h"
> +
> +ARCHFILE_armeb = "file://objarch.h"
> +
> +ARCHFILE_i586 = "file://objarch.h"
> +
> +ARCHFILE_i686 = "file://objarch.h"
> +
> +ARCHFILE_microblazeeb = "file://objarch.h"
> +
> +ARCHFILE_microblazeel = "file://objarch.h"
> +
> +ARCHFILE_mipsarchn32eb = "file://objarch.h"
> +
> +ARCHFILE_mipsarchn32el = "file://objarch.h"
> +
> +ARCHFILE_mipsarchn64eb = "file://objarch.h"
> +
> +ARCHFILE_mipsarchn64el = "file://objarch.h"
> +
> +ARCHFILE_mipsarcho32eb = "file://objarch.h"
> +
> +ARCHFILE_mipsarcho32el = "file://objarch.h"
> +
> +ARCHFILE_nios2 = "file://objarch.h"
> +
> +ARCHFILE_powerpc = "file://objarch.h"
> +
> +ARCHFILE_powerpc64 = "file://objarch.h"
> +
> +ARCHFILE_x86-64 = "file://objarch.h"
>

That's a very long list, would it be easier to set it to objarch.h and then
use select overrides to clear it?

Ross

--001a114708cc7b45a5054d0cd43c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 10:11, Rebecca Chang Swee Fun <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rebecca.swee.fun.chang@intel.com" target=3D"_blank">rebecca.=
swee.fun.chang@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":2qr" class=3D"a3s aXjCH m15b66954c5d14949">+ARCHFILE ?=3D=
 &quot;&quot;<br>
+<br>
+ARCHFILE_aarch64 =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_arm =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_armeb =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_i586 =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_i686 =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_microblazeeb =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_microblazeel =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarchn32eb =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarchn32el =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarchn64eb =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarchn64el =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarcho32eb =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_mipsarcho32el =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_nios2 =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_powerpc =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_powerpc64 =3D &quot;file://objarch.h&quot;<br>
+<br>
+ARCHFILE_x86-64 =3D &quot;file://objarch.h&quot;</div></blockquote></div><=
br>That&#39;s a very long list, would it be easier to set it to objarch.h a=
nd then use select overrides to clear it?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114708cc7b45a5054d0cd43c--
