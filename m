Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2942862133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 23:40:28 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w129-v6so4442723pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=++b6bJgdyDtbvgl1uR+c3+4Z5+5cFwNuZLrtI0jQAIE=;
	b=V7IMY6fahG6MsTN7zjQ5zqBgfXvHbp927Qzy81RlzaS2nI5OOMR1j1k14f1vDJ1BkI
	JHryvH58IKDhQlx7qDNjDggzVTVN63iCx5AX1xYwfpj0e6mAJ2WH5RSi2IXcnEzpr2hV
	5gwXcEiec8xGA9w22z8Rb2uY4mMw7e1mJ+nSQFR3NAUOAVXw3HDg75VRVLL4FdzQ5din
	YQkGqqq4bYbFz6BjjyFB4IZipPnC+lKy90Db+9Q7rrAj93uqDtwo7eMnJ4W9WojsTxdB
	JvULvRjXPmZEo9a8XzSGgaLGCsmymk62aKlaiOX0yj+GUX/wCBOhVrpgBxPcsBXsDfXu
	TWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=++b6bJgdyDtbvgl1uR+c3+4Z5+5cFwNuZLrtI0jQAIE=;
	b=JGntKRPtDyv9qaE9yxxy6EyID/vNmxiazH5Tr1lEGUozcCi+cWJ0hgQPVzcBqknLUZ
	Z9l2aes/GcMG01G1eJLV6DhicDvWoFgLHg3KYmioQmPyjYLXSS/IYiP5dPJl3Luw7Ep8
	f52tSrMnMfTRlrLY8L8u1J4O2EbBWF5wWgW3lmfTkAq0P789zt7h6KboEjZ0+mSpyCC6
	61fq1EClnY8PvnmYHwBMJ70o6o0Q1ZyMmPjyW/S95UN/XeJQYW6h6jsmxOjjrcwG4mAq
	YNXomcPN0XvE5hUmLATIQ2+HskXX/2yoIR/gjnfP9wwUAL928/FZyv4SFiTMdRjdSEsf
	ZK0w==
X-Gm-Message-State: ALKqPwfJ/xisorObvnKgtfiHASLuvAqitIbf6O6WrDRY+EbwBS4QR/PC
	xtr+T94L1wTyRL9t1ij7x+0i0uvOtnwbWuMSfz4=
X-Google-Smtp-Source: AB8JxZrHdsali59aMoH4sbid9H8t/l3vvpINhqEv2VO/MzxMujWNpEFbn6GPZcq97S2AwF9HexstgHYF/gEEDgVQ7Pc=
X-Received: by 2002:a65:6510:: with SMTP id
	x16-v6mr9155407pgv.204.1526686829907; 
	Fri, 18 May 2018 16:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2018 16:40:19 -0700
Message-ID: <CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Fri, 18 May 2018 23:40:29 -0000
Content-Type: multipart/alternative; boundary="0000000000002e17f1056c837a09"

--0000000000002e17f1056c837a09
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 3:50 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> Although there may still be specific cases which can benefit from the
> ARM instruction set, the Thumb2 instruction set is generally a better
> default for armv7a class CPUs. Distros such as Debian and Fedora have
> been targeting Thumb2 by default for some time.
>
> Note that setting ARM_INSTRUCTION_SET has no effect unless
> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
> of tree machine configs may need to update their DEFAULTTUNE to take
> advantage of this change.



I think this is a good change and we shoudl take it in thumb2 is default
ISA
for other major distros as well

Oe based distros who ship feeds might be affected

>
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv7a.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> b/meta/conf/machine/include/arm/arch-armv7a.inc
> index bad1c27..a2663d8 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -1,4 +1,5 @@
>  DEFAULTTUNE ?= "armv7athf"
> +ARM_INSTRUCTION_SET ?= "thumb"
>
>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002e17f1056c837a09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, May 18, 2018 =
at 3:50 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccur=
dy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Althoug=
h there may still be specific cases which can benefit from the<br>
ARM instruction set, the Thumb2 instruction set is generally a better<br>
default for armv7a class CPUs. Distros such as Debian and Fedora have<br>
been targeting Thumb2 by default for some time.<br>
<br>
Note that setting ARM_INSTRUCTION_SET has no effect unless<br>
TUNE_FEATURES contains &quot;thumb&quot; (which is controlled by the &quot;=
t&quot; suffix<br>
in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out<br>
of tree machine configs may need to update their DEFAULTTUNE to take<br>
advantage of this change.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think this is a good change and we =
shoudl take it in thumb2 is default ISA=C2=A0</div><div dir=3D"auto">for ot=
her major distros as well=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Oe based distros who ship feeds might be affected=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" tar=
get=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/arch-armv7a.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/mach=
ine/include/arm/arch-armv7a.inc<br>
index bad1c27..a2663d8 100644<br>
--- a/meta/conf/machine/include/arm/arch-armv7a.inc<br>
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
@@ -1,4 +1,5 @@<br>
=C2=A0DEFAULTTUNE ?=3D &quot;armv7athf&quot;<br>
+ARM_INSTRUCTION_SET ?=3D &quot;thumb&quot;<br>
<br>
=C2=A0TUNEVALID[armv7a] =3D &quot;Enable instructions for ARMv7-a&quot;<br>
=C2=A0TUNECONFLICTS[armv7a] =3D &quot;armv4 armv5 armv6 armv7&quot;<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000002e17f1056c837a09--
