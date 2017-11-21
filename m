Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 110927868A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 01:22:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAL1M8pd029334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Nov 2017 17:22:09 -0800
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 17:22:07 -0800
To: <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"Xu, Chi" <Chi.Xu@windriver.com>,
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>,
	"WOLD, SAUL" <saul.wold@intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
Date: Mon, 20 Nov 2017 20:22:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
X-Originating-IP: [172.25.44.3]
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Tue, 21 Nov 2017 01:22:10 -0000
Content-Type: multipart/alternative;
	boundary="------------474C3D09EE528346BD20C1B0"
Content-Language: en-GB

--------------474C3D09EE528346BD20C1B0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017-11-20 10:36 AM, Jolley, Stephen K wrote:
>
> Current Dev Position: YP 2.5 Planning and M1 development
>
> Next Deadline: YP 2.5 M1 cut off of 12/4/17
>
> SWAT team rotation: Juro -> Paul on Nov.17, 2017.
>
> SWAT team rotation: Paul -> Todor on Nov. 24, 2017.
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> Key Status/Updates:
>
> ·There is no real change to the status from last week. We continue to 
> suffer intermittent build failures and are continuing to attempt to 
> debug these.
>
> ·Currently open issues are:
>

Some US-based people may be on holiday later this week so I'm offering
help from the frozen Northland and more importantly from the team in 
Beijing. ;-)

> oqemuppc continues to demonstrate random hangs in boot  in userspace
>

Is we can create a defect for this and point / copy the wiki notes into 
it, that
would help.
    https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs

I think I had asked Chi to see if he could reproduce this a week or two ago.
When the lack of entropy problem was identified and fix, many people thought
this hang went away as well. Chi can you read the wiki report and see if you
can add anything to them?

> oIssues with 4.13.10 host kernels booting kvm x86 guests on Tumbleweed 
> (Suse) and Fedora 26 (attempting to see if 4.13.12 helps)
>

Robert, can you test Fedora 26. It would help to have a defect open with 
steps to reproduce or
something about the typical workflow/ build time/ day of the week/ phase 
of the moon.

> onfs inode count for the sstate/dldir share appears to break 
> periodically causing the disk monitor to halt the builds (bug 12267)
>

Likely specific to the AB server so no plans to do anything for this bug.

> oa perf build race (bug 12302)
>
  I'll take a look to:
  - see if I can duplicate the bug on a fast build host
  - check upstream to see if the bug is known/fixed
  - see if I can spot a race in the build rules.

> oAn ext filesystem creation/sizing issue (bug 12304)
>

Saul, Are you around this week? Do you have any additional information 
before
leaving for Thanksgiving?

Jackie,
Can you look at the code around the image creation and try to reproduce 
this one?

../Randy

