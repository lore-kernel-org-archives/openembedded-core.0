Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8B772EC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 17:27:57 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id h4so10056971qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=IlZf0WG1psayHXpAlrhddYjBAr4UExUFFQsrXJRW5Ek=;
	b=q+dhzg0JbwoiDZVyJTBCwbWNPq4jOVOibMfbMnwSdEW7SQB2ldFtI692PWETBWKWNi
	jti0zdkFDLoAERz5VnKya+H9iB5PERkc8I9/uHslubKKTxZ69kV2Fq4OhZUNFgYQZEyT
	8JZ5CzOEmTfdlZ/pQ65vXr0JtRRBY3yrMfRO8lW6L2dOv8eJ+1cxWxeUfs2A86DJBu0/
	hUP2sn9qkUToHc9q3S2eFlllGmvd7vuKLR83igszhJfsop1NBB4oAiNz6z4i/D/pixgK
	FxCANVdgc0nbKIharT8vmUssL4O8PEzvfo6kFF5j7PqBvMg3r1/qBpGTIzT0MoRIKOqb
	w2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=IlZf0WG1psayHXpAlrhddYjBAr4UExUFFQsrXJRW5Ek=;
	b=uLbzHYMk3YojX5VNAFQYbN8l7+snJLDZ+RnX97Gvhk8IQBi1l3lkbjowd2GHT2Wiip
	5S3Hz2NZECajy02d67Rc6y05AoU2ndAgsymoDYUym1zWJKn31FjuNe1H9gumvFvxtLLi
	HSxlvazLnm720za2cHNbgmZe1UXsisCkr2cWC8v5BPKhVyIDZPIdMATsudqt91EpMwOt
	qEq50RfSBV6gsIO4ct+KSjrFbwxhG2FCWhlk2uT1Fh+yGiZsPRqLPoN0LZVJlaswT3AE
	hRck4o+itIjKWHB1DovhEiIqN1SM7lC30qpSFEx3QcPd3sVM8dfhGch+BM0+dqIM/1i7
	Hdgg==
X-Gm-Message-State: ALQs6tD7oSZYGWh0kt2pqIY95BFfpHgbiJ7bOZmH0PT3QBnk3SyY1iEd
	sS7d5uA9ydl5DjC4UsyByOtewg==
X-Google-Smtp-Source: AIpwx4+6WzEJg2ESoDomrOlELlA9FR2hFIVUt97jl9j1qO/kEf9oDymhGbOsyzCaNvAyJl64LadrKg==
X-Received: by 10.200.51.155 with SMTP id c27mr53255196qtb.90.1523294878162;
	Mon, 09 Apr 2018 10:27:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id u11sm601324qkk.87.2018.04.09.10.27.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 10:27:57 -0700 (PDT)
To: "Jordan, Robin L" <robin.l.jordan@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <39acb374-d013-2313-3222-20dbc9fe576f@gmail.com>
Date: Mon, 9 Apr 2018 10:27:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com>
Subject: =?UTF-8?B?UmU6IFt5b2N0b10gWW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxNeKAmTE4?=
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
X-List-Received-Date: Mon, 09 Apr 2018 17:27:58 -0000
Content-Type: multipart/alternative;
	boundary="------------BBEDBBFAF7038535C2F05DC9"
Content-Language: en-US

--------------BBEDBBFAF7038535C2F05DC9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 04/09/2018 08:13 AM, Jordan, Robin L wrote:
>
> Current Dev Position: YP 2.5 M4 final close out.
>
> Next Deadline: YP 2.5 M4 release is 4/27/18
>
> =A0
>
> SWAT Team Rotation:
>
> SWAT lead is currently: Paul.
>
> SWAT team rotation: Paul -> Tracy on April 13, 2018
>
> SWAT team rotation: Tracy -> Stephano on April 20, 2018
>
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
> =A0
>
> Key Status/Updates:
>
>   * The M3 rc1 QA report has been completed:
>     https://wiki.yoctoproject.org/wiki/WW15_-_2018-04-09-_Full_Test_Cyc=
le_-_2.5_M3_rc1
>     =A0=A0There are a number of selftest failures and a known SRCREV
>     related issue with the build-appliance. We will look into these,
>     but at this point we don=92t foresee these blocking M3 and will aim=

>     to start testing release candidates for the final 2.5 release this
>     week. =A0
>   * A problem was spotted with fedora28 which has worryingly decided
>     to merge extra patches ahead of glibc and =93break=94 ABI over the
>     split of libcrypt out of glibc into libxcrypt. Since we will have
>     to handle this, we have decided to change nativesdk-glibc for the
>     2.5 release but keep on target as is until the situation with
>     upstream glibc becomes clearer.
>   * We realised late in the cycle that we needed to change the
>     LAYERSERIES_COMPAT variable in the core layers. We have also added
>     warnings to make this variable more obvious and required it for
>     Yocto Project Compatible v2 status. It seemed best to make these
>     changes for 2.5 rather than wait until 2.6.
>   * We are considering a final late change to 2.5 to allow poky to use
>     the Yocto Project sstate mirrors by default. Feedback welcome on
>     whether we should do this. It is late in the cycle but would make
>     a good speedup for users potentially.
>
I would not make it the default, but have the url info defined in the
sample.local.conf
Can the Yocto infrastructure handle the world pinging it for sstate?

