Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92580C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 14:55:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.13163.1633532151584164511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 07:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DY9T7LvO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e12so9710961wra.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kmwjTvH3u7ka3Y8sjXUmBOAhHeP4AJ/xKpDjdzt1iro=;
        b=DY9T7LvO+6K6HN6JsNMQtxihkLQXDuksmMc95RvshQf7CIQfJw5afbnFELuqRH+A3z
         t9oUJ3lgvahY6H0bV43U42mCaVlq0rn9+LcFS98eh0BohFsAPDnTOeHdi123f82v2cF1
         goirtbFeZh2ht39tPZJceQqPxTrNHqKZsyiCUme/qmLES+YTbDUeMsVHqS3/0IAbQo2Y
         LmU0pUxOKfRWFnTz0ENSQeXf+pdTGql7y4674vai6kM1fFpCIS5AlD1DoR6zh7bVqt8E
         C0yzQ7JDlXc9F3P9hpHOruW6LWt5xmT5GfewLFfrf1wVfDvJIjQaPbFhw1xxelexQdVT
         Pa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kmwjTvH3u7ka3Y8sjXUmBOAhHeP4AJ/xKpDjdzt1iro=;
        b=ri/J+nrhiNSu5ud2qT8/TvUPdcaRIrfHuwAQO5wxSkYLPTutp84B6YOsXPUBvrTqEL
         7B0e7AmmeIOP/3jDNRcTZVZiSFGXpZx1iac27GIE/BQJf6BLCKVvkd/NM0rsT3IApwc0
         xwqtpFda+9e0jd1vh5JMmwyJP4fZHytPVxiBBOAC1SAxZrwbB9wpDZ7fJfltcfkvJPqE
         i9Z7kkrJZ/QBNG5TVohxEbLy9+lmDL+WYPPWM+4NIyrFyqsFYZQPARgwLsNneP7iXUJX
         YrwJ35dZD9U7FsWZ4jVRE/dpeWxrJ/QJ10hSBEjfdW77tWK6IipUeuh79ZEmyOzx4yYI
         ozLg==
X-Gm-Message-State: AOAM531l82OYllQFmqyozu8dtJ0B058Q8yWNS4Scu5/2Xn72r9W2p97O
	a0tzvmAMGHzeL8NgGcGKuHkfPEqmk2TClhuJqzI=
X-Google-Smtp-Source: 
 ABdhPJxvvRgiAwSlugwG3dEV+MvTFWS/+f4Quxl9du2zGmy8Asj2vZDKpu+BseEjrc9RY8aKizWKaqVoQplh1SBw1KQ=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr28649169wrq.399.1633532149353;
 Wed, 06 Oct 2021 07:55:49 -0700 (PDT)
MIME-Version: 1.0
References: 
 <TYZPR03MB6077C29F32661014C935B01AC6B09@TYZPR03MB6077.apcprd03.prod.outlook.com>
In-Reply-To: 
 <TYZPR03MB6077C29F32661014C935B01AC6B09@TYZPR03MB6077.apcprd03.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 6 Oct 2021 09:55:37 -0500
Message-ID: 
 <CAJdd5Ga=85PyVEscBAKD9=WA22ED6mx6J_h7tRsEmD-q+o5wkQ@mail.gmail.com>
Subject: Re: SPDX Data Fields in Open Embedded
To: Christopher Lusk <clusk@lenovo.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/related; boundary="0000000000007df04b05cdb05706"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 14:55:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156696

--0000000000007df04b05cdb05706
Content-Type: multipart/alternative; boundary="0000000000007df04a05cdb05705"

--0000000000007df04a05cdb05705
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 9:44 AM Christopher Lusk <clusk@lenovo.com> wrote:

> Hello all,
>
>
>
> I am reaching out to inquire about an issue I have experienced as it
> relates to SPDX output from the oe-core build process and specifically the
> create-spdx.bbclass output.  The data fields in the output that I have
> produced do not line up with the SPDX data field standards (see below) set
> forth by the Linux Foundation.
>
>
>
> My question is if there are plans to update the create-spdx code so that
> the output fields align with those set forth by both NTIA and Linux
> Foundation?
>
>
>
> *SPDX Mapped Field*
>
> PackageSupplier:
>
> PackageName:
>
> PackageVersion:
>
> SPDXID:
>
> Relationship: CONTAINS
>
> Creator:
>
> PackageChecksum:
>
>
>

Can you be a little more specific and possibly provide examples of what you
are expecting to see and what it is actually generating? We are trying to
adhere to the SPDX spec, but it is possible there is something we
misinterpreted or are doing incorrectly.


> Source -
> https://www.ntia.gov/files/ntia/publications/ntia_sbom_formats_and_standards_whitepaper_-_version_20191025.pdf
>
>
>
> Thanks.
> ------------------------------
>
> *Christopher D. Lusk*
> Product Security Analyst
> Product Security Office
> Lenovo
>
>
> [image: Email]clusk@lenovo.com
>
>
>
> Lenovo.com <http://www.lenovo.com/>
> Twitter <http://twitter.com/lenovo> | Instagram
> <https://instagram.com/lenovo> | Facebook <http://www.facebook.com/lenovo>
>  | Linkedin <http://www.linkedin.com/company/lenovo> | YouTube
> <http://www.youtube.com/lenovovision> | Privacy
> <https://www.lenovo.com/gb/en/privacy-selector/>
>
>
>
>
>

