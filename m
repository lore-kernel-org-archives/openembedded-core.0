Return-Path: <r.meier@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1159F607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 10:58:07 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u6TAvvgw017864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 29 Jul 2016 12:57:58 +0200
Received: from DEFTHW99ERNMSX.ww902.siemens.net
	(defthw99ernmsx.ww902.siemens.net [139.22.70.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u6TAvvFw025950
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 29 Jul 2016 12:57:57 +0200
Received: from DEFTHW99ERSMSX.ww902.siemens.net (139.22.70.207) by
	DEFTHW99ERNMSX.ww902.siemens.net (139.22.70.141) with Microsoft SMTP
	Server (TLS) id 14.3.301.0; Fri, 29 Jul 2016 12:57:56 +0200
Received: from DENBGAT9EH2MSX.ww902.siemens.net ([169.254.6.75]) by
	DEFTHW99ERSMSX.ww902.siemens.net ([139.22.70.207]) with mapi id
	14.03.0301.000; Fri, 29 Jul 2016 12:57:56 +0200
From: "Meier, Roger" <r.meier@siemens.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH v3 0/4] license: Sync with SPDX 2.0, pull
	request
Thread-Index: AQHR50fGCeIfK7iAREGNStSKUS7RsaAqsbsAgASDxFqAAAwQPw==
Date: Fri, 29 Jul 2016 10:57:55 +0000
Message-ID: <FB46AF37-B905-4CC6-9594-B768A258470D@siemens.com>
References: <1469539192-18406-1-git-send-email-sergeimir@emcraft.com>
	<1469542336.23580.101.camel@linuxfoundation.org>,
	<55cb9817-d62f-88bf-e886-b1f18549fbff@windriver.com>,
	<892B027B-E61A-49EE-9B15-F84516241426@siemens.com>
In-Reply-To: <892B027B-E61A-49EE-9B15-F84516241426@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: Alexander Dyachenko <sasha_d@emcraft.com>,
	Sergei Miroshnichenko <sergeimir@emcraft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/4] license: Sync with SPDX 2.0, pull request
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
X-List-Received-Date: Fri, 29 Jul 2016 10:58:08 -0000
Content-Language: de-CH
Content-Type: multipart/alternative;
	boundary="_000_FB46AF37B9054CC69594B768A258470Dsiemenscom_"

--_000_FB46AF37B9054CC69594B768A258470Dsiemenscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Now including the list as I'm subscriber now...

Am 29.07.2016 um 11:14 schrieb Meier, Roger (BT CPS R&D ZG FW CCP) <r.meier=
@siemens.com<mailto:r.meier@siemens.com>>:

Hi Mark

Am 26.07.2016 um 16:18 schrieb Mark Hatle <mark.hatle@windriver.com<mailto:=
mark.hatle@windriver.com>>:

On 7/26/16 9:12 AM, Richard Purdie wrote:
On Tue, 2016-07-26 at 16:19 +0300, Sergei Miroshnichenko wrote:
Here are the request for a community review for a synchronization
with the SPDX License List (git.spdx.org/license-list.git<http://git.spdx.o=
rg/license-list.git>) and adding
license operators to meet SPDX 2.0 specification compliance
(https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX
License Expression).

The whole patch series is way too big to send them to the mailing
list (the biggest one is ~3MiB), so please find the diffs via gitweb
of the -contrib repo.

Whilst we certainly want to collaborate with SPDX, we've never said our
LICENSE field should match what SPDX is doing. Your patch appears to
unequivocally join them as a 1:1 mapping and I'm not sure this is
something we've ever planned or agreed to. These fields do get written
into the packages and used in a variety of places.

Certainly if we are going to map them 1:1, this is something which
would need discussion on the OE architecture list first. I'd be nervous
about committing to do that, not knowing or having any influence over
what SPDX may do next.

SPDX is part of linux foundation and they listen to the open source communi=
ties,
Jilayne Lovejoy is maintaining the license list and she is very open minded=
 if we have further questions or have better ideas on the direction of the =
