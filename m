Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7368578523
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 07:48:30 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t201so6760705wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fUrEGbdIfOxVH11B0MUCBBpOCZilXRSR1LHA/QHKo3s=;
	b=cgvvFlv35BAHr91V/FUQ+AgysCtItvS9kW4Yyt+kcRFzNiYZwh2oR+xSuiTAe0w6qO
	XYwTXwvFWh6ftYNzVGpZUBwH/gsG5EmVPTiOu9Eeh2wvgwDkOZ1lXWYSYRkQVegEzZ6Z
	m8s+HBbbKZ8Y6B/CnQLe35h0A7LxZgD+G3Iu2j04TT0sdWhSUuCvnnr7uye+STnq0XjA
	OHYvXmZpQ6rcQLXuARl6cBetDbLFdpfLV1zYtNDu6VnkGpcSiNItEcC4xDZfl2JG9sWi
	fE9YOdWYWX+cnEa4Tl7WtJpJkVeHw0NSbip4EQPXfCviaX3FTrZ70V6bdVOgZ1xHoXaO
	4GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fUrEGbdIfOxVH11B0MUCBBpOCZilXRSR1LHA/QHKo3s=;
	b=t9J2+M902KLrrHZS2X66h1D6yFJ5tKs2cWuvqUsLjOh43OszrUdrm1hZx6aWPlmZBC
	HV59/2rNlkAsgaJjRACdZC1DveUR/nw8Z7W9HtiXvs8UBhxI0MEuWqLRd2SwKERW5KB9
	Jo77fXfDJUE1mXGpF24+YlTfrDwKhcCfKn9UDQZZs8LFi+y1u8OVkGghOslm09KOcmJz
	cYZ8nxlHK8z2SQVZP+fGPN1SPN1VaW7N9E0SF3nVoAid11eTsa8dy68JnXvloGK3i87p
	O98DDNsGDJAnMFVBYdax3XZ1NwtAFhiaaGCRCMoS92ZgcdpLPx34kFdno6pKHz07Bsvv
	EAnw==
X-Gm-Message-State: AIVw111X46C7VVaXDZkaWh26AQYZiXMuWyHRdIRK7AVAJuiYxA7S99ha
	vpMkHbseZLO0IUh5w1PdBc94NNtWTg==
X-Received: by 10.28.152.206 with SMTP id a197mr703790wme.7.1501573712155;
	Tue, 01 Aug 2017 00:48:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.68 with HTTP; Tue, 1 Aug 2017 00:48:30 -0700 (PDT)
Received: by 10.28.183.68 with HTTP; Tue, 1 Aug 2017 00:48:30 -0700 (PDT)
In-Reply-To: <20170731135904.GL16135@bill-the-cat>
References: <20170731135904.GL16135@bill-the-cat>
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Tue, 1 Aug 2017 13:18:30 +0530
Message-ID: <CALDxG5hiunNsC1_TDS0dYYfS3NrXsTRRq24eyB_HJiVvVXn0yw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Chaining compression support fixes for morty / pyro
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
X-List-Received-Date: Tue, 01 Aug 2017 07:48:31 -0000
Content-Type: multipart/alternative; boundary="001a114b2af8b79c8a0555ac5ff0"

--001a114b2af8b79c8a0555ac5ff0
Content-Type: text/plain; charset="UTF-8"

RgfdfcD



On 31-Jul-2017 7:27 PM, "Tom Rini" <trini@konsulko.com> wrote:

> Hi Armin,
>
> The following changes in master are relevant to both morty and pyro:
>
> commit 0a7ce0b971a208956cb895ba5a869ec8c5d94703
> Author: Tom Rini <trini@konsulko.com>
> Date:   Fri Jul 21 18:06:33 2017 -0400
>
>     image.bbclass: Correct chaining compression support
>
> commit 98a2afeb3a53bec7a72a4a9846e1dba636cc6f3d
> Author: Tom Rini <trini@konsulko.com>
> Date:   Tue Jul 25 15:58:09 2017 -0400
>
>     image: Fix "metadata is not deterministic" when chaining 2+
> CONVERSION_CMDs
>
> And fix the problem where you cannot make arbitrary combinations of say
> "ext4", "u-boot" and "xz" images.  In the interest of full disclosure,
> it is entirely possible that there are image types introduces in other
> layers that have the same problem that the "u-boot" type had which lead
> to 46bc438374de being done in the first place, which is to say a new
> IMAGE_CMD that also cleaned up the intermediate files on its own.  This
> may make this too risky to pull into stable branches and that's fine.
> Thanks for your consideration!
>
> --
> Tom
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114b2af8b79c8a0555ac5ff0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">RgfdfcD<div dir=3D"auto"><br></div><div dir=3D"auto"><br>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 31=
-Jul-2017 7:27 PM, &quot;Tom Rini&quot; &lt;<a href=3D"mailto:trini@konsulk=
o.com">trini@konsulko.com</a>&gt; wrote:<br type=3D"attribution"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi Armin,<br>
<br>
The following changes in master are relevant to both morty and pyro:<br>
<br>
commit 0a7ce0b971a208956cb895ba5a869e<wbr>c8c5d94703<br>
Author: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.c=
om</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Jul 21 18:06:33 2017 -0400<br>
<br>
=C2=A0 =C2=A0 image.bbclass: Correct chaining compression support<br>
<br>
commit 98a2afeb3a53bec7a72a4a9846e1db<wbr>a636cc6f3d<br>
Author: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.c=
om</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jul 25 15:58:09 2017 -0400<br>
<br>
=C2=A0 =C2=A0 image: Fix &quot;metadata is not deterministic&quot; when cha=
ining 2+ CONVERSION_CMDs<br>
<br>
And fix the problem where you cannot make arbitrary combinations of say<br>
&quot;ext4&quot;, &quot;u-boot&quot; and &quot;xz&quot; images.=C2=A0 In th=
e interest of full disclosure,<br>
it is entirely possible that there are image types introduces in other<br>
layers that have the same problem that the &quot;u-boot&quot; type had whic=
h lead<br>
to 46bc438374de being done in the first place, which is to say a new<br>
IMAGE_CMD that also cleaned up the intermediate files on its own.=C2=A0 Thi=
s<br>
may make this too risky to pull into stable branches and that&#39;s fine.<b=
r>
Thanks for your consideration!<br>
<br>
--<br>
Tom<br>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div></div>

--001a114b2af8b79c8a0555ac5ff0--