--0000000000007df04a05cdb05705
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 9:44 AM Christ=
opher Lusk &lt;<a href=3D"mailto:clusk@lenovo.com">clusk@lenovo.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_2487225848235209125WordSection1">
<p class=3D"MsoNormal">Hello all,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am reaching out to inquire about an issue I have e=
xperienced as it relates to SPDX output from the oe-core build process and =
specifically the create-spdx.bbclass output.=C2=A0 The data fields in the o=
utput that I have produced do not line
 up with the SPDX data field standards (see below) set forth by the Linux F=
oundation.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">My question is if there are plans to update the crea=
te-spdx code so that the output fields align with those set forth by both N=
TIA and Linux Foundation?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table style=3D"width:170.75pt;border-collapse:collapse" width=3D"228" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0">
<thead>
<tr>
<td style=3D"width:170.75pt;border:1pt solid rgb(193,199,208);background:rg=
b(244,245,247) none repeat scroll 0% 0%;padding:5.25pt 11.25pt 5.25pt 7.5pt=
" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal"><b><span style=3D"color:rgb(23,43,77)">SPDX Mapped F=
ield<u></u><u></u></span></b></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 11.25pt 5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">PackageSupplier:<b><span style=3D"color:rgb(23,43,77=
)"><u></u><u></u></span></b></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">PackageName:<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">PackageVersion:<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">SPDXID:<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">Relationship: CONTAINS<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">Creator:<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"width:170.75pt;border-color:currentcolor rgb(193,199,208) rgb(=
193,199,208);border-style:none solid solid;border-width:medium 1pt 1pt;padd=
ing:5.25pt 7.5pt" width=3D"228" valign=3D"top">
<p class=3D"MsoNormal">PackageChecksum:<u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0</p></div></div></blockquote><div><br><=
/div><div>Can you be a little more specific and possibly provide examples o=
f what you are expecting to see and what it is actually generating? We are =
trying to adhere to the SPDX spec, but it is possible there is something we=
 misinterpreted or are doing incorrectly.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: bre=
ak-word;" lang=3D"EN-US"><div class=3D"gmail-m_2487225848235209125WordSecti=
on1"><p class=3D"MsoNormal"><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt">Source - <a href=3D"ht=
tps://www.ntia.gov/files/ntia/publications/ntia_sbom_formats_and_standards_=
whitepaper_-_version_20191025.pdf" target=3D"_blank">
https://www.ntia.gov/files/ntia/publications/ntia_sbom_formats_and_standard=
s_whitepaper_-_version_20191025.pdf</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
<table style=3D"border-collapse:collapse" cellspacing=3D"0" cellpadding=3D"=
0" border=3D"0">
<tbody>
<tr>
<td colspan=3D"3" style=3D"padding:0in">
<div style=3D"margin-top:15pt;margin-bottom:15pt">
<div class=3D"MsoNormal" style=3D"text-align:center" align=3D"center"><span=
 style=3D"font-size:10.5pt;font-family:&quot;Helvetica Neue&quot;;color:rgb=
