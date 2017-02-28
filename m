Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id D3BFB719E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 02:09:38 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id b129so51480020pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 18:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=IOv3iqApuN7UAJLWxNSboAk8VNw17kJ5Zd6wd/Il9zg=;
	b=OfJR4iSz+RNlsTHa8KFaRVnn5jjBhOM5qsCf7Ms1zGVMdKFXUVyNk43GolO5nDlDfC
	5EZxUrKFVozHn4l8H8W2O2nb9IJK7+e367Q6RSPJgZtlkKK5YlTT8NqjjMS/5ll3k+wt
	sB/K7iRLB9h6GY1f6mfTqSXqOO4DvA57I0ZCIIeOxVU//QcBvpKcYYIXTPJAHSO1PMNS
	W59sv8CJHJzxM09HiPvb6LC0yrbwOTmoq/iBKAAV77IZ0Ffqyh23LrqDFZRwScuSCwAf
	rJBI8KOpiLzy2scz3rejuVi0s87ed0fVln8OU86lnkvu/Ey+ziV+UQFHDJOmDwxkeVfN
	+sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=IOv3iqApuN7UAJLWxNSboAk8VNw17kJ5Zd6wd/Il9zg=;
	b=WS3yT6ueKfDARjrxCOMZZMjEP4mRjvvUNYvgmRJoy606YEaPWV1i8w5CLC8lGUyh50
	7RlAI+hlRJmEwSffRfZRqAdBm1a0t2PoK9lagPr4RT5BZ2NzY7ad2ql/8TRWQ0mLafgB
	+vtbVPh0b0rKHdlrA02tVFSTTYNl++PsoxlrXlrj1bNZrxPbuJqfIzfe0DtaNKDKkJX3
	p5IfmmdlJQ5hwI8dRvcWCx+qTkAcRy2itrq8Y5mbVQ1nXCSnLzDlcA+tEO7VvFK8xsJP
	cCGCdkClyOG4qKbLhrvI1xZHBjPxM0IT1J6fN7+ubCL7WICXSIT+TPoJQ/na+wXSpOlJ
	ez1g==
X-Gm-Message-State: AMke39ln002enhi77cWDeeH5HYxBVdlaTH7k2H5m4PBDWTdH8rIXvS4N0U+FrG7zC8/2tQ==
X-Received: by 10.98.152.91 with SMTP id q88mr24332072pfd.69.1488247779485;
	Mon, 27 Feb 2017 18:09:39 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:40d:2600:e57d:625e?
	([2601:202:4001:9ea0:40d:2600:e57d:625e])
	by smtp.gmail.com with ESMTPSA id d2sm229343pgf.35.2017.02.27.18.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Feb 2017 18:09:38 -0800 (PST)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <956ffb9d-d58d-93b8-6989-6283009f4826@gmail.com>
Date: Mon, 27 Feb 2017 18:09:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXMDnigJkxNw==?=
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
X-List-Received-Date: Tue, 28 Feb 2017 02:09:39 -0000
Content-Type: multipart/alternative;
	boundary="------------3F54D2D54A3A3A700C04E7BE"

--------------3F54D2D54A3A3A700C04E7BE
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 02/27/2017 08:59 AM, Jolley, Stephen K wrote:
>
> Current Dev Position: YP 2.3 M3
>
> Next Deadline: YP 2.3 M3 by Feb. 27, 2017
>
> *** FEATURE FREEZE for 2.3 is now in effect. ***
>
> SWAT team rotation: Anibal -> Todor on Feb. 24, 2017.
>
> SWAT team rotation: Todor -> Tracy on Mar. 4, 2017.
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> Key Status/Updates:
>
> ·We’re now into feature freeze for 2.3.
>
> ·We need to decide which recently submitted items should be merged. 
> Some major items In particular:
>
> orpm v4/dnf to replace rpm v5/smart?
>
IMHO, we should include dnf in 2.3 so folks can start playing with it 
and remove smart in 2.4.

> oMerging go into OE-Core?
>
> oSeparate out elderly GPLv2 into a separate layer?
>
yes, but maybe not for 2.3 if its a large effort.

> oGraphics stack vulkan changes?
>
The "Go" changes hit before the vulkan. Both should have the same rules 
applied which ever way the decision goes.


> oLarge queue of wic changes?
>
> I am leaning towards trying to take these even if they do delay the M3 
> release slightly as we do have some time left in M4 to stabilize.
>
> ·Unfortunately we continue to have stability issues in testing. There 
> appear to be some intermittent failures which have crept into master 
> and M3 merging will likely be delayed until those issues have been 
> tracked down. They seem to affect sdk image size, breaking the 4GB 
> limit and eSDKs stopping containing libxml2 under unknown 
> circumstances, possibly amongst other issues.
>
> ·YP 2.2.1 has been released
>

thanks to all that help.

> Proposed upcoming dot releases:
>
> YP 2.1.3 Cut off May 15, 2017
>
> YP 2.1.3 Release by May 26, 2017
>
> YP 2.2.2 Cut off May 29, 2017
>
> YP 2.2.2 Release by June 9, 2017
>

I like the dot release schedule. Helps me focus.

