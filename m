Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2334B789D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:22:24 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id x4-v6so1904782pln.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=UGhGCspsX2Rm9FigVS9OHI5x2gERakaOVYjMh6x7nAE=;
	b=WPhHEtBrIUYJQGYebtJUR5WtaD1YbZ7v06faZjL5I+DUxyd23m65PCMw6tnGQHSJkm
	b1Jc+1BTphOj1vrMkQ8dhelS8CbGY/fQGkZWRAvn2VDrS+CDeLizKfirFfdi2QieqbpM
	FSdhCxWImHFMWe4LSjrsue3iMso6Ans2ZNd+zFNcqEsKJat8J8IEqBPxfg+4TeIwRLjQ
	YM/pDOxRAuGmV1mwzK6SLqA1htsX3ymRXBeWMEI1KKIsup+HNg2mgk4CWRsiJLzrf6Z7
	eKROHRB/J5l9yAfXbxDcrJI447oQi51AFnBWCB0pTItr5D9kJ8awFJvMd6epvTkSgCk6
	oMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=UGhGCspsX2Rm9FigVS9OHI5x2gERakaOVYjMh6x7nAE=;
	b=SwohZOzU5Hfsko/uH9cg+1D485VG6HW92HgYxYIReOgxoZ+m9GNg8DwdgL334T2rT4
	mj34Yzf5Bir7Pw2zm1ceoMPMpvAs0QVWkcENTA4veEBluLz+p9hIOpkurxGF9BPVrqQa
	a6LyAwla3JqOavswdOGHGDRRM/BYafJ2ZB1wuUrs1SFbh8KFIjnRCLGH1bvI+b143sJP
	vnhK/yAAYj7H3Hl5SMXxSW7O3+uTt3ZbRqQxcqK+DzUHO2L6OTNNqemO71iR6SXI9Jh/
	lo7ZL26rP0iWjYS9ECxYslc7J7zKXe0Lin4QlXeaGyEhygtEGHoiKM0AqaHKWJ8oiBhO
	DNZA==
X-Gm-Message-State: AElRT7GZp6xk1lBHJPtAbK8LDqIbVjc7L5gYnM4gIY6e32qOVjh2rF/A
	XD8qBkv6dt2dqcyB+0krt2Mt9Q==
X-Google-Smtp-Source: AG47ELuf8C5anHf3Ai62BAQAVZGtqCpoO0g5jERGSgdyAIxa2hjfYoM3xqbSC8qpr1Bmuo+sM+H7oA==
X-Received: by 2002:a17:902:51ad:: with SMTP id
	y42-v6mr10457797plh.314.1521487346291; 
	Mon, 19 Mar 2018 12:22:26 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:4088:e426:a566:fc98?
	([2601:202:4000:1184:4088:e426:a566:fc98])
	by smtp.gmail.com with ESMTPSA id
	j23sm1085779pfi.78.2018.03.19.12.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 12:22:25 -0700 (PDT)
To: "Jordan, Robin L" <robin.l.jordan@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <dd055b01-fe83-d706-bce1-5a2aea3103fe@gmail.com>
Date: Mon, 19 Mar 2018 12:22:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXMTLigJkxOA==?=
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
X-List-Received-Date: Mon, 19 Mar 2018 19:22:25 -0000
Content-Type: multipart/alternative;
	boundary="------------548A70ACEB132035F048EC81"
Content-Language: en-US

--------------548A70ACEB132035F048EC81
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 03/19/2018 08:45 AM, Jordan, Robin L wrote:
>
> Current Dev Position: YP 2.5 M3 final close out.
>
> Next Deadline: YP 2.5 M3 cut off was 2/19/18
>
> *** FEATURE FREEZE for 2.5 has passed ***
>
>  
>
> SWAT lead is currently Ross.
>
> SWAT team rotation: Armin -> Ross on March 23, 2018
>
> SWAT team rotation: Ross -> Juro on March 30, 2018
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
>  
>
> Key Status/Updates:
>
>   * YP 2.4.2 was released:
>     https://lists.yoctoproject.org/pipermail/yocto/2018-March/040282.html
>   * Meta-intel 8.1 was released:
>     https://lists.yoctoproject.org/pipermail/meta-intel/2018-March/005261.html
>
>   * We’ve realised we were going to run into problems with distros
>     adopting glibc 2.27, if not now, during the next release cycle. We
>     therefore decided to head off this problem and try and fix the
>     issues now. Unfortunately, due to locale changes in 2.27, it also
>     breaks our eSDK in the current and all previous releases. We have
>     fixes in master for this (thanks Ross!) and backports ready for
>     rocko and pyro in the -next branches. Morty is proving harder to
>     fix. We believe it is likely better to fix these issue even if the
>     changes are invasive (they are at least mostly contained to the SDKs).
>
>   * The gcc 6.x changes were merged into rocko/pyro/morty which means
>     point releases are now unblocked by that issue.
>   * The performance issue reported last week was tracked down to a
>     kernel change which was reverted.
>   * The new buildbot autobuilder instance is working with basic
>     functionality. We therefore plan to run the M3 release build on
>     that infrastructure with a view to using it for the main 2.5
>     release. It was great to be able to report an issue upstream and
>     be using their latest code! The autobuilder functionality is
>     improved in at least two significant ways already which benefit
>     the maintainers.
>   * We really do need to roll M3 now, our current plan is to test the
>     final changes in mut and then run M3 with this. It is not a
>     perfect set of features, many things simply haven’t made it in as
>     the people doing review are overloaded. We’re too far past the
>     freeze deadline to realistically make any further progress with
>     this though.
>   * ELC was productive and there was a lot of good discussion between
>     the people there about many different things. In particular we
>     have some ideas for improving the project’s build infrastructure
>     to allow more builds including other layers. More info will follow
>     as we build the plans to make that happen.
>
>  
>
> Planned upcoming dot releases:
>
> YP 2.3.4 (Pyro) will be built after 2.5 M3
>
> YP 2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27 issue
> is fixed
>
> YP 2.4.3 (Rocko) is planned for post YP 2.5.
>
>  
>
> Key YP 2.5 Dates are:
>
> YP 2.5 M3 is in feature freeze.  See status above.
>
Does this include package updates?

