Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6367.1793788685176849221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JhjlNFds;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c5e31bea9so8446096d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 02:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793788684; cv=none;
        d=google.com; s=arc-20260327;
        b=YJOUEk8EEXGRW2mNXpP0Z+HtitmVw34F7pZ7L6+tZibrZKPaS27aatUzchMZAsqwko
         NucoCMOYSec1O5sRqvH7O5fBqz7uouI5WMxMYb7JKf/BnyD0SUjOX8k9BMGy/keOGQ9T
         RqZMO2OV7mHSKslQy0+CKtWH7BWf+oFiGN/8xdVQ6Ie4pcq8rpZfoy1YckE/0YbpuSAm
         Ix/fIGvFczYFzMWdgwPR9J831eKnM1tIcKiqM2iHhRoqSgcQIJtZ2/cj88+5KFwIsnDH
         ZYIc1ENU9P2JM5kTOzenz5Aopd4nQ7VD3L6frTiVnE1jVYPpyRcxQ1lCD16CjvVaXs1k
         Z4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9X0+LrwCc0IKtLmakosiZEMnXMcyXvRcF5/sNc0crUI=;
        fh=IgcHwqBro0UH/+SvJ2ObDUbqNAllHg8gmoNqKfqQrdY=;
        b=h3BXMYItXJsJjpFS5e0xPmKG2Pknq3HWBeicYXkzvG7aulmFHyq4L+zZQLlxlcwD7/
         EETBg7xPKnYLT0B3LMQBxcR6LF7o128Q6rpDIxJIX8UBwrq2iThptc6Zx0wbtZi1pWXF
         M+LyWRtCYpLYFSpGwtekObmwk5XAS2RBavwG5je5A9bK5eGU43gaqjimI/0jF71cwLTz
         uX7AXHRfcW6ij6u/EPWnbgCpnOM3H17BTdthpgf1rvxAjzOZ5PIad+OHXiE4iAI8CtZE
         3vKqfhjh3TtDCiQfatxziAyCn122LU9skn6ahxs9fcnb9/H8L4HUu5/l7ojOCMCePYT8
         zWDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788684; x=1794393484; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X0+LrwCc0IKtLmakosiZEMnXMcyXvRcF5/sNc0crUI=;
        b=JhjlNFdsNzj4wR4eOl/lHb87A15W7E9DUZmwVpPtru0qxSZ/OIY1TmBAcEE2JPC17I
         0YuUd98A6fGcBcFtHvcH+ysyPJoLRBgohEsjjE4yKf6wC3VyPXgR1DI9z5y/UeEQNXeL
         viT72IW5xXe19lYximd3qE7udI/XUpOaixe5LIUcyBug2f5YWlQ3Koax6rgpMGP8yTCo
         Yp0xWB8xny/Dl35qCu6YJ2E4Nc3XVQ4TfayBSw1XiDp6/65RGGFyEmBQ0kMzVv9IJ/Bz
         RUC1YEbrBStLETeMMSNciwh35xwr05c/zTdrKHr0H3L+Qag1sVeuZqfSkeSOwrrhudoq
         FGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788684; x=1794393484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9X0+LrwCc0IKtLmakosiZEMnXMcyXvRcF5/sNc0crUI=;
        b=A6D0ROZABHMJEUHgFS7sTqja80VhTVEbCT6ovm9MvAI6WrBz+ABodzAAej63j3ZMXA
         AItYdd7yd7LREYONEm48cWrsUffuhDdN1efYbJpxLLtOrqlCEo7ecB0rAZuHVRsp3Col
         h6NBOT6hDM1jOfwS/BdYB9oDns3Kd73YegnQHZfLThhrsOZM5FRTDdIHGWxCE18flAn+
         fIcYHUb37eQ1v0AqX0xnF9uUDH3w5YZhmi1UdtZmbmeP4eCvrFxd8J+hR0t9hxuxrnBU
         ANeRfPQvKudUjt8neC3j8HLChl0oJ8O/h+2mgl+3q4J8ihT7vLjxtm0UVenIo9oPLIQm
         9B5Q==
X-Gm-Message-State: APuU4Z/3nuWz9GKoh8z39tV2hEoyjtCClZWLq0TTy4ptxaiIDDM7ZNmR
	NwJhW0OjmGxz9imReg1fH5LsH8spQLZr9xDussHxMYdWxPB2UDiCFO7XT2V2s85XO4FSNwywPja
	Mrzc4okPIMD00gRI6Af0B2aanqHC2hZw=