> ·Until we resolve these issues patches will continue to be slow to 
> merge, if at all. This also blocks several core developers from doing 
> any feature work at this point in time (e.g. layer setup tool is on 
> hold, again).
>
> ·We can only continue to stress that unless others step up and help to 
> try and root cause these issues, things will stall with the project.
>
> Planned upcoming dot releases:
>
> YP 2.2.3 is planned and should be out in the next few weeks.
>
> YP 2.3.3 is planned, but date TBD during YP 2.5 planning.
>
> YP 2.4.1 is planned, but date TBD during YP 2.5 planning.
>
> Key YP 2.5 Dates are:
>
> YP 2.5 M1 cut off of 12/4/17
>
> YP 2.5 M1 release of 12/15/17
>
> YP 2.5 M2 cut off of 1/15/18
>
> YP 2.5 M2 release of 1/26/18
>
> YP 2.5 M3 cut off of 2/19/18
>
> YP 2.5 M3 release of 3/2/18
>
> YP 2.5 M4 cut off of 4/2/18
>
> YP 2.5 M4 release of 4/27/18
>
> Tracking Metrics:
>
> WDD 2655 (last week 2640)
>
> (https://wiki.yoctoproject.org/charts/combo.html)
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features
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

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company


--------------474C3D09EE528346BD20C1B0
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017-11-20 10:36 AM, Jolley, Stephen
      K wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
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
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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
	{mso-list-id:1114057376;
	mso-list-template-ids:-674957818;}
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
	{mso-list-id:1161702765;
	mso-list-template-ids:-985757304;}
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
            Dev Position: YP 2.5 Planning and M1 development</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.5 M1 cut off of 12/4/17</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Juro -&gt; Paul on Nov.17, 2017.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Paul -&gt; Todor on Nov. 24, 2017.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"
            moz-do-not-send="true"><span
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
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">There
            is no real change to the status from last week. We continue
            to suffer intermittent build failures and are continuing to
            attempt to debug these.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Currently
            open issues are:</span></p>
      </div>
    </blockquote>
    <br>
    Some US-based people may be on holiday later this week so I'm
    offering <br>
    help from the frozen Northland and more importantly from the team in
    Beijing. ;-)<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">  
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">qemuppc
            continues to demonstrate random hangs in boot  in userspace</span></p>
      </div>
    </blockquote>
    <br>
    Is we can create a defect for this and point / copy the wiki notes
    into it, that<br>
    would help.<br>
       <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs">https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs</a><br>
    <br>
    I think I had asked Chi to see if he could reproduce this a week or
    two ago.<br>
    When the lack of entropy problem was identified and fix, many people
    thought<br>
    this hang went away as well. Chi can you read the wiki report and
    see if you<br>
    can add anything to them?<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
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
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Issues
            with 4.13.10 host kernels booting kvm x86 guests on
            Tumbleweed (Suse) and Fedora 26 (attempting to see if
            4.13.12 helps)</span></p>
      </div>
    </blockquote>
    <br>
    Robert, can you test Fedora 26. It would help to have a defect open
    with steps to reproduce or<br>
    something about the typical workflow/ build time/ day of the week/
    phase of the moon. <br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
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
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">nfs
            inode count for the sstate/dldir share appears to break
            periodically causing the disk monitor to halt the builds
            (bug 12267)</span></p>
      </div>
    </blockquote>
    <br>
    Likely specific to the AB server so no plans to do anything for this
    bug.<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
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
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">a
            perf build race (bug 12302)</span></p>
      </div>
    </blockquote>
     I'll take a look to:<br>
     - see if I can duplicate the bug on a fast build host<br>
     - check upstream to see if the bug is known/fixed<br>
     - see if I can spot a race in the build rules.<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
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
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">An
            ext filesystem creation/sizing issue (bug 12304)</span></p>
      </div>
    </blockquote>
    <br>
    Saul, Are you around this week? Do you have any additional
    information before<br>
    leaving for Thanksgiving?<br>
    <br>
    Jackie, <br>
    Can you look at the code around the image creation and try to
    reproduce this one?<br>
    <br>
    ../Randy<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level2 lfo3;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Until
            we resolve these issues patches will continue to be slow to
            merge, if at all. This also blocks several core developers
            from doing any feature work at this point in time (e.g.
            layer setup tool is on hold, again).<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l1
          level1 lfo3;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">       
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">We
            can only continue to stress that unless others step up and
            help to try and root cause these issues, things will stall
            with the project.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.3 is planned and should be out in the next few weeks.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3.3 is planned, but date TBD during YP 2.5 planning.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.1 is planned, but date TBD during YP 2.5 planning.</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.5 Dates are:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M1 cut off of 12/4/17</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M1 release of 12/15/17</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M2 cut off of 1/15/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M2 release of 1/26/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 cut off of 2/19/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 release of 3/2/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 cut off of 4/2/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 release of 4/27/18</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            class="apple-tab-span"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">           
            </span></span><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">WDD
            2655 (last week 2640)</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span
            style="font-size:11.0pt;font-family:Consolas;color:black">(</span><a
            href="https://wiki.yoctoproject.org/charts/combo.html"
            moz-do-not-send="true"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><span
            style="font-size:11.0pt;font-family:Consolas;color:black">)</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status Links for YP:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p> </o:p></span></p>
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
            style="font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">
          </span><span style="font-size:8.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">  </span><b><span
              style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal">Work Telephone</span></b><span
            style="font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">:       
          </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif">(503) 712-0534<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings;color:black">(</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">   
          </span><b><span style="font-size:8.0pt;font-family:&quot;Comic
              Sans MS&quot;;color:teal">Cell</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal">:                             
          </span><span style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif">(208) 244-4460<span style="color:black"><o:p></o:p></span></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:Wingdings">* </span>
          <b><span style="font-size:8.0pt;font-family:&quot;Comic Sans
              MS&quot;;color:teal" lang="FR">Email</span></b><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif;color:teal" lang="FR">:</span><span
            style="font-size:9.0pt;font-family:&quot;MS Sans
            Serif&quot;,serif" lang="FR">                            <u><span
                style="color:blue"><a class="moz-txt-link-abbreviated" href="mailto:stephen.k.jolley@intel.com">stephen.k.jolley@intel.com</a></span></u></span><span
style="font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"
            lang="FR"><o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company
</pre>
  </body>
</html>

--------------474C3D09EE528346BD20C1B0--