Do we have a place identified for new changes (2.6) while 2.5 stabilizes.

- armin


> YP 2.5 M3 was scheduled for release 3/2/18
>
> YP 2.5 M4 cut off of 4/2/18
>
> YP 2.5 M4 release of 4/27/18
>
>  
>
> Tracking Metrics:
>
>             WDD 2673 (last week 2673)
>
> (https://wiki.yoctoproject.org/charts/combo.html)
>
>  
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features
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
>  
>
> Robin Jordan
>
> Yocto Project Program Manager
>
>  
>
>
>


--------------548A70ACEB132035F048EC81
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/19/2018 08:45 AM, Jordan, Robin L
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com">
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
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
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
	{mso-list-id:17434137;
	mso-list-template-ids:402580926;}
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
	{mso-list-id:768934452;
	mso-list-template-ids:1928618722;}
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
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Current
            Dev Position: YP 2.5 M3 final close out.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.5 M3 cut off was 2/19/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">***
            FEATURE FREEZE for 2.5 has passed ***</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            lead is currently Ross.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Armin -&gt; Ross on March 23, 2018</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Ross -&gt; Juro on March 30, 2018</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.4.2 was released: <a
href="https://lists.yoctoproject.org/pipermail/yocto/2018-March/040282.html"
                moz-do-not-send="true">
                <span style="color:#1155CC">https://lists.yoctoproject.org/pipermail/yocto/2018-March/040282.html</span></a>
              <o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Meta-intel
              8.1 was released: <a
href="https://lists.yoctoproject.org/pipermail/meta-intel/2018-March/005261.html"
                moz-do-not-send="true">
                <span style="color:#1155CC">https://lists.yoctoproject.org/pipermail/meta-intel/2018-March/005261.html</span></a>
              <o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We’ve
              realised we were going to run into problems with distros
              adopting glibc 2.27, if not now, during the next release
              cycle. We therefore decided to head off this problem and
              try and fix the issues now. Unfortunately, due to locale
              changes in 2.27, it also breaks our eSDK in the current
              and all previous releases. We have fixes in master for
              this (thanks Ross!) and backports ready for rocko and pyro
              in the -next branches. Morty is proving harder to fix. We
              believe it is likely better to fix these issue even if the
              changes are invasive (they are at least mostly contained
              to the SDKs).<o:p></o:p></span></li>
        </ul>
        <ul style="margin-top:0in" type="disc">
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1
            level1 lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">The
              gcc 6.x changes were merged into rocko/pyro/morty which
              means point releases are now unblocked by that issue.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1
            level1 lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">The
              performance issue reported last week was tracked down to a
              kernel change which was reverted.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1
            level1 lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">The
              new buildbot autobuilder instance is working with basic
              functionality. We therefore plan to run the M3 release
              build on that infrastructure with a view to using it for
              the main 2.5 release. It was great to be able to report an
              issue upstream and be using their latest code! The
              autobuilder functionality is improved in at least two
              significant ways already which benefit the maintainers.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1
            level1 lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We
              really do need to roll M3 now, our current plan is to test
              the final changes in mut and then run M3 with this. It is
              not a perfect set of features, many things simply haven’t
              made it in as the people doing review are overloaded.
              We’re too far past the freeze deadline to realistically
              make any further progress with this though.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l1
            level1 lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">ELC
              was productive and there was a lot of good discussion
              between the people there about many different things. In
              particular we have some ideas for improving the project’s
              build infrastructure to allow more builds including other
              layers. More info will follow as we build the plans to
              make that happen.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3.4 (Pyro) will be built after 2.5 M3</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27
            issue is fixed</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.3 (Rocko) is planned for post YP 2.5.</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.5 Dates are:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 is in feature freeze.  See status above.</span></p>
      </div>
    </blockquote>
    Does this include package updates? <br>
    <br>
    Do we have a place identified for new changes (2.6) while 2.5
    stabilizes. <br>
    <br>
    - armin<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB17663B664B1ED6ADE96BC48AC7D40@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 was scheduled for release 3/2/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 cut off of 4/2/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 release of 4/27/18</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            class="apple-tab-span"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:black">           
            </span></span><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">WDD
            2673 (last week 2673)</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span
            style="font-family:Consolas;color:black">(</span><a
            href="https://wiki.yoctoproject.org/charts/combo.html"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><span
            style="font-family:Consolas;color:black">)</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status Links for YP:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Status reports are now stored on the wiki at:
          </span><a
            href="https://wiki.yoctoproject.org/wiki/Weekly_Status"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]<o:p></o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Robin
            Jordan<o:p></o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Yocto
            Project Program Manager</span><o:p></o:p></p>
        <p class="MsoNormal"><span style="font-size:14.0pt"><o:p> </o:p></span></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------548A70ACEB132035F048EC81--