(51,51,51)">
<hr width=3D"100%" size=3D"1" align=3D"center">
</span></div>
</div>
</td>
</tr>
<tr>
<td style=3D"width:300pt;padding:0in" width=3D"400" valign=3D"top">
<table style=3D"width:300pt;border-collapse:collapse" width=3D"400" cellspa=
cing=3D"0" cellpadding=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"width:150pt;padding:0in" width=3D"200" valign=3D"top">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:&quot;A=
rial&quot;,sans-serif;color:rgb(64,64,64)">Christopher D. Lusk</span></b><b=
r>
<span style=3D"font-size:9pt;font-family:&quot;Arial&quot;,sans-serif;color=
:rgb(64,64,64)">Product Security Analyst</span><br>
<span style=3D"font-size:9pt;font-family:&quot;Arial&quot;,sans-serif;color=
:rgb(64,64,64)">Product Security Office<br>
Lenovo</span><u></u><u></u></p>
</td>
<td style=3D"width:150pt;padding:0in" width=3D"200" valign=3D"top">
<p class=3D"MsoNormal"><br>
<img style=3D"width: 0.243in; height: 0.0902in;" id=3D"gmail-m_248722584823=
5209125Picture_x0020_2" src=3D"cid:17c56193d564cdccc1" alt=3D"Email" width=
=3D"23" height=3D"9" border=3D"0"><a href=3D"mailto:clusk@lenovo.com" targe=
t=3D"_blank"><span style=3D"font-size:9pt;font-family:&quot;Arial&quot;,san=
s-serif;color:rgb(64,64,64);text-decoration:none">clusk@lenovo.com</span></=
a><u></u><u></u></p>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"padding:0in">
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"padding:0in" valign=3D"top">
<p class=3D"MsoNormal"><span style=3D"font-size:8pt;font-family:&quot;Arial=
&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D"http://www.lenovo.com/" t=
arget=3D"_blank"><span style=3D"color:rgb(64,64,64)">Lenovo.com</span></a><=
br>
<a href=3D"http://twitter.com/lenovo" target=3D"_blank"><span style=3D"colo=
r:rgb(64,64,64)">Twitter</span></a></span><span style=3D"font-size:5pt;font=
-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><spa=
n style=3D"font-size:8pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb=
(64,64,64)">|</span><span style=3D"font-size:5pt;font-family:&quot;Arial&qu=
ot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span style=3D"font-size:8=
pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D=
"https://instagram.com/lenovo" target=3D"_blank"><span style=3D"color:rgb(6=
4,64,64)">Instagram</span></a></span><span style=3D"font-size:5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span sty=
le=3D"font-size:8pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(64,6=
4,64)">|</span><span style=3D"font-size:5pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:rgb(64,64,64)">=C2=A0</span><span style=3D"font-size:8pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D"http=
://www.facebook.com/lenovo" target=3D"_blank"><span style=3D"color:rgb(64,6=
4,64)">Facebook</span></a></span><span style=3D"font-size:5pt;font-family:&=
quot;Arial&quot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span style=
=3D"font-size:8pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,=
64)">|</span><span style=3D"font-size:5pt;font-family:&quot;Arial&quot;,san=
s-serif;color:rgb(64,64,64)">=C2=A0</span><span style=3D"font-size:8pt;font=
-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D"http:/=
/www.linkedin.com/company/lenovo" target=3D"_blank"><span style=3D"color:rg=
b(64,64,64)">Linkedin</span></a></span><span style=3D"font-size:5pt;font-fa=
mily:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span s=
tyle=3D"font-size:8pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(64=
,64,64)">|</span><span style=3D"font-size:5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span style=3D"font-size:8pt;=
font-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D"ht=
tp://www.youtube.com/lenovovision" target=3D"_blank"><span style=3D"color:r=
gb(64,64,64)">YouTube</span></a></span><span style=3D"font-size:5pt;font-fa=
mily:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span s=
tyle=3D"font-size:8pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(64=
,64,64)">|</span><span style=3D"font-size:5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:rgb(64,64,64)">=C2=A0</span><span style=3D"font-size:8pt;=
font-family:&quot;Arial&quot;,sans-serif;color:rgb(64,64,64)"><a href=3D"ht=
tps://www.lenovo.com/gb/en/privacy-selector/" target=3D"_blank"><span style=
=3D"color:rgb(64,64,64)">Privacy</span></a><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</td>
<td style=3D"background:white none repeat scroll 0% 0%;padding:0in" valign=
=3D"top">
<div align=3D"right">
<table style=3D"border-collapse:collapse" cellspacing=3D"0" cellpadding=3D"=
0" border=3D"0">
<tbody>
<tr>
<td style=3D"padding:0in" valign=3D"top">
<p class=3D"MsoNormal"><img style=3D"width: 3.375in; height: 1.7083in;" id=
=3D"gmail-m_2487225848235209125Picture_x0020_1" src=3D"cid:17c56193d575b16b=
22" width=3D"324" height=3D"164" border=3D"0"><u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
<td style=3D"padding:0in"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>

--0000000000007df04a05cdb05705--

--0000000000007df04b05cdb05706
Content-Type: image/gif; name="image001.gif"
Content-Disposition: inline; filename="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <17c56193d564cdccc1>
X-Attachment-Id: 17c56193d564cdccc1

R0lGODlhFwAJALMAAN3d3WZmZpmZmczMzERERLu7u4iIiAAAAP///wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH5BAEAAAgALAAAAAAXAAkAAAQtEMliqhUy643M+SDBjZJ3GEU6kKMZWAXLmeApbyaaArdm
xr1Z7SMKdoaHoiwCADs=
--0000000000007df04b05cdb05706
Content-Type: image/png; name="image002.png"
Content-Disposition: inline; filename="image002.png"
Content-Transfer-Encoding: base64
Content-ID: <17c56193d575b16b22>
X-Attachment-Id: 17c56193d575b16b22

iVBORw0KGgoAAAANSUhEUgAAAUQAAACkCAYAAADv2VfwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA4BpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2
NDM1MiwgMjAyMC8wMS8zMC0xNTo1MDozOCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
Ok9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyMzcwQjk0OENGNDMxMUU0ODdFRkU5QTJBN0Ew
NTk0OCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpENDZGRkQ1MzdEOEUxMUVBOTBDMEJDRTNG
NUUxNDYzRSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpENDZGRkQ1MjdEOEUxMUVBOTBDMEJD
RTNGNUUxNDYzRSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoV2lu
ZG93cykiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozNjg1
YjQzMy1mOWIzLTg3NDctOGU4My1jZDcyODRhOTM1ZGQiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2Jl
OmRvY2lkOnBob3Rvc2hvcDplNzBiYmRkYy1iNTczLThiNGEtODc5ZS03ZjAzZGM3NjU0ZTEiLz4g
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
--0000000000007df04b05cdb05706--

