Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869C3C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 21:36:36 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.3218.1659389786142368812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 14:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SyXKjTbu;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c20so9079104qtw.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language;
        bh=V87f85a4L9e8t6Nr/QH9wOKh3tXPUFLYPKRbpAmxmMw=;
        b=SyXKjTbudkYcTbMvaWssD8I6n+rpQ2N1Ep9nViqKutpHg4FWNijEl9QlFd1wzElsfz
         hY17x6BbRzFkQuDZhZjO9oeS5ahu2uqg/fjdJlhUedBjwDTWUbHxJq8fFnGhJH55y2mZ
         Ey9zokhyxgMeEG4UfhvQj59fdTlX+oRrG6HN2NmH15TC1zsox1hkSZBxD7rPjtHFD1h7
         Ccv+cHRy0exN/1AJnOg02yfTE6WFuViV1z4Xauum+V0X/9sy4Sd7RvR0Me65djMlZMrE
         ZB4D0HYrc02muvUQeYdcMONcZTmZv6K4IMzY6pvqC8dh1krbYu5TRlSslfNvcdzP678C
         QpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=V87f85a4L9e8t6Nr/QH9wOKh3tXPUFLYPKRbpAmxmMw=;
        b=1WtsXmhOy71sLfnzR0TXz8Q1zZuX+fW7ZkMk/RnOOtkO2V0yb5v3pyPPanXIg6Tfno
         xe1j42ehkkfXvh0UEgv7PoS5fdm8uaPKbce87h5sodpEgefRBT2SoR56kHqrLZPweg6c
         w6A4ts4jonFBWKBzz4iRPxlpVWDuiAgSaETnkONNbBAEsjJWy824oJISJfri754Y6A+d
         18LC0KAA11JwgAwXxKmRevFDaihs9YZuSz7It5vnl46TOy1eSSwsGylufh32NCJm1DLM
         H0y/LsMFphkniSg4eEScW+qpZBMEjUv/+kzRZ0I5iAuqaDE8hsmrBjRPKzu9Jw5iRN0B
         EOeg==
X-Gm-Message-State: AJIora/DJqCu/8QBo3W2fBfczeII6uJxQ5jQkPwOCfSKai6pd0bYH7AL
	xTjTHGohbHhdMf+ttww+rw0sXVJ9q/w=
X-Google-Smtp-Source: 
 AGRyM1t2/sQxCYbp0rxGEKc/mJ/mFl81GZQnMgBZwNxTzC098U0hbeJLunxDcXpwGyLADlmRPUb+Ow==
X-Received: by 2002:ac8:5e0d:0:b0:31f:239c:99c6 with SMTP id
 h13-20020ac85e0d000000b0031f239c99c6mr16303218qtx.189.1659389785054;
        Mon, 01 Aug 2022 14:36:25 -0700 (PDT)
Received: from skjolley ([72.2.239.73])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a05620a410a00b006a65c58db99sm9026394qko.64.2022.08.01.14.36.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Aug 2022 14:36:24 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Current high bug count owners for Yocto Project 4.1
Date: Mon, 1 Aug 2022 14:36:16 -0700
Message-ID: <0dae01d8a5ee$bf12f600$3d38e200$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0DAF_01D8A5B4.12B667F0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJOxFj+LNcl6V/Sk1eYjD/aq0ZWtA==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 21:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168760

This is a multipart message in MIME format.

------=_NextPart_000_0DAF_01D8A5B4.12B667F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


All,

 

Below is the list as of top 37 bug owners as of the end of WW31 of who have
open medium or higher bugs and enhancements against YP 4.1.   There are 62
possible work days left until the final release candidates for YP 4.1 needs
to be released.


Who

Count

 	

michael.opdenacker@bootlin.com

36

 	

ross.burton@arm.com

26

 	

david.reyna@windriver.com

23

 	

bruce.ashfield@gmail.com

21

 	

randy.macleod@windriver.com

16

 	

richard.purdie@linuxfoundation.org

11

 	

saul.wold@windriver.com

10

 	

JPEWhacker@gmail.com

9

 	

sakib.sajal@windriver.com

9

 	

Aryaman.Gupta@windriver.com

7

 	

tim.orling@konsulko.com

6

 	

mhalstead@linuxfoundation.org

4

 	

jon.mason@arm.com

4

 	

akuster808@gmail.com

3

 	

hongxu.jia@windriver.com

2

 	

pavel@zhukoff.net

2

 	

pgowda.cve@gmail.com

2

 	

Qi.Chen@windriver.com

2

 	

tvgamblin@gmail.com

2

 	

sundeep.kokkonda@gmail.com

2

 	

ptsneves@gmail.com

1

 	

aehs29@gmail.com

1

 	

Martin.Jansa@gmail.com

1

 	

nicolas.dechesne@linaro.org

1

 	

thomas.perrot@bootlin.com

1

 	

martin.beeger@online.de

1

 	

Ahmed.Hossam@opensynergy.com

1

 	

behanw@converseincode.com

1

 	

sgw@bigsur.com

1

 	

alexandre.belloni@bootlin.com

1

 	

ola.x.nilsson@axis.com

1

 	

raj.khem@gmail.com

1

 	

mostthingsweb@gmail.com

1

 	

shachar@vdoo.com

1

 	

luca.ceresoli@bootlin.com

