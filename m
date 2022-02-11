Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C23C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:22:39 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.5583.1644574958505568358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+rxsMYO;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id l14so4648873vko.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 02:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMmL7QPwFch4EGqVl9TLNo0a1Flpu23s+fsS48GE3ok=;
        b=n+rxsMYOdZ7wfG04/w9NGYlan6Cpk/YQAAx84T+4OppWKIYdIqEPm0cMAxgLB9YZrD
         qefHrWqJsbnNyn0ay2t3CvaiRX7WJCCUvqI7X7xKL6YjD4F2GDIdnEQ3fFLyKSEhoHZd
         Tc/yL1F28QE72KQ2jVsvDqx3sN9m/cjHUu3plByjEW1nvNriV6p3VNfLWnTls0Ki6/bH
         xB+FfTIF/yAs9Qyb9Fq8NSDOZXhk0QgkLLkyiT5iGaUMOK5e4KsMR7XQZeEnz7QzVL0L
         e1lQApclQDV4fB802FeeJ4KfRuPxWdw6G966YLQej0ku9Er+6aQOc8GYp7a6rKJF3FRH
         e1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMmL7QPwFch4EGqVl9TLNo0a1Flpu23s+fsS48GE3ok=;
        b=XDx2jOgFENPgHdydziCNY8k6E2EJCK5rdMVIcmykH5HVWinPs9Ts/z4+g4/NXo9DLH
         VZurLOlvmJflOt/Nzx/ozo9AQIucnwZ3hwRaTEcogAK72oHy8bth+B/MiKZPVaLcSTtL
         jlCaKG7Dhz7G/ctz6jheDu8yMdChHKA4oFMDMa3scORcq98s+yN2khkC3cbRCuX7iw/Z
         VB3Q9dU+ohYu2w3mzNrozp+wPW+UgawYuGXEv3Tg3lS2NWG5uwV9wY3G57TmsGxxWUR2
         obmDQJitzEulWc9LuqPx99wmESq+2jRaIt9cwg/cwdxBnwyuov0q4uKg04YDnMc4YL05
         qoaA==
X-Gm-Message-State: AOAM532nDi/Xs8qMGw9S3ezp0ZAvnW6nwRrDEkNDu72RMyniZNp8uYrI
	oQRYAJ7IuaPUMa/rQbkHRUCEL0LclHAntsmUOzs=
X-Google-Smtp-Source: 
 ABdhPJzXG9dlnVxXj135o3RmQ/nCUhV6Q59ap8L+XHkt9XljLoCiQ8TbZTbuC+G31ZuWYVjq1XqfEjK5DIatWs7jVb8=
X-Received: by 2002:a05:6122:218f:: with SMTP id
 j15mr238307vkd.20.1644574957547;
 Fri, 11 Feb 2022 02:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211095806.4360-1-ceggers@arri.de>
In-Reply-To: <20220211095806.4360-1-ceggers@arri.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Feb 2022 11:22:25 +0100
Message-ID: 
 <CANNYZj-oUps-VnKy04E2FCSUNdV4Wjp7TNAnZuepOzxhtxsEZg@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] package_manager: ipk: Fix host
 manifest generation
To: Christian Eggers <ceggers@arri.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksiy Obitotskyy <oobitots@cisco.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>
Content-Type: multipart/related; boundary="00000000000026cd5205d7bb72bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 10:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161639

--00000000000026cd5205d7bb72bc
Content-Type: multipart/alternative; boundary="00000000000026cd5105d7bb72bb"

--00000000000026cd5105d7bb72bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like your mail system broke the indentation?

Alex

On Fri, 11 Feb 2022 at 10:58, Christian Eggers <ceggers@arri.de> wrote:

