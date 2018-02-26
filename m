Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 415CF786D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 17:09:31 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id i6so9622092plt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 09:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=bmVOPZkvkZo+gQcmZAGrpVi+UwFdjQc6TYLV8X/Wa2A=;
	b=IGbz3fL0MkjqFMk/EHPy41DLi06OyaM+F1hE4tWhlfAp40Gg5yh4vrKRFbsPL8pC4D
	YMAhGiFPC/AyYzaJPF7dQxlqZ156qDQZfUueM8biDwlN66UznN06sV6gjeuz5EFdM9vW
	eZdYzsqV0n1nUsbdJMmQFWXN9ZiVuEd58I2ox1WUEjwdEgFnfwuKTUdLhtv4sqL8wJZL
	KYVuXZNTOY0ZtXJLCScP1fUHR0eV3d8+7zA2kLV+oauIk7VhZS7kP6wU4SYvh/DIlMiE
	1QBgMR7uaQbTn2+xvaLTJzonITN99WNzlZzFrjM2CpQ5Jm2OxuTf15t2kxGrWne9kCDw
	rhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=bmVOPZkvkZo+gQcmZAGrpVi+UwFdjQc6TYLV8X/Wa2A=;
	b=mWqrz8O8oUIml/cvAK0d8fAbU6KGmw0JcbigZ0ix+vgJYSF3P5TF0oG1UtH8jPMIEF
	cPkQHws3/449f5uQ7XXEyV+agyjibReK5rH9HuKX0C+asDN3jLLuu3yffErbqP2tAS7C
	NTkNp5DTBp7Tnpb0Pn2JobpyQZAcIvcJehSzx0EFGf1mB2czGsz/pxEJ7YyjIgCITYMO
	EQKA36x8vSVaTFjrDUfKOrCaWbTAckfVQyG1Rt/HTDAFEvbNMJHGwdIIJk9oTyjczLJ1
	3pqgtSxLzCSUZaDXbrw7S4Hfw4RIzctGYEZkZblvTOw+pe9ZUiCvaXJ6Wn6ZuYtdMKoI
	nNKg==
X-Gm-Message-State: APf1xPCmycJu6Q4CHwCN5uycNklvuo44Adkhuv0j+Sw83BzjvKa3HvSu
	lEkllyh6Y68ahvqnpBAdLCtkGg==
X-Google-Smtp-Source: AH8x227aj72mWUjtipoSAIa7LAhzdZrdvZRiLABZ4XYzdzD1CfbzsY7OS256EA6UzLpt/AqXEFDN3Q==
X-Received: by 2002:a17:902:8215:: with SMTP id
	x21-v6mr11455659pln.164.1519664972711; 
	Mon, 26 Feb 2018 09:09:32 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c195:e6de:d325:c161?
	([2601:202:4000:1184:c195:e6de:d325:c161])
	by smtp.gmail.com with ESMTPSA id
	k23sm8970647pfi.79.2018.02.26.09.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Feb 2018 09:09:32 -0800 (PST)
To: "Jordan, Robin L" <robin.l.jordan@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6d1dffd4-c39e-72d5-b628-b2050bfed0f7@gmail.com>
Date: Mon, 26 Feb 2018 09:09:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cwOeKAmTE4?=
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
X-List-Received-Date: Mon, 26 Feb 2018 17:09:32 -0000
Content-Type: multipart/alternative;
	boundary="------------C395CA76801F07B9ABE2985E"
Content-Language: en-US

--------------C395CA76801F07B9ABE2985E
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/26/2018 08:13 AM, Jordan, Robin L wrote:
>
> Current Dev Position: YP 2.5 M3 development
>
> Next Deadline: YP 2.5 M3 cut off was 2/19/18
>
> *** FEATURE FREEZE for 2.5 has passed ***
>
> =A0
>
> SWAT team rotation: Stephano -> Maxin John on Feb. 23, 2018
>
> SWAT team rotation: Maxin -> Rebecca on March 2, 2018
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> =A0
>
> Key Status/Updates:
>
>   * YP 2.5 M2 is through QA and likely to be released early this week.
>   * YP 2.2.3 is through QA and likely to be released early this week.
>   * YP 2.4.2 rc2 was successfully built and is undergoing QA.
>   * YP 2.5 M3 is feature freeze. After discussions with various people
>     we concluded that we need:
>       o the 2.27 glibc upgrade
>       o kernel-devsrc size changes
>       o to resolve some of the outstanding pseudo bugs
>       o to resolve the multilib SDK patch series
>       o the package feed filtering patch series (the multilib SDK
>         series depends on it)
>       o image EFI configuration rework
>   * We plan to defer:
>       o pkg-conf vs. pkgconfig issues/discussion
>       o profile guided optimisation for python (patch series)
>       o oe-selftest parallelization
>   * We=92re continuing to work on the autobuilder changes and for
>     various reasons (inc. changes in people). =A0We would be in much
>     better shape to switch to the new codebase before release, rather
>     than waiting until early 2.6 to pick this work up again by which
>     time we=92d have lost people and context. If we are to switch, we
>     need to build M3 with the new infrastructure. We=92ll have to make =
a
>     decision on whether we do this during this week.
>

