Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2007C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 23:01:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.5894.1684191689651688029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 16:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZL8Bozao;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1aad6f2be8eso123858915ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 16:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684191689; x=1686783689;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4YjD9br19vGb+6PHSvQu5bn3YEKJWWn3OrTm/kPV6g0=;
        b=ZL8Bozaoj10KXdWO1rTlm3aNhhBqlp/nxryBZfRbcyZRyR4bTge33NLLlGp4P3SeCx
         rjJ41nfq6hSZN+auZprPY7N7Du9g1PQ5YTxVlt3or8L846xHJe3mliYifq3Z5IYDlvWk
         RHyfReiD+R+T6Ei0zvTKcA8mEAx5gi3XZ01cTy6lAK+wEL3c2AdAKCvBjPj/lkYduSZ1
         BWpmh3QJpQP90+tjbL7FK7K0ZjvgM3MWxuOS4wZMVWpNqcq9dfG6L9y4DmL20oZwFHE5
         Gsayi3EX+ufksUIjDX97WKMbVAdpzXTbiYaCHZMDQXP8yIGKlXEOk7S7N3FXcOO/ejPl
         952g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684191689; x=1686783689;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YjD9br19vGb+6PHSvQu5bn3YEKJWWn3OrTm/kPV6g0=;
        b=GYWFnJvSjlKm3VbvMZ9nEybyyJQe3iIg2COXXtf0S7eK8EKrxUtD+6cpR4bA8Rxlhg
         4iqYShFc3EnyOf5meUxQbukc7v8Vsqwa0qH2eih8uvN+qpJqnwXzEcvxFlsUvcwUjv95
         7+O4hLPPA0Q8T6b2muS4pz+EscW11yRQSmNXLSfaf9v1M5rnLDaMQo+M223VsuOYjhLV
         /jakcHSyYc6ah7zPvRJJWukPIS4/Ye5yTtQzJ1BrVBJOIS/2zv+SX6Jt1acf+ym32CWY
         d7uzaG7r+XlfutIWzYMp+OgU5ZLdNA9r7TA2uW92bVBQTcbT+ZbkNoG7/KkINbebvOFG
         OPYA==
X-Gm-Message-State: AC+VfDz4mPgyV/49o3uv3XfTqOKNI768twCZIiveMEOnqPfXgjleupGd
	zLMsPHx0EZrxIvPriM59/FHrdM6kLHw=
X-Google-Smtp-Source: ACHHUZ6WvM5B7cKWjdHTUx1ZL9pAEehQDwMyf6+rtoRzhFm5fxH2P6OqpsTzUUuIiis9U1Vx6PRXEA==
X-Received: by 2002:a17:902:f54c:b0:19c:dbce:dce8 with SMTP id h12-20020a170902f54c00b0019cdbcedce8mr48460471plf.15.1684191688502;
        Mon, 15 May 2023 16:01:28 -0700 (PDT)
Received: from skjolley ([2600:1011:a110:fb5:3813:85e0:f5e9:8cd9])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e80c00b001a0448731c2sm14063760plg.47.2023.05.15.16.01.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 May 2023 16:01:28 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Current high bug count owners for Yocto Project 4.3
Date: Mon, 15 May 2023 16:01:27 -0700
Message-ID: <122401d98781$2eb2eff0$8c18cfd0$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_1225_01D98746.8255C5A0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFr3A+RG95K0DMNBDlOvwL/ZtLBTA==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 23:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181395

This is a multipart message in MIME format.

------=_NextPart_000_1225_01D98746.8255C5A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

Below is the list as of top 36 bug owners as of the end of WW19 of who have
open medium or higher bugs and enhancements against YP 4.3. There are 114
possible work days left until the final release candidates for YP 4.3 needs
to be released.




Who

Count


ross.burton@arm.com

33


michael.opdenacker@bootlin.com

31


david.reyna@windriver.com

27


richard.purdie@linuxfoundation.org

26


randy.macleod@windriver.com

25


bruce.ashfield@gmail.com

25


JPEWhacker@gmail.com

11


pavel@zhukoff.net

9


sundeep.kokkonda@windriver.com

6


sakib.sajal@windriver.com

6