kind regards,
Armin
>
> Key YP 2.3 Dates:
>
> YP 2.3 M3 Cutoff is Feb 27, 2017
>
> YP 2.3 M3 Release is Mar. 10, 2017
>
> YP 2.3 M4 Cutoff is April 10, 2017
>
> YP 2.3 M4 Release is May 5, 2017
>
> Tracking Metrics:
>
> WDD 2747 (last week 2682)
>
> (https://wiki.yoctoproject.org/charts/combo.html)
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features
>
>
> [If anyone has suggestions for other information you’d like to see on 
> this weekly status update, let us know!]
>
> Thanks,
>
> */Stephen K. Jolley/**//*
>
> *Yocto Project Program Manager*
>
> *INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124 *
>
> (*Work Telephone*: (503) 712-0534
>
> (*Cell*: (208) 244-4460
>
> * *Email*:_stephen.k.jolley@intel.com_
>
>
>


--------------3F54D2D54A3A3A700C04E7BE
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 02/27/2017 08:59 AM, Jolley, Stephen
      K wrote:<br>
    </div>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
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
	{mso-list-id:1058700876;
	mso-list-template-ids:-537102308;}
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
	{mso-list-id:1091196149;
	mso-list-template-ids:627992598;}
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
	{mso-list-id:1154881042;
	mso-list-template-ids:-1030177482;}
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
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Current
            Dev Position: YP 2.3 M3
          </span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.3 M3 by Feb. 27, 2017</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">***
            FEATURE FREEZE for 2.3 is now in effect. ***</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Anibal -&gt; Todor on Feb. 24, 2017.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Todor -&gt; Tracy on Mar. 4, 2017.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">We’re
            now into feature freeze for 2.3.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">We
            need to decide which recently submitted items should be
            merged. Some major items In particular:<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">rpm
            v4/dnf to replace rpm v5/smart?</span></p>
      </div>
    </blockquote>
    IMHO, we should include dnf in 2.3 so folks can start playing with
    it and remove smart in 2.4.<br>
    <br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Merging
            go into OE-Core?<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Separate
            out elderly GPLv2 into a separate layer?</span></p>
      </div>
    </blockquote>
    yes, but maybe not for 2.3 if its a large effort. <br>
    <br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Graphics
            stack vulkan changes?</span></p>
      </div>
    </blockquote>
    The "Go" changes hit before the vulkan. Both should have the same
    rules applied which ever way the decision goes.<br>
    <br>
    <br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Large
            queue of wic changes?<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">I
            am leaning towards trying to take these even if they do
            delay the M3 release slightly as we do have some time left
            in M4 to stabilize.</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo4;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Unfortunately
            we continue to have stability issues in testing. There
            appear to be some intermittent failures which have crept
            into master and M3 merging will likely be delayed until
            those issues have been tracked down. They seem to affect sdk
            image size, breaking the 4GB limit and eSDKs stopping
            containing libxml2 under unknown circumstances, possibly
            amongst other issues.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo4;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.1 has been released</span></p>
      </div>
    </blockquote>
    <br>
    thanks to all that help.<br>
    <br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo4;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed
            upcoming dot releases:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.1.3 Cut off May 15, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.1.3 Release by May 26, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.2 Cut off May 29, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.2 Release by June 9, 2017</span></p>
      </div>
    </blockquote>
    <br>
    I like the dot release schedule. Helps me focus.<br>
    <br>
    kind regards,<br>
    Armin<br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.3 Dates:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3 M3 Cutoff is Feb 27, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3 M3 Release is Mar. 10, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3 M4 Cutoff is April 10, 2017</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3 M4 Release is May 5, 2017</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            class="apple-tab-span"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">           
            </span></span><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">WDD
            2747 (last week 2682)</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span
            style="font-size:11.0pt;font-family:Consolas;color:black">(</span><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/charts/combo.html"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><span
            style="font-size:11.0pt;font-family:Consolas;color:black">)</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status Links for YP:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features</span></a><o:p></o:p></p>
        <p class="MsoNormal"><br>
          <span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Thanks,</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"
          style="page-break-after:avoid;text-autospace:none"><b><i><span
                style="font-size:16.0pt;font-family:&quot;Times New
                Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span
style="font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:8.0pt;font-family:&quot;Courier
              New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></span></b></p>
        <p class="MsoNormal"
          style="page-break-after:avoid;text-autospace:none"><b><span
              style="font-size:10.0pt;font-family:&quot;Courier
              New&quot;;color:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th
              Avenue, Hillsboro, OR 97124
              <o:p></o:p></span></b></p>
        <p class="MsoNormal"><span
            style="font-family:Wingdings;color:black">(</span><span
            style="font-family:&quot;MS Sans Serif&quot;;color:teal">
          </span><span style="font-size:8.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">  </span><b><span
              style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal">Work Telephone</span></b><span
            style="font-family:&quot;MS Sans Serif&quot;;color:teal">:       
          </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;">(503) 712-0534<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings;color:black">(</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">   
          </span><b><span style="font-size:8.0pt;font-family:&quot;Comic
              Sans MS&quot;;color:teal">Cell</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal">:              
          </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;">(208) 244-4460<span style="color:black"><o:p></o:p></span></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings">* </span>
          <b><span style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal" lang="FR">Email</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;;color:teal" lang="FR">:</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;" lang="FR">                           
            <u><span style="color:blue"><a class="moz-txt-link-abbreviated" href="mailto:stephen.k.jolley@intel.com">stephen.k.jolley@intel.com</a></span></u></span><span
style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"
            lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------3F54D2D54A3A3A700C04E7BE--
