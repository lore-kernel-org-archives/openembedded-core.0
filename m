Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE8EB7FBE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 18:39:53 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id s64so6780172pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=17OneuF5iNxecLWNmPk3CueZ1GdcAl42V4WSVg8O1Dc=;
	b=D8PLwc09HWyPYp2jlhXRTdEn6fCOO89KPt4Z4EriXTcnG/0gJ2j9GNeB5LZQt8cJKC
	N/zL9yzjEDsiMAsJ4GUvWrqFyUVliNzL9ofWjY7LkD8MEJClU3Oa3MuPnp4d60Is39t4
	JOimfyQwaCtQz4a5NEbeVqQltGdgpXMNCMYavO5DMwiKiuLE9kAjx/2XykRGe1YAdcv4
	eGTcYFiukujXgQMmyt3UdXG5q+0/Eif2WNiLa+GDw9ma61ENFKtZzel5/yHtsCrzUaZF
	RZ61zokrKKatpAb9Un7ym9zAAdewG0bbeLDmO+EWcajwGAAb7iKiGkKgOg4HvyhnXlOt
	6+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language;
	bh=17OneuF5iNxecLWNmPk3CueZ1GdcAl42V4WSVg8O1Dc=;
	b=OJJ/e/Oxf1fAZnF2VCqo8oREtGDwg0QfYJ2+clWC8H0NLA7P/SgQSzgnLyXYrcq5uc
	SBfgbim2cXi1rABFdqL+eZEZ3XESK20hW+D6f/cyM+e22Re7ZmZuQ5tU+ZbbuPRU6A66
	TPjslaOLz2+EWHSpNhpNkIRWut609zlABF0woxDDKGZ4/Rn5Avx7s3hsjPosov7OuUgf
	UZUDKWD7mk0sO5gKZsBWNatmKsU+oO5ctYQ+AkYAtpmCeYV/5ryScy3bs0zK9HpqCR6n
	jgw/BmArXIBrm01iyKZUPbYBEl2hsgkiSmqmZfXc/euEyGMbHg4+OPkk6BhCTDBd+DBC
	GN/A==
X-Gm-Message-State: APjAAAUMudS61w4jXqakbZ8whm8FBXHgUjFcqQmS4bohaXEluekNS+5B
	g6HGt49mx4mHN/zKmvbkRgQhEgHn
X-Google-Smtp-Source: APXvYqzrAntrYuu+drSzUcooKeRJkaSDy3DjJCWEoQAuXTDcCbgc1JYSdzo7fK6r0Oxk4Jz00ypD5A==
X-Received: by 2002:a65:66c8:: with SMTP id c8mr29707214pgw.161.1579027194821; 
	Tue, 14 Jan 2020 10:39:54 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:fd83:79d8:6b68:b6b6?
	([2601:202:4180:a5c0:fd83:79d8:6b68:b6b6])
	by smtp.gmail.com with ESMTPSA id
	g19sm19054314pfh.134.2020.01.14.10.39.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 14 Jan 2020 10:39:54 -0800 (PST)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <074801d5caf2$a160cdf0$e42269d0$@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d5c64105-2bde-0840-17d3-d44192edc770@gmail.com>
Date: Tue, 14 Jan 2020 10:39:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <074801d5caf2$a160cdf0$e42269d0$@gmail.com>
Subject: Re: [yocto] Yocto Project Status WW03'20
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
X-List-Received-Date: Tue, 14 Jan 2020 18:39:54 -0000
Content-Type: multipart/alternative;
	boundary="------------DAB9FE06B64351407BAB80A3"
Content-Language: en-US

