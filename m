Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33438C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 00:09:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8394.1684800587913424841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 17:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XpRn//V6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ae85b71141so35210395ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684800587; x=1687392587;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=clCCm8Kd4o3vQSTYy0pSdvPHTMKkzc5kP9drbMbOMD8=;
        b=XpRn//V6B7RhWIj1HlVSlkfJehb4z3AUC+Ys0vwW/9em7J3GTlkpcoa/BJveCj8sNo
         b+fdB5PDMLIgPLmHS7IXL9ape50pv6l3DjxuscoA8L9FjZiiBaG25lkWYjaRY+ohpVAh
         lj2gI/UMeO9d6rF+IeGnapPBLu72oTIQxd4kEGDDDMOQJjHNcMYDm3zULi3rUkCarkwy
         fFa9HOtbY8sF9kFUnGoJZ+tUTC06AfiYBWyQgyjnnxhEGnQ7RK9aul3o61/kMndk/jEu
         umIuEcK534N+T+4uq/cr+hTdWSapwHW+eS5Qt094WMCIBBFBlDbynkbi8jDR4wg0Cdn7
         jqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684800587; x=1687392587;
        h=thread-index:content-language:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clCCm8Kd4o3vQSTYy0pSdvPHTMKkzc5kP9drbMbOMD8=;
        b=klAxZZI1pCNlF5pVAIF3YusbrDNwLCvn8gIWD3XOL/Mqypi47qGuhlRlhiEzSryX8P
         60UIML+TTGmZ4On+UsAD3Pmz/+fP0O71XyVjrb+TEq2bfA0GrgVVIGLJNmhw71/IS6eh
         ws+19jKlhX4EQ3KW5/q/nO47TWcPHGMhfHm+G2WXeH8bp4/d/SL+2BpVoD3QZZiGYQZ0
         dt4jX2VKklZWAFNlm57cCLrsy/De4qD/NFDUlcg6hqjIobWgswdBOFelCRiyt7/NkdnP
         80y6XRSWJ0vMpIlExOqRNdLtPh/km80iq3zbV9I9p3F0uASslVmkJ1xtsjFp+VWRT45v
         rvZg==
X-Gm-Message-State: AC+VfDzZNjLCqg4K5gs5k1DV+PVqPqQswIYHvsJf/GaZjLCzliQNMHfn
	cL3007jwEiwYiIUQb1cUXCgRqdpZy3Q=
X-Google-Smtp-Source: ACHHUZ7yqyla+wjMeR2xp4uGmpko2mr3UR21NOPKmvQHaUufbblSID6s2A2R48TTnVAGuikb2TmTJg==
X-Received: by 2002:a17:903:2343:b0:1ac:a9c1:b61d with SMTP id c3-20020a170903234300b001aca9c1b61dmr14077070plh.11.1684800586919;
        Mon, 22 May 2023 17:09:46 -0700 (PDT)
Received: from skjolley ([2600:1011:a110:fb5:3813:85e0:f5e9:8cd9])
        by smtp.gmail.com with ESMTPSA id o5-20020a170903210500b001aaffe15f39sm5398897ple.30.2023.05.22.17.09.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 May 2023 17:09:46 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Current high bug count owners for Yocto Project 4.3
Date: Mon, 22 May 2023 17:09:46 -0700
Message-ID: <0a8401d98d0a$e2933d70$a7b9b850$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0A85_01D98CD0.3636AF60"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIIzFWAagF0SZwYFTPT5VzNTF86vA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 00:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181619

This is a multipart message in MIME format.

------=_NextPart_000_0A85_01D98CD0.3636AF60
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

Below is the list as of top 34 bug owners as of the end of WW20 of who have
open medium or higher bugs and enhancements against YP 4.3. There are 109
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


sakib.sajal@windriver.com

6


sundeep.kokkonda@windriver.com

5


tim.orling@konsulko.com

4


pidge@pidge.org

4


Yash.Shinde@windriver.com

3


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


Grand Total

233

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_0A85_01D98CD0.3636AF60
Content-Type: text/html;
	boundary="----=_NextPart_000_1225_01D98746.8255C5A0";
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
as of top 34 bug owners as of the end of WW20 of who have open medium or =
higher bugs and enhancements against YP 4.3. There are 109 possible work =
days left until the final release candidates for YP 4.3 needs to be =
released.<span style=3D'color:black'><o:p></o:p></span></p><table =
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
class=3DMsoNormal>sakib.sajal@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>6<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>sundeep.kokkonda@windriver.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>5<o:p></o:p></p></td></tr><tr =
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
class=3DMsoNormal>p.lobacz@welotec.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'>2<o:p></o:p></p></td></tr><tr =
style=3D'height:15.0pt'><td valign=3Dbottom style=3D'border:solid black =
1.0pt;border-top:none;padding:0in 2.25pt 0in 2.25pt;height:15.0pt'><p =
class=3DMsoNormal>jon.mason@arm.com<o:p></o:p></p></td><td =
valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;padding:0in 2.25pt 0in =
2.25pt;height:15.0pt'><p class=3DMsoNormal align=3Dright =
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
1.0pt;border-top:none;background:#DBE5F1;padding:0in 2.25pt 0in =
2.25pt;height:15.75pt'><p class=3DMsoNormal><b><span =
style=3D'color:black'>Grand =
Total</span></b><b><o:p></o:p></b></p></td><td valign=3Dbottom =
style=3D'border-top:none;border-left:none;border-bottom:solid black =
1.0pt;border-right:solid black 1.0pt;background:#DBE5F1;padding:0in =
2.25pt 0in 2.25pt;height:15.75pt'><p class=3DMsoNormal align=3Dright =
style=3D'text-align:right'><b><span =
style=3D'color:black'>233</span></b><b><o:p></o:p></b></p></td></tr></tab=
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
------=_NextPart_000_0A85_01D98CD0.3636AF60--


