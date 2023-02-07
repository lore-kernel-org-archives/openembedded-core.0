Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1634C636D4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 16:58:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.88863.1675789093891853020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 08:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3e7s8Ew;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id bx22so12728356pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XbkiiXf6/UKcQlbxFG5aKQHQENQWRBPYTGGeQG6S5Q=;
        b=D3e7s8EwxlLq3yCUNpSqEYTBn/PX3Gn6CgHvUm9nNdQ8f//ppEuw0o74Ovg8HtyaKA
         f8LslJxrYxo1/bAxG9er1QTwE6J/RrDO5HR5dN0DwzgXtuFDsv8IrVYBJg5HAOOjO4mI
         uTuRkprtnqky53WgStOTPk9nrTlZ08eWPD3A4DLcMUWk9vwNPFSjYLb36qvusNWmlr1R
         CAABeoICvNlVr2CJ8CE1myVnR+I2GkJm2LDp7/elaSSDlTM5+cHpBdBO7AAjVA+6Qz+O
         CcA5yTOqZ6BuavUcA0ucJuiD3D49y8zTpY6KWWMQpO4uaVs3VPQo8he+ShzQsxT1qGMm
         6p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :cc:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XbkiiXf6/UKcQlbxFG5aKQHQENQWRBPYTGGeQG6S5Q=;
        b=hw00ZxMEUVXubknaCFl3NRUPr6EQHwIuWvCGR+MG37mMnIvbkxn1vSfXPKFD8aJYPR
         Tjy0jfbLFChDzI0G79iaZFSITo48n0MI5AXV3jdIn6tvFlde7ZayTyfBl5iyk66JS/52
         un7/06MOkc4PRxkFzGoune+tPLQNt6xVdla8B+Qh2oMiQdEYFXyeIr6l7Zkc5vWmpQ7/
         Huyarj5NdmhrYl/OwqQXJ/sSERWUHzoFrT9YSfD+aoWj2ttVWHXFmIcTrrCTCrRJOB67
         bh5fpTT3RJQzUuDK5ZIRKaJ6Xb0wBa3AIzpR2TW3OyqnLo+1pyXUxcDvn6Vhlg3byzCF
         tYrw==
X-Gm-Message-State: AO0yUKVx7f1Jx2NSBwZJ9VszBTI4O0c7OOSCGpWv6RDUtPV6OVOymIP1
	PZXBDKr7sPtATzM+NJAlwj2d9Kmt5ss/9w==
X-Google-Smtp-Source: AK7set8rIA7uv/luqQpJV6PlqKGK+BeJlwOllOgBA/PxfCNvkJYW2zBoOkdvR8g6VbfpABy+Hxsn1A==
X-Received: by 2002:a05:6a20:8401:b0:c0:afba:8b78 with SMTP id c1-20020a056a20840100b000c0afba8b78mr5071192pzd.45.1675789093009;
        Tue, 07 Feb 2023 08:58:13 -0800 (PST)
Received: from BFTLPTI009 ([183.83.146.245])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001990028c0c9sm1560336plb.68.2023.02.07.08.58.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:58:12 -0800 (PST)
From: <sundeep.kokkonda@gmail.com>
To: "'\"Alex Kiernan\"'" <alex.kiernan@gmail.com>,
	"'Richard Purdie'" <richard.purdie@linuxfoundation.org>
Cc: <openembedded-core@lists.openembedded.org>,
	"'Randy MacLeod'" <Randy.MacLeod@windriver.com>
Subject: Yocto Bug 14965 - Need info on rmeta hash
Date: Tue, 7 Feb 2023 22:28:08 +0530
Message-ID: <003001d93b15$5c8396e0$158ac4a0$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0031_01D93B43.763CE450"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adk7FLu8Trw3aqMsT5OBSa3qgvxE5A==
Content-Language: en-in
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 16:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176823

This is a multipart message in MIME format.

------=_NextPart_000_0031_01D93B43.763CE450
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Alex,

 

I am working on Yocto bug 14965. There is a build failure happening during
rust build because of 2 rmeta files with different hashes are generated.

 

I found that the changes with below commit id causing the 2nd rmeta file
(libcore-c5fc82c620226960.rmeta) generation.

e33afcd0dc rust-common.bbclass: use built-in rust targets for -native builds

 