--------------DAB9FE06B64351407BAB80A3
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 1/14/20 7:52 AM, Stephen Jolley wrote:
>
> Current Dev Position: YP 3.1 M2
>
> Next Deadline: YP 3.1 M2 build date 1/20/2020
>
>  
>
> Next Team Meetings:
>
>   * Bug Triage meeting Thursday Jan. 16th  at 7:30am PDT
>     (https://zoom.us/j/454367603)
>   * Monthly Project Meeting Tuesday Feb. 4th  at 8am PDT
>     (https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
>   * Weekly Engineering Sync Tuesday Jan. 14th at 8am PDT
>     (https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
>   * Twitch - Next event is Tuesday Jan. 14th at 8am PDT
>     (https://www.twitch.tv/yocto_project)
>
>  
>
> Tip of the Week:
>
>   * ‘oe-pkgdata-browser’ is a new handy small helper UI added by Ross
>     to visualise the pkgdata held within a build.
>   * (anyone with tips they’d like to see here, please send to Stephen
>     or Richard)
>
>  
>
> Key Status/Updates:
>
>   * YP 3.1 M2 is due to be built next week.
>   * Patch merging is roughly on track however there are a number of
>     failures identified with key patches (glibc has a prelink issue on
>     mips, python 3.8 upgrade blocked on uid issue, gstreamer meson
>     transition blocked on nodistro failure). Most of these issues are
>     making progress over time.
>   * The more worrying aspect is that there are a number of
>     recurring/intermittent failures in the automated testing, mostly
>     from selftest and testimage.
>   * Looking at the build history, “full” images have built cleanly
>     only once in the past month (3 times in the last two months),
>     which is a pretty shocking statistic which summarises the
>     challenges we face there. Most of these are being procrastinated
>     on by the bug owners since we can’t reproduce them at will. We
>     really need help working on these kinds of issues.
>   * We have changed the sstate mirrors to be per release, simply to
>     lower the numbers of files in any given sstate directory.
>   * The triage team is worried about attendance at triage meetings and
>     the project is finding it hard to find people to help fix bugs. If
>     anyone is willing to work on bugs, assistance would be greatly
>     appreciated.
>
>  
>
> YP 3.1 Milestone Dates:
>
>   * YP 3.1 M2 build date 1/20/2020
>   * YP 3.1 M2 release date 1/31/2020
>   * YP 3.1 M3 build date 2/24/2020
>   * YP 3.1 M3 release date 3/6/2020
>   * YP 3.1 M4 build date  3/30/2020
>   * YP 3.1 M4 release date  4/24/2020
>
>  
>
> Planned upcoming dot releases:
>
>   * YP 2.7.3 build date  2/10/2020
>   * YP 2.7.3 release date 2/21/2020
>
New set of warrior patches sent out for review.


>  *
>
>
>
>   * YP 3.0.2 build date  2/3/2020
>   * YP 3.0.2 release date 2/14/2020
>
Back porting the remaining hash equivalence patches.

Do have some build failures that also affecting Master.

Will send out a call for patches sometime the end of next week.

Do we hold up the dot release if we add a new host?

- armin
>
>  *
>
>  
>
> Tracking Metrics:
>
>   * WDD 2772 (last week
>     2773)(https://wiki.yoctoproject.org/charts/combo.html)
>   * Poky Patch Metrics  
>       o Total patches found: 1411 (last week 1400)
>       o Patches in the Pending State: 562 (40%) [last week 562 (40%)]
>
>  
>
> The Yocto Project’s technical governance is through its Technical
> Steering Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
>
>  
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
>  
>
> [If anyone has suggestions for other information you’d like to see on
> this weekly status update, let us know!]
>
>  
>
> Thanks,
>
>  
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Project Manager*
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:              _sjolley.yp.pm@gmail.com
> <mailto:sjolley.yp.pm@gmail.com>_
>
>  
>
>
> 


--------------DAB9FE06B64351407BAB80A3
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/14/20 7:52 AM, Stephen Jolley
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:074801d5caf2$a160cdf0$e42269d0$@gmail.com">
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:285503537;
	mso-list-template-ids:-1442514388;}
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
	{mso-list-id:388849393;
	mso-list-template-ids:745155412;}
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
	{mso-list-id:656610575;
	mso-list-template-ids:298983202;}
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
	{mso-list-id:955989339;
	mso-list-template-ids:100696504;}
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
	{mso-list-id:1020814898;
	mso-list-template-ids:-1691966188;}
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
	{mso-list-id:1126004780;
	mso-list-template-ids:-184510978;}
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
@list l6
	{mso-list-id:1459496779;
	mso-list-template-ids:1223869194;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7
	{mso-list-id:1613246509;
	mso-list-template-ids:-962182500;}
@list l7:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l7:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l7:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l7:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8
	{mso-list-id:1718047357;
	mso-list-template-ids:-1655521626;}
@list l8:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l8:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l8:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l8:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9
	{mso-list-id:1899198675;
	mso-list-template-ids:-319940586;}
@list l9:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l9:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l9:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l9:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10
	{mso-list-id:2013024561;
	mso-list-template-ids:-86611496;}
@list l10:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l10:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l10:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l10:level9
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
            Dev Position: YP 3.1 M2</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 3.1 M2 build date 1/20/2020</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Team Meetings:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Bug
              Triage meeting Thursday Jan. 16th  at 7:30am PDT (<a
                href="https://zoom.us/j/454367603"
                moz-do-not-send="true"><span
                  style="font-size:10.0pt;color:#1155CC">https://zoom.us/j/454367603</span></a>)<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Monthly
              Project Meeting Tuesday Feb. 4th  at 8am PDT (<a
                href="https://zoom.us/j/990892712"
                moz-do-not-send="true"><span style="color:#1155CC">https://zoom.us/j/990892712)</span></a><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Weekly
              Engineering Sync Tuesday Jan. 14th at 8am PDT (<a
                href="https://zoom.us/j/990892712"
                moz-do-not-send="true"><span style="color:#1155CC">https://zoom.us/j/990892712)</span></a><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l2 level1
            lfo6;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Twitch -
              Next event is Tuesday Jan. 14th at 8am PDT (<a
                href="https://www.twitch.tv/yocto_project"
                moz-do-not-send="true"><span style="color:#1155CC">https://www.twitch.tv/yocto_project</span></a>)<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Tip
            of the Week:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l6 level1
            lfo7;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">‘oe-pkgdata-browser’
              is a new handy small helper UI added by Ross to visualise
              the pkgdata held within a build.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l6 level1
            lfo7;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">(anyone
              with tips they’d like to see here, please send to Stephen
              or Richard)<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M2
              is due to be built next week.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Patch
              merging is roughly on track however there are a number of
              failures identified with key patches (glibc has a prelink
              issue on mips, python 3.8 upgrade blocked on uid issue,
              gstreamer meson transition blocked on nodistro failure).
              Most of these issues are making progress over time.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">The more
              worrying aspect is that there are a number of
              recurring/intermittent failures in the automated testing,
              mostly from selftest and testimage.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Looking
              at the build history, “full” images have built cleanly
              only once in the past month (3 times in the last two
              months), which is a pretty shocking statistic which
              summarises the challenges we face there. Most of these are
              being procrastinated on by the bug owners since we can’t
              reproduce them at will. We really need help working on
              these kinds of issues.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">We have
              changed the sstate mirrors to be per release, simply to
              lower the numbers of files in any given sstate directory.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l9 level1
            lfo8;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">The
              triage team is worried about attendance at triage meetings
              and the project is finding it hard to find people to help
              fix bugs. If anyone is willing to work on bugs, assistance
              would be greatly appreciated.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            3.1 Milestone Dates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M2
              build date 1/20/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M2
              release date 1/31/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M3
              build date 2/24/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M3
              release date 3/6/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M4
              build date  3/30/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l5 level1
            lfo9;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.1 M4
              release date  4/24/2020<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 2.7.3
              build date  2/10/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 2.7.3
              release date 2/21/2020</span></li>
        </ul>
      </div>
    </blockquote>
    New set of warrior patches sent out for review.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:074801d5caf2$a160cdf0$e42269d0$@gmail.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span><br>
          </li>
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.0.2
              build date  2/3/2020<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">YP 3.0.2
              release date 2/14/2020</span></li>
        </ul>
      </div>
    </blockquote>
    Back porting the remaining hash equivalence patches.<br>
    <br>
    Do have some build failures that also affecting Master.<br>
    <br>
    Will send out a call for patches sometime the end of next week.<br>
    <br>
    Do we hold up the dot release if we add a new host?<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:074801d5caf2$a160cdf0$e42269d0$@gmail.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l7 level1
            lfo10;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l8 level1
            lfo11;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">WDD 2772
              (last week 2773)</span><span style="font-family:Consolas">
              (</span><span
              style="font-family:&quot;Arial&quot;,sans-serif"><a
                href="https://wiki.yoctoproject.org/charts/combo.html"
                moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a></span><span
              style="font-family:Consolas">)</span><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l8 level1
            lfo11;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif">Poky
              Patch Metrics  </span><span style="font-family:Consolas"><o:p></o:p></span></li>
          <ul style="margin-top:0in" type="circle">
            <li class="MsoNormal" style="color:black;mso-list:l8 level2
              lfo11;vertical-align:baseline"><span
                style="font-family:&quot;Arial&quot;,sans-serif">Total
                patches found: 1411 (last week 1400)<o:p></o:p></span></li>
            <li class="MsoNormal" style="color:black;mso-list:l8 level2
              lfo11;vertical-align:baseline"><span
                style="font-family:&quot;Arial&quot;,sans-serif">Patches
                in the Pending State: 562 (40%) [last week 562 (40%)]</span><span
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
            Serif&quot;">(208) 244-4460<span style="color:black"><o:p></o:p></span></span></p>
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
                  moz-do-not-send="true">sjolley.yp.pm@gmail.com</a></span></u></span><span
style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"
            lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------DAB9FE06B64351407BAB80A3--
