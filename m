Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5807565C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 13:32:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0MDWKtE028599
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 22 Jan 2015 05:32:20 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Thu, 22 Jan 2015 05:32:20 -0800
From: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libgcc-common: Fix file ownership for
	installed files
Thread-Index: AQHQM/QR6fFxoAtK8UKXzc1yXzGMnZzJsVWAgAJ1ALU=
Date: Thu, 22 Jan 2015 13:32:19 +0000
Message-ID: <7805B0FACE4FCC4E84636AB320CBA4AC360C55FB@ALA-MBB.corp.ad.wrs.com>
References: <1421677653-1166-1-git-send-email-daniel.dragomir@windriver.com>,
	<CAJTo0LY9L3vzJ+5EJsov04Dh1D9wCfVj7HHOQ-HcmA79mzG8+w@mail.gmail.com>
In-Reply-To: <CAJTo0LY9L3vzJ+5EJsov04Dh1D9wCfVj7HHOQ-HcmA79mzG8+w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.124.175]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcc-common: Fix file ownership for installed files
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
X-List-Received-Date: Thu, 22 Jan 2015 13:32:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7805B0FACE4FCC4E84636AB320CBA4AC360C55FBALAMBBcorpadwrs_"

--_000_7805B0FACE4FCC4E84636AB320CBA4AC360C55FBALAMBBcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I made a new git pull on dizzy branch and started a new build, and I see no=
 warnings like those anymore.
I guess this was solved by this commit:

2014-11-25 17:58 Richard Purdie     o gcc: Rework shared work
a6f2e490380581a8d4cb27bd95ec7f8d164d3b12

Skip this patch.

BR,
Daniel
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Tuesday, January 20, 2015 5:55 PM
To: Dragomir, Daniel
Cc: OE-core
Subject: Re: [OE-core] [PATCH] libgcc-common: Fix file ownership for instal=
led files


On 19 January 2015 at 14:27, Daniel Dragomir <daniel.dragomir@windriver.com=
<mailto:daniel.dragomir@windriver.com>> wrote:
Fix two QA warnings caused by setting the wrong user and group for
files installed in the destination directory on do_install task.

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [warn]
WARNING: log_check: warning: user xxxx does not exist - using root

WARNING: log_check: There is a warn message in the logfile
WARNING: log_check: Matched keyword: [warn]
WARNING: log_check: warning: group xxxx does not exist - using root

This worries me.  Why is libgcc installing files with the wrong owners, and=
 is libgcc special or are other packages also installing files with the wro=
ng owners?  If this is a libgcc-specific problem and files are installed wi=
th the wrong owners then fixing the install process seems like a better fix=
.

Ross

--_000_7805B0FACE4FCC4E84636AB320CBA4AC360C55FBALAMBBcorpadwrs_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">I made a new git pull on dizzy branch and started a new build, and I=
 see no warnings like those anymore.<br>
I guess this was solved by this commit:<br>
<br>
2014-11-25 17:58 Richard Purdie&nbsp;&nbsp;&nbsp;&nbsp; o gcc: Rework share=
d work<br>
a6f2e490380581a8d4cb27bd95ec7f8d164d3b12<br>
<br>
Skip this patch.<br>
<br>
BR,<br>
Daniel<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF140491"><font color=3D"#000000" =
face=3D"Tahoma" size=3D"2"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Tuesday, January 20, 2015 5:55 PM<br>
<b>To:</b> Dragomir, Daniel<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libgcc-common: Fix file ownership for=
 installed files<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 19 January 2015 at 14:27, Daniel Dragomir <sp=
an dir=3D"ltr">
&lt;<a href=3D"mailto:daniel.dragomir@windriver.com" target=3D"_blank">dani=
el.dragomir@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":31c" class=3D"a3s" style=3D"overflow:hidden">Fix two QA warning=
s caused by setting the wrong user and group for<br>
files installed in the destination directory on do_install task.<br>
<br>
WARNING: log_check: There is a warn message in the logfile<br>
WARNING: log_check: Matched keyword: [warn]<br>
WARNING: log_check: warning: user xxxx does not exist - using root<br>
<br>
WARNING: log_check: There is a warn message in the logfile<br>
WARNING: log_check: Matched keyword: [warn]<br>
WARNING: log_check: warning: group xxxx does not exist - using root</div>
</blockquote>
</div>
<br>
This worries me.&nbsp; Why is libgcc installing files with the wrong owners=
, and is libgcc special or are other packages also installing files with th=
e wrong owners?&nbsp; If this is a libgcc-specific problem and files are in=
stalled with the wrong owners then fixing
 the install process seems like a better fix.</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7805B0FACE4FCC4E84636AB320CBA4AC360C55FBALAMBBcorpadwrs_--
