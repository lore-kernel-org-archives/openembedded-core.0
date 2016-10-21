Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9154071CF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 15:32:02 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id r16so58640373pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=Uqw5+93ovu3Omtt9yPbHs2QXz0Dd5UiMxi5u4/XiHmI=;
	b=C+r2kW9uvZp1QU9QjUH2yZK4ri14nQ5vtt/aKB2ZeRRRRnzNlOz9YZhoy0gdj88dgq
	xcO8Y3fBX0DGO940/SSlfFbGneazl5PZY+4y9t8xoPh1wbFx51LPq+pWzijAmIDHwE6O
	j+0Q99YxMVdyyH1sgNTJz0LJssMi1hBXcx6soAJU2dBPKfUZLfrzRin37e3xpMcE4tl5
	hXnJGMDM91S8DGJuMgE2xfii3MkY2M8gz7B4nZ+MzY2qH748bI8GBy/zbF8VYGaHYeUb
	+S+Qebs+pEpmEZ9t8wMOYhZvCSKzMTjYFxJuaRNYaNNQQt7GyvuELy54uvqMy2brF9YB
	3pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Uqw5+93ovu3Omtt9yPbHs2QXz0Dd5UiMxi5u4/XiHmI=;
	b=Zr9MZrnIV3OMb3xGwKJxN4+wQXWle2cz3zUCCsRsEzCtP6GC1RdCDAceZgTlsJV/oA
	gC+nIWB+JBARwVNAN2Q3yyR88+Ll9IXWObgSFSJqNKfq9ipTTjm6JWLjKeAqTHAx6ttN
	gwJBvPNWf7SxfvBDgih0TH1QUY4cqIhCT1HthqWDY6kDEdp0XPP0k/JL4myjA8IveEGl
	cOROR3fRODJwXCbCnd9qsNAjcmP9p5pq/uhGuSWnZJKwYFotX260QIPuWnM9ibinE84x
	Z87KJl1IM0DQSo1QW2nZnyEUW+ZTBkdIjQRr17SBU1KIFEMEprekxMNL2fAXVh0T6YSD
	szlw==
X-Gm-Message-State: ABUngvcxGH2B+4hpRCLJOM2p4NwI73XsTECgTit5Uu7GgZ23PrjJxf6NP+c1GQhitgzErw==
X-Received: by 10.99.245.69 with SMTP id e5mr957014pgk.92.1477063922794;
	Fri, 21 Oct 2016 08:32:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:95c6:4f09:f950:8f9?
	([2601:202:4001:9ea0:95c6:4f09:f950:8f9])
	by smtp.gmail.com with ESMTPSA id
	c15sm6097420pfd.53.2016.10.21.08.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 08:32:02 -0700 (PDT)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E5729D82D@fmsmsx111.amr.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <23bd6029-1062-3065-8d8e-113b21edec6a@gmail.com>
Date: Fri, 21 Oct 2016 08:32:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E5729D82D@fmsmsx111.amr.corp.intel.com>
Subject: Re: [yocto] Yocto Project Status WW43
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
X-List-Received-Date: Fri, 21 Oct 2016 15:32:03 -0000
Content-Type: multipart/alternative;
	boundary="------------62F75191128626FC69DE1488"

--------------62F75191128626FC69DE1488
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


Stephen,

On 10/21/2016 08:26 AM, Jolley, Stephen K wrote:
>
> Current Dev Position: YP 2.2 M4
>
> Next Deadline: YP 2.2 M4 which was Oct. 3rd (5:00pm GMT)
>
> SWAT team rotation: Paul -> Ross
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> Key Status/Updates:
>
> ·Travel for ELC-E did interrupt these status report, apologies for 
> that. Some of the builds were tricky to debug and/or fix due to some 
> communication issues the travel didn’t help with too.
>
> ·2.2 rc4 is currently in QA. Current status is at: 
> https://wiki.yoctoproject.org/wiki/2.2_QA_Status
>
> ·At time of press, the runqemu issues are concerning but perhaps not 
> enough to delay the release, instead being fixed on the branch 
> immediately afterwards, assuming fixes are available by then.
>
> ·2.2 rc1-3 had various issues, some autobuilder related, some were new 
> and interesting bugs we’d never seen before during the release build, 
> or an intermittent bug we’d not seen for months in one case.
>
> ·The Morty release branches are in a position to diverge and we have 
> started to look at queuing the patches that are already being 
> submitted in -next and mut builds for master.
>
> ·2.3 planning is underway and RP will send more thoughts on the plans 
> for that in the next couple of weeks. Recipe specific sysroots look 
> like one desired feature for multiple reasons and there was good 
> discussion and feedback and OEDEM
>
> ·The discussion at OEDEM has great notes (thanks Jan in particular): 
> http://openembedded.org/wiki/OEDEM_2016#Minutes
>
> ·Whilst the defect density was decreasing, there has now been an 
> uptick in the number of defects and things are rising again.
>
> ·Several good performance issues were found and addressed, a separate 
> email was sent on that topic.
>
> ·Proposed 2.3 dates are below but this isn’t 100% confirmed yet.
>
> Key YP 2.2 Dates:
>
> ·YP 2.2 M4 release would be: 10/28/16
>
> Proposed upcoming releases after YP 2.2 are:
>
> Milestone
>
> 	
>
> Cutoff
>
> 	
>
> Release
>
> YP 2.0.3
>
> 	
>
> 11/7/2016
>
> 	
>
> 11/18/2016
>
> YP 2.1.2
>
> 	
>
> 11/28/2016
>
> 	
>
> 12/9/2016
>
> YP 2.3 M1
>
> 	
>
> 12/12/2016
>
> 	
>
> 12/23/2016
>
> YP 2.2.1
>
> 	
>
> 1/9/2017
>
> 	
>
> 1/20/2017
>
> YP 2.3 M2
>
> 	
>
> 1/23/2017
>
> 	
>
> 2/3/2017
>
> YP 2.3 M3
>
> 	
>
> 2/27/2017
>
> 	
>
> 3/10/2017
>
> YP 2.3 M4
>
> 	
>
> 4/3/2017
>
> 	
>
> 4/28/2017
>
> YP 2.3
>
> 	
>
> 4/3/2017
>
> 	
>
> 4/28/2017
>
> YP 2.1.3
>
> 	
>
> 5/8/2017
>
> 	
>
> 5/19/2017
>
> YP 2.2.2
>
> 	
>
> 5/15/2017
>
> 	
>
> 5/30/2017
>