X-Gm-Gg: AYBFou0XJr/UEQNzanmkzb7REpvaChwcWhA8mMfZCxFX2tvqMEO0JfL+28iDPWLb09d
	rGJ49byWyXcFgqMj5cXSwylxH0RU8L5G8USgCNdMkTQUKEX8iTE/OAj4v0WXKoSkSh5GDfFC7Ls
	5xahZ72HjwJf+2qhOPEQldJqV1rToaM/z6STykQ+H4c8vVGt67UQeXDY3wzH8snjxlUpkHklv33
	GcPLw15oprCsVlZ4pbvq0c5HEykeeVXGl5zrd6XQcT4Xd1642f5PWWXTK4RYX4Ha+bmP+If8+fd
	fNs9w+DbWETBrHlL8/4VISixpP1xIDhZ4ztUIDgEUpezaQnP4GGIkOEVFlcUCnJjnlr4UBvBfR9
	meYbh+EZnJTomIsV4p5zJhTpdvF4bdM1jFEpiPa1gTw3eiRlCm9KpmXyUQreYnACHDHKeN/A=
X-Received: by 2002:a05:6214:c49:b0:91c:79eb:ea55 with SMTP id
 6a1803df08f44-91ca4b7aa24mr268743016d6.28.1793788684029; Wed, 04 Nov 2026
 02:38:04 -0800 (PST)
MIME-Version: 1.0
References: <18E449B471A74413.164306@lists.openembedded.org> <DS4PR02MB11190D3AA58D06C430BC4203687682@DS4PR02MB11190.namprd02.prod.outlook.com>
In-Reply-To: <DS4PR02MB11190D3AA58D06C430BC4203687682@DS4PR02MB11190.namprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Nov 2026 11:37:53 +0100
X-Gm-Features: AclHuK8Qhdu6_JZQ_Ru9P3Pnld_PtwcrKt3f-R-FeeaXLkPlV6O2GnzZ8gnPwpo
Message-ID: <CANNYZj9DcLwXLp3H49O_HZshYdiXiJ493Jh0Dvh_SRNzPA=_1Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap to
 avoid sed dependency
To: Roshan Sivakumar <roshs@qti.qualcomm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000050517e065f70f9e4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 10:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249351

--00000000000050517e065f70f9e4
Content-Type: text/plain; charset="UTF-8"

Please do not ping people for review, especially less than 48 hours after
the patch was posted. If no one has anything to say, they will not clutter
the mailing list with 'lgtm'. The patch will move through the standard
review process as usual (CI pipeline, patch review meetings), and you'll
hear if something needs to be addressed, otherwise it will merge quietly.

Alex

On Wed, 4 Nov 2026 at 02:30, Roshan Sivakumar <roshs@qti.qualcomm.com>
wrote:

