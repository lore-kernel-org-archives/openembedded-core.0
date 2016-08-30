Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 381 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Aug 2016 10:04:00 UTC
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.109])
	by mail.openembedded.org (Postfix) with ESMTP id A8C136FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:04:00 +0000 (UTC)
Received: from [194.106.220.51] by server-5.bemta-6.messagelabs.com id
	C5/04-29563-39855C75; Tue, 30 Aug 2016 09:57:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRWlGSWpSXmKPExsVyU6aHU3dSxNF
	wg+b5+hZnNjSzW9z5+Y7dYt4Oewdmj8V7XjJ5nNu4gtFj7+ffLAHMUayZeUn5FQmsGZevT2Qp
	mO5YMf/yPuYGxt3WXYycHEICWxgl9uzg7GLkArL3Mkq86bvJDpJgEzCT2PVqHZgtIqAlcfb1Y
	2aQImaBaYwST/pes4AkhAWsJF7f38cMUWQtsf//HqAGDiDbSuJadyRImEVAVeLLqWlMIDavgK
	tEy/YrrBDLuhglGpdOAEtwCgRKNK5ZwghiMwrISnxpXA02k1lAXOLWk/lgNRICAhJL9pxnhrB
	FJV4+/scKYRtIbF26jwXCVpD40XsKqsZa4t+Du0wQc7Il5lx4wgxxhKDEyZlPWCYwis5CsmIW
	krJZSMog4joSC3Z/YoOwtSWWLXzNDGOfOfCYCVl8ASP7Kkb14tSistQiXWO9pKLM9IyS3MTMH
	F1DAzO93NTi4sT01JzEpGK95PzcTYzA6GQAgh2MHf+cDjFKcjApifJOjT8SLsSXlJ9SmZFYnB
	FfVJqTWnyIUYaDQ0mC90LY0XAhwaLU9NSKtMwcYJqASUtw8CiJ8GqGA6V5iwsSc4sz0yFSpxg
	VpcR5d4L0CYAkMkrz4NpgqekSo6yUMC8j0CFCPAWpRbmZJajyrxjFORiVhHntQcbzZOaVwE1/
	BbSYCWhxwZ3DIItLEhFSUg2MIQxvRY7z5vTOCK0Un2j2X6Ld/OUW31/LG2uPsSxU7nt8cb+8/
	s7L0b8Zf/5nz/tQPOl3o1xo7WOJ/dN37ZST+/7zQ1npV0nlNs6ZV/Tc9rI57zJUCJgTfpD/Ae
	uK6kMpbZ+SXcxaDvpIJ05bk+IqXJe4+aoV85e5TFrSHOETLp36daSe59ZJJZbijERDLeai4kQ
	A24wAgkgDAAA=
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-15.tower-92.messagelabs.com!1472551057!48109743!3
X-Originating-IP: [217.28.140.9]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22026 invoked from network); 30 Aug 2016 09:57:38 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.140.9)
	by server-15.tower-92.messagelabs.com with AES256-SHA256 encrypted SMTP;
	30 Aug 2016 09:57:38 -0000
Received: from THHSTE15D2BE2.hs20.net (192.168.251.32) by
	THHSTE15D2BE3.hs20.net (192.168.251.33) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Tue, 30 Aug 2016 10:57:37 +0100
Received: from THHSTE15D2BE2.hs20.net ([fe80::d195:d16f:3c24:f255]) by
	THHSTE15D2BE2.hs20.net ([fe80::d195:d16f:3c24:f255%21]) with mapi id
	15.00.1178.000; Tue, 30 Aug 2016 10:57:37 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] Build of u-boot with gold is broken
Thread-Index: AdH5VjLhAuTAF19QS3yoE/njm4xwfAEHdroAAIRDB9c=
Date: Tue, 30 Aug 2016 09:57:36 +0000
Message-ID: <e0328689f1a4439a97564d4e2620da53@THHSTE15D2BE2.hs20.net>
References: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>,
	<CAJTo0LbYUFLWAhiM+WF3dYzrcLksTLDCQUDqDVr4w0m9050jdA@mail.gmail.com>
