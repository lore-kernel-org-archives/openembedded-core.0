Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 23AA979020
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 23:25:01 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b16-v6so36742492oic.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=QkiV3B+SxxG0OMCKyzwV0DcvIbObSIlequWBDeGXMV0=;
	b=Hk/W8ff2TZV+tA7bgTd2K0OG02ge60+pPgpMF+IGIsAfRarxPdMOOYdrPqdUIl69JN
	imeDQB+gF/0pcRQl1LoT1E6QEn468XxYYyAxvr8lQq7tAUTefY+T/KKT5/gH8HSzrKQz
	DOnnHiWthQeifEq8nfIX6akbT1cq0ONa8q7DTEZNkaaJaRrBWvo+bfFW2LQfpd9ju+d5
	jLSvxGR32bUhmpdubxa/ML5BTkUoUKByFL5WdeRuinAsoVWBVFdHShNW4DWkVm4zo6Eb
	Ct9QMnL68XmCC6XGia3rtHVT3U/5yXTXKF6pj34qBljZZMvGFP+uh35AeAakh5kRBF3i
	ghHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=QkiV3B+SxxG0OMCKyzwV0DcvIbObSIlequWBDeGXMV0=;
	b=n+UmLRGs2ceyN4312WGFxEetBISdz32Ols+Kz2Zx0hjgl79/WqhrREOAkvlWWNi6Ne
	rJNco3hd629ir7MHq5dFHqL5HfoWIG5xpNcNTkD08FF8Ja01IxTujKHa3bWo+iL4VC7K
	v1AmjPR+yKe5FulB2f1OFLpsegx0w8TGie9C7PMKBpdqMy4tfDnTNV/AbZUOWkIlYFm1
	f0TwOSbWZopUXzUgpUv5BtFKC8bMu3dv1VJsdMBBagUROY+Z77fhmVFkprXsmy3zDZzL
	g0gGmqQQMh6f6CJnTT75Fm5Q/3NSWtgNB7xvnqgFPGGhYJsML4aHWXEsEFPcbaq1Qypc
	YrJg==
X-Gm-Message-State: AOUpUlEwtRpnLd7bcAeseq3xCdw917FyAR7RKpZOryOop7nNsTg9rSEn
	/aJf9wOUzZtt7F1gM9qCD9148KYt
X-Google-Smtp-Source: AA+uWPzMHMw+N1GP1ri7bykgk0uE3bN/5arVzhZvjNhdZ7fwlc+OtqiwQ0ZkU55AwKeANDK322vtBQ==
X-Received: by 2002:aca:51c2:: with SMTP id
	f185-v6mr25184772oib.188.1534289101988; 
	Tue, 14 Aug 2018 16:25:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a992:553:fc14:a9d6?
	([2601:202:4180:c33:a992:553:fc14:a9d6])
	by smtp.gmail.com with ESMTPSA id
	t131-v6sm23454438oie.34.2018.08.14.16.25.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 16:25:01 -0700 (PDT)
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ca716515-653e-685a-1de6-d7c1ba48d8ff@gmail.com>
Date: Tue, 14 Aug 2018 16:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXMzPigJkxOA==?=
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
X-List-Received-Date: Tue, 14 Aug 2018 23:25:01 -0000
Content-Type: multipart/alternative;
	boundary="------------AFACE128A6DA0F3E1D3652A2"
Content-Language: en-US

--------------AFACE128A6DA0F3E1D3652A2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 08/14/2018 07:46 AM, Jolley, Stephen K wrote:
>
> Current Dev Position: YP 2.6 M3.
>
> Next Deadline: YP 2.6 M3 Build Target is Aug. 27, 2018
>
Thanks for the updates Steven.
>
>  
>
> SWAT Team Rotation:
>
> ·         SWAT lead is currently: Maxin
>
> ·         SWAT team rotation: Maxin -> Chen on Aug. 17, 2018
>
> ·         SWAT team rotation: Chen -> Paul on Aug. 24, 2018
>
> ·         https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
>  
>
> Key Status/Updates:
>
> ·         YP 2.6 M2 released on 8/10/18.
>
> ·         YP 2.5.1 is in QA. See
> https://wiki.yoctoproject.org/wiki/2.5_QA_Status.  It is 98% complete
> and should finish soon.
>
> ·         A summary of sstate usage was added to the initial build
> output which gives numbers for the fraction of artefacts which are
> being reused. We may need to tweak the presentation to the user but
> its good information to provide and feedback on it is welcome.
>
> ·         Glibc 2.28 is proving to have a number of issues to
> integrate including the significant size increase of its locale data,
> creating locale archives is likely the way forward for images reducing
> their size in core-image-lsb-sdk from ~900MB to ~220MB. The patches
> remain -next whilst fixes for issues are confirmed.
>
> ·         Many other miscellaneous fixes were merged covering many
> aspects of the system.
>
> ·         A potential DoS style issue was found in the bitbake
> checksum code and in fixing it the improvement of the checksumming
> code measurably improved (Thanks Ross!)
>
Thanks Ross.