These are helpful.

Thanks
Armin
>
> Tracking Metrics:
>
> WDD 2306 (last week 2289)
>
> (https://wiki.yoctoproject.org/charts/combo.html)
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features
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


--------------62F75191128626FC69DE1488
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
    Stephen,<br>
    <br>
    <div class="moz-cite-prefix">On 10/21/2016 08:26 AM, Jolley, Stephen
      K wrote:<br>
    </div>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E5729D82D@fmsmsx111.amr.corp.intel.com"
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
	{mso-list-id:265310024;
	mso-list-template-ids:2039094302;}
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
	{mso-list-id:277295872;
	mso-list-template-ids:-2021763744;}
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
	{mso-list-id:395707557;
	mso-list-template-ids:-640490192;}
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
	{mso-list-id:1612782334;
	mso-list-template-ids:-1874056916;}
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
            Dev Position: YP 2.2 M4</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.2 M4 which was Oct. 3rd (5:00pm GMT)</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Paul -&gt; Ross</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Travel
            for ELC-E did interrupt these status report, apologies for
            that. Some of the builds were tricky to debug and/or fix due
            to some communication issues the travel didn’t help with
            too.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2.2
            rc4 is currently in QA. Current status is at:
            <a moz-do-not-send="true"
              href="https://wiki.yoctoproject.org/wiki/2.2_QA_Status"><span
                style="color:#1155CC">https://wiki.yoctoproject.org/wiki/2.2_QA_Status</span></a><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">At
            time of press, the runqemu issues are concerning but perhaps
            not enough to delay the release, instead being fixed on the
            branch immediately afterwards, assuming fixes are available
            by then.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2.2
            rc1-3 had various issues, some autobuilder related, some
            were new and interesting bugs we’d never seen before during
            the release build, or an intermittent bug we’d not seen for
            months in one case.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Morty release branches are in a position to diverge and we
            have started to look at queuing the patches that are already
            being submitted in -next and mut builds for master.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2.3
            planning is underway and RP will send more thoughts on the
            plans for that in the next couple of weeks. Recipe specific
            sysroots look like one desired feature for multiple reasons
            and there was good discussion and feedback and OEDEM<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The
            discussion at OEDEM has great notes (thanks Jan in
            particular):
            <a moz-do-not-send="true"
              href="http://openembedded.org/wiki/OEDEM_2016#Minutes"><span
                style="color:#1155CC">http://openembedded.org/wiki/OEDEM_2016#Minutes</span></a><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Whilst
            the defect density was decreasing, there has now been an
            uptick in the number of defects and things are rising again.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Several
            good performance issues were found and addressed, a separate
            email was sent on that topic.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo5;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed
            2.3 dates are below but this isn’t 100% confirmed yet.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.2 Dates:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l0
          level1 lfo6;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2 M4 release would be: 10/28/16<o:p></o:p></span></p>
        <p
          style="margin:0in;margin-bottom:.0001pt;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed
            upcoming releases after YP 2.2 are:</span></p>
      </div>
    </blockquote>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E5729D82D@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <table class="MsoNormalTable" style="border-collapse:collapse"
          border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td style="border:solid black 1.0pt;padding:5.25pt 5.25pt
                5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Milestone</span><o:p></o:p></p>
              </td>
              <td style="border:solid black
                1.0pt;border-left:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Cutoff</span><o:p></o:p></p>
              </td>
              <td style="border:solid black
                1.0pt;border-left:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Release</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.0.3</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/7/2016</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/18/2016</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.1.2</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/28/2016</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/9/2016</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.3 M1</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/12/2016</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/23/2016</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.2.1</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/9/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/20/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.3 M2</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/23/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2/3/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.3 M3</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2/27/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">3/10/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.3 M4</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/3/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/28/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.3</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/3/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/28/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.1.3</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/8/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/19/2017</span><o:p></o:p></p>
              </td>
            </tr>
            <tr>
              <td style="border:solid black
                1.0pt;border-top:none;padding:5.25pt 5.25pt 5.25pt
                5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
                    2.2.2</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/15/2017</span><o:p></o:p></p>
              </td>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/30/2017</span></p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </blockquote>
    <br>
    <br>
    These are helpful.  <br>
    <br>
    Thanks<br>
    Armin<br>
    <blockquote
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155E5729D82D@fmsmsx111.amr.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <table class="MsoNormalTable" style="border-collapse:collapse"
          border="0" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td
                style="border-top:none;border-left:none;border-bottom:solid
                black 1.0pt;border-right:solid black
                1.0pt;padding:5.25pt 5.25pt 5.25pt 5.25pt" valign="top">
                <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
              </td>
            </tr>
          </tbody>
        </table>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            class="apple-tab-span"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">           
            </span></span><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">WDD
            2306 (last week 2289)</span><o:p></o:p></p>
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
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            moz-do-not-send="true"
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features"><span
style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features</span></a><o:p></o:p></p>
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

--------------62F75191128626FC69DE1488--
