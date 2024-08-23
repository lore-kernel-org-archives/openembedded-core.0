Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA4C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:18:05 +0000 (UTC)
Subject: Re: [master][scarthgap][PATCH] wpa-supplicant: Upgrade 2.10 -> 2.11
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: IN (157.32.46.111)
X-Originating-Platform: Linux Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 Aug 2024 10:17:59 -0700
References: <CANNYZj_k-QHOXH-qEu69HTBcza1d3zge6LQkH5JmbxWYmyJVtw@mail.gmail.com>
In-Reply-To: <CANNYZj_k-QHOXH-qEu69HTBcza1d3zge6LQkH5JmbxWYmyJVtw@mail.gmail.com>
Message-ID: <5008.1724433479274681997@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hbOHMv4wrzc0mJaLH5uI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 17:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203703

--hbOHMv4wrzc0mJaLH5uI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy and Alex,

I appreciate the feedback and your concern regarding upgrades in stable-bra=
nches.

>=20
> This update make sense for the master brnanch but likely not for scarthga=
p
> unless you can show that
> this is a bug fix only release.
>=20

- This release for sure is not a bug fix only release. It does include supp=
ort to new feature and can never classify as bug fix only release.

>=20
> you'll have to backport any CVE fixes that you're interested in unless
> someone explains why this is a sensible update for scarthgap.
>=20
>=20

- I do the understand that upgrades are avoided in stable/LTS branches as i=
t might break the compatibility and result in various compilation issues.
- However, that would only take place if the backward compatibility of the =
new upgrade is questionable.
- Generally every new releases will have API or ABI-symbols added but if AP=
I or ABI symbols are removed from shared libraries or binaries it a matter =
of concern as it would be the cause of breakdown.
- For this release, there are no ABI-symbols or API removed from the binari=
es and shared libraries. you can cross-check it in different ways (there ar=
e open-source tools to check or can be checked by manually comparing the he=
ader files)
- I have my own script to do so and i always check the backward compatibili=
ty before submitting any upgrades and since it was all clear for wpa-suppli=
cant, i went ahead with the upgrade.

However, if still the opinion is that upgrade should be avoided, let me kno=
w, i would submit the CVE-patch for the same.

Regards,
Siddharth

--hbOHMv4wrzc0mJaLH5uI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Randy and Alex,</div>
<div>&nbsp;</div>
<div>I appreciate the feedback and your concern regarding upgrades in stabl=
e-branches.</div>
<div>&nbsp;</div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">This update make sense for the master brnanch but likely not f=
or scarthgap unless you can show that</span><br style=3D"box-sizing: border=
-box; overflow-wrap: break-word !important; color: #333333; font-family: sy=
stem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation San=
s', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sym=
bol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: normal; background-color: #ffffff; text-decoration-thickness: ini=
tial; text-decoration-style: initial; text-decoration-color: initial;" /><s=
pan style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'H=
elvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple C=
olor Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-=
size: 16px; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-co=
lor: #ffffff; text-decoration-thickness: initial; text-decoration-style: in=
itial; text-decoration-color: initial; display: inline !important; float: n=
one;">this is a bug fix only release.&nbsp;</span></div>
</blockquote>
<div>- This release for sure is not a bug fix only release. It does include=
 support to new feature and can never classify as&nbsp; <span style=3D"back=
ground-color: #ffffff;">bug fix only release.&nbsp;</span></div>
<blockquote>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span style=3D"color: #333333; font-family: system-ui, 'Segoe =
UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Colo=
r Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; display: inline !impo=
rtant; float: none;">you'll have to backport any CVE fixes that you're inte=
rested in unless</span><br style=3D"box-sizing: border-box; overflow-wrap: =
break-word !important; color: #333333; font-family: system-ui, 'Segoe UI', =
Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emo=
ji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;" /><span style=3D"color: #=
333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto=
 Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe U=
I Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: normal; background-color: #ffffff; text-de=
coration-thickness: initial; text-decoration-style: initial; text-decoratio=
n-color: initial; display: inline !important; float: none;">someone explain=
s why this is a sensible update for scarthgap.</span></span></div>
<div>&nbsp;</div>
</blockquote>
<div>- I do the understand that upgrades are avoided in stable/LTS branches=
 as it might break the compatibility and result in various compilation issu=
es.</div>
<div>- However, that would only take place if the backward compatibility of=
 the new upgrade is questionable.</div>
<div>- Generally every new releases will have API or ABI-symbols added but =
if API or ABI symbols are removed from shared libraries or binaries it a ma=
tter of concern as it would be the cause of breakdown.</div>
<div>- For this release, there are no ABI-symbols or API removed from the b=
inaries and shared libraries. you can cross-check it in different ways (the=
re are open-source tools to check or can be checked by manually comparing t=
he header files)<br />- I have my own script to do so and i always check th=
e backward compatibility before submitting any upgrades and since it was al=
l clear for wpa-supplicant, i went ahead with the upgrade.<br /><br />Howev=
er, if still the opinion is that upgrade should be avoided, let me know, i =
would submit the CVE-patch for the same.<br /><br />Regards,</div>
<div>Siddharth</div>

--hbOHMv4wrzc0mJaLH5uI--

