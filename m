Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA72DC7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 20:40:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.63648.1682368809152574477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 13:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gPJbez0z;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b70ca0a84so6290354b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682368808; x=1684960808;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RejtzWB31ANy4C7DOBljNOqjF5kMGkDMenYLELmD9PQ=;
        b=gPJbez0z3LIVmuY1t5WF7BRGB50/XbyvcWW9ZNhIvao19CvOjdFg3yCmVqazm89AMb
         5LjL3Pq0ZvU8nnXySF0oCjwf0fRxTtX1itlUbzBaVLN5RzmTui1nW51k9ITwuDfRO3So
         NUTf25XdbnOnGWxgpSczV5ymMgQvitt/mBNtIghAZbPG87UDm0AVzfAEPN1s6G2dGTqh
         xZfH4Nr8s5kS3DOKDqhwmbeFNuPNDu+0FGTsmkyqO2tFKYRtTi4PpaTMbXNppOjR9/up
         1E+Mvz38kJt06US8AxED4QNduhWdoQWRUjCiJkaju6OspmMB7w84ToPW9Ln9fJ0cBi0V
         YbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682368808; x=1684960808;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RejtzWB31ANy4C7DOBljNOqjF5kMGkDMenYLELmD9PQ=;
        b=IcVPn6TuBY0i0ghJ3HjDS7bWVshlmGViQubTTaprjC6dnIlYVy9FTatRqo5EWwwE5C
         wPSASTTe12TOcr3lwg0FWVB0DX4LmPvYW4Hl2bK1qEzCqnOHbw3QXdVl2xccG8XORcUo
         bZb+waSdg6sRPwWT1h3UVBAELiHgOwmmD1oRsOrSOX9KywlPnpxzBys8CFCrWLEtsdRz
         LXz5H/Ofd0W5oxD1VIMLWiMI0Qb7ZzkRWZcOTLADSeCPHaKZQGcdOQ+V443uArygoXdl
         qZnktEFSLeetui9u/GVd2kp9bJFcJS49mrvYeBweNE2L9D36QFkKmw8zmR08rr/+I/mr
         4bUA==
X-Gm-Message-State: AAQBX9erdoIBeBslv67++R5tV1f58pF5f8b9Gm2sMtfrAuZKG3opnVNx
	aeR1yxIS6nnIbla72BVI1faiZsRBTnU=
X-Google-Smtp-Source: AKy350bR+FHV8XKebhuG/T658C8R241cjaDDpjczXcSnUWRmuB7bL+WIqNZ0sD4llRGvI/sXXc0N4A==
X-Received: by 2002:a05:6a20:e186:b0:f0:ab4c:c04d with SMTP id ks6-20020a056a20e18600b000f0ab4cc04dmr16241636pzb.40.1682368808127;
        Mon, 24 Apr 2023 13:40:08 -0700 (PDT)
Received: from skjolley ([2600:1011:a110:fb5:3813:85e0:f5e9:8cd9])
        by smtp.gmail.com with ESMTPSA id h9-20020a056a00218900b0063b89300347sm8080456pfi.142.2023.04.24.13.40.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 13:40:07 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Current high bug count owners for Yocto Project 4.2
Date: Mon, 24 Apr 2023 13:40:05 -0700
Message-ID: <103901d976ec$f4c4d500$de4e7f00$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_103A_01D976B2.48690A40"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHb4jRSV+7JjIBz+c/2tBpEXTUJRg==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 20:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180367

This is a multipart message in MIME format.

------=_NextPart_000_103A_01D976B2.48690A40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

Below is the list as of top 37 bug owners as of the end of WW16 of who have
open medium or higher bugs and enhancements against YP 4.2. There are 3
possible work days left until the final release candidates for YP 4.2 needs
to be released.


Who

Count


michael.opdenacker@bootlin.com

36


ross.burton@arm.com

36


richard.purdie@linuxfoundation.org

32


david.reyna@windriver.com

26


randy.macleod@windriver.com

25


bruce.ashfield@gmail.com

25


JPEWhacker@gmail.com

21


pavel@zhukoff.net

11


sakib.sajal@windriver.com

7


p.lobacz@welotec.com

6


pidge@pidge.org

4


tim.orling@konsulko.com

4


sundeep.kokkonda@gmail.com

4


jon.mason@arm.com

3


alexis.lothore@bootlin.com

2


rybczynska@gmail.com