> ·         The sstate equivalency server work from Joshua/Garmin has
> review still pending but the related persist_data improvements are
> queued for merging.
>
> ·         The kernel-devsrc rework from Bruce/Windriver is pending
> patch resubmission.
>
> ·         2.4 (rocko) series stabilization continues for the next
> point release 2.4.4
>
>  
>
> Planned Releases for YP 2.6:
>
> ·         YP 2.6 M3 Build Target is Aug. 27, 2018
>
> ·         YP 2.6 M3 Release Target is Sept. 7, 2018
>
Is M3 feature freeze?

- Armin

> ·         YP 2.6 M4 Build Target is Oct. 1, 2018
>
> ·         YP 2.6 M4 Release Target is Oct. 26, 2018
>
>  
>
> Planned upcoming dot releases:
>
> ·         YP 2.5.1 (Sumo) is in QA.
>
> ·         YP 2.4.4 (Rocko) will be targeted after YP 2.6 M4 is done.
>
> ·         YP 2.5.2 (Sumo) will be targeted after YP 2.4.4 is done.
>
>  
>
> Tracking Metrics:
>
> ·         WDD 2592 (last week
> 2590)(https://wiki.yoctoproject.org/charts/combo.html)
>
> ·         Poky Patch Metrics  
>
> o    Total patches found: 1616 (last week 1608)
>
> o    Percentage of patches in the Pending State: 736 (46%) [last week
> 730 (45%)]
>

>  
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.6_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.6_Features
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
> *Yocto Project Program Manager*
>
> *INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124 *
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:                             _stephen.k.jolley@intel.com_
>
>  
>
>
>


--------------AFACE128A6DA0F3E1D3652A2
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
    <div class="moz-cite-prefix">On 08/14/2018 07:46 AM, Jolley, Stephen
      K wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com">
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:2 11 5 0 0 0 0 0 0 0;}
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
	{mso-list-id:46497222;
	mso-list-template-ids:-306775014;}
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
	{mso-list-id:218398690;
	mso-list-template-ids:-1491467040;}
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
	{mso-list-id:350036764;
	mso-list-template-ids:646637278;}
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
	{mso-list-id:472867465;
	mso-list-template-ids:-1177640642;}
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
	{mso-list-id:499544718;
	mso-list-template-ids:274525736;}
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
	{mso-list-id:655375444;
	mso-list-template-ids:1161988858;}
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
	{mso-list-id:821849258;
	mso-list-template-ids:-172329626;}
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
	{mso-list-id:913274551;
	mso-list-template-ids:956701084;}
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
	{mso-list-id:1506553632;
	mso-list-template-ids:423005988;}
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
	{mso-list-id:1717243185;
	mso-list-template-ids:-1609638740;}
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
            Dev Position: YP 2.6 M3.</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next
            Deadline: YP 2.6 M3 Build Target is Aug. 27, 2018</span></p>
      </div>
    </blockquote>
    Thanks for the updates Steven.<br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com">
      <div class="WordSection1">
        <p style="margin:0in;margin-bottom:.0001pt"><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            Team Rotation:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l7
          level1 lfo11;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            lead is currently: Maxin<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l7
          level1 lfo11;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Maxin -&gt; Chen on Aug. 17, 2018<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l7
          level1 lfo11;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT
            team rotation: Chen -&gt; Paul on Aug. 24, 2018<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l7
          level1 lfo11;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
            style="font-size:11.0pt;font-family:Consolas;color:black"><a