tim.orling@konsulko.com

4


pidge@pidge.org

4


Yash.Shinde@windriver.com

3


steve@sakoman.com

2


p.lobacz@welotec.com

2


jon.mason@arm.com

2


alexis.lothore@bootlin.com

2


tvgamblin@gmail.com

1


throos@amazon.de

1


thomas.perrot@bootlin.com

1


naveen.kumar.saini@intel.com

1


mathew.prokos@gmail.com

1


Martin.Jansa@gmail.com

1


mark.hatle@kernel.crashing.org

1


mark.asselstine@windriver.com

1


louis.rannou@syslinbit.com

1


johannes.schrimpf@blueye.no

1


jens.georg@desy.de

1


geissonator@yahoo.com

1


frederic.martinsons@gmail.com

1


frank.wolff@smile.fr

1


fawzi.khaber@smile.fr

1


fathi.boudra@linaro.org

1


anuj.mittal@intel.com

1


alexandre.belloni@bootlin.com

1


alex.kanavin@gmail.com

1


Grand Total

237

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_1225_01D98746.8255C5A0
Content-Type: text/html;
	boundary="----=_NextPart_000_0637_01D981D2.CD4CAD90";
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
	font-size:10.0pt;
	mso-ligatures:none;}
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
class=3DWordSection1><p class=3DMsoNormal>All,<br><br>Below is the list =
as of top 36 bug owners as of the end of WW19 of who have open medium or =
higher bugs and enhancements against YP 4.3. There are 114 possible work =
days left until the final release candidates for YP 4.3 needs to be =
released.<br><br><span =
style=3D'color:black'><o:p></o:p></span></p><table =
class=3DMsoNormalTable border=3D0 cellspacing=3D0 cellpadding=3D0 =
width=3D0 style=3D'border-collapse:collapse'><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;background:#DBE5F1;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal><b><span =
style=3D'color:black'>Who</span></b><b><o:p></o:p></b></p></td><td =
valign=3Dbottom style=3D'border:solid black =
1.0pt;border-left:none;background:#DBE5F1;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal><b><span =
style=3D'color:black'>Count</span></b><b><o:p></o:p></b></p></td></tr><tr=
 style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>ross.burton@arm.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>33<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>michael.opdenacker@bootlin.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>31<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>david.reyna@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>27<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>richard.purdie@linuxfoundation.org<o:p></o:p></p></td><=
td valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>26<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>randy.macleod@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>25<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>bruce.ashfield@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>25<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>JPEWhacker@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>11<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>pavel@zhukoff.net<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>9<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>sundeep.kokkonda@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>6<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>sakib.sajal@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>6<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>tim.orling@konsulko.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>4<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>pidge@pidge.org<o:p></o:p></p></td><td valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>4<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>Yash.Shinde@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>3<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>steve@sakoman.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>2<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>p.lobacz@welotec.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>2<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>jon.mason@arm.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>2<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>alexis.lothore@bootlin.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>2<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>tvgamblin@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>throos@amazon.de<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>thomas.perrot@bootlin.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>naveen.kumar.saini@intel.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>mathew.prokos@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>Martin.Jansa@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>mark.hatle@kernel.crashing.org<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>mark.asselstine@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>louis.rannou@syslinbit.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>johannes.schrimpf@blueye.no<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>jens.georg@desy.de<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>geissonator@yahoo.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>frederic.martinsons@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>frank.wolff@smile.fr<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>fawzi.khaber@smile.fr<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>fathi.boudra@linaro.org<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>anuj.mittal@intel.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>alexandre.belloni@bootlin.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.75pt'><p =
class=3DMsoNormal>alex.kanavin@gmail.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>1<o:p></o:p></p></td></tr><tr =
style=3D'height:15.75pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;background:#DBE5F1;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal><b><span =
style=3D'color:black'>Grand =
Total</span></b><b><o:p></o:p></b></p></td><td valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;background:#DBE5F1;padding:0in =
2.25pt 0in 2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><b><span =
style=3D'color:black'>237</span></b><b><o:p></o:p></b></p></td></tr></tab=
le><p class=3DMsoNormal><span =
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
------=_NextPart_000_1225_01D98746.8255C5A0--


