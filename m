Return-Path: <arnis.juraga@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD1AECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 23:05:16 +0000 (UTC)
Subject: sstate cache SSTATE_PKG generation will silently fail,
 if hardlinking is not supported on the file system #bitbake
To: openembedded-core@lists.openembedded.org
From: "Arnis" <arnis.juraga@gmail.com>
X-Originating-Location: GB (62.209.33.82)
X-Originating-Platform: Windows Firefox 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Sep 2022 16:05:14 -0700
Message-ID: <2xfY.1663283114373399868.FjIK@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="u9RMnozPt6iCSwD1iSNi"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 23:05:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170775

--u9RMnozPt6iCSwD1iSNi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have faced a problem today that sstate-cache `${SSTATE_PKG}` generation w=
ill silently fail on the file systems no supporting hard linking.
I've faced this problem on cloud-based Kubernetes cluster, where persistent=
 volume is mounted to Docker containers as shared sstate-cache location.

Because of https://git.openembedded.org/ openembedded-core/commit/?id=3D 55=
2197a0c4c9f75a9177c00b197ea9 1296ed9fc4 ( https://git.openembedded.org/open=
embedded-core/commit/?id=3D552197a0c4c9f75a9177c00b197ea91296ed9fc4 ) chang=
e

+ ln $TFILE ${SSTATE_PKG} || true

this will leave sstate folder with only `*...tar.zst.siginfo` files generat=
ed, but no "*...tar.zst"

As a temporary solution, I have replaced it with

+ cp $TFILE ${SSTATE_PKG}

which obviously is not ideal.

What would you suggest?

--u9RMnozPt6iCSwD1iSNi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, </div>
<div>&nbsp;</div>
<div>I have faced a problem today that sstate-cache `${SSTATE_PKG}` generat=
ion will silently fail on the file systems no supporting hard linking. </di=
v>
<div>I've faced this problem on cloud-based Kubernetes cluster, where persi=
stent volume is mounted to Docker containers as shared sstate-cache locatio=
n.</div>
<div>&nbsp;</div>
<div>Because of <a href=3D"https://git.openembedded.org/openembedded-core/c=
ommit/?id=3D552197a0c4c9f75a9177c00b197ea91296ed9fc4" target=3D"_blank" rel=
=3D"noopener" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps:=
//git.openembedded.org/openembedded-core/commit/?id%3D552197a0c4c9f75a9177c=
00b197ea91296ed9fc4&amp;source=3Dgmail&amp;ust=3D1663369360388000&amp;usg=
=3DAOvVaw19thelkdCQU5WmqxxPYoSj">https://git.openembedded.org/<wbr />openem=
bedded-core/commit/?id=3D<wbr />552197a0c4c9f75a9177c00b197ea9<wbr />1296ed=
9fc4</a> change </div>
<div>&nbsp;</div>
<div><span style=3D"color: #008000; font-family: monospace; font-size: 13.3=
333px; font-style: normal; font-variant-ligatures: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0=
px; background-color: #ffffff; text-decoration-style: initial; text-decorat=
ion-color: initial; display: inline; float: none;">+ ln $TFILE ${SSTATE_PKG=
} || true</span> </div>
<div>&nbsp;</div>
<div>this will leave sstate folder with only `*...tar.zst.siginfo` files ge=
nerated, but no "*...tar.zst" </div>
<div>&nbsp;</div>
<div>As a temporary solution, I have replaced it with</div>
<div>&nbsp;</div>
<div><span style=3D"color: #008000; font-family: monospace; font-size: 13.3=
333px; font-style: normal; font-variant-ligatures: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0=
px; background-color: #ffffff; text-decoration-style: initial; text-decorat=
ion-color: initial; display: inline; float: none;">+ cp $TFILE ${SSTATE_PKG=
}</span></div>
<div>&nbsp;</div>
<div>which obviously is not ideal.</div>
<div>&nbsp;</div>
What would you suggest?

--u9RMnozPt6iCSwD1iSNi--