1

 	

alejandro@enedino.org

1

 	

open.source@oleksandr-kravchuk.com

1

 	

Grand Total

214

 	

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_0DAF_01D8A5B4.12B667F0
Content-Type: text/html;
	boundary="----=_NextPart_000_10A7_01D89AA6.C61C1F10";
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
class=3DWordSection1><table class=3DMsoNormalTable border=3D0 =
cellspacing=3D0 cellpadding=3D0 width=3D1071 =
style=3D'width:803.15pt;border-collapse:collapse'><tr =
style=3D'height:13.45pt'><td width=3D1071 nowrap colspan=3D3 =
valign=3Dbottom style=3D'width:803.15pt;padding:0in 0in 0in =
0in;height:13.45pt'><p class=3DMsoNormal><span =
style=3D'color:black'>All,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:black'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'color:black'>Below is the list as of =
top 37 bug owners as of the end of WW31 of who have open medium or =
higher bugs and enhancements against YP 4.1.&nbsp;&nbsp; There are 62 =
possible work days left until the final release candidates for YP 4.1 =
needs to be released.<o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td width=3D251 nowrap valign=3Dbottom =
style=3D'width:188.0pt;border:solid windowtext =
1.0pt;background:#DCE6F1;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><b><span style=3D'color:black'>Who</span></b><b><span =
style=3D'color:black'><o:p></o:p></span></b></p></td><td width=3D43 =
nowrap valign=3Dbottom style=3D'width:32.0pt;border:solid windowtext =
1.0pt;border-left:none;background:#DCE6F1;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal><b><span =
style=3D'color:black'>Count<o:p></o:p></span></b></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>michael.opdenacker@bootlin.com<o:p></o:p></span></p=
></td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>36<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>ross.burton@arm.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>26<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>david.reyna@windriver.com<o:p></o:p></span></p></td=
><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>23<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>bruce.ashfield@gmail.com<o:p></o:p></span></p></td>=
<td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>21<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>randy.macleod@windriver.com<o:p></o:p></span></p></=
td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>16<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>richard.purdie@linuxfoundation.org<o:p></o:p></span=
></p></td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>11<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>saul.wold@windriver.com<o:p></o:p></span></p></td><=
td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>10<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>JPEWhacker@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>9<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>sakib.sajal@windriver.com<o:p></o:p></span></p></td=
><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>9<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>Aryaman.Gupta@windriver.com<o:p></o:p></span></p></=
td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>7<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>tim.orling@konsulko.com<o:p></o:p></span></p></td><=
td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>6<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>mhalstead@linuxfoundation.org<o:p></o:p></span></p>=
</td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>4<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>jon.mason@arm.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>4<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>akuster808@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>3<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>hongxu.jia@windriver.com<o:p></o:p></span></p></td>=
<td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>pavel@zhukoff.net<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>pgowda.cve@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>Qi.Chen@windriver.com<o:p></o:p></span></p></td><td=
 nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>tvgamblin@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>sundeep.kokkonda@gmail.com<o:p></o:p></span></p></t=
d><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>2<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>ptsneves@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>aehs29@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>Martin.Jansa@gmail.com<o:p></o:p></span></p></td><t=
d nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>nicolas.dechesne@linaro.org<o:p></o:p></span></p></=
td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>thomas.perrot@bootlin.com<o:p></o:p></span></p></td=
><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>martin.beeger@online.de<o:p></o:p></span></p></td><=
td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>Ahmed.Hossam@opensynergy.com<o:p></o:p></span></p><=
/td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>behanw@converseincode.com<o:p></o:p></span></p></td=
><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>sgw@bigsur.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>alexandre.belloni@bootlin.com<o:p></o:p></span></p>=
</td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>ola.x.nilsson@axis.com<o:p></o:p></span></p></td><t=
d nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>raj.khem@gmail.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>mostthingsweb@gmail.com<o:p></o:p></span></p></td><=
td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>shachar@vdoo.com<o:p></o:p></span></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>luca.ceresoli@bootlin.com<o:p></o:p></span></p></td=
><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>alejandro@enedino.org<o:p></o:p></span></p></td><td=
 nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;padding:0in 0in 0in 0in;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'color:black'>open.source@oleksandr-kravchuk.com<o:p></o:p></span=
></p></td><td nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'color:black'>1<o:p></o:p></span></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr><tr style=3D'height:15.0pt'><td =
nowrap valign=3Dbottom style=3D'border:solid windowtext =
1.0pt;border-top:none;background:#DCE6F1;padding:0in 0in 0in =
0in;height:15.0pt'><p class=3DMsoNormal><b><span =
style=3D'color:black'>Grand Total<o:p></o:p></span></b></p></td><td =
nowrap valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid windowtext =
1.0pt;border-right:solid windowtext 1.0pt;background:#DCE6F1;padding:0in =
0in 0in 0in;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><b><span =
style=3D'color:black'>214<o:p></o:p></span></b></p></td><td =
style=3D'border:none;padding:0in 0in 0in 0in' width=3D777><p =
class=3D'MsoNormal'>&nbsp;</td></tr></table><p class=3DMsoNormal><span =
style=3D'color:black'> Thanks,</span><o:p></o:p></p><p =
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
------=_NextPart_000_0DAF_01D8A5B4.12B667F0--