In-Reply-To: <CAJTo0LbYUFLWAhiM+WF3dYzrcLksTLDCQUDqDVr4w0m9050jdA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [46.17.166.30]
x-exclaimer-md-config: 266e7a57-cddd-49fd-bdea-19bca6d40303
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Tue, 30 Aug 2016 10:04:01 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_e0328689f1a4439a97564d4e2620da53THHSTE15D2BE2hs20net_"

--_000_e0328689f1a4439a97564d4e2620da53THHSTE15D2BE2hs20net_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Burton, Ross <ross.burton@intel.com>
On 19 August 2016 at 10:33, Andrew Goodbody <andrew.goodbody@cambrionix.com=
<mailto:andrew.goodbody@cambrionix.com>> wrote:
The sed at line 70 fails as it is being executed in an empty build director=
y and so there is no config.mk<http://config.mk>.

For fame and glory, can you send a tested patch to fix this?

Ross

Sorry but I am not sure about the best way to fix this.

Andrew

PS This is a resend (with additions below) as I neglected to copy the list,=
 sorry - I was out of the office at the time.
It would be possible to simply cd into the source directory, apply the sed,=
 then cd back to the build directory. However this seems to go against the =
point of having a separate build directory in that you are attempting to le=
ave the source tree alone, or so I assume.
In my local tree I simply revert

commit 36f110594506fbee5dc18de3a04981f019f2024d
Author: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Date:   Tue Aug 9 10:15:07 2016 -0700

    u-boot.inc: Enable out-of-tree builds

    This patch enabled out-of-tree builds for u-boot. This also helps build=
ing
    u-boot using EXTERNALSRC flow

    Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com=
>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

--_000_e0328689f1a4439a97564d4e2620da53THHSTE15D2BE2hs20net_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:black;
	font-weight:bold;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p><b><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif;color:black">From:</span></b><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black"> Burton, Ross &lt;ross.burt=
on@intel.com&gt;</span><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p></o:p></span></p>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">On 19 August 2016 at 10:33, Andrew Goodbody &lt;<a hre=
f=3D"mailto:andrew.goodbody@cambrionix.com" target=3D"_blank">andrew.goodbo=
dy@cambrionix.com</a>&gt; wrote:<o:p></o:p></span></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div id=3D":259">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">The sed at line 70 fails as it is being executed in an=
 empty build directory and so there is no
<a href=3D"http://config.mk" target=3D"_blank">config.mk</a>.<o:p></o:p></s=
pan></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">For fame and glory, can you send a tested patch to fix=
 this?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">Ross&nbsp;<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><br>
Sorry but I am not sure about the best way to fix this.<br>
<br>
Andrew<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">PS This is a resend (with additions below) as I neglec=
ted to copy the list, sorry &#8211; I was out of the office at the time.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">It would be possible to simply cd into the source dire=
ctory, apply the sed, then cd back to the build directory. However this see=
ms to go against the point of having a separate
 build directory in that you are attempting to leave the source tree alone,=
 or so I assume.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">In my local tree I simply revert<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">commit 36f110594506fbee5dc18de3a04981f019f2024d<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">Author: Manjukumar Matha &lt;manjukumar.harthikote-mat=
ha@xilinx.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">Date:&nbsp;&nbsp; Tue Aug 9 10:15:07 2016 -0700<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">&nbsp;&nbsp;&nbsp; u-boot.inc: Enable out-of-tree buil=
ds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">&nbsp;&nbsp;&nbsp; This patch enabled out-of-tree buil=
ds for u-boot. This also helps building<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">&nbsp;&nbsp;&nbsp; u-boot using EXTERNALSRC flow<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">&nbsp;&nbsp;&nbsp; Signed-off-by: Manjukumar Matha &lt=
;manjukumar.harthikote-matha@xilinx.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:#212121">&nbsp;&nbsp;&nbsp; Signed-off-by: Ross Burton &lt;ross=
.burton@intel.com&gt;<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_e0328689f1a4439a97564d4e2620da53THHSTE15D2BE2hs20net_--