2


sundeep.kokkonda@windriver.com

2


throos@amazon.de

2


frederic.martinsons@gmail.com

2


wen.yan.tan@intel.com

1


fawzi.khaber@smile.fr

1


Martin.Jansa@gmail.com

1


geissonator@yahoo.com

1


alexandre.belloni@bootlin.com

1


mark.asselstine@windriver.com

1


yashinde145@gmail.com

1


tvgamblin@gmail.com

1


mathew.prokos@gmail.com

1


frank.wolff@smile.fr

1


fathi.boudra@linaro.org

1


thomas.perrot@bootlin.com

1


louis.rannou@syslinbit.com

1


johannes.schrimpf@blueye.no

1


Yash.Shinde@windriver.com

1


jens.georg@desy.de

1


Grand Total

1


Total Result

401

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_103A_01D976B2.48690A40
Content-Type: text/html;
	boundary="----=_NextPart_000_037E_01D96BEC.03B66800";
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>All,<br><br>Below is the list as =
of top 37 bug owners as of the end of WW16 of who have open medium or =
higher bugs and enhancements against YP 4.2. There are 3 possible work =
days left until the final release candidates for YP 4.2 needs to be =
released.</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p><table =
class=3DMsoNormalTable border=3D0 cellspacing=3D0 cellpadding=3D0><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;background:#DCE6F2;padding:.75pt .75pt .75pt =
.75pt;height:15.0pt'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;color:black'>Who</span></b><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black =
1.0pt;background:#DCE6F2;padding:.75pt .75pt .75pt =
.75pt;height:15.0pt'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;color:black'>Count</span></b><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>michael.opdenacker@bootlin.com</sp=
an><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>36</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>ross.burton@arm.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>36</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>richard.purdie@linuxfoundation.org=
</span><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>32</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>david.reyna@windriver.com</span><s=
pan style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>26</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>randy.macleod@windriver.com</span>=
<span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>25</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>bruce.ashfield@gmail.com</span><sp=
an style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>25</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>JPEWhacker@gmail.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>21</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>pavel@zhukoff.net</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>11</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>sakib.sajal@windriver.com</span><s=
pan style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>7</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>p.lobacz@welotec.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>6</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>pidge@pidge.org</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>4</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>tim.orling@konsulko.com</span><spa=
n style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>4</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>sundeep.kokkonda@gmail.com</span><=
span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>4</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>jon.mason@arm.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>3</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>alexis.lothore@bootlin.com</span><=
span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>2</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>rybczynska@gmail.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>2</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>sundeep.kokkonda@windriver.com</sp=
an><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>2</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>throos@amazon.de</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>2</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>frederic.martinsons@gmail.com</spa=
n><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>2</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>wen.yan.tan@intel.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>fawzi.khaber@smile.fr</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>Martin.Jansa@gmail.com</span><span=
 style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>geissonator@yahoo.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>alexandre.belloni@bootlin.com</spa=
n><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>mark.asselstine@windriver.com</spa=
n><span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>yashinde145@gmail.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>tvgamblin@gmail.com</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>mathew.prokos@gmail.com</span><spa=
n style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>frank.wolff@smile.fr</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>fathi.boudra@linaro.org</span><spa=
n style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>thomas.perrot@bootlin.com</span><s=
pan style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>louis.rannou@syslinbit.com</span><=
span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>johannes.schrimpf@blueye.no</span>=
<span style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>Yash.Shinde@windriver.com</span><s=
pan style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;color:black'>jens.georg@desy.de</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;padding:.75pt .75pt .75pt .75pt;height:15.0pt'><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt;color:black'>Grand =
Total</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black 1.0pt;padding:.75pt .75pt =
.75pt .75pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><span =
style=3D'font-size:10.0pt;color:black'>1</span><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr><tr =
style=3D'height:13.5pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;background:#DCE6F2;padding:.75pt .75pt .75pt =
.75pt;height:13.5pt'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;color:black'>Total Result</span></b><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td><td =
valign=3Dbottom style=3D'border:solid black =
1.0pt;background:#DCE6F2;padding:.75pt .75pt .75pt =
.75pt;height:13.5pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><b><span =
style=3D'font-size:10.0pt;color:black'>401</span></b><span =
style=3D'font-size:10.0pt'><o:p></o:p></span></p></td></tr></table><p =
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
------=_NextPart_000_103A_01D976B2.48690A40--


