Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3B978A53
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 16:30:58 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id a16so7404483pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 08:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=gnDeB2xpwkfPf0CCr/hAfGhGRAuasIXigSW3eGthYWc=;
	b=rSMHGVrsZQR8TbMJeJ6qD4PJm0QkOPb/ng+HbgG9xN7z7fHKvIES1fVORdWfssaAGc
	nnRslbthI0NoHcoEvLQfvMbFxgpM60C/21NgFbleipu+SL5Ui54b2k98OgEcfcpvYiou
	ECIXAmOCZdXiudlq/4Tc/QYN5RHAnFPjM86a6f8ECKWTmyYUG6ZtqVjWsgk/R5hAUKX3
	/CSSF9WFshjwMOFGmDWufQYptDqeo5Z0fImYNsTVHMFRhMkkoUvXl0EbBl5VebxdhsGG
	eX17Rmm9d7vljmaK89Q3Z+peQbfwyKiiZSyH/L+c7gj1HmM3hUuAyTshjgxh8Jb+EYJm
	mPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=gnDeB2xpwkfPf0CCr/hAfGhGRAuasIXigSW3eGthYWc=;
	b=onpbPWjZiG8BXfxRBuaKNFPO5aS2ThvxRZdrhUcLV4o/dRte2COq2Ud67MR5xUTZ9l
	pT0TmnJbyo3I0QplWLVXp86i57vRqaN3r5uMpYpTxUrnKRNvW8EtG3uPiaIS6pfnBVEM
	6+kJ9/PXzowfRuVvuOHGtEqLB590TVeBAokH8NEMJhEcUNOZx/tXS44W2INdXhMwXzLE
	g9OgZzh3V1IJ6xAsGKi3419K8NLOQWJQSGui+1WkiDO+yHVhSsyUTyCoCyYtBastzoRG
	EhJE5dwe9pTUVoFpjtTca9sQnxywBXBI8rumMgNr2Fl10HnNix7P+cUOQQAs5ngNMWDH
	z9uA==
X-Gm-Message-State: APf1xPDqoTLtxAzBR9lnG77KAzXjZLF7yyOta9XeJHtv2ZKV0+kyJ/WC
	z/6zx5zsvJcm19b14c4koyrMkQ==
X-Google-Smtp-Source: AG47ELvoFIWCfAoabU++6xHt0OZvFiL+IToaLd8YkxyBwioxoPXVD5sfEUyz3NOUa62IT/DQ3kLN1w==
X-Received: by 10.98.162.26 with SMTP id m26mr15896932pff.217.1520267460190;
	Mon, 05 Mar 2018 08:31:00 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:95c8:2b55:de97:f11f?
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	b68sm20532171pfg.59.2018.03.05.08.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 08:30:59 -0800 (PST)
To: "Jordan, Robin L" <robin.l.jordan@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8dcbb503-f0d0-c616-e794-80742dccd78a@gmail.com>
Date: Mon, 5 Mar 2018 08:30:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gU3ViamVjdDogWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxMOKAmTE4?=
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
X-List-Received-Date: Mon, 05 Mar 2018 16:30:59 -0000
Content-Type: multipart/alternative;
	boundary="------------9ED340DD6B650EEF98F70D01"
Content-Language: en-US

--------------9ED340DD6B650EEF98F70D01
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 03/05/2018 08:03 AM, Jordan, Robin L wrote:
>
> Subject: Yocto Project Status WW10=9218
>
> =A0
>
> Current Dev Position: YP 2.5 M3 final close out.
>
> Next Deadline: YP 2.5 M3 cut off was 2/19/18
>
> *** FEATURE FREEZE for 2.5 has passed ***
>
> =A0
>
> SWAT team rotation: Rebecca -> Cal on March 9, 2018
>
> SWAT team rotation: Cal -> Armin on March 16, 2018
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> =A0
>
> Key Status/Updates:
>
>   * YP 2.5 M2 was released February 27.
>       o This milestone release includes CVE fixes and 60 recipe
>         upgrades*. *=A0It incorporates security fixes**with upgrades to=