href="https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"
              moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status/Updates:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.6 M2 released on 8/10/18.
            <o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5.1 is in QA. See
            <a href="https://wiki.yoctoproject.org/wiki/2.5_QA_Status"
              moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/wiki/2.5_QA_Status</span></a>.
             It is 98% complete and should finish soon.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">A
            summary of sstate usage was added to the initial build
            output which gives numbers for the fraction of artefacts
            which are being reused. We may need to tweak the
            presentation to the user but its good information to provide
            and feedback on it is welcome.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Glibc
            2.28 is proving to have a number of issues to integrate
            including the significant size increase of its locale data,
            creating locale archives is likely the way forward for
            images reducing their size in core-image-lsb-sdk from ~900MB
            to ~220MB. The patches remain -next whilst fixes for issues
            are confirmed.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Many
            other miscellaneous fixes were merged covering many aspects
            of the system.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">A
            potential DoS style issue was found in the bitbake checksum
            code and in fixing it the improvement of the checksumming
            code measurably improved (Thanks Ross!)</span></p>
      </div>
    </blockquote>
    Thanks Ross.<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The
            sstate equivalency server work from Joshua/Garmin has review
            still pending but the related persist_data improvements are
            queued for merging.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The
            kernel-devsrc rework from Bruce/Windriver is pending patch
            resubmission.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l8
          level1 lfo12;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2.4
            (rocko) series stabilization continues for the next point
            release 2.4.4<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            Releases for YP 2.6:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l9
          level1 lfo13;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.6 M3 Build Target is Aug. 27, 2018<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l9
          level1 lfo13;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.6 M3 Release Target is Sept. 7, 2018</span></p>
      </div>
    </blockquote>
    Is M3 feature freeze?<br>
    <br>
    - Armin<br>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l9
          level1 lfo13;vertical-align:baseline"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l9
          level1 lfo13;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.6 M4 Build Target is Oct. 1, 2018<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l9
          level1 lfo13;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.6 M4 Release Target is Oct. 26, 2018<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
            upcoming dot releases:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l6
          level1 lfo14;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5.1 (Sumo) is in QA.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l6
          level1 lfo14;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.4.4 (Rocko) will be targeted after YP 2.6 M4 is done.<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l6
          level1 lfo14;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP
            2.5.2 (Sumo) will be targeted after YP 2.4.4 is done.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking
            Metrics:</span><o:p></o:p></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo15;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">WDD
            2592 (last week 2590)</span><span
            style="font-size:11.0pt;font-family:Consolas;color:black"> (</span><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><a
              href="https://wiki.yoctoproject.org/charts/combo.html"
              moz-do-not-send="true"><span style="color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html</span></a></span><span
            style="font-size:11.0pt;font-family:Consolas;color:black">)</span><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level1 lfo15;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:Symbol;color:black"><span
              style="mso-list:Ignore">·<span style="font:7.0pt
                &quot;Times New Roman&quot;">        
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Poky
            Patch Metrics  </span><span
            style="font-size:11.0pt;font-family:Consolas;color:black"><o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level2 lfo15;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">   
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Total
            patches found: 1616 (last week 1608)<o:p></o:p></span></p>
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level2 lfo15;vertical-align:baseline">
          <!--[if !supportLists]--><span
            style="font-size:10.0pt;font-family:&quot;Courier
            New&quot;;color:black"><span style="mso-list:Ignore">o<span
                style="font:7.0pt &quot;Times New Roman&quot;">   
              </span></span></span><!--[endif]--><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Percentage
            of patches in the Pending State: 736 (46%) [last week 730
            (45%)]</span></p>
      </div>
    </blockquote>
    <br>
    <blockquote type="cite"
cite="mid:9ADD3FDE8B189B4AA2F8A3C711F8155ECE46263B@FMSMSX112.amr.corp.intel.com">
      <div class="WordSection1">
        <p
style="mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margin-left:1.0in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2
          level2 lfo15;vertical-align:baseline"><span
            style="font-size:11.0pt;font-family:Consolas;color:black"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:12.0pt;font-family:&quot;Times New
            Roman&quot;,serif"><o:p> </o:p></span></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key
            Status Links for YP:</span><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.6_Schedule"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.6_Schedule</span></a><o:p></o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><a
            href="https://wiki.yoctoproject.org/wiki/Yocto_2.6_Features"
            moz-do-not-send="true"><span
              style="font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.6_Features</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The
            Status reports are now stored on the wiki at:
          </span><a
            href="https://wiki.yoctoproject.org/wiki/Weekly_Status"
            moz-do-not-send="true"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p style="margin:0in;margin-bottom:.0001pt"><span
style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If
            anyone has suggestions for other information you’d like to
            see on this weekly status update, let us know!]</span><o:p></o:p></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Arial&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
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

--------------AFACE128A6DA0F3E1D3652A2--
