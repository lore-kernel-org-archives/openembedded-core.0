Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490D5C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 22:34:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8393.1678746838685282345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 15:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cjzgM7Cz;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id a2so14627529plm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678746838;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1ooYcvhjaCLNmzGlJfbEULBhVfqMZtf0fSC845WWrA=;
        b=cjzgM7Czz7C1ge9XFGiw4UxcTF9d13/avuB9Uow4qV83j79X4VJaakEsdfPPWzGaj5
         P1gsE4QJ9HV8wwwNEp1go1n01CNBDKvGyqmcZwupGbi56C023T2LN00wAp/vT4tPUnbj
         +pXIhmMm9JQ9zNyaxGeAVmLRGKlCQRKlF7RWFcS26hebIQn05GPIoHVxQFu3m+hmvUxD
         AXt0yA2YTmWgC7QVD8YSKHU27/nXBeDyz7oL2w4gWi1l56HQLLGAuRLc0Xco8A4NlG71
         6bBh8kzY7Ya4iEVTZq9au0CYMI0OoiB0JcM30kzGhH32Y/+ZucPEE4QOpf1MHtiBF6xg
         TEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678746838;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1ooYcvhjaCLNmzGlJfbEULBhVfqMZtf0fSC845WWrA=;
        b=IWjkvy4LcMKxEWx0H2pHngkE6Is4N1Y6lgVXSmm6xB9keMDK703F5O7gLy0cq7KiyW
         m/dWvs6YSpFQnu/t+AxeASVKs1DBrNTBeOhbgZZFK3B9TGiV9xu/Nyv7Qh6U0g11QlL7
         1Hb5aZZQYX6QEsFyHFvYn2G6wyMwAveLLRzc3FHoIGqzKmddosuH6hjnfOl7M4++PJtA
         6BZzXfzuk8wi/JWwUGzomt/xyfHJSDU3AokTAiZ71oHnwKQjX0xCBLo+aWy20h8rToOx
         ShIAqUVF7bEyA/Tw+cWBToIMROu1KVfHcIqER8/obxfUT/r3SxAx1WBhDg8N3QpmiIj+
         Gs7Q==
X-Gm-Message-State: AO0yUKXUJCj6ncqxtdvAa8g9Dr65K9ZoeBhgihmoFSAQuXGW9+G547Va
	vb0opA9r8g8kzAxrpBt/Bw+sHSnALm4=
X-Google-Smtp-Source: AK7set+F9OjJ/gJiWy0bGbfZSJND6Ctxz2GNfGwb8vE7mlMIO50J395SXPkeppcVouuynELUaR9TkQ==
X-Received: by 2002:a05:6a20:9390:b0:c6:ff46:c713 with SMTP id x16-20020a056a20939000b000c6ff46c713mr44518670pzh.57.1678746837725;
        Mon, 13 Mar 2023 15:33:57 -0700 (PDT)
Received: from skjolley ([2600:1011:a124:5236:fab7:c3f3:b8a7:82b5])
        by smtp.gmail.com with ESMTPSA id x21-20020aa784d5000000b00592eb6f239fsm216415pfn.40.2023.03.13.15.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Mar 2023 15:33:57 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Current high bug count owners for Yocto Project 4.2
Date: Mon, 13 Mar 2023 15:33:57 -0700
Message-ID: <0b6601d955fb$e719a4b0$b54cee10$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0B67_01D955C1.3ABE0100"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIIU1YqlK7LmhytrnvnBINB/Gimgw==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 22:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178468

This is a multipart message in MIME format.

------=_NextPart_000_0B67_01D955C1.3ABE0100
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Below is the list as of top 38 bug owners as of the end of WW10 of who have
open medium or higher bugs and enhancements against YP 4.2.   There are 33
possible work days left until the final release candidates for YP 4.2 needs
to be released.


Who

Count


michael.opdenacker@bootlin.com

33


ross.burton@arm.com

31


bruce.ashfield@gmail.com

25


randy.macleod@windriver.com

25


david.reyna@windriver.com

23


richard.purdie@linuxfoundation.org

22


JPEWhacker@gmail.com

10


pavel@zhukoff.net

9


sakib.sajal@windriver.com

6


pidge@toganlabs.com

4


tim.orling@konsulko.com

4


saul.wold@windriver.com

3


sundeep.kokkonda@windriver.com

3


sundeep.kokkonda@gmail.com

3


alexandre.belloni@bootlin.com

2


alexis.lothore@bootlin.com

2


yoann.congal@smile.fr

2


Yash.Shinde@windriver.com

2


jon.mason@arm.com

2


rybczynska@gmail.com

2


piotr.lobacz@vm.pl

2


fawzi.khaber@smile.fr

1


louis.rannou@syslinbit.com

1


hongxu.jia@windriver.com

1


chee.yang.lee@intel.com

1


jens.georg@desy.de

1


nick.owens@eero.com

1


mathew.prokos@gmail.com

1


Martin.Jansa@gmail.com

1


naveen.kumar.saini@intel.com

1


mhalstead@linuxfoundation.org

1


steve@sakoman.com

1


thomas.perrot@bootlin.com

1


geoffrey.giry@smile.fr

1


Naveen.Gowda@windriver.com

1


tvgamblin@gmail.com

1


yashinde145@gmail.com

