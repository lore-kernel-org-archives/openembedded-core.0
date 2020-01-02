Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id CD52D7F798
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 15:42:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id bg7so3487286pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:thread-index
	:content-language:importance;
	bh=hG4LKUsRb1MN92sFQSBCECxu9rYgH5H8labz8VWAJ1E=;
	b=oaMHZtAyu8590QTzmIpossJXOspMYuMimgG5XCCIbvqbeo8f9rpq93h4YjcXtMGD5J
	7xMOPRZVJC2icfSCmO+TdEPARz6WBLnZe/K4p3YpxkB5rLhZofJNQb+5EDM8zJ2ItxAe
	RZz5XZW2+LRC/OQ5OYpR6dTbeuwds0i0pVmmD+Bm9AHU/dM9MRrZkOlexe/CdfgBUYCl
	XJxVmne1s3DHx5u6vBQ3GbxrTXUx+A3PFUEy4Quzwj21QYYR2z234Ko2OR+l+DkQryqn
	L88pKXVmXGm/hvPE1ZzLm6sHTSBrCduk40dcj9efnEI5/jQ6co6Hi/DrPO6OpPpWuVVD
	RdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:thread-index:content-language:importance;
	bh=hG4LKUsRb1MN92sFQSBCECxu9rYgH5H8labz8VWAJ1E=;
	b=LsTZwFpHkT3OKLnSpZ/YYQKngieQzIGxPp+jbqJ4bnq6KTPIJC48LpQn4KDlekdk80
	pjX20ODbDevWa0Z9lrq/lKaiWag+HXdyP2JBk8yT0yN9u+cL2m66rPKi95vtMi9N+qYT
	5zQBZaKBbqeurOt7My/L0+LkEaaRkZ4Vg1bUNnnsTYvSzClvB+g3YDZl8/Ni6yExZgqF
	HBqieUwlN8WgoRJ0AIePW4ytNXeDIFjgGaXLXc9sUc+t5YfHuy0UvW+ECVZqOrYcHLdi
	BBDFLwJ5wEFSp7WISas6X7omkDol9IQSDKAZmdnqr1sYUIUUl6X+TLE1tGN9KUYQ+/fh
	is7Q==
X-Gm-Message-State: APjAAAUSfOCJdzXRWeno9Un5XA4l3DaH9z/Tga49xVd8ZTamZIPOpxFT
	Xv8N79JBJ3GlOdqG7+JbhS5l2Fsd
X-Google-Smtp-Source: APXvYqwJVq/x/tcuVGgnE56Rq3/3pbwl0np08G/L1o/F7BXSJSsoE1CVc1Av4PNFVYbXJx4W0e+a5w==
X-Received: by 2002:a17:90a:da01:: with SMTP id
	e1mr20877422pjv.29.1577979754808; 
	Thu, 02 Jan 2020 07:42:34 -0800 (PST)
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
	by smtp.gmail.com with ESMTPSA id
	e19sm11695144pjr.10.2020.01.02.07.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jan 2020 07:42:34 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2020 07:42:34 -0800
Message-ID: <0cde01d5c183$40f2ace0$c2d806a0$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdXBgn5yT1X/ZzNcSZi6Yk+RqZGOeA==
Importance: High
Subject: YP 3.1 M1 has been released.
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
X-List-Received-Date: Thu, 02 Jan 2020 15:42:34 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0CDF_01D5C140.32D00920"
Content-Language: en-us

------=_NextPart_000_0CDF_01D5C140.32D00920
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

YP 3.1 M1 has been released.  Please review the bugs at
https://wiki.yoctoproject.org/wiki/Bug_Triage#Old_Milestone and move/edit
the target milestone to YP 3.1 M2 or later.

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:               <mailto:sjolley.yp.pm@gmail.com>
sjolley.yp.pm@gmail.com

 


------=_NextPart_000_0CDF_01D5C140.32D00920
Content-Type: text/html;
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
	{font-family:"MS Sans Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>All,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>YP 3.1 M1 =
has been released.&nbsp; Please review the bugs at <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Old_Milestone">http=
s://wiki.yoctoproject.org/wiki/Bug_Triage#Old_Milestone</a> and =
move/edit the target milestone to YP 3.1 M2 or later.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
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
244-4460</span><span style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:black'><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com"><span =
style=3D'color:#0563C1'>sjolley.yp.pm@gmail.com</span></a></span></u></sp=
an><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0CDF_01D5C140.32D00920--