>         gcc and kernels to all current stable versions. =A0Headline
>         changes include reproducibility improvements, gettext build
>         performance, image generation, and cmake using Ninja by
>         default. =A0This release added gobject-introspection tests to
>         testimage, integrated support for the Meson build system,
>         Python build/packaging refactoring, and redesigned postinstall
>         script handling.
>   * YP 2.2.3 was released February 27.
>       o A total of**97 CVE fixes** and other fixes to work with GCC 7
>         on newer host OSs.
>       o We have committed to a 2.2.4 release to integrate all
>         remaining security fixes.
>   * YP 2.4.2 RC2 came out of QA today (report at
>     https://wiki.yoctoproject.org/wiki/WW10_-_2018-03-05-_Full_Test_Cyc=
le_-_2.4.2_rc2)
>
>   * YP 2.5 M3 is in final feature freeze. Reviewing last week=92s
>     required features:
>       o 2.27 glibc upgrade has been merged. This meant making SDK
>         changes so they=92re all ~50M larger now thanks to the need to
>         ship locales. However the same underlying code could be reused
>         to generate locale archives in images, which will make those
>         smaller.
>       o kernel-devsrc size reduction: the blocking issue has been
>         resolved so waiting for an updated patch.
>       o pseudo upgrade has been merged which should solve many issues,
>         and Peter is investigating the long-standing host
>         contamination issue.
>       o Still need to resolve the multilib SDK patch series.
>       o Package feed filtering has been merged.
>       o Image EFI configuration rework under review now.
>   * Performance metrics indicate that a recent merge has caused a
>     slowdown in build times.
>
Is this data publicly available?

>   * =A0It is suspected that the glibc upgrade is the cause of this
>     although help would be appreciated to verify this.
>   * Flood of last-minute upgrades continuing to be reviewed and merged
>     if low-impact.
>

Is there a cut off on package upgrades?

>  *
>   * Go upgrade/improvements are under review, possibly we=92ll ship bot=
h
>     Go 1.9.4 and 1.10 in 2.5 but do plan to drop 1.9.4 from master as
>     soon as 1.10 doesn=92t present compatibility problems.
>   * We=92re continuing to work on the autobuilder changes and for
>     various reasons (inc. changes in people). =A0We would be in much
>     better shape to switch to the new codebase before release, rather
>     than waiting until early 2.6 to pick this work up again by which
>     time we=92d have lost people and context. If we are to switch, we
>     need to build M3 with the new infrastructure. We plan to make this
>     switch for M3.
>
> =A0
>
> Planned upcoming dot releases:
>
> YP 2.3.4 (Pyro) will be built when we figure out gcc backports.
>

yocto-linux 4.10 still needs updating.

> YP 2.2.4 (Morty) will be built when we figure out gcc backports.
>
kernel 4.8 has a pull request
kernel 4.1 pull request sent that includes=A0 spectre changes and some
general fixes.

- armin

