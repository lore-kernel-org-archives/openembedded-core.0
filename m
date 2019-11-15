Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 694C57FA19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 00:11:32 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 3so5391700pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=giDw8+NS6nqnV8P5BxJhYVctvfApalVlleEZgOTQlv0=;
	b=JtCQ/l42hKgjbAo6/4a+VlhbqkyhfleEiF5vyI9YjVzM5Omt85z3HLN3HSBGWKeBq+
	Wzl7JcyfBwFEZFB58OSTKujhkJE5SBjTfXA4DZJ86qKplSFjeqArqiFfeU+B9aB24SCs
	G+I3srXr674MFPZJXveR/KtIpfBpi3oyOTrjOWw4+Chb568iuMUaetNqf7fXMtfGRjb2
	7vz3oIAiCPrVMd/SPIIGZOPdyZQwqUV63KYMiVlUAsWPQH33kb2/euUGRHTFk7kgYO0W
	in9eZDR6dgDnR5t6oRMSA+WmlsZlfoYfIfpVAVRifQM7vlW8KU8vEJoPN5TdVQiZzitp
	2YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=giDw8+NS6nqnV8P5BxJhYVctvfApalVlleEZgOTQlv0=;
	b=uaypnrxAyRY7Uy9cTE0Szpz8meo733P+nOx/QJyj5kuPkYPB8LgJ64G25rEMzRKcvS
	uHpiD30lk6LlYvkxkZowdhoVBp3iqyJ2XwEwuqUpuhrOEwJmt4p4Lstn1j7JkSa7kREg
	VcFzz1ZecAZNO4Rh7VHYhkH8QfpqkyCNEhic17BY9oWd3E906yWp5SbDoiM8S6e2VfAz
	8XE+N8W59hkfS1+m+J+wLOHFipZGH0l/xdJc72gXSUS+rXaVJ+4X4vFVYY04/zcWBImN
	lutVrRjXC2j9IheiaeOSv+skGA9i0UklnheSUDT/C9Km0dQZR9PIyZquaRfPpUVQiDYW
	wV1g==
X-Gm-Message-State: APjAAAVIUOI3ucy34Go+nEbu6mCHUyGNUIIE9C3AtfnZESn8MG/NvYeQ
	LTkmMULVAEAudQsCZ2IuCXDs4+JE
X-Google-Smtp-Source: APXvYqwy+XpeOvj2DiQf70G8tBgDAmf8/fSuahrSUnRBVmwQmwcgAb8zU3Mng8xDnQaNCbBZLBxplA==
X-Received: by 2002:a63:3603:: with SMTP id d3mr12996485pga.259.1573776692880; 
	Thu, 14 Nov 2019 16:11:32 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:90e5:8f1e:65b9:f435?
	([2601:202:4180:a5c0:90e5:8f1e:65b9:f435])
	by smtp.gmail.com with ESMTPSA id
	r68sm8544683pfr.78.2019.11.14.16.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 16:11:31 -0800 (PST)
To: sjolley.yp.pm@gmail.com, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <014c01d59970$73f28c40$5bd7a4c0$@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <44cd46c9-ddc1-a7fd-ce2f-3cbcf4331152@gmail.com>
Date: Thu, 14 Nov 2019 16:11:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <014c01d59970$73f28c40$5bd7a4c0$@gmail.com>
Subject: Re: [yocto] Yocto Project Status WW46'19
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
X-List-Received-Date: Fri, 15 Nov 2019 00:11:32 -0000
Content-Type: multipart/alternative;
	boundary="------------ABE9281D7756F9236CD8FDFD"
Content-Language: en-US

--------------ABE9281D7756F9236CD8FDFD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Hello Stephen,

On 11/12/19 7:47 AM, sjolley.yp.pm@gmail.com wrote:
>
> Current Dev Position: YP 3.1 M1=A0
>
> Next Deadline: YP 3.1 M1 build Dec. 2, 2019
>
> =A0
>
> SWAT Team Rotation:
>
>   * SWAT lead is currently: Anuj=A0
>   * SWAT team rotation: Anuj -> Chen on Nov. 15, 2019
>   * SWAT team rotation: Chen > Paul on Nov. 22, 2019
>   * https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>

I watch and triage stable branch builds I initiate week after week and I
no longer want to take on the responsibilities for the other builds. I
therefor am removing my name from the normal swat rotation and have
updated the wiki accordingly.=A0 This should set the appropriate
expectations. This unfortunately puts the full burden back on Intel and
WindRiver.=A0 If things should change in the future, I will let you know.=


regards,
Armin