1


Zheng.Qiu@windriver.com

1


Grand Total

232

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_0B67_01D955C1.3ABE0100
Content-Type: text/html;
	boundary="----=_NextPart_000_0D3C_01D95060.022BD5D0";
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:black'>All,<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:black'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:black'>Below is the =
list as of top 38 bug owners as of the end of WW10 of who have open =
medium or higher bugs and enhancements against YP 4.2.&nbsp;&nbsp; There =
are 33 possible work days left until the final release candidates for YP =
4.2 needs to be released.<o:p></o:p></span></p><table =
class=3DMsoNormalTable border=3D0 cellspacing=3D0 cellpadding=3D0 =
style=3D'margin-left:-1.9pt;border-collapse:collapse'><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;background:#CCCCFF;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><b><span =
style=3D'color:black'>Who<o:p></o:p></span></b></p></td><td width=3D46 =
valign=3Dtop style=3D'width:34.65pt;border:solid windowtext =
1.0pt;border-left:none;background:#CCCCFF;padding:0in 5.4pt 0in =
5.4pt;height:14.5pt'><p class=3DMsoNormal =
style=3D'text-autospace:none'><b><span =
style=3D'color:black'>Count<o:p></o:p></span></b></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>michael.opdenacker@bootlin.com<o:p></o:p></span></p=
></td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>33<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>ross.burton@arm.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>31<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>bruce.ashfield@gmail.com<o:p></o:p></span></p></td>=
<td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>25<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>randy.macleod@windriver.com<o:p></o:p></span></p></=
td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>25<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>david.reyna@windriver.com<o:p></o:p></span></p></td=
><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>23<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>richard.purdie@linuxfoundation.org<o:p></o:p></span=
></p></td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>22<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>JPEWhacker@gmail.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>10<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>pavel@zhukoff.net<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>9<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>sakib.sajal@windriver.com<o:p></o:p></span></p></td=
><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>6<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>pidge@toganlabs.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>4<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>tim.orling@konsulko.com<o:p></o:p></span></p></td><=
td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>4<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>saul.wold@windriver.com<o:p></o:p></span></p></td><=
td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>3<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>sundeep.kokkonda@windriver.com<o:p></o:p></span></p=
></td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>3<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>sundeep.kokkonda@gmail.com<o:p></o:p></span></p></t=
d><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>3<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>alexandre.belloni@bootlin.com<o:p></o:p></span></p>=
</td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>alexis.lothore@bootlin.com<o:p></o:p></span></p></t=
d><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>yoann.congal@smile.fr<o:p></o:p></span></p></td><td=
 width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>Yash.Shinde@windriver.com<o:p></o:p></span></p></td=
><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>jon.mason@arm.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>rybczynska@gmail.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>piotr.lobacz@vm.pl<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>fawzi.khaber@smile.fr<o:p></o:p></span></p></td><td=
 width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>louis.rannou@syslinbit.com<o:p></o:p></span></p></t=
d><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>hongxu.jia@windriver.com<o:p></o:p></span></p></td>=
<td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>chee.yang.lee@intel.com<o:p></o:p></span></p></td><=
td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>jens.georg@desy.de<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>nick.owens@eero.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>mathew.prokos@gmail.com<o:p></o:p></span></p></td><=
td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>Martin.Jansa@gmail.com<o:p></o:p></span></p></td><t=
d width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>naveen.kumar.saini@intel.com<o:p></o:p></span></p><=
/td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>mhalstead@linuxfoundation.org<o:p></o:p></span></p>=
</td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>steve@sakoman.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>thomas.perrot@bootlin.com<o:p></o:p></span></p></td=
><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>geoffrey.giry@smile.fr<o:p></o:p></span></p></td><t=
d width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>Naveen.Gowda@windriver.com<o:p></o:p></span></p></t=
d><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>tvgamblin@gmail.com<o:p></o:p></span></p></td><td =
width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>yashinde145@gmail.com<o:p></o:p></span></p></td><td=
 width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:black'>Zheng.Qiu@windriver.com<o:p></o:p></span></p></td><=
td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext 1.0pt;padding:0in =
5.4pt 0in 5.4pt;height:14.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td></tr><tr =
style=3D'height:14.5pt'><td width=3D269 valign=3Dtop =
style=3D'width:201.5pt;border:solid windowtext =
1.0pt;border-top:none;background:#CCCCFF;padding:0in 5.4pt 0in =
5.4pt;height:14.5pt'><p class=3DMsoNormal =
style=3D'text-autospace:none'><b><span style=3D'color:black'>Grand =
Total<o:p></o:p></span></b></p></td><td width=3D46 valign=3Dtop =
style=3D'width:34.65pt;border-top:none;border-left:none;border-bottom:sol=
id windowtext 1.0pt;border-right:solid windowtext =
1.0pt;background:#CCCCFF;padding:0in 5.4pt 0in 5.4pt;height:14.5pt'><p =
class=3DMsoNormal align=3Dright =
style=3D'text-align:right;text-autospace:none'><b><span =
style=3D'color:black'>232<o:p></o:p></span></b></p></td></tr></table><p =
class=3DMsoNormal><span =
style=3D'color:black'>Thanks,</span><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span=
></u></span><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0B67_01D955C1.3ABE0100--