> From: Oleksiy Obitotskyy <oobitots@cisco.com>
>
> Since honister host manifest stopped to generate, i.e.
> manifest file is empty but all ipks/files into sdk is
> ok.
>
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
> meta/lib/oe/sdk.py | 4 ++++
> 1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index 37b59afd1a99..27347667e846 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -115,6 +115,10 @@ def sdk_list_installed_packages(d, target,
> rootfs_dir=3DNone):
>
> rootfs_dir =3D [sdk_output, os.path.join(sdk_output, target_path)][target=
 is
> True]
>
> + if target is False:
> + ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK")
> + d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
> +
> img_type =3D d.getVar('IMAGE_PKGTYPE')
> import importlib
> cls =3D importlib.import_module('oe.package_manager.' + img_type)
> --
> 2.34.1
>
> _______________________________________________________=E2=80=8B
> Christian
> Eggers
> Software Engineer
> =E2=80=8B
> ARRI
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Arriweg 17 ,
> 83071
> Stephanskirchen
>
>
> *www.arri.com * <http://www.arri.com/>
> *+49 8036 3009-3118* <+49%208036%203009-3118>
> *CEggers@arri.de* <CEggers@arri.de>
>
> =E2=80=8B
> [image: Orbiter Docking Ring]
> <https://www.arri.com/en/lighting/led/orbiter-accessories/orbiter-docking=
ring/>
> Get all the latest information from *www.arri.com* <http://www.arri.com/>
> , *Facebook* <https://www.facebook.com/TeamARRI>, *Twitter*
> <https://twitter.com/ARRIChannel>, *Instagram* <http://instagram.com/arri=
>
>  and *YouTube* <http://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik G=
mbH
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRB 54477
>
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Wa=
lter Trauninger; Markus Zeiler
>
> =E2=80=8B
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161638):
> https://lists.openembedded.org/g/openembedded-core/message/161638
> Mute This Topic: https://lists.openembedded.org/mt/89068016/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026cd5105d7bb72bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks like your mail system broke the indentation?</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, 11 Feb 2022 at 10:58, Christia=
n Eggers &lt;<a href=3D"mailto:ceggers@arri.de">ceggers@arri.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Fr=
om: Oleksiy Obitotskyy &lt;<a href=3D"mailto:oobitots@cisco.com" target=3D"=
_blank">oobitots@cisco.com</a>&gt;<br><br>Since honister host manifest stop=
ped to generate, i.e.<br>manifest file is empty but all ipks/files into sdk=
 is<br>ok.<br><br>Signed-off-by: Oleksiy Obitotskyy &lt;<a href=3D"mailto:o=