> YP 2.4.3 (Roko) is planned for post YP 2.5.
>
> =A0
>
> Key YP 2.5 Dates are:
>
> YP 2.5 M3 is in feature freeze. =A0See status above.
>
> YP 2.5 M3 was scheduled for release 3/2/18
>
> YP 2.5 M4 cut off of 4/2/18
>
> YP 2.5 M4 release of 4/27/18
>
> =A0
>
> Tracking Metrics:
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WDD 2663 (last week 2646)
>
> (https://wiki.yoctoproject.org/charts/combo.html)
>
> =A0
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features
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
>
>


--------------9ED340DD6B650EEF98F70D01
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
    <div class="moz-cite-prefix">On 03/05/2018 08:03 AM, Jordan, Robin L
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com">
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
	{mso-list-id:510873238;
	mso-list-template-ids:569155230;}
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
	{mso-list-id:1167525389;
	mso-list-template-ids:-1673385002;}
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
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Subject:
            Yocto Project Status WW10’18</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Current
            Dev Position: YP 2.5 M3 final close out.</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.5 M3 cut off was 2/19/18</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">***
            FEATURE FREEZE for 2.5 has passed ***</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Rebecca -&gt; Cal on March 9, 2018</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Cal -&gt; Armin on March 16, 2018</span><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.5 M2 was released February 27.<o:p></o:p></span>
            <ul style="margin-top:0in" type="circle">
              <li class="MsoNormal" style="color:black;mso-list:l1
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">This
                  milestone release includes CVE fixes and 60 recipe
                  upgrades<b>.
                  </b> It incorporates security fixes<b> </b>with
                  upgrades to gcc and kernels to all current stable
                  versions.  Headline changes include reproducibility
                  improvements, gettext build performance, image
                  generation, and cmake using Ninja by default.  This
                  release added gobject-introspection tests to
                  testimage, integrated support for the Meson build
                  system, Python build/packaging refactoring, and
                  redesigned postinstall script handling.<o:p></o:p></span></li>
            </ul>
          </li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.2.3 was released February 27.<o:p></o:p></span>
            <ul style="margin-top:0in" type="circle">
              <li class="MsoNormal" style="color:black;mso-list:l1
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">A
                  total of<b> </b>97 CVE fixes<b> </b>
                  and other fixes to work with GCC 7 on newer host OSs.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l1
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">We
                  have committed to a 2.2.4 release to integrate all
                  remaining security fixes.<o:p></o:p></span></li>
            </ul>
          </li>
          <li class="MsoNormal" style="color:black;mso-list:l1 level1
            lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.4.2 RC2 came out of QA today (report at
<a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/WW10_-_2018-03-05-_Full_Test_Cycle_-_2.4.2_rc2">https://wiki.yoctoproject.org/wiki/WW10_-_2018-03-05-_Full_Test_Cycle_-_2.4.2_rc2</a>)<o:p></o:p></span></li>
        </ul>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.5 M3 is in final feature freeze. Reviewing last week’s
              required features:<o:p></o:p></span>
            <ul style="margin-top:0in" type="circle">
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">2.27
                  glibc upgrade has been merged. This meant making SDK
                  changes so they’re all ~50M larger now thanks to the
                  need to ship locales. However the same underlying code
                  could be reused to generate locale archives in images,
                  which will make those smaller.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">kernel-devsrc
                  size reduction: the blocking issue has been resolved
                  so waiting for an updated patch.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">pseudo
                  upgrade has been merged which should solve many
                  issues, and Peter is investigating the long-standing
                  host contamination issue.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">Still
                  need to resolve the multilib SDK patch series.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">Package
                  feed filtering has been merged.<o:p></o:p></span></li>
              <li class="MsoNormal" style="color:black;mso-list:l0
                level2 lfo2;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">Image
                  EFI configuration rework under review now.<o:p></o:p></span></li>
            </ul>
          </li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Performance
              metrics indicate that a recent merge has caused a slowdown
              in build times. </span></li>
        </ul>
      </div>
    </blockquote>
    Is this data publicly available?<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"> It is
              suspected that the glibc upgrade is the cause of this
              although help would be appreciated to verify this.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Flood
              of last-minute upgrades continuing to be reviewed and
              merged if low-impact.</span></li>
        </ul>
      </div>
    </blockquote>
    <br>
    Is there a cut off on package upgrades?<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Go
              upgrade/improvements are under review, possibly we’ll ship
              both Go 1.9.4 and 1.10 in 2.5 but do plan to drop 1.9.4
              from master as soon as 1.10 doesn’t present compatibility
              problems.<o:p></o:p></span></li>
          <li class="MsoNormal" style="color:black;mso-list:l0 level1
            lfo2;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We’re
              continuing to work on the autobuilder changes and for
              various reasons (inc. changes in people).  We would be in
              much better shape to switch to the new codebase before
              release, rather than waiting until early 2.6 to pick this
              work up again by which time we’d have lost people and
              context. If we are to switch, we need to build M3 with the
              new infrastructure. We plan to make this switch for M3.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3.4 (Pyro) will be built when we figure out gcc backports.</span></p>
      </div>
    </blockquote>
    <br>
    yocto-linux 4.10 still needs updating.<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.4 (Morty) will be built when we figure out gcc
            backports.</span></p>
      </div>
    </blockquote>
    kernel 4.8 has a pull request<br>
    kernel 4.1 pull request sent that includes  spectre changes and some
    general fixes.<br>
    <br>
    - armin<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766A9FB3A584F0EE50568F3C7DA0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.3 (Roko) is planned for post YP 2.5.</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.5 Dates are:</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 is in feature freeze.  See status above.</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 was scheduled for release 3/2/18</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 cut off of 4/2/18</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M4 release of 4/27/18</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">           
            WDD 2663 (last week 2646)</span><o:p></o:p></p>
        <p class="MsoNormal" style="text-indent:.5in"><span
            style="font-family:Consolas;color:black">(</span><a
            href="https://wiki.yoctoproject.org/charts/combo.html"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a><span
            style="font-family:Consolas;color:black">)</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status Links for YP:</span><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status</span></a><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></a><o:p></o:p></p>
        <p class="MsoNormal"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features"
            moz-do-not-send="true"><span
              style="font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Status reports are now stored on the wiki at:
          </span><a
            href="https://wiki.yoctoproject.org/wiki/Weekly_Status"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]</span><o:p></o:p></p>
        <p class="MsoNormal"><span style="font-size:14.0pt"><o:p> </o:p></span></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------9ED340DD6B650EEF98F70D01--
