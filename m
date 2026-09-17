Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B806BC982D6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:33:13 +0000 (UTC)
Subject: Re: [wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: Rajkot, Gujarat, IN (157.32.46.1)
X-Originating-Platform: Linux Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 07:33:11 -0700
References: <20260917105551.76512-1-vanusuri@mvista.com> <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr> <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev> <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
In-Reply-To: <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
Message-ID: <546192.1789655591562202413@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ll0T9SEUipqLUJlVtzEj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246070

--ll0T9SEUipqLUJlVtzEj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Paul and Vijay,

v3.4.1-sec-patches3 and v3.2.7-sec-patches3 both the branches are part of o=
fficial security release afaik.

these versions corresponds to ubuntu/launchpad PPA for racoon and noble res=
pectively so i see them being maintained till 2031 and 2029 atleast(unless =
ubuntu decides on bumping those versions up in unforseen situations).

with that being said, yes it is trade-off between maintaining 34 kLOC patch=
 and minor upgrade which we need to figure out.
upgrading to 3.4.4 is less favourable as it still leaves 33 CVE's open and =
for that we would still have a larger patch to maintain rather than patches=
 getting applied directly.

Since rsync does not expose an architecture-wide library ( librsync is a co=
mpletely distinct project), upgrading it will *never break the ABI of other=
 compiled packages* in rootfs. No other binary links against rsync dynamica=
lly at the linker level. on top of it, rsync is maintaining backword compat=
ability. So upgrading to 3.5.x wouldn't be an issue too.

To talk about the regressions in 3.5.0, they are being fixed in 3.5.1 which=
 is planned to release on 21st september.

we have 2 ways in front of us:
1) maintain the 34 kLOC patch for 3.4.1.
Pros: we will mostly have maintainence till 2031( 1 year more than wrynose =
EOL).
cons: large patches to be maintained. (we can locally tar it though but sti=
ll has to be maintained)

2) upgrade the 3.5.1
Pros: no need to maintain large patches and we would be in line with upstre=
am.
Cons: we will be violating the stable upgrade policy of no new features and=
 there are chances we would encounter same situation in future when more CV=
E's are found affecting the newer version.

i am fine with either of the way as one of fellow contributor. But, let me =
know your thoughts.

Regards,
Siddharth

--ll0T9SEUipqLUJlVtzEj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann, Paul and Vijay,<br /><br /></div>
<div><code dir=3D"ltr" style=3D"box-sizing: border-box; font-family: Menlo,=
 Monaco, Consolas, 'Courier New', monospace; font-size: 14.4px; padding: 2p=
x 4px; color: #c7254e; background-color: #f9f2f4; border-radius: 4px; overf=
low-wrap: break-word !important; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
normal; text-decoration-thickness: initial; text-decoration-style: initial;=
 text-decoration-color: initial;"><span style=3D"box-sizing: border-box; ov=
erflow-wrap: break-word !important;">v3.4.1-sec-patches3</span></code><span=
 style=3D"box-sizing: border-box; overflow-wrap: break-word !important; col=
or: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', =
'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Se=
goe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;"><span>&nbsp;</span>and<span>&nbsp;</span></span><co=
de dir=3D"ltr" style=3D"box-sizing: border-box; font-family: Menlo, Monaco,=
 Consolas, 'Courier New', monospace; font-size: 14.4px; padding: 2px 4px; c=
olor: #c7254e; background-color: #f9f2f4; border-radius: 4px; overflow-wrap=
: break-word !important; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;"><span style=3D"box-sizing: border-box; overflow-w=
rap: break-word !important;">v3.2.7-sec-patches3</span></code> both the bra=
nches are part of official security release afaik.<br /><br /></div>
<div>these versions corresponds to ubuntu/launchpad PPA for racoon and nobl=
e respectively so i see them being maintained till 2031 and 2029 atleast(un=
less ubuntu decides on bumping those versions up in unforseen situations).<=
br /><br />with that being said, yes it is trade-off between maintaining <s=
pan style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'H=
elvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple C=
olor Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-=
size: 16px; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-=
color: #ffffff; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial; display: inline !important; float:=
 none;">34 kLOC patch and minor upgrade which we need to figure out.<br />u=
