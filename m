Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 2058 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Apr 2017 17:33:27 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0120.outbound.protection.outlook.com [104.47.38.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0529071976
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OEVaBasN2bbfd68tCcXYHQg9mcqtkaYNI8EbB9coDKY=;
	b=YRBVhtaZDCag0pDZ51bzRpZPSYXGn/xqLti1tkNX6yUpcWw5ypUXYmmx8vfPJAYdQZOSux7LXCt1OMKTvThu1aJjJIdzyDHUsbQ8X+FLaT+z7i8AMWA9nTGXdUT6u06G+Ey2DhKyoNv6htHfEC1X4xEPHny9qiMEPRNfFkd5IaI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-oi0-f46.google.com (209.85.218.46) by
	MWHPR11MB1679.namprd11.prod.outlook.com (10.172.55.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Fri, 21 Apr 2017 16:59:09 +0000
Received: by mail-oi0-f46.google.com with SMTP id x184so103963341oia.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 09:59:09 -0700 (PDT)
X-Gm-Message-State: AN3rC/4cgHTheoabGswxoleqdPw6XZiHmz19d9UU7s4xVGJrPU0k16IJ
	GaC1NwqR4hE4ge/X5lTdvOGUmMfT1Q==
X-Received: by 10.202.171.213 with SMTP id u204mr7597158oie.96.1492793946490; 
	Fri, 21 Apr 2017 09:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.111.9 with HTTP; Fri, 21 Apr 2017 09:59:06 -0700 (PDT)
In-Reply-To: <CAJTo0LY+Yw9K2W+ZJ3uLNDurBCLd9xV8huoBLwcNZQG=SEd5WQ@mail.gmail.com>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
	<1492521609-26624-3-git-send-email-ferlandm@amotus.ca>
	<CAJTo0LY+Yw9K2W+ZJ3uLNDurBCLd9xV8huoBLwcNZQG=SEd5WQ@mail.gmail.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Fri, 21 Apr 2017 12:59:06 -0400
X-Gmail-Original-Message-ID: <CAMRMzCDPAge5sEQNQof9Pi5ytVsPEsFp8kmrtppwC+htHjgw7w@mail.gmail.com>
Message-ID: <CAMRMzCDPAge5sEQNQof9Pi5ytVsPEsFp8kmrtppwC+htHjgw7w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Originating-IP: [209.85.218.46]
X-ClientProxiedBy: BN6PR17CA0029.namprd17.prod.outlook.com (10.175.189.15) To
	MWHPR11MB1679.namprd11.prod.outlook.com (10.172.55.20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d2987b-efa3-4b39-cb8a-08d488d7ba89
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:MWHPR11MB1679; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	3:4PPi/7pQhiqn9BirT+ZDV/gpPGdEqOlTpVS+e0MZVS7joBx9LYY5st//kLWvJtAcQkP1xzSU4qmgzf2NHC+eFAuzuKRRp1dEojTjYibX4RQPpdcVcVDI3am1Cg0wBbNTbzaayhW0PV6Y8EWsWzLCjd5lF22qQiqNh/s5eJJ5IaahPhifCdTJ2TACVY1hqMX5eP/4fEQLWQ5vZgKH4YIPBUVBKeu649kkkwFr0V2oZsFdRQ/PKgEMFebqI68xhIm0pSS4RATv9OKUemDtDdanX44OUaCFbCB2sQv44CbVm46yz3NOrTljTnGl2zId8WMK;
	25:ZgZy9H0J9T2TYRbHF/BgKrHXTrUqIXSua0XC1xfle7UBgnclq+XqjAoSEGsd4YM93CnRU0I9nBM8Ran1dRY/CZlebnhPMAwzDgTngkZWV7g0iB9uh/HLsX86CpHDF6w4PLjzPWOcgeHa8R35INgDJMYjPiNslLtvnEMmjzZO2j/+1IkIZhOgKZ7RWAwtBL2uq6AqlI3qEsRQgt27mJDZ+7/RFdN1oVaWNgqymjA/PjmITDKFhl5IhEBOVwWAufvvg7IzQ6h2zqsrNObsTcyTso5gsT2i0jcHfTzUjqdIWTuOopgoydYBr6zBjR9FYPHM445NK2PBWPy2BLE5VC+NMsZUviFOEha5xsV4sqw2ni5v5rKgaA85WmnBEeptmlSNU3O/gO/+ldUp32j+wggpiMozHi8tFsoApvt+0JYpqs1+yOO26F0nEBKuPK1esL8MZo0LscBnUryVcrmvb0csQA==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	31:WagAHJLFGPYBkS3M58Sri/m6yN1mPOb/e2q2mqrgPWpBff4aKQ86v65jA8G18WH/7zXlGz/ryLhIIWJs9YKT95xbeb6f6b8kZ63y0Tpw2iNYK2EU3RddUBfvKulPfAbdXeItxXqqjYB8TJGMm0taCqW+cmxxsoKaMvT1DIWOFZaGOaaB7q2dDLiBpWY9jj3S3EUTCsySO9HPUqmfwJxwWB8NjhQBP1/EGtDLsxlgC6JBAR6q+NQZktMk5/ug6hazWF0sI+A7sKcC5O2pxA+LYA==
X-Microsoft-Antispam-PRVS: <MWHPR11MB1679DB9C3350109B8B20C121DC1A0@MWHPR11MB1679.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(6043046)(6072148);
	SRVR:MWHPR11MB1679; BCL:0; PCL:0; RULEID:; SRVR:MWHPR11MB1679; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	4:rW1xD9jzeOWAXRLsPbxezgbWU5BzGYXlWKXYZQxBwWNAS8Btwi9jB/vZh0IXPVMt0gKtfwGkBeD3extx1S7w8uNJegNycKSyGtbyzpgGJ9b+KJx+HYyo9sAZaiIwzNzCplSnVTPocAhyHyQavbVQu2wuZEucyM162jJdbWgNBQcPZeo4tfkM1D1G3meAe3ckpAHOStKyZ2S6ebB6VQsYM0aTmDVlPMWD6IM1J+sRa6R32BzbGdMMDCSHC20948UHIatr27NUFP8XZeGN+pIKoO7y06/KPDslymTqmqb/N2bSz8cRQLnY3l46Tnx3fIUAin4cT4wCCs0RvQXhgMF26tZuDIXRW89isoeNf0Q247EuNnppjH5bFPqDRf5wX6+fpblDvhZy3sDxdDrHkbWTIr36YQhU6MtX4+YtZfFa68MDuFAHZ2c82YnP2CTxNEqWoQu//8kCDGOe3WjHyMjh6ZU/LI0oa9xtgbzieVcQrClEHjalNWEO+Ar9wnTMKOVCRC+MJk0F4t4xJBfYEOTlwbnS8cdtfJd1WwLO3mJziEo78whkIoN7JuweFOoZNZ7Yn3KQGTBz3/R1k47BRLMpJNyaLEOd6h4RcYWd0JqkZylw3hKFY84y9m3QFEDYwkl7flPbdFvmbk5D0QV+Uruwh2FjszwybyDn/XCGKGjDJXHIfD2ZJ6yhHHXRqnoQUjwUZnufr2S6GBabK7XuzzwgdCMDGt5qXe4LR4rrHPCfDu8XmBTO8ctmKqjSuu0IMDs6OBVBsTTnlbQY+Wv8S2j5mq2YITM+1T3IJYX6MuV78YOQpjUN9gskWgW2WM/sne/C
X-Forefront-PRVS: 02843AA9E0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39830400002)(39450400003)(39410400002)(39400400002)(24454002)(377454003)(5660300001)(3846002)(498394004)(6862004)(81166006)(86362001)(2950100002)(74482002)(189998001)(42186005)(8576002)(55446002)(8676002)(122856001)(38730400002)(512874002)(76176999)(229853002)(63696999)(50986999)(54356999)(93516999)(110136004)(9896002)(61726006)(9686003)(53936002)(2906002)(84326002)(6246003)(236005)(305945005)(7736002)(4326008)(66066001)(61266001)(6116002)(53546009)(59536001)(67856001)(55456009)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR11MB1679;
	H:mail-oi0-f46.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR11MB1679;
	23:CokTTI2c84Ha4k6QQKstzUXRn6QU7Z0HPG292ZbaP?=
	=?us-ascii?Q?rDHzpjIuZQYd1JxLll5BdSW7Y9xvMANNvJ8uai4gR3tbm652NgW6I81PERNt?=
	=?us-ascii?Q?x3DIfg8eJK8MJjgkTWWnUsISlzJ4lJ2Fj4W7rvKo5xXWtK0QrGaRUPALYzb7?=
	=?us-ascii?Q?axvezgb3uKocZ/rHINnBjYU+5lmkkAPDtKuoanPYVr+PdZQnYwVu/fZamIZA?=
	=?us-ascii?Q?Io+PfVbyCsaJwoq4MLC6qEirnzbronrbvx/MP4WB3cfQwnYqfTuZflzjJrOE?=
	=?us-ascii?Q?n++KlbCWaXmOglaqx/GSYACDPyfPwEe0TzjtizJZ0mEw0G28YrXn13W3Wfm1?=
	=?us-ascii?Q?spEM3hHnZmeVFomm1NLCdhvHkLe8dw+PucQZMkv/+VAsb4djCdwJdFgFDRBC?=
	=?us-ascii?Q?OMUuELGoLzsG0NoSuls2J6y0TPgIk35rOG3j85R0Nbq/bEgOZooYDB2w2rHY?=
	=?us-ascii?Q?OOaycP4WnN5O0Bb8Ifhz3CPtyjCcCufgKsgEBJlwesH1Zw9LI2REZY9opOus?=
	=?us-ascii?Q?/6/IQkD7ZEFfoPJRcmDomO/3gFqXCV+oNP1XsIA+5MXnOPYMf5deLzF4+6JJ?=
	=?us-ascii?Q?VPoHlqkyOlw1P9hYz4x9IJv1zKnJD2ST35B0kAjF+bMmESbSS9E3dhpLITWP?=
	=?us-ascii?Q?DBTkSLlixp7qF0VshIzHEZY2rMPdTz/9xh+VNB5WruN0o12mo3eaiExVQ/ua?=
	=?us-ascii?Q?N1jgqptCxTOmcu9GqsLY8oOGomE9SPFvwgSSDYFFoOPp0q+fENO4hWINXSec?=
	=?us-ascii?Q?8ugXf+f4dI7KE+1X8q057NZUU405pNl46fI+yAalaHUDM9LNCo5lmVKhOm6s?=
	=?us-ascii?Q?o40Vi/FJWo00PFublPjRJQSnkaoBmxeNwnaYZzTWC4d0+a9Ocypnkijeps0K?=
	=?us-ascii?Q?beXiumlJaJInGk2lLoizERwmuErQll93nIkIZ4b9tPUhDV02mPyp/ZMv/31e?=
	=?us-ascii?Q?Nh3lKZxu652jYyX6QDLPapOfopNJDJASTvv8+ymkEFwil09nHotNqYydLdKq?=
	=?us-ascii?Q?wpv0t3smcDwUiTWjcQGpIHa7ZQwwEGBexqYqVI0hetbBQncryxd0g+OEWQiZ?=
	=?us-ascii?Q?cOWlxAXEpZRlyjoc1oBUkzblVd/877RZDZbrQ69zqiLeL1yMwJlEDxUQxE6h?=
	=?us-ascii?Q?IPvZQUMOzu+mW/ghs7fQX6om3SvTOiFLoBdSL86ppgWcBxfTTIH08lgsLpuK?=
	=?us-ascii?Q?jPh9BPSQMeJG875xrxLcO43vpqWw28XTJRK?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	6:lRwo1HJdGYQADyA0nPsinSdq2DOukcW9O6D6eOY585CCGHgjqCjhOzvJPWdwpthQiIC/F+Px6SwOe/LJkwXXvTZ/L/jq3kSLyYyBejLxcimsNB4WmoQhZTyHVZj06+TeS+bBt4CKE/ORYkrIb/saEWv8PpJXOeRvXMjLEn/e+Nv0nq6VIlKCLfzKJUSgfFYDxgKmb8XtRH+fFVjHl8uZzUq3lQlaOezRedTIGR9tToFjIqIA0PNPYQztFwpJB0FyIxar2LoCEmG9nVzZw0IUt8/+lBOC+acFrt1FASPwuB9ODZ7la+qCgVm+XfqdyC0iEUGjoMgb69UWTGA4EGop80hYQO4YQsccsVHctggG0jrzuJLV2J6WNptgUAsypcOi9QWpz87tJV1GA9NcnrjIHiuxGKtCntFpdXjT/JDdAup0uHNKX/c8HoxmprkwzERXqhwXbcF8xz/HD7hsg0kJVGi0ms+s8gUQMt194tKlgEYZVg5lD8WUOq8a21AK1tK2HoSVKIkNmZc//6XGstwy9A==;
	5:TZqACBwj4LDZQHbvZFR2pZ69aGfL3ed5x3TosrjXrMAcFEX37uucLMV9AEbzQuK4QN/PVB7qHvt/xbnO6v67R81uP4AnWLOnlcl+4ecpumY8Dltt0oz98Tm09ngKIH0eG86gV5+tlP7F6WwhXyAOYA==;
	24:aoKNlxjlnRQMdwi6hLBj4TDFaiRzfa8M1Trh9N3rGR5af3HaFHViApn/zFeWHbHj/gWhnRPmxskH6uFHZcRqJw2E1rqOZr6QX3lheCD6GUk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1679;
	7:UBxi9PbTqg2cJ6SPR+El8wxyxHAOJVeus3KkzZb+0lH5Ezf9CcjafD8lgEqfm6j7j6b5AfNqXuC3tAb7DGjQPm/7FkWSMEobc5+aDJyMtp2r57A+aRAC9SQUa/S0F1AxhGfoxionqNvDxbDQd+HXOWuVW3JnPfMOoKKhtnA5nD095/QlTXo1XOfkqTq+wLBo83lbTI5loz4DwpqZ58flcHXca+x73dYPK3itojDkvbbuTEq27NLRONF/f/Hgu5RWOK9pIFNPSVaZZ1/iY0BpeSbSiovFC+v5+IprDfydaHAstXsFit6gg9HONABQlL9/PbSZBK14T3+dZKa83VOqFw==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2017 16:59:09.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1679
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/8] bluez5: remove libasound-module references
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
X-List-Received-Date: Fri, 21 Apr 2017 17:33:29 -0000
Content-Type: multipart/alternative; boundary="001a113c385ae750aa054db02c27"

--001a113c385ae750aa054db02c27
Content-Type: text/plain; charset="UTF-8"

Noted. Thanks for the input.
Marc

On Fri, Apr 21, 2017 at 11:33 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 18 April 2017 at 14:20, Marc Ferland <ferlandm@amotus.ca> wrote:
>
>> -PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex
>> ${PN}-noinst-tools"
>> +PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
>>
>
> packagegroup-base still refers to this package though:
>
>   - nothing provides libasound-module-bluez needed by
> packagegroup-base-bluetooth-1.0-r83.0.qemux86_64
>
> Ross
>

--001a113c385ae750aa054db02c27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Noted. Thanks for the input.<br></div>Marc<br></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 21, 20=
17 at 11:33 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.b=
urton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
extra"><span class=3D""><br><div class=3D"gmail_quote">On 18 April 2017 at =
14:20, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"mailto:ferlandm@amotus=
.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex"><div id=3D"m_-8506584531453888945gmail-:1xb" class=3D"m_-850658453=
1453888945gmail-a3s m_-8506584531453888945gmail-aXjCH m_-850658453145388894=
5gmail-m15b8139e06b17090">-PACKAGES =3D+ &quot;libasound-module-<span class=
=3D"m_-8506584531453888945gmail-il">bluez</span> ${PN}-testtools ${PN}-obex=
 ${PN}-noinst-tools&quot;<br>
+PACKAGES =3D+ &quot;${PN}-testtools ${PN}-obex ${PN}-noinst-tools&quot;<br=
></div></blockquote></div><div class=3D"gmail_extra"><br></div></span>packa=
gegroup-base still refers to this package though:</div><div class=3D"gmail_=
extra"><br>=C2=A0 - nothing provides libasound-module-bluez needed by packa=
gegroup-base-bluetooth-1.<wbr>0-r83.0.qemux86_64</div><span class=3D"HOEnZb=
"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--001a113c385ae750aa054db02c27--