I am trying to find the changes in build which causing the generation of 2nd
rmeta with different hash. I gave 2 builds by with & without e33afcd0dc
commit changes.

*	I checked the sigdata of librsvg & libstd-rs in both builds and
those are identical.
*	The dependency files
(../build/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/build/target/releas
e/deps/*.d) also analysed and the shown differences are only the changed
hash value (did not get any info on what is causing this change).
*	But, some interesting changes I observed in '.rustc_info.json' which
are related to e33afcd0dc commit. In this json file,

*	'host' tag changed from 'x86_64-linux-gnu' ->
'x86_64-unknown-linux-gnu',
*	an extra 'target_feature=\"fxsr\' is added, and
*	'rustc_fingerprint' has different values between 2 builds.



Since you know much about rust, can you let me know is there any way I can
check which exact changes are causing the hash to be changed? also, are the
above changes in json file will cause hash to be changed?

 

 

Thanks,

Sundeep K.

 


------=_NextPart_000_0031_01D93B43.763CE450
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Gautami;
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1234463531;
	mso-list-template-ids:1294254332;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>Hello =
Alex,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>I am =
working on Yocto bug&nbsp;14965. There is a build failure happening =
during&nbsp;<i>rust&nbsp;</i>build because of 2 rmeta files with =
different hashes are generated.<o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>I =
found that the changes with below commit id causing the 2<sup><span =
style=3D'border:none windowtext 1.0pt;padding:0cm'>nd</span></sup><span =
style=3D'border:none windowtext 1.0pt;padding:0cm'>&nbsp;rmeta file =
(libcore-c5fc82c620226960.rmeta) =
generation.</span><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><i><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>e33afcd=
0dc rust-common.bbclass: use built-in rust targets for -native =
builds</span></i><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p></=
o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>I am =
trying to find the changes in build which causing the generation of =
2<sup><span style=3D'border:none windowtext =
1.0pt;padding:0cm'>nd</span></sup><span style=3D'border:none windowtext =
1.0pt;padding:0cm'>&nbsp;rmeta with different&nbsp;</span>hash. I gave 2 =
builds by with &amp; without&nbsp;<i>e33afcd0dc&nbsp;</i><span =
style=3D'border:none windowtext 1.0pt;padding:0cm'>commit =
changes</span><i>.</i><o:p></o:p></span></p><ul type=3Ddisc><li =
class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level1 lfo1;background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>I checked the sigdata =
of&nbsp;<i>librsvg&nbsp;</i>&amp;&nbsp;<i>libstd-rs</i>&nbsp;in both =
builds and those are identical.</span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li><li class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level1 lfo1;background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>The dependency files =
(../build/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/build/target/rel=
ease/deps/*.d) also analysed and the shown differences are only the =
changed hash value (did not get any info on what is causing this =
change).</span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li><li class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level1 lfo1;background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>But, some interesting =
changes I observed in '<i>.rustc_info.json</i>' which are related =
to&nbsp;<i>e33afcd0dc&nbsp;</i>commit. In this json file,</span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li><ul type=3Dcircle><li class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level2 =
lfo1;background:white;vertical-align:baseline'><i><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>'host'&nbsp;</span></i><spa=
n style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>tag changed from =
'x86_64-linux-gnu' -&gt; 'x86_64-unknown-linux-gnu',</span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li><li class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level2 lfo1;background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>an extra =
'<i>target_feature=3D\&quot;fxsr\</i>' is added, and</span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li><li class=3DMsoNormal =
style=3D'color:black;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;m=
so-list:l0 level2 lfo1;background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:EN-IN'>&#8216;<i>rustc_fingerprint=
</i>&#8217; has different values between 2 builds.<br><br></span><span =
style=3D'font-size:12.0pt;mso-fareast-language:EN-IN'><o:p></o:p></span><=
/li></ul></ul><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;background:wh=
ite;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>Since =
you know much about&nbsp;<i>rust</i>, can you let me know is there any =
way I can check which exact changes are causing the hash to be changed? =
also, are the above changes in json file will cause hash to be =
changed?<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>Thanks,=
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'background:white;vertical-align:baseline'><span =
style=3D'font-size:12.0pt;color:black;mso-fareast-language:EN-IN'>Sundeep=
 K.<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0031_01D93B43.763CE450--