>  *
>
> =A0
>
> Next Team Meetings:
>
>   * Bug Triage meeting Thursday Nov. 14th at 7:30am PDT
>     (https://zoom.us/j/454367603)
>   * Monthly Project Meeting Tuesday Dec. 3rd at 8am PDT
>     (https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
>   * Weekly Engineering Sync Tuesday Nov. 12th at 8am PDT
>     (https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
>   * Twitch - Next event is Tuesday Nov. 12th at 8am PDT
>     (https://www.twitch.tv/yocto_project)
>
> =A0
>
> Key Status/Updates:
>
>   * YP 2.7.2 is still undergoing QA
>   * There were some key fixes for pseudo related issues which mean it
>     continues to work with modern distros like Fedora 31.
>   * Patches have continued to merge and master is staying roughly
>     current with the pending patch queue but there continue to be
>     recurring build failures that are not being addressed.
>   * The YP TSC worked on and shared a proposal on how an LTS release
>     could work which is available at:
>     https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JM=
GVG-Kj_sUkyc/
>     . There has been much discussion about this, patience would be
>     appreciated as the TSC and governing board work through this to
>     come up with plans on how we proceed.
>   * We are continuing to collect ideas for YP 3.1 in this document:
>     https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_=
f4ye64yjnABc/edit?usp=3Dsharing
>   * If anyone has any status items for the project they=92d like to add=

>     to the weekly reports, please email Richard and Stephen.
>
> =A0
>
> Proposed YP 3.1 Milestone Dates:
>
>   * YP 3.1 M1 Proposed build date 12/2/2019
>   * YP 3.1 M1 Proposed release date 12/13/2019
>   * YP 3.1 M2 Proposed build date 1/20/2020
>   * YP 3.1 M2 Proposed release date 1/31/2020
>   * YP 3.1 M3 Proposed build date 2/24/2020
>   * YP 3.1 M3 Proposed release date 3/6/2020
>   * YP 3.1 M4 Proposed build date=A0 3/30/2020
>   * YP 3.1 M4 Proposed release date=A0 4/24/2020
>
> =A0
>
> Planned upcoming dot releases:
>
>   * YP 3.0.1 has patches being queued in poky-contrib
>   * YP 2.7.2 (Warrior) is in QA.
>
> =A0
>
> Tracking Metrics:
>
>   * WDD 2508 (last week
>     2518)(https://wiki.yoctoproject.org/charts/combo.html)
>   * Poky Patch Metrics=A0=A0
>       o Total patches found: 1445 (last week 1446)
>       o Patches in the Pending State: 579 (40%) [last week 579 (40%)]
>
> =A0
>
> The Yocto Project=92s technical governance is through its Technical
> Steering Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
>
> =A0
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
> =A0
>
> [If anyone has suggestions for other information you=92d like to see on=

> this weekly status update, let us know!]
>
> =A0
>
> Thanks,
>
> =A0
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Project Manager*
>
> (=A0=A0=A0 *Cell*:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (208) 2=
44-4460
>
> * *Email*:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0_sjolley.yp.pm@gmai=
l.com
> <mailto:sjolley.yp.pm@gmail.com>_
>
> =A0
>
>


--------------ABE9281D7756F9236CD8FDFD
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    Hello Stephen,<br>
    <br>
    On 11/12/19 7:47 AM, <a class="moz-txt-link-abbreviated" href="mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a> wrote:<br>
    <blockquote type="cite"
      cite="mid:014c01d59970$73f28c40$5bd7a4c0$@gmail.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
/* List Definitions */
@list l0
	{mso-list-id:465591455;
	mso-list-template-ids:-251655038;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:610742564;
	mso-list-template-ids:-668318924;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:957760518;
	mso-list-template-ids:-1207167602;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1246377514;
	mso-list-template-ids:1726491756;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4
	{mso-list-id:1308585288;
	mso-list-template-ids:1270131472;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5
	{mso-list-id:1925142584;
	mso-list-template-ids:1341916044;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Current
            Dev Position: YP 3.1 M1 </span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 3.1 M1 build Dec. 2, 2019</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            Team Rotation:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">SWAT lead
              is currently: Anuj <o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">SWAT team
              rotation: Anuj -&gt; Chen on Nov. 15, 2019<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">SWAT team
              rotation: Chen &gt; Paul on Nov. 22, 2019<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo1;vertical-align:baseline"><span
              style="font-family:Consolas"><a
                href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"
                moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></span></li>
        </ul>
      </div>
    </blockquote>
    <br>
    I watch and triage stable branch builds I initiate week after week
    and I no longer want to take on the responsibilities for the other
    builds. I therefor am removing my name from the normal swat rotation
    and have updated the wiki accordingly.  This should set the
    appropriate expectations. This unfortunately puts the full burden
    back on Intel and WindRiver.  If things should change in the future,
    I will let you know.<br>
    <br>
    regards,<br>
    Armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:014c01d59970$73f28c40$5bd7a4c0$@gmail.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo1;vertical-align:baseline"><span
              style="font-family:Consolas"><o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Team Meetings:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Bug
              Triage meeting Thursday Nov. 14th at 7:30am PDT (<a
                href="https://zoom.us/j/454367603"
                moz-do-not-send="true"><span
                  style="font-size:10.0pt;color:#1155CC">https://zoom.us/j/454367603</span></a>)<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Monthly
              Project Meeting Tuesday Dec. 3rd at 8am PDT (<a
                href="https://zoom.us/j/990892712"
                moz-do-not-send="true"><span style="color:#1155CC">https://zoom.us/j/990892712)</span></a><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Weekly
              Engineering Sync Tuesday Nov. 12th at 8am PDT (<a
                href="https://zoom.us/j/990892712"
                moz-do-not-send="true"><span style="color:#1155CC">https://zoom.us/j/990892712)</span></a><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Twitch -
              Next event is Tuesday Nov. 12th at 8am PDT (<a
                href="https://www.twitch.tv/yocto_project"
                moz-do-not-send="true"><span style="color:#1155CC">https://www.twitch.tv/yocto_project</span></a>)<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 2.7.2
              is still undergoing QA<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">There
              were some key fixes for pseudo related issues which mean
              it continues to work with modern distros like Fedora 31.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Patches
              have continued to merge and master is staying roughly
              current with the pending patch queue but there continue to
              be recurring build failures that are not being addressed.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">The YP
              TSC worked on and shared a proposal on how an LTS release
              could work which is available at: <a
href="https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-Kj_sUkyc/"
                moz-do-not-send="true"><span style="color:#1155CC">https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-Kj_sUkyc/</span></a>
              . There has been much discussion about this, patience
              would be appreciated as the TSC and governing board work
              through this to come up with plans on how we proceed.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">We are
              continuing to collect ideas for YP 3.1 in this document: <a
href="https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye64yjnABc/edit?usp=sharing"
                moz-do-not-send="true"><span style="color:#1155CC">https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye64yjnABc/edit?usp=sharing</span></a><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo3;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">If anyone
              has any status items for the project they’d like to add to
              the weekly reports, please email Richard and Stephen.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed
            YP 3.1 Milestone Dates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M1
              Proposed build date 12/2/2019<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M1
              Proposed release date 12/13/2019<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M2
              Proposed build date 1/20/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M2
              Proposed release date 1/31/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M3
              Proposed build date 2/24/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M3
              Proposed release date 3/6/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M4
              Proposed build date  3/30/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l3 level1
            lfo4;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M4
              Proposed release date  4/24/2020<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l4 level1
            lfo5;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.0.1
              has patches being queued in poky-contrib<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l4 level1
            lfo5;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 2.7.2
              (Warrior) is in QA.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">WDD 2508
              (last week 2518)</span><span style="font-family:Consolas">
              (</span><span
              style="font-family:&quot;Arial&quot;,sans-serif"><a
                href="https://wiki.yoctoproject.org/charts/combo.html"
                moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a></span><span
              style="font-family:Consolas">)</span><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Poky
              Patch Metrics  </span><span style="font-family:Consolas"><o:p></o:p></span></li>
          <ul style="margin-top:0in" type="circle">
            <li class="MsoNormal" style="color:black;mso-list:l0 level2
              lfo6;vertical-align:baseline"><span
                style="font-family:&quot;Arial&quot;,sans-serif">Total
                patches found: 1445 (last week 1446)<o:p></o:p></span></li>
            <li class="MsoNormal" style="color:black;mso-list:l0 level2
              lfo6;vertical-align:baseline"><span
                style="font-family:&quot;Arial&quot;,sans-serif">Patches
                in the Pending State: 579 (40%) [last week 579 (40%)]</span><span
                style="font-family:Consolas"><o:p></o:p></span></li>
          </ul>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Yocto Project’s technical governance is through its
            Technical Steering Committee, more information is available
            at:</span><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://wiki.yoctoproject.org/wiki/TSC"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/TSC</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Status reports are now stored on the wiki at: </span><a
            href="https://wiki.yoctoproject.org/wiki/Weekly_Status"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"
          style="page-break-after:avoid;text-autospace:none"><b><i><span
                style="font-size:16.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span
style="font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.0pt;font-family:&quot;Courier
              New&quot;;color:blue">Yocto Project Project Manager<o:p></o:p></span></b></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings;color:black">(</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">    </span><b><span
              style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal">Cell</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">:                </span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;">(208) 244-4460</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:black"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings">* </span><b><span
              style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal" lang="FR">Email</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal" lang="FR">:</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;" lang="FR">              <u><span
                style="color:blue"><a
                  href="mailto:sjolley.yp.pm@gmail.com"
                  moz-do-not-send="true"><span style="color:#0563C1">sjolley.yp.pm@gmail.com</span></a></span></u></span><span
style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"
            lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
  </body>
</html>

--------------ABE9281D7756F9236CD8FDFD--