>  *
>   * Armin fixed the SDK locale issues with morty, thanks! We are aware
>     of a related locale =A0build regression on morty sadly.
>
I assume a bug was opened?
>
>  *
>
>
>   * We were able to upgrade pseudo and have hopefully resolved our
>     fedora27/coreutils issues. Thanks to all who helped!
>   * Master-next has a number of recipe upgrades queued. We still want
>     to discourage people from sending recipe upgrades until we start
>     2.6; however, there were simply too many patches to ignore. This
>     has meant various people and build resources have ended up
>     distracted from 2.5 work.
>
> =A0
>
> Planned upcoming dot releases:
>
> YP 2.3.4 (Pyro) will be built after 2.5 M3
>
Wont it be post Rocko point release?
>
> YP 2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27 issue
> is fixed
>
Wouldn't Morty be post Pyro point release? This will the the point releas=
e?

> YP 2.4.3 (Rocko) is planned for post YP 2.5.
>
> =A0
>
> Key YP 2.5 Dates are:
>
> YP 2.5 M3 is in QA. =A0See status above.
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
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WDD 2570 (last week 2594)
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


--------------BBEDBBFAF7038535C2F05DC9
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
    <div class="moz-cite-prefix">On 04/09/2018 08:13 AM, Jordan, Robin L
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com">
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
	{mso-list-id:2132243880;
	mso-list-template-ids:-485213662;}
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
            Dev Position: YP 2.5 M4 final close out.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.5 M4 release is 4/27/18</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            Team Rotation:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            lead is currently: Paul.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Paul -&gt; Tracy on April 13, 2018</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Tracy -&gt; Stephano on April 20, 2018</span><o:p></o:p></p>
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
            <span style="font-family:&quot;Arial&quot;,sans-serif">The
              M3 rc1 QA report has been completed:
              <a
href="https://wiki.yoctoproject.org/wiki/WW15_-_2018-04-09-_Full_Test_Cycle_-_2.5_M3_rc1"
                moz-do-not-send="true">
                <span style="color:#1155CC">https://wiki.yoctoproject.org/wiki/WW15_-_2018-04-09-_Full_Test_Cycle_-_2.5_M3_rc1</span></a>
                There are a number of selftest failures and a known
              SRCREV related issue with the build-appliance. We will
              look into these, but at this point we don’t foresee these
              blocking M3 and will aim to start testing release
              candidates for the final 2.5 release this week.  <o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">A
              problem was spotted with fedora28 which has worryingly
              decided to merge extra patches ahead of glibc and “break”
              ABI over the split of libcrypt out of glibc into
              libxcrypt. Since we will have to handle this, we have
              decided to change nativesdk-glibc for the 2.5 release but
              keep on target as is until the situation with upstream
              glibc becomes clearer.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We
              realised late in the cycle that we needed to change the
              LAYERSERIES_COMPAT variable in the core layers. We have
              also added warnings to make this variable more obvious and
              required it for Yocto Project Compatible v2 status. It
              seemed best to make these changes for 2.5 rather than wait
              until 2.6.<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We
              are considering a final late change to 2.5 to allow poky
              to use the Yocto Project sstate mirrors by default.
              Feedback welcome on whether we should do this. It is late
              in the cycle but would make a good speedup for users
              potentially.</span></li>
        </ul>
      </div>
    </blockquote>
    I would not make it the default, but have the url info defined in
    the sample.local.conf<br>
    Can the Yocto infrastructure handle the world pinging it for sstate?<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Armin
              fixed the SDK locale issues with morty, thanks! We are
              aware of a related locale  build regression on morty
              sadly.</span></li>
        </ul>
      </div>
    </blockquote>
    I assume a bug was opened?<br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline"><span
              style="font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span><br>
          </li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">We
              were able to upgrade pseudo and have hopefully resolved
              our fedora27/coreutils issues. Thanks to all who helped!<o:p></o:p></span></li>
          <li
style="color:black;margin-top:0in;margin-bottom:0in;margin-bottom:.0001pt;mso-list:l0
            level1 lfo1;vertical-align:baseline">
            <span style="font-family:&quot;Arial&quot;,sans-serif">Master-next
              has a number of recipe upgrades queued. We still want to
              discourage people from sending recipe upgrades until we
              start 2.6; however, there were simply too many patches to
              ignore. This has meant various people and build resources
              have ended up distracted from 2.5 work.<o:p></o:p></span></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.3.4 (Pyro) will be built after 2.5 M3</span></p>
      </div>
    </blockquote>
    Wont it be post Rocko point release?<br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.2.4 (Morty) will be built after 2.5 M3 once the glibc 2.27
            issue is fixed</span></p>
      </div>
    </blockquote>
    Wouldn't Morty be post Pyro point release? This will the the point
    release?<br>
    <br>
    <blockquote type="cite"
cite="mid:CY4PR11MB1766CC383F4489AF64684EEFC7BF0@CY4PR11MB1766.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.3 (Rocko) is planned for post YP 2.5.</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            YP 2.5 Dates are:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5 M3 is in QA.  See status above.</span><o:p></o:p></p>
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
            2570 (last week 2594)</span><o:p></o:p></p>
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
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------BBEDBBFAF7038535C2F05DC9--