spdx license list itself, e.g. for simpler integration into other systems s=
uch as OE.

Is the intent here to map us 1:1 with SPDX and are you advocating that?

I agree.  This needs to be set as part of the OE Architecture first.  I don=
't
object to the format or contents of the change -- just that it's a pretty b=
ig
change for how things work.
I was not aware of a seperate architecture list, sorry.
The goal here is to reduce efforts on license compliance by using the well =
known SPDX license list.

There are two approaches
* having a SPDX license list beside of the OE license list
* reuse the SPDX license list as suggested via this patch series


Also looking over the patches, the changes to the license text (common-lice=
nses)
need some more explanation.  The comment says it syncs to the spdx license =
list.
But mostly what I see are simply format changes that actually make it harde=
r
for developers to read the license text.
Is there any reference/explanation as to why the formatting changes are
required/suggested/etc?

The licenses are directly from the spdx license list and having them in syn=
c with the spdx license list makes it much easier to maintain in the future=
. Just synch with latest license list as soon as a new version is published=
.
Some licenses do already have some place holders for copyright holders, whi=
ch is part of the license matching rules, that's why you see some special f=
ields, see http://spdx.org/spdx-license-list/matching-guidelines

Best!
Roger


--Mark

Cheers,

Richard



--_000_FB46AF37B9054CC69594B768A258470Dsiemenscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div></div>
<div>Now including the list as I'm subscriber now...</div>
<div><br>
Am 29.07.2016 um 11:14 schrieb Meier, Roger (BT CPS R&amp;D ZG FW CCP) &lt;=
<a href=3D"mailto:r.meier@siemens.com">r.meier@siemens.com</a>&gt;:<br>
<br>
</div>
<blockquote type=3D"cite">
<div>
<div><span></span></div>
<div>
<div></div>
<div>Hi Mark</div>
<div><br>
Am 26.07.2016 um 16:18 schrieb Mark Hatle &lt;<a href=3D"mailto:mark.hatle@=
windriver.com">mark.hatle@windriver.com</a>&gt;:<br>
<br>
</div>
<blockquote type=3D"cite">
<div><span>On 7/26/16 9:12 AM, Richard Purdie wrote:</span><br>
<blockquote type=3D"cite"><span>On Tue, 2016-07-26 at 16:19 &#43;0300, Serg=
ei Miroshnichenko wrote:</span><br>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>Here are the request for a community review=
 for a synchronization</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>with the SPDX License List (<a href=3D"http=
://git.spdx.org/license-list.git">git.spdx.org/license-list.git</a>) and ad=
ding</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>license operators to meet SPDX 2.0 specific=
ation compliance</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>(<a href=3D"https://spdx.org/sites/spdx/fil=
es/SPDX-2.0.pdf">https://spdx.org/sites/spdx/files/SPDX-2.0.pdf</a> Appendi=
x IV: SPDX</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>License Expression).</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span></span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>The whole patch series is way too big to se=
nd them to the mailing
</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>list (the biggest one is ~3MiB), so please =
find the diffs via gitweb
</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><span>of the -contrib repo.</span><br>
</blockquote>
</blockquote>
<blockquote type=3D"cite"><span></span><br>
</blockquote>
<blockquote type=3D"cite"><span>Whilst we certainly want to collaborate wit=
h SPDX, we've never said our</span><br>
</blockquote>
<blockquote type=3D"cite"><span>LICENSE field should match what SPDX is doi=
ng. Your patch appears to</span><br>
</blockquote>
<blockquote type=3D"cite"><span>unequivocally join them as a 1:1 mapping an=
d I'm not sure this is</span><br>
</blockquote>
<blockquote type=3D"cite"><span>something we've ever planned or agreed to. =
These fields do get written</span><br>
</blockquote>
<blockquote type=3D"cite"><span>into the packages and used in a variety of =
places.</span><br>
</blockquote>
<blockquote type=3D"cite"><span></span><br>
</blockquote>
<blockquote type=3D"cite"><span>Certainly if we are going to map them 1:1, =
this is something which</span><br>
</blockquote>
<blockquote type=3D"cite"><span>would need discussion on the OE architectur=
e list first. I'd be nervous</span><br>
</blockquote>
<blockquote type=3D"cite"><span>about committing to do that, not knowing or=
 having any influence over</span><br>
</blockquote>
<blockquote type=3D"cite"><span>what SPDX may do next. </span><br>
</blockquote>
</div>
</blockquote>
<div><br>
</div>
SPDX is part of linux foundation and they listen to the open source communi=
ties,
<div><span style=3D"background-color: rgba(255, 255, 255, 0);">Jilayne Love=
joy is maintaining the license list and she is very open minded if we have =
further questions or have better ideas on the direction of the spdx license=
 list itself, e.g. for simpler integration
 into other systems such as OE.</span><br>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite"><span></span><br>
</blockquote>
<blockquote type=3D"cite"><span>Is the intent here to map us 1:1 with SPDX =
and are you advocating that?</span><br>
</blockquote>
<span></span><br>
<span>I agree. &nbsp;This needs to be set as part of the OE Architecture fi=
rst. &nbsp;I don't</span><br>
<span>object to the format or contents of the change -- just that it's a pr=
etty big</span><br>
<span>change for how things work.</span><br>
</div>
</blockquote>
I was not aware of a seperate architecture list, sorry.
<div>The goal here is to reduce efforts on license compliance by using the =
well known SPDX license list.</div>
<div><br>
<div>There are two approaches</div>
<div>* having a SPDX license list beside of the OE license list</div>
<div>* reuse the SPDX license list as suggested via this patch series</div>
<div><br>
<blockquote type=3D"cite">
<div><span></span><br>
<span>Also looking over the patches, the changes to the license text (commo=
n-licenses)</span><br>
<span>need some more explanation. &nbsp;The comment says it syncs to the sp=
dx license list.</span><br>
<span>But mostly what I see are simply format changes that actually make it=
 harder</span><br>
<span>for developers to read the license text.</span></div>
</blockquote>
<div>
<blockquote type=3D"cite">
<div><span>Is there any reference/explanation as to why the formatting chan=
ges are</span><br>
<span>required/suggested/etc?</span><br>
</div>
</blockquote>
<div><br>
</div>
<span style=3D"background-color: rgba(255, 255, 255, 0);">The licenses are =
directly from the spdx license list and having them in sync with the spdx l=
icense list makes it much easier to maintain in the future. Just synch with=
 latest license list as soon as a
 new version is published.</span>
<div><span style=3D"background-color: rgba(255, 255, 255, 0);">Some license=
s do already have some place holders for copyright holders, which is part o=
f the license matching rules, that's why you see some special fields, see&n=
bsp;</span><a href=3D"http://spdx.org/spdx-license-list/matching-guidelines=
">http://spdx.org/spdx-license-list/matching-guidelines</a></div>
<div><span style=3D"background-color: rgba(255, 255, 255, 0);"><br>
</span></div>
<div><span style=3D"background-color: rgba(255, 255, 255, 0);">Best!</span>=
</div>
<div><span style=3D"background-color: rgba(255, 255, 255, 0);">Roger</span>=
</div>
<div><span style=3D"background-color: rgba(255, 255, 255, 0);"><br>
</span></div>
<blockquote type=3D"cite">
<div><span></span><br>
<span>--Mark</span></div>
</blockquote>
<blockquote type=3D"cite">
<div><span></span><br>
<blockquote type=3D"cite"><span>Cheers,</span><br>
</blockquote>
<blockquote type=3D"cite"><span></span><br>
</blockquote>
<blockquote type=3D"cite"><span>Richard</span><br>
</blockquote>
<blockquote type=3D"cite"><span></span><br>
</blockquote>
<span></span><br>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</body>
</html>

--_000_FB46AF37B9054CC69594B768A258470Dsiemenscom_--