> Could someone review this patch? @Alexander <alex.kanavin@gmail.com>,
> @Bruce <bruce.ashfield@gmail.com>, @Peter <peter.kjellerstedt@axis.com>
>
> Thanks,
>
> Roshan.
>
>
> ------------------------------
> *From:* Roshan Sivakumar via openembedded-core <roshs=
> qti.qualcomm.com@lists.openembedded.org>
> *Sent:* Monday, November 2, 2026 09:13
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* Alexander Kanavin <alex.kanavin@gmail.com>; Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>; Sumanth Gavini <sumanth.gavini@windriver.com>;
> Bruce Ashfield <bruce.ashfield@gmail.com>; Roshan Sivakumar <
> roshs@qti.qualcomm.com>
> *Subject:* [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysmap
> to avoid sed dependency
>
> WARNING: This email originated from outside of Qualcomm. Please be wary of
> any links or attachments, and do not enable macros.
>
> scripts/mksysmap is a '#!/bin/sed -f' script that is consumed only by
> scripts/link-vmlinux.sh during a full vmlinux link (NM | sed -f mksysmap
> > System.map). External module builds against kernel-devsrc never relink
> vmlinux, so the script is never used in this package.
>
> Because it is packaged with a '#!/bin/sed' shebang, the RPM 6 interpreter
> dependency generator emits "Requires: /bin/sed" for kernel-devsrc. Only
> full GNU sed provides /bin/sed (busybox provides /usr/bin/sed), so SDK
> population fails with "nothing provides /bin/sed" on images using busybox
> sed.
>
> Remove the script in do_install, mirroring the existing removal of
> scripts/package/debian/rules (dropped to avoid an RDEPENDS on make). This
> clears the spurious /bin/sed dependency without pulling full sed into the
> package or the SDK.
>
> Assisted-by: Claude Code:claude-opus-4.8
> Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 90bdbfc534..7da7e270c3 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -158,6 +158,13 @@ do_install() {
>          # Remove as we else would ned to RDEPEND on make
>          rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
>
> +        # scripts/mksysmap is a '#!/bin/sed -f' script that is only
> consumed by
> +        # scripts/link-vmlinux.sh during a full vmlinux link. External
> module
> +        # builds never relink vmlinux, so it is unused here. Remove it as
> otherwise
> +        # we would need to pull sed into the package/SDK to satisfy
> +        # the dependency generated via the RPM shebang dependency
> generator (Requires: /bin/sed).
> +        rm $kerneldir/build/scripts/mksysmap 2>/dev/null || :
> +
>          # tools/include is needed by the archscripts host tools that
>          # 'make scripts prepare' rebuilds on target (e.g. x86 vdso2c) and
>         # not checked against objtool as it previously was.
> --
> 2.34.1
>
>

--00000000000050517e065f70f9e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please do not ping people for review, especially less=
 than 48 hours after the patch was posted. If no one has anything to say, t=
hey will not clutter the mailing list with &#39;lgtm&#39;. The patch will m=
ove through the standard review process as usual (CI pipeline, patch review=
 meetings), and you&#39;ll hear if something needs to be addressed, otherwi=
se it will merge quietly.</div><div><br></div><div>Alex</div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, 4 Nov 2026 at 02:30, Roshan Sivakumar &lt;<a href=3D"mailto=
:roshs@qti.qualcomm.com">roshs@qti.qualcomm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-5574475297=
050941096">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Could someone review this patch? <a id=3D"m_-5574475297050941096OWAAM965965=
" href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">
@Alexander</a>, <a id=3D"m_-5574475297050941096OWAAM949424" href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">
@Bruce</a>, <a id=3D"m_-5574475297050941096OWAAM888764" href=3D"mailto:pete=
r.kjellerstedt@axis.com" target=3D"_blank">
@Peter</a></div>
<div id=3D"m_-5574475297050941096Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">Thank=
s,</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">Rosha=
n.</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">=C2=
=A0</p>
</div>
<div id=3D"m_-5574475297050941096appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-5574475297050941096divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Roshan Sivakumar via openembedded-core &lt;roshs=3D<a href=3D"mailto:qti.q=
ualcomm.com@lists.openembedded.org" target=3D"_blank">qti.qualcomm.com@list=
s.openembedded.org</a>&gt;<br>
<b>Sent:</b> Monday, November 2, 2026 09:13<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;; Peter Kjellerstedt &lt;<a=
 href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjelle=
rstedt@axis.com</a>&gt;; Sumanth Gavini &lt;<a href=3D"mailto:sumanth.gavin=
i@windriver.com" target=3D"_blank">sumanth.gavini@windriver.com</a>&gt;; Br=
uce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_bla=
nk">bruce.ashfield@gmail.com</a>&gt;; Roshan Sivakumar &lt;<a href=3D"mailt=
o:roshs@qti.qualcomm.com" target=3D"_blank">roshs@qti.qualcomm.com</a>&gt;<=
br>
<b>Subject:</b> [OE-core][PATCH] kernel-devsrc: drop unused scripts/mksysma=
p to avoid sed dependency</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>WARNING: This email originated from outside of Qualcomm. Please be war=
y of any links or attachments, and do not enable macros.<br>
<br>
scripts/mksysmap is a &#39;#!/bin/sed -f&#39; script that is consumed only =
by<br>
scripts/link-vmlinux.sh during a full vmlinux link (NM | sed -f mksysmap<br=
>
&gt; System.map). External module builds against kernel-devsrc never relink=
<br>
vmlinux, so the script is never used in this package.<br>
<br>
Because it is packaged with a &#39;#!/bin/sed&#39; shebang, the RPM 6 inter=
preter<br>
dependency generator emits &quot;Requires: /bin/sed&quot; for kernel-devsrc=
. Only<br>
full GNU sed provides /bin/sed (busybox provides /usr/bin/sed), so SDK<br>
population fails with &quot;nothing provides /bin/sed&quot; on images using=
 busybox<br>
sed.<br>
<br>
Remove the script in do_install, mirroring the existing removal of<br>
scripts/package/debian/rules (dropped to avoid an RDEPENDS on make). This<b=
r>
clears the spurious /bin/sed dependency without pulling full sed into the<b=
r>
package or the SDK.<br>
<br>
Assisted-by: Claude Code:claude-opus-4.8<br>
Signed-off-by: Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.co=
m" target=3D"_blank">roshs@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" target=
=3D"_blank">kernel-devsrc.bb</a> | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-kernel/linux/<a href=
=3D"http://kernel-devsrc.bb" target=3D"_blank">kernel-devsrc.bb</a><br>
index 90bdbfc534..7da7e270c3 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" target=
=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" target=
=3D"_blank">kernel-devsrc.bb</a><br>
@@ -158,6 +158,13 @@ do_install() {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Remove as we else would =
ned to RDEPEND on make<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm $kerneldir/build/script=
s/package/debian/rules 2&gt;/dev/null || :<br>
<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # scripts/mksysmap is a &#39;#!=
/bin/sed -f&#39; script that is only consumed by<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # scripts/link-vmlinux.sh durin=
g a full vmlinux link. External module<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # builds never relink vmlinux, =
so it is unused here. Remove it as otherwise<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # we would need to pull sed int=
o the package/SDK to satisfy<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the dependency generated via =
the RPM shebang dependency generator (Requires: /bin/sed).<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm $kerneldir/build/scripts/mks=
ysmap 2&gt;/dev/null || :<br>
+<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # tools/include is needed =
by the archscripts host tools that<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # &#39;make scripts prepar=
e&#39; rebuilds on target (e.g. x86 vdso2c) and<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # not checked against objtool as=
 it previously was.<br>
--<br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>

</div></blockquote></div>

--00000000000050517e065f70f9e4--
