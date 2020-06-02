Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web12.6233.1591086483508879013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 01:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mCCTyrhZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id n22so686609vkm.7
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Kb3gtJbumWJSmCPZhMGQVepqY33VbWLFOBNm0B3GAU=;
        b=mCCTyrhZU8RGZk6wIRlVNKhgPFBcKaof36rARyDerxA1xZh2c+EkSLY0tz5+gL+z7W
         5VABhl7dTDGp7e//bNOY+J8W9/8E/FhmzT7wghlPcCzfYFE3wTu5KkNHqFNSND1q3QcJ
         mvYget5RXMYvmSe3MxSCZNVZliUML02LVF8lmcgna3U7GtqCvXg74RhyExf8dLgiz1SO
         Zvdm2c7oLfcNYdD7AYNpdFPssQRTMAXNZ8U12yfPUKCc6fdhiP/kKEirPp2xx0RE5Z96
         oe/MeFpgc+EXc23h8+CIADK/HfJWPI8R8/7Yb39QLiV2pRrVv2VMrIx6wWETDh3zHxWu
         WXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Kb3gtJbumWJSmCPZhMGQVepqY33VbWLFOBNm0B3GAU=;
        b=H61uPWh3duaDo4oo90bifqSu2SAAtdigJJrDFrqprWjAPP8ZnWVCFDd+FkPJqtppMj
         bYqouWjvmZyvw1ER9A6BZpEqlVug7MC5Bh2j4ksK4O2djUNqZ/yCs960gSZ3Ef2Rf7pd
         SwsaabktAUR25fvHR+zphBu60u23BstOfOuOYhlT/E3wAMILhnPCi+KJTJTifwJaFgyg
         Gasc7KCo6l6kQsFQL/9qExl50jgmf4G3A0MSLPkWfxpa4x8mDUj82R/jO8biIxfEwIrN
         G+m8v+WIwKMtu5n0ezb944vFRLZiAoNCrSc76szeu+ouuNXGhgEyBYUEjEqp9rBrDQlm
         8yYg==
X-Gm-Message-State: AOAM530SeDGhADu1D06X4w+0W+DsTbItDiFLmXBog3c9V3xI/2Mtqwr6
	q1sia2x89VfkxMCk5jD7EYhYIZ5zbKSfnSUseO/Imb94
X-Google-Smtp-Source: ABdhPJwaB79iYC+WrXCN/Gwj/dOrh6WTljasNZg/Xyv/CcPScc+MJ/PJqelcPDewNCjqKRsFfjZbFV88FdV76i4EUTg=
X-Received: by 2002:a1f:1bd6:: with SMTP id b205mr12135245vkb.29.1591086482605;
 Tue, 02 Jun 2020 01:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com> <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
 <CANNYZj9fr4o5C3X7DOCs6Oza9RA4QKh1CnGnV=8hdTaBvf7rvA@mail.gmail.com> <77be6de7fa4b447eab96bfb9cc2253d5@XBOX03.axis.com>
In-Reply-To: <77be6de7fa4b447eab96bfb9cc2253d5@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 10:27:50 +0200
Message-ID: <CANNYZj_YOFgBQw44DEkvqT3n0Z=zcqw_izgvPThWfAe39y3skQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009a4bf205a715b039"

--0000000000009a4bf205a715b039
Content-Type: text/plain; charset="UTF-8"

Right, in that case this commit should indeed be dropped or reverted.

Alex

On Tue, 2 Jun 2020 at 09:39, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> If you have COPY_LIC_DIRS enabled, the license files (the ones listed in
> LICENSE and the (parts) listed in LIC_FILES_CHKSUM) will be included in
> the generated image by license_image.bbclass. Extraction of the license
> information is handled by license.bbclass, which also is responsible for
> creating ${PN}-lic packages if LICENSE_CREATE_PACKAGE is set.
>
>
>
> //Peter
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* den 2 juni 2020 09:30
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum
> to omit copyright year lines.
>
>
>
> On Tue, 2 Jun 2020 at 00:12, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 31 maj 2020 17:53
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
> > copyright year lines.
>
> Eh, what? That's definitely not the right thing to do. For a license
> that says "The above copyright notice and this permission notice shall
> be included in all copies or substantial portions of the Software.",
> removing the copyright information makes the file useless as part of,
> e.g., ${PN}-lic.
>
>
>
> As far as I understand, the extracts from LIC_FILES_CHKSUM are not used in
> copies or substantial portions of the software,
>
> they are used in tmp/deploy/licenses (which is neither). Is it beneficial
> to have the copyright years and owners
>
> there? The idea behind dropping them is that we can avoid continuous
> adjusting of the checksum on version updates.
>
>
>
> If you archive the source code, or install binaries to the target, this
> mechanism is not involved.
>
>
>
> I am not aware of ${PN}-lic, can you please point where that is defined?
>
>
>
> Alex
>

--0000000000009a4bf205a715b039
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, in that case this commit should indeed be drop=
ped or reverted.</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Jun 2020 =
at 09:39, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.=
com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">





<div lang=3D"SV">
<div class=3D"gmail-m_-8508441607384899256WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
If you have
</span><span style=3D"font-family:Consolas;color:rgb(148,54,52)" lang=3D"EN=
-US">COPY_LIC_DIRS</span><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US=
"> enabled, the license files (the ones listed in
</span><span style=3D"font-family:Consolas;color:rgb(148,54,52)" lang=3D"EN=
-US">LICENSE</span><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US"> and=
 the (parts) listed in
</span><span style=3D"font-family:Consolas;color:rgb(148,54,52)" lang=3D"EN=
-US">LIC_FILES_CHKSUM</span><span style=3D"color:rgb(148,54,52)" lang=3D"EN=
-US">) will be included in the generated image by license_image.bbclass. Ex=
traction
 of the license information is handled by license.bbclass, which also is re=
sponsible for creating ${PN}-lic packages if
</span><span style=3D"font-family:Consolas;color:rgb(148,54,52)" lang=3D"EN=
-US">LICENSE_CREATE_PACKAGE</span><span style=3D"color:rgb(148,54,52)" lang=
=3D"EN-US"> is set.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 2 juni 2020 09:30<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksu=
m to omit copyright year lines.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, 2 Jun 2020 at 00:12, Peter Kjellerstedt &lt;=
<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt; Sent: den 31 maj 2020 17:53<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to o=
mit<br>
&gt; copyright year lines.<br>
<br>
Eh, what? That&#39;s definitely not the right thing to do. For a license <b=
r>
that says &quot;The above copyright notice and this permission notice shall=
 <br>
be included in all copies or substantial portions of the Software.&quot;, <=
br>
removing the copyright information makes the file useless as part of, <br>
e.g., ${PN}-lic.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">As far as I understand, the extracts from LIC_FILES_=
CHKSUM are not used in copies or substantial portions of the software,<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">they are used in tmp/deploy/licenses (which is neith=
er). Is it beneficial to have the copyright years and owners<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">there? The idea behind dropping them is that we can =
avoid continuous adjusting of the checksum on version updates.<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If you archive the source code, or install binaries =
to the target, this mechanism is not involved.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am not aware of ${PN}-lic, can you please point wh=
ere that is defined?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000009a4bf205a715b039--