I recommend updating to new code base on the old cluster for debug. We
can fallback to the .io and/or use them in parallel.

Will the new code base work on stable branches?

>  *
>
> =A0
>
> Planned upcoming dot releases:
>
> YP 2.4.2 (Rocko) is currently in QA 82% complete. =A0=A0See:
> https://wiki.yoctoproject.org/wiki/2.4_QA_Status
>
stable/rocko-next: clean build last night

> YP 2.3.4 (Pyro) will be built when we figure out gcc backports.
>
stable/pyro-next: Mostly clean. GCC update pulled out for V2. V2 not
merged back.


> YP 2.2.3 (Morty) rc2 has passed QA and is being prepared for release
>
> YP 2.2.4 (Morty) will be built when we figure out gcc backports.
>
stable/morty-next: Getting cleaner. recommend updating to version in pyro=
=2E

- armin
>
> =A0
>
> Key YP 2.5 Dates are:
>
> YP 2.5 M2 has passed QA and is being prepared for release.
>
> YP 2.5 M3 is in feature freeze. =A0See status above.
>
> YP 2.5 M3 release of 3/2/18
>
> YP 2.5 M4 cut off of 4/2/18
>
> YP 2.5 M4 release of 4/27/18
>
> =A0
>
> Tracking Metrics:
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WDD 2646 (last week =A0=A02648)
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
> Robin Jordan
>
> Yocto Project Program Manager
>
>
>


--------------C395CA76801F07B9ABE2985E
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
    <div class="moz-cite-prefix">On 02/26/2018 08:13 AM, Jordan, Robin L
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com">
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
	{mso-list-id:345790794;
	mso-list-template-ids:-1907583470;}
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
            Dev Position: YP 2.5 M3 development</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.5 M3 cut off was 2/19/18</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">***
            FEATURE FREEZE for 2.5 has passed ***</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Stephano -&gt; Maxin John on Feb. 23, 2018</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Maxin -&gt; Rebecca on March 2, 2018</span><o:p></o:p></p>
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
              2.5 M2 is through QA and likely to be released early this
              week.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.2.3 is through QA and likely to be released early this
              week.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.4.2 rc2 was successfully built and is undergoing QA.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">YP
              2.5 M3 is feature freeze. After discussions with various
              people we concluded that we need:<o:p></o:p></span>
            <ul style="margin-top:0in" type="circle">
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">the
                  2.27 glibc upgrade<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">kernel-devsrc
                  size changes<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">to
                  resolve some of the outstanding pseudo bugs<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">to
                  resolve the multilib SDK patch series<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">the
                  package feed filtering patch series (the multilib SDK
                  series depends on it)<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">image
                  EFI configuration rework<o:p></o:p></span></li>
            </ul>
          </li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We
              plan to defer:<o:p></o:p></span>
            <ul style="margin-top:0in" type="circle">
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">pkg-conf
                  vs. pkgconfig issues/discussion<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">profile
                  guided optimisation for python (patch series)<o:p></o:p></span></li>
              <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
                level2 lfo1;vertical-align:baseline">
                <span style="font-family:&quot;Arial&quot;,sans-serif">oe-selftest
                  parallelization<o:p></o:p></span></li>
            </ul>
          </li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We’re
              continuing to work on the autobuilder changes and for
              various reasons (inc. changes in people).  We would be in
              much better shape to switch to the new codebase before
              release, rather than waiting until early 2.6 to pick this
              work up again by which time we’d have lost people and
              context. If we are to switch, we need to build M3 with the
              new infrastructure. We’ll have to make a decision on
              whether we do this during this week.</span></li>
        </ul>
      </div>
    </blockquote>
    <br>
    I recommend updating to new code base on the old cluster for debug.
    We can fallback to the .io and/or use them in parallel. <br>
    <br>
    Will the new code base work on stable branches?<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.2 (Rocko) is currently in QA 82% complete.   See:
          </span><a
            href="https://wiki.yoctoproject.org/wiki/2.4_QA_Status"
            moz-do-not-send="true"><span
              style="font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/2.4_QA_Status</span></a></p>
      </div>
    </blockquote>
    stable/rocko-next: clean build last night<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3.4 (Pyro) will be built when we figure out gcc backports.</span></p>
      </div>
    </blockquote>
    stable/pyro-next: Mostly clean. GCC update pulled out for V2. V2 not
    merged back.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.3 (Morty) rc2 has passed QA and is being prepared for
            release</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.4 (Morty) will be built when we figure out gcc
            backports.</span></p>
      </div>
    </blockquote>
    stable/morty-next: Getting cleaner. recommend updating to version in
    pyro.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766EFA2B012B4750100AD09C7C10@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.5 Dates are:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M2 has passed QA and is being prepared for release.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 is in feature freeze.  See status above.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 release of 3/2/18</span><o:p></o:p></p>
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
            2646 (last week   2648)</span><o:p></o:p></p>
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
            see on this weekly status update, let us know!]</span><o:p></o:p></p>
        <p class="MsoNormal"><span style="font-size:14.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:14.0pt">Robin Jordan<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:14.0pt">Yocto
            Project Program Manager<o:p></o:p></span></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------C395CA76801F07B9ABE2985E--
