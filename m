Subject: Re: [PATCH] rpm: disable the RPM 6 script interpreter dependency generator
To: openembedded-core@lists.openembedded.org
From: "Roshan Sivakumar" <roshs@qti.qualcomm.com>
X-Originating-Location: IN (202.46.23.22)
X-Originating-Platform: Windows Edge 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 00:37:40 -0700
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
In-Reply-To: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
Message-ID: <2475665.1792741060655588968@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="K0sLv8tQZjp1QephONbk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248487

--K0sLv8tQZjp1QephONbk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I believe this dependency belongs here: openembedded-core/meta/recipes-kern=
el/linux/kernel-devsrc.bb at master =C2=B7 openembedded/openembedded-core (=
 https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-kernel/linux/kernel-devsrc.bb#L460 )

RDEPENDS:${PN} +=3D "sed" in the above recipe is the right way to do it?

There should probably be a separate patch to satisfy that dependency.

--K0sLv8tQZjp1QephONbk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web =
(West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neu=
e', sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
normal; background-color: #ffffff; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;">I believe this dependency belongs here: </span><=
a style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-eas=
t-asian: inherit; font-variant-alternates: inherit; font-variant-position: =
inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch: inher=
it; font-size: 15px; line-height: inherit; font-family: 'Segoe UI', 'Segoe =
UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvet=
ica Neue', sans-serif; font-optical-sizing: inherit; font-size-adjust: inhe=
rit; font-kerning: inherit; font-feature-settings: inherit; font-variation-=
settings: inherit; font-language-override: inherit; margin: 0px; padding: 0=
px; vertical-align: baseline; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #ffffff;" title=3D"https://github.com/openembedded/openembedded-core/blob/=
master/meta/recipes-kernel/linux/kernel-devsrc.bb#L460" href=3D"https://git=
hub.com/openembedded/openembedded-core/blob/master/meta/recipes-kernel/linu=
x/kernel-devsrc.bb#L460" data-auth=3D"NotApplicable" data-linkindex=3D"0">o=
penembedded-core/meta/recipes-kernel/linux/kernel-devsrc.bb at master &midd=
ot; openembedded/openembedded-core</a><br style=3D"color: #242424; font-fam=
ily: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSys=
temFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 15px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;" /><br style=3D"color: #242424; font-family: 'Segoe UI', 'S=
egoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'H=
elvetica Neue', sans-serif; font-size: 15px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<span style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (West=
 European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', s=
ans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;">RDEPENDS:${PN} +=3D "sed" in the above recipe is the =
right way to do it?&nbsp;</span><br style=3D"color: #242424; font-family: '=
Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFon=
t, Roboto, 'Helvetica Neue', sans-serif; font-size: 15px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: normal; background-color: #ffffff; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial;" /><br style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe U=
I Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helveti=
ca Neue', sans-serif; font-size: 15px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: normal; background-color: #ffffff; text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;" /><span =
style=3D"color: #242424; font-family: 'Segoe UI', 'Segoe UI Web (West Europ=
ean)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-se=
rif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial; display: inline !important=
; float: none;">There should probably be a separate patch to satisfy that d=
ependency.</span></div>

--K0sLv8tQZjp1QephONbk--
