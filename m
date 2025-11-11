Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ECBCCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:43:25 +0000 (UTC)
Subject: Question about merger process for patches under different branch 
To: openembedded-core@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: IN (1.7.20.122)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:43:19 -0800
Message-ID: <3Q2y.1762836199203901249.LEbU@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RWGvEP7RMyLtm3rQ8eso"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 04:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226145

--RWGvEP7RMyLtm3rQ8eso
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I am trying to get a better picture so that we avoid un-necessary message w=
hich interrupts the branch maintainer's
Can team please confirm if I am understanding usage of below branches corre=
ct:

1) meta-openembedded-contrib
The patches which are being "considered" or "scheduled" to be tested for me=
rge can be seen from these branches
From these patches, whichever passes the auto-build will then move to branc=
h-next
*The presence of patches here can be considered as "patch considered for au=
to build and testing for respective branch "*
To know which patches are scheduled for next test , we can look at
master=C2=A0 =C2=A0 =C2=A0 : https://git.openembedded.org/meta-openembedded=
-contrib/log/?h=3Djansa/master ( https://git.openembedded.org/meta-openembe=
dded-contrib/log/?h=3Djansa/master )
scarthgap : https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Djansa/scarthgap
kirkstone=C2=A0 : https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Djansa/kirkstone

2) branch-next @ meta-openembedded
These are the patches which have been tested & will shortly be added in the=
ir respective branch
*But the presence of patches here can be considered as "merged" in respecti=
ve branch*

master=C2=A0 =C2=A0 =C2=A0 =C2=A0: https://git.openembedded.org/meta-openem=
bedded/log/?h=3Dmaster-next
scarthgap : https://git.openembedded.org/meta-openembedded/log/?h=3Dscarthg=
ap-next
kirkstone=C2=A0 : https://git.openembedded.org/meta-openembedded/log/?h=3Dk=
irkstone-next

3) Any ball mark, how much time we can consider it takes for patches to be =
available in respective branch from "branch-next".

Thanks ,
Ashish Kumar Mishra

--RWGvEP7RMyLtm3rQ8eso
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi Team,&nbsp;</div>
<div>&nbsp;</div>
<div>I am trying to get a better picture so that we avoid un-necessary mess=
age which interrupts the branch maintainer's</div>
<div>Can team please confirm if I am understanding usage of below branches =
correct:</div>
<div>&nbsp;</div>
<div>1) <span style=3D"text-decoration: underline;">meta-openembedded-contr=
ib</span></div>
<div>&nbsp; &nbsp; The patches which are being "considered" or "scheduled" =
to be tested for merge can be seen from these branches&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;From these patches, whichever passes the auto-buil=
d will then move to branch-next&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp; <strong>The presence of patches here can be consider=
ed as "patch considered for auto build and testing for respective branch "&=
nbsp;</strong></span></div>
<div><span style=3D"white-space: normal;">&nbsp; &nbsp; &nbsp;To know which=
 patches are scheduled for next test , we can look at&nbsp;</span></div>
<div>&nbsp; &nbsp; &nbsp;master&nbsp; &nbsp; &nbsp; : <a href=3D"https://gi=
t.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/master" target=
=3D"_blank" rel=3D"noopener">https://git.openembedded.org/meta-openembedded=
-contrib/log/?h=3Djansa/master&nbsp;</a>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;scarthgap : <a href=3D"https://git.openembedded.or=
g/meta-openembedded-contrib/log/?h=3Djansa/scarthgap" target=3D"_blank" rel=
=3D"noopener">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Djansa/scarthgap</a>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;kirkstone&nbsp; : <a href=3D"https://git.openembed=
ded.org/meta-openembedded-contrib/log/?h=3Djansa/kirkstone" target=3D"_blan=
k" rel=3D"noopener">https://git.openembedded.org/meta-openembedded-contrib/=
log/?h=3Djansa/kirkstone</a>&nbsp;</div>
<div>&nbsp;</div>
<div>2)<span style=3D"text-decoration: underline;"> branch-next @ meta-open=
embedded</span></div>
<div>&nbsp; &nbsp; These are the patches which have been tested &amp; will =
shortly be added in their respective branch&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span><span style=3D"text-decoration: underline;"><strong>But the presen=
ce of patches here can be considered as "merged" in respective branch&nbsp;=
</strong></span></span></div>
<div><span style=3D"white-space: normal;"> </span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>master&nbsp; &nbsp; &nbsp; &nbsp;: <a href=3D"https://git.openembe=
dded.org/meta-openembedded/log/?h=3Dmaster-next" target=3D"_blank" rel=3D"n=
oopener">https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-nex=
t</a>&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>scarthgap : <a href=3D"https://git.openembedded.org/meta-openembed=
ded/log/?h=3Dscarthgap-next" target=3D"_blank" rel=3D"noopener">https://git=
.openembedded.org/meta-openembedded/log/?h=3Dscarthgap-next</a>&nbsp;</span=
></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>kirkstone&nbsp; : <a href=3D"https://git.openembedded.org/meta-ope=
nembedded/log/?h=3Dkirkstone-next" target=3D"_blank" rel=3D"noopener">https=
://git.openembedded.org/meta-openembedded/log/?h=3Dkirkstone-next</a></span=
></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"> </span></div>
<div>3) Any ball mark, <span style=3D"text-decoration: underline;">how much=
 time we can consider it takes for patches to be available in respective br=
anch from "branch-next".</span></div>
<div>&nbsp;</div>
<div>Thanks ,</div>
<div>Ashish Kumar Mishra&nbsp;</div>
<div>&nbsp;</div>
</div>

--RWGvEP7RMyLtm3rQ8eso--