pgrading to 3.4.4 is less favourable as it still leaves 33 CVE's open and f=
or that we would still have a larger patch to maintain rather than patches =
getting applied directly.<br /><br />Since <code class=3D"KDcb0c" dir=3D"lt=
r" style=3D"font-family: monospace; font-size: 14px; font-weight: 400; marg=
in: 0px; text-decoration: none; border-bottom: 0.8px solid #f0f2f5;" data-s=
fc-root=3D"ep" data-complete=3D"true" data-sae=3D"" data-copy-service-compu=
ted-style=3D"font-family: monospace; font-size: 14px; font-weight: 400; mar=
gin: 0px; text-decoration: none; border-bottom: 0.8px solid rgb(240, 242, 2=
45);">rsync<!--TgQPHd|||[]--></code> does not expose an architecture-wide l=
ibrary (<code class=3D"KDcb0c" dir=3D"ltr" style=3D"font-family: monospace;=
 font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; bor=
der-bottom: 0.8px solid #f0f2f5;" data-sfc-root=3D"ep" data-complete=3D"tru=
e" data-sae=3D"" data-copy-service-computed-style=3D"font-family: monospace=
; font-size: 14px; font-weight: 400; margin: 0px; text-decoration: none; bo=
rder-bottom: 0.8px solid rgb(240, 242, 245);">librsync<!--TgQPHd|||[]--></c=
ode> is a completely distinct project), upgrading it will <strong class=3D"=
rQesXe MPyX" style=3D"font-family: 'Google Sans', sans-serif; font-size: 16=
px; font-weight: bold; margin: 0px; text-decoration: none; border-bottom: 0=
px #0a0a0a;" data-sfc-cp=3D"" data-sfc-root=3D"ep" data-complete=3D"true" d=
ata-processed=3D"true" data-copy-service-computed-style=3D"font-family: &qu=
ot;Google Sans&quot;, sans-serif; font-size: 16px; font-weight: 700; margin=
: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">never br=
eak the ABI of other compiled packages<!--TgQPHd|||[]--></strong> in rootfs=
. No other binary links against <code class=3D"KDcb0c" dir=3D"ltr" style=3D=
"font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px; te=
xt-decoration: none; border-bottom: 0.8px solid #f0f2f5;" data-sfc-root=3D"=
ep" data-complete=3D"true" data-sae=3D"" data-copy-service-computed-style=
=3D"font-family: monospace; font-size: 14px; font-weight: 400; margin: 0px;=
 text-decoration: none; border-bottom: 0.8px solid rgb(240, 242, 245);">rsy=
nc<!--TgQPHd|||[]--></code> dynamically at the linker level. on top of it, =
rsync is maintaining backword compatability. So upgrading to 3.5.x wouldn't=
 be an issue too.<br /><br />To talk about the regressions in 3.5.0, they a=
re being fixed in 3.5.1 which is planned to release on 21st september. <br =
/><br />we have 2 ways in front of us:<br />1) maintain the <span style=3D"=
color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue=
', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: pre-wrap; background-color: #fffff=
f; text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial; display: inline !important; float: none;">34 kL=
OC patch for 3.4.1. <br />Pros: we will mostly have maintainence till 2031(=
 1 year more than wrynose EOL). <br />cons: large patches to be maintained.=
 (we can locally tar it though but still has to be maintained)<br /><br />2=
) upgrade the 3.5.1<br />Pros: no need to maintain large patches and we wou=
ld be in line with upstream.<br />Cons: we will be violating the stable upg=
rade policy of no new features and there are chances we would encounter sam=
e situation in future when more CVE's are found affecting the newer version=
.<br /><br />i am fine with either of the way as one of fellow contributor.=
 But, let me know your thoughts.<br /><br />Regards,<br />Siddharth</span><=
/span></div>

--ll0T9SEUipqLUJlVtzEj--