obitots@cisco.com" target=3D"_blank">oobitots@cisco.com</a>&gt;<br>Signed-o=
ff-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>(cherr=
y picked from commit 79a2392f5d2a4cb6509a83afb40bca01bac59914)<br>Signed-of=
f-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_b=
lank">anuj.mittal@intel.com</a>&gt;<br>---<br> meta/lib/oe/sdk.py | 4 ++++<=
br> 1 file changed, 4 insertions(+)<br><br>diff --git a/meta/lib/oe/sdk.py =
b/meta/lib/oe/sdk.py<br>index 37b59afd1a99..27347667e846 100644<br>--- a/me=
ta/lib/oe/sdk.py<br>+++ b/meta/lib/oe/sdk.py<br>@@ -115,6 +115,10 @@ def sd=
k_list_installed_packages(d, target, rootfs_dir=3DNone):<br> <br>         r=
ootfs_dir =3D [sdk_output, os.path.join(sdk_output, target_path)][target is=
 True]<br> <br>+    if target is False:<br>+        ipkgconf_sdk_target =3D=
 d.getVar(&quot;IPKGCONF_SDK&quot;)<br>+        d.setVar(&quot;IPKGCONF_TAR=
GET&quot;, ipkgconf_sdk_target)<br>+<br>     img_type =3D d.getVar(&#39;IMA=
GE_PKGTYPE&#39;)<br>     import importlib<br>     cls =3D importlib.import_=
module(&#39;oe.package_manager.&#39; + img_type)<br>-- <br>2.34.1<br><br></=
div><div dir=3D"ltr" style=3D"direction:ltr"><table style=3D"width:100%" ce=
llspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-siz=
e:0px"><td style=3D"vertical-align:top" align=3D"left"><table style=3D"font=
-size:0px" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr styl=
e=3D"font-size:0px"><td style=3D"padding:0px;vertical-align:top" align=3D"l=
eft"><table style=3D"width:100%;font-size:0px" cellspacing=3D"0" cellpaddin=
g=3D"0" border=3D"0"><tbody><tr style=3D"font-size:14.67px;color:rgb(127,12=
7,127);font-style:normal;font-weight:400;white-space:nowrap"><td style=3D"v=
ertical-align:top;font-family:Calibri,Arial,sans-serif" align=3D"left">____=
___________________________________________________<span style=3D"font-fami=
ly:remialcxesans;font-size:1px;color:rgb(255,255,255);line-height:1px">=E2=
=80=8B</span></td></tr><tr style=3D"font-size:0px"><td style=3D"vertical-al=
ign:top" align=3D"left"><table style=3D"font-size:0px" cellspacing=3D"0" ce=
llpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:0px"><td style=
=3D"vertical-align:top" align=3D"left"><table style=3D"font-size:0px;color:=
rgb(127,127,127);font-style:normal;font-weight:400;white-space:nowrap" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:=
14.67px"><td style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if" align=3D"left">Christian</td><td style=3D"vertical-align:top;color:rgb(=
0,0,1);font-family:Calibri,Arial,sans-serif" align=3D"left">=C2=A0<br></td>=
<td style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif" align=
=3D"left">Eggers</td></tr></tbody></table></td></tr><tr style=3D"font-size:=
0px"><td style=3D"vertical-align:top" align=3D"left"><table style=3D"font-s=
ize:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-spac=
e:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=
=3D"font-size:14.67px"><td style=3D"vertical-align:top;font-family:Calibri,=
Arial,sans-serif" align=3D"left">Software=C2=A0Engineer</td></tr><tr style=
=3D"font-size:14.67px;color:rgb(0,0,1)"><td style=3D"vertical-align:top;fon=
t-family:Calibri,Arial,sans-serif" align=3D"left">=E2=80=8B</td></tr></tbod=
y></table></td></tr></tbody></table></td></tr><tr style=3D"font-size:0px"><=
td style=3D"vertical-align:top" align=3D"left"><table style=3D"font-size:0p=
x" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"fon=
t-size:0px"><td style=3D"vertical-align:top" align=3D"left"><table style=3D=
"font-size:0px;color:rgb(14,80,173);font-style:normal;font-weight:400;white=
-space:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr =
style=3D"font-size:13.33px"><td style=3D"vertical-align:top;font-family:&qu=
ot;Arial Black&quot;" align=3D"left">ARRI</td></tr><tr style=3D"font-size:1=
0.67px;color:rgb(127,127,127)"><td style=3D"vertical-align:top;font-family:=
Arial" align=3D"left"><span style=3D"font-size:11px">Arnold=C2=A0&amp;=C2=
=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=A0Betrie=
bs=C2=A0KG</span>=C2=A0<br></td></tr></tbody></table></td></tr><tr style=3D=
"font-size:0px"><td style=3D"vertical-align:top" align=3D"left"><table styl=
e=3D"font-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400=
;white-space:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbod=
y><tr style=3D"font-size:10.67px"><td style=3D"vertical-align:top;font-fami=
ly:Arial" align=3D"left">Arriweg=C2=A017</td><td style=3D"vertical-align:to=
p;font-family:Arial" align=3D"left">,=C2=A0<br></td><td style=3D"vertical-a=
lign:middle;font-family:Arial" align=3D"left">83071</td><td style=3D"vertic=
al-align:middle;font-family:Arial" align=3D"left">=C2=A0<br></td><td style=
=3D"vertical-align:middle;font-family:Arial" align=3D"left">Stephanskirchen=
</td></tr></tbody></table></td></tr></tbody></table></td></tr><tr style=3D"=
font-size:0px"><td style=3D"vertical-align:top" align=3D"left"><table style=
=3D"font-size:0px" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody>=
<tr style=3D"font-size:0px"><td style=3D"vertical-align:top" align=3D"left"=
><table style=3D"font-size:0px;color:rgb(21,50,185);font-style:normal;font-=
weight:400;white-space:nowrap" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr style=3D"font-size:11px"><td style=3D"vertical-align:top;=
font-family:Arial" align=3D"left"><span style=3D"text-decoration:underline"=
><a href=3D"http://www.arri.com/" id=3D"gmail-m_6195521162510029733LPlnk689=
713" style=3D"text-decoration:underline;color:rgb(21,50,185)" target=3D"_bl=
ank"><strong style=3D"font-weight:400">www.arri.com=C2=A0<br><br></strong><=
/a></span></td></tr><tr style=3D"font-size:0px"><td style=3D"vertical-align=
:top" align=3D"left"><table style=3D"font-size:0px;color:rgb(133,128,128);f=
ont-style:normal;font-weight:400;line-height:normal;white-space:nowrap" cel=
lspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size=
:14.67px"><td style=3D"padding:0px;vertical-align:top;font-size:0px" align=
=3D"left"><img src=3D"cid:17ee84d74fcc355a4bd1" alt=3D"" style=3D"width: 20=
px; min-width: 20px; max-width: 20px; font-size: 0px;" width=3D"20" border=
=3D"0"></td><td style=3D"padding:0px;vertical-align:top;font-family:Calibri=
,Arial,sans-serif" align=3D"left"><a href=3D"tel:+49%208036%203009-3118" id=
=3D"gmail-m_6195521162510029733LPlnk689713" style=3D"text-decoration:none;c=
olor:rgb(133,128,128)" target=3D"_blank"><strong style=3D"font-weight:400">=
+49=C2=A08036=C2=A03009-3118</strong></a></td></tr><tr style=3D"font-size:0=
px"><td style=3D"padding:0px;vertical-align:top" align=3D"left"></td><td st=
yle=3D"padding:0px;vertical-align:top" align=3D"left"></td></tr><tr style=
=3D"font-size:0px"><td style=3D"padding:0px;vertical-align:top" align=3D"le=
ft"></td><td style=3D"padding:0px;vertical-align:top" align=3D"left"></td><=
/tr><tr style=3D"font-size:14.67px"><td style=3D"padding:0px;vertical-align=
:top;font-size:0px" align=3D"left"><img src=3D"cid:17ee84d74fe63f23b592" al=
t=3D"" style=3D"width: 20px; min-width: 20px; max-width: 20px; font-size: 0=
px;" width=3D"20" border=3D"0"></td><td style=3D"padding:0px;vertical-align=
:top;font-family:Calibri,Arial,sans-serif" align=3D"left"><a href=3D"mailto=
:CEggers@arri.de" id=3D"gmail-m_6195521162510029733LPlnk689713" style=3D"te=
xt-decoration:none;color:rgb(133,128,128)" target=3D"_blank"><strong style=
=3D"font-weight:400">CEggers@arri.de</strong></a></td></tr></tbody></table>=
</td></tr></tbody></table></td></tr></tbody></table></td></tr><tr style=3D"=
font-size:14.67px;color:rgb(0,0,1);font-style:normal;font-weight:400;white-=
space:nowrap"><td style=3D"vertical-align:top;font-family:Calibri,Arial,san=
s-serif" align=3D"left"><br>=E2=80=8B</td></tr></tbody></table></td></tr><t=
r style=3D"font-size:0px;line-height:normal"><td style=3D"padding:0px;verti=
cal-align:top" align=3D"left"><a href=3D"https://www.arri.com/en/lighting/l=
ed/orbiter-accessories/orbiter-dockingring/" id=3D"gmail-m_6195521162510029=
733LPlnk689713" style=3D"text-decoration:none" target=3D"_blank"><img src=
=3D"https://assets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Sig=
nature_650x95.jpg" title=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking Ri=
ng" style=3D"font-size: 12px;" border=3D"0"></a></td></tr><tr style=3D"font=
-size:13px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-s=
pace:nowrap"><td style=3D"padding:0px;vertical-align:top;font-family:Calibr=
i,Arial,sans-serif" align=3D"left">Get=C2=A0all=C2=A0the=C2=A0latest=C2=A0i=
nformation=C2=A0from=C2=A0<span style=3D"text-decoration:underline"><a href=
=3D"http://www.arri.com/" id=3D"gmail-m_6195521162510029733LPlnk689713" tit=
le=3D"www.arri.com" style=3D"text-decoration:underline;color:rgb(127,127,12=
7)" target=3D"_blank"><strong style=3D"font-weight:400">www.arri.com</stron=
g></a></span>,=C2=A0<span style=3D"text-decoration:underline"><a href=3D"ht=
tps://www.facebook.com/TeamARRI" id=3D"gmail-m_6195521162510029733LPlnk6897=
13" style=3D"text-decoration:underline;color:rgb(127,127,127)" target=3D"_b=
lank"><strong style=3D"font-weight:400">Facebook</strong></a></span>,=C2=A0=
<span style=3D"text-decoration:underline"><a href=3D"https://twitter.com/AR=
RIChannel" id=3D"gmail-m_6195521162510029733LPlnk689713" style=3D"text-deco=
ration:underline;color:rgb(127,127,127)" target=3D"_blank"><strong style=3D=
"font-weight:400">Twitter</strong></a></span>,=C2=A0<span style=3D"text-dec=
oration:underline"><a href=3D"http://instagram.com/arri" id=3D"gmail-m_6195=
521162510029733LPlnk689713" style=3D"text-decoration:underline;color:rgb(12=
7,127,127)" target=3D"_blank"><strong style=3D"font-weight:400">Instagram</=
strong></a></span>=C2=A0and=C2=A0<span style=3D"text-decoration:underline">=
<a href=3D"http://www.youtube.com/user/ARRIChannel" id=3D"gmail-m_619552116=
2510029733LPlnk689713" style=3D"text-decoration:underline;color:rgb(127,127=
,127)" target=3D"_blank"><strong style=3D"font-weight:400">YouTube</strong>=
</a></span>.<br></td></tr><tr style=3D"font-size:0px"><td style=3D"padding:=
0px;vertical-align:top" align=3D"left"><table style=3D"font-size:0px;color:=
rgb(106,106,106);font-style:normal;font-weight:400;white-space:nowrap" cell=
spacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr style=3D"font-size:=
10px"><td style=3D"vertical-align:top;font-family:Arial" align=3D"left"><br=
>Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH=C2=A0&amp;=
=C2=A0Co.=C2=A0Betriebs=C2=A0KG<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=
=C2=A0Registergericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=
=A0Handelsregisternummer:=C2=A0HRA=C2=A057918<br>Pers=C3=B6nlich=C2=A0hafte=
nder=C2=A0Gesellschafter:=C2=A0Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=
=A0Technik=C2=A0GmbH<br>Sitz:=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registe=
rgericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=A0=E2=80=91=C2=A0Handelsreg=
isternummer:=C2=A0HRB=C2=A054477<br>Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Dr.=C2=
=A0Michael=C2=A0Neuh=C3=A4user;=C2=A0Stephan=C2=A0Schenk;=C2=A0Walter=C2=A0=
Trauninger;=C2=A0Markus=C2=A0Zeiler<br></td></tr><tr style=3D"font-size:14.=
67px;color:rgb(0,0,1)"><td style=3D"vertical-align:top;font-family:Calibri,=
Arial,sans-serif" align=3D"left"><br>=E2=80=8B<br></td></tr></tbody></table=
></td></tr></tbody></table></td></tr></tbody></table></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161638): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161638" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161638</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89068016/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89068016/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000026cd5105d7bb72bb--

--00000000000026cd5205d7bb72bc
Content-Type: image/png; name="image399736.png"
Content-Disposition: inline; filename="image399736.png"
Content-Transfer-Encoding: base64
Content-ID: <17ee84d74fcc355a4bd1>
X-Attachment-Id: 17ee84d74fcc355a4bd1

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC
--00000000000026cd5205d7bb72bc
Content-Type: image/png; name="image200984.png"
Content-Disposition: inline; filename="image200984.png"
Content-Transfer-Encoding: base64
Content-ID: <17ee84d74fe63f23b592>
X-Attachment-Id: 17ee84d74fe63f23b592

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=
--00000000000026cd5205d7bb72bc--

