Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C49C977208
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 13:29:59 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cH9dA-00040j-G1 from Awais_Belal@mentor.com ;
	Wed, 14 Dec 2016 05:30:00 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Wed, 14 Dec 2016 13:29:57 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Wed, 14 Dec 2016 13:29:57 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] grub_git: extend recipe for proper target
	deployment
Thread-Index: AQHSVUvSV9G8LvsP8EWmyzHmbHpAe6EHcSqx
Date: Wed, 14 Dec 2016 13:29:57 +0000
Message-ID: <1481722196426.25330@mentor.com>
References: <1481627960-3608-1-git-send-email-awais_belal@mentor.com>,
	<CAJTo0LZOSS8nYB9ooPsSJGkuBU5=pvzCTUAKVXSEUR=f7kgjDg@mail.gmail.com>
In-Reply-To: <CAJTo0LZOSS8nYB9ooPsSJGkuBU5=pvzCTUAKVXSEUR=f7kgjDg@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub_git: extend recipe for proper target deployment
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
X-List-Received-Date: Wed, 14 Dec 2016 13:30:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_148172219642625330mentorcom_"

--_000_148172219642625330mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ross,


>> +RDEPENDS_${PN}_class-target =3D "diffutils freetype"
> Does this really need to be class-target-specific?


Without the class-target override I get


ERROR: Nothing RPROVIDES 'diffutils-native' (but virtual:native:/data/amd_y=
octo/poky/meta/recipes-bsp/grub/grub_git.bb RDEPENDS on or otherwise requir=
es it)


so I believe this is necessary in this case. Are you through your review? I=
f so, just let me know and I'll send a v2 fixing the other DEPENDS issue yo=
u pointed out.


BR,
Awais
________________________________
From: Burton, Ross <ross.burton@intel.com>
Sent: Tuesday, December 13, 2016 7:17 PM
To: Belal, Awais
Cc: OE-core
Subject: Re: [OE-core] [PATCH 1/2] grub_git: extend recipe for proper targe=
t deployment


On 13 December 2016 at 11:19, Awais Belal <awais_belal@mentor.com<mailto:aw=
ais_belal@mentor.com>> wrote:
+DEPENDS_class-target +=3D "grub-native"

The native magic won't generate dependencies on itself, so this can just be=
 DEPENDS.

+RDEPENDS_${PN}_class-target =3D "diffutils freetype"

Does this really need to be class-target-specific?

Ross

--_000_148172219642625330mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:10pt;color:#000000;background-color:#F=
FFFFF;font-family:Tahoma,Geneva,sans-serif;">
<p>Hi Ross,</p>
<p><br>
</p>
<p>&gt;&gt; &#43;RDEPENDS_${PN}_class-target =3D &quot;diffutils freetype&q=
uot; <br>
&gt; Does this really need to be class-target-specific?<br>
<br>
</p>
<p>Without the class-target override I get</p>
<p><br>
</p>
<p>ERROR: Nothing RPROVIDES 'diffutils-native' (but virtual:native:/data/am=
d_yocto/poky/meta/recipes-bsp/grub/grub_git.bb RDEPENDS on or otherwise req=
uires it)</p>
<p><br>
</p>
<p>so I believe this is necessary in this case. Are you through your review=
? If so, just let me know and I'll send a v2 fixing the other DEPENDS issue=
 you pointed out.<br>
</p>
<p><br>
</p>
<div id=3D"Signature">
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div style=3D"color: rgb(33, 33, 33);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" color=
=3D"#000000" face=3D"Calibri, sans-serif"><b>From:</b> Burton, Ross &lt;ros=
s.burton@intel.com&gt;<br>
<b>Sent:</b> Tuesday, December 13, 2016 7:17 PM<br>
<b>To:</b> Belal, Awais<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/2] grub_git: extend recipe for prope=
r target deployment</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 13 December 2016 at 11:19, Awais Belal <span =
dir=3D"ltr">
&lt;<a href=3D"mailto:awais_belal@mentor.com" target=3D"_blank">awais_belal=
@mentor.com</a>&gt;</span> wrote:&nbsp;</div>
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left-width:1px; border-left-color:rgb(204,204,204); border-left-style:soli=
d; padding-left:1ex">
<div id=3D"gmail-:3nk" class=3D"gmail-a3s gmail-aXjCH gmail-m158f7e9ba465a9=
98">&#43;DEPENDS_class-target &#43;=3D &quot;grub-native&quot;<br>
</div>
</blockquote>
<div><br>
</div>
<div>The native magic won't generate dependencies on itself, so this can ju=
st be DEPENDS.</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left-width:1px; border-left-color:rgb(204,204,204); border-left-style:soli=
d; padding-left:1ex">
<div id=3D"gmail-:3nk" class=3D"gmail-a3s gmail-aXjCH gmail-m158f7e9ba465a9=
98">&#43;RDEPENDS_${PN}_class-target =3D &quot;diffutils freetype&quot;</di=
v>
</blockquote>
</div>
<br>
Does this really need to be class-target-specific?</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</body>
</html>

--_000_148172219642625330mentorcom_--
