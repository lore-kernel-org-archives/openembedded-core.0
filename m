Return-Path: <philippe.coval@astrolabe.coop>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C4FC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:49:35 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.9096.1664452171934826859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 04:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@astrolabe.coop header.s=gm1 header.b=Ycu2z0B9;
 spf=pass (domain: astrolabe.coop, ip: 217.70.178.232,
 mailfrom: philippe.coval@astrolabe.coop)
Received: (Authenticated sender: philippe.coval@astrolabe.coop)
	by mail.gandi.net (Postfix) with ESMTPSA id 33E57200010;
	Thu, 29 Sep 2022 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astrolabe.coop;
	s=gm1; t=1664452169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=JRjDB5iAEYu9vd06R6o/P6QoimkB0dTIaDJGc1CoPf4=;
	b=Ycu2z0B9nN1cbaosf7ELNXAYvQKi1pn28qUou61dmfkUL7xSGg5MqtuhDi22M5v6HcZyXi
	BePB/nceknP5x0EWdeUP/S8eGPTEVFnGUp7ShEPMs9nns9hs3M8d+pGKc4jYdBlGyp27XI
	0ZcDBkQHGDxdSU1i45GVI/ay857hgOc6/CHEjZgyhnZv7HoaJ2QHFGME3TE2YkhsaCvze2
	IL6a4I5nuih0vFhvUGQa8Q1iNavOQAvxN2K8LSogho7WWFHHvu5OlDof1kBt5iLGgf4gSV
	Tup4dEB8TOaAjF2iH5J5LtDD9wwRClPrmOcwr6lVhW5NTcwals2kkjq0XncmAA==
From: =?utf-8?q?philippe.coval=40astrolabe.coop?=
 <philippe.coval@astrolabe.coop>
In-Reply-To: 
 <CA+chaQe5hFd58fpAJFGOcVC-ucJ4qMqXHynYAeTzqu034w_=MA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-11606-1664452168.980444-145------"
X-Forward: 127.0.0.1
Date: Thu, 29 Sep 2022 13:49:28 +0200
Cc: openembedded-core@lists.openembedded.org,
 philippe.coval.pro+openembedded-core-lists.yoctoproject.org@gmail.com,
 "Philippe Coval" <philippe.coval@huawei.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
MIME-Version: 1.0
Message-ID: <2d56-63358680-10f-685e3180@236193258>
Subject: =?utf-8?q?Re=3A?= [OE-core] [openembedded-core][PATCH]
 =?utf-8?q?graphics=3A?= Hotfix for eGalax Touchscreen
User-Agent: SOGoMail 5.5.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 11:49:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171184

------=_=-_OpenGroupware_org_NGMime-11606-1664452168.980444-145------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 3703


Hi,
Yes sorry I sent it in a rush
it's not ready and should be reworked to be reviewed :)

But I am wondering if this is the right project to share it?

For the record I proposed it upstream (in libinput) and downstream (oni=
ro),
but it was not merged because it's specific to some hardware that both =
projects do not support.

If not anyone can take and maintain this patch elsewhere...

Sorry for noise


On Thursday, September 29, 2022 12:50 CEST, Martin Jansa <martin.jansa@=
gmail.com> wrote:
=C2=A0Was this sent by accident? The overrides are all wrong and recipe=
 from oe-core surely shouldn't have a .bbappend in oe-core.=C2=A0On Thu=
, Sep 29, 2022 at 11:58 AM <philippe.coval@astrolabe.coop> wrote:From: =
Philippe Coval <philippe.coval@astrolabe.coop>

For unsupported screens (which X axis is inverted)

For the record issue was observed with this CVL1010 device:

http://www.cartft.com/en/catalog/il/1589#

For more details check related links:

Forwarded: https://lists.openembedded.org/g/openembedded-core/search?q=3D=
philippe.coval
Relate-to: https://gitlab.freedesktop.org/libinput/libinput/-/issues/66=
5
Relate-to: https://at.projects.genivi.org/jira/si/jira.issueviews:issue=
-html/GDP-19/GDP-19.html
Relate-to: https://git.ostc-eu.org/OSTC/planning/blueprints/-/issues/22=

Origin: https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/merge=5Frequests/=
288
Signed-off-by: Philippe Coval <philippe.coval@huawei.com>
Signed-off-by: Philippe Coval <philippe.coval@astrolabe.coop>
---
=C2=A0.../wayland/libinput/90-usb-0eef-0001.rules=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +
=C2=A0meta/recipes-graphics/wayland/libinput=5F%.bbappend=C2=A0 =C2=A0|=
 13 +++++++++++++
=C2=A02 files changed, 14 insertions(+)
=C2=A0create mode 100644 meta/recipes-graphics/wayland/libinput/90-usb-=
0eef-0001.rules
=C2=A0create mode 100644 meta/recipes-graphics/wayland/libinput=5F%.bba=
ppend

diff --git a/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.ru=
les b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
new file mode 100644
index 0000000000..354629dbbb
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/90-usb-0eef-0001.rules
@@ -0,0 +1 @@
+ACTION=3D=3D"add|change", KERNEL=3D=3D"event[0-9]*", ENV{ID=5FVENDOR=5F=
ID}=3D=3D"0eef", ENV{ID=5FMODEL=5FID}=3D=3D"0001", ENV{ID=5FINPUT=5FTOU=
CHSCREEN}=3D"1", ENV{ID=5FINPUT=5FTABLET}=3D"0", ENV{ID=5FINPUT=5FMOUSE=
}=3D"0", ENV{LIBINPUT=5FCALIBRATION=5FMATRIX}=3D"-1 0 1 0 1 0"
diff --git a/meta/recipes-graphics/wayland/libinput=5F%.bbappend b/meta=
/recipes-graphics/wayland/libinput=5F%.bbappend
new file mode 100644
index 0000000000..281b499624
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput=5F%.bbappend
@@ -0,0 +1,13 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+# SPDX-License-Identifier: Apache-2.0
+
+FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/${PN}:"
+
+SRC=5FURI +=3D "file://90-usb-0eef-0001.rules"
+
+do=5Finstall=5Fappend() {
+=C2=A0 =C2=A0 install -d=C2=A0 "${D}/${sysconfdir}/udev/rules.d"
+=C2=A0 =C2=A0 install -m444 "${WORKDIR}/90-usb-0eef-0001.rules" "${D}/=
${sysconfdir}/udev/rules.d/"
+}
+
+FILES=5F${PN} +=3D "${sysconfdir}/udev/rules.d/90-usb-0eef-0001.rules"=

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#171179): https://lists.openembedded.org/g/openembed=
ded-core/message/171179
Mute This Topic: https://lists.openembedded.org/mt/93991089/3617156
Group Owner: openembedded-core+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Martin.Jansa@gmail.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=C2=A0


=C2=A0

------=_=-_OpenGroupware_org_NGMime-11606-1664452168.980444-145------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 6200

<html>Hi,<br />Yes sorry I sent it in a rush<br />it's not ready and sh=
ould be reworked to be reviewed :)<br /><br />But I am wondering if thi=
s is the right project to share it?<br /><br />For the record I propose=
d it upstream (in libinput) and downstream (oniro),<br />but it was not=
 merged because it's specific to some hardware that both projects do no=
t support.<br /><br />If not anyone can take and maintain this patch el=
sewhere...<br /><br />Sorry for noise<br /><br /><br />On Thursday, Sep=
tember 29, 2022 12:50 CEST, Martin Jansa &lt;martin.jansa@gmail.com&gt;=
 wrote:<br />&nbsp;<blockquote type=3D"cite" cite=3D"CA+chaQe5hFd58fpAJ=
FGOcVC-ucJ4qMqXHynYAeTzqu034w=5F=3DMA@mail.gmail.com"><div dir=3D"ltr">=
Was this sent by accident? The overrides are all wrong and recipe from =
oe-core surely shouldn't have a .bbappend in oe-core.</div>&nbsp;<div c=
lass=3D"gmail=5Fquote"><div dir=3D"ltr" class=3D"gmail=5Fattr">On Thu, =
Sep 29, 2022 at 11:58 AM &lt;<a href=3D"mailto:philippe.coval@astrolabe=
.coop">philippe.coval@astrolabe.coop</a>&gt; wrote:</div><blockquote cl=
ass=3D"gmail=5Fquote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Philippe Coval &lt;<a t=
arget=3D"=5Fblank" href=3D"mailto:philippe.coval@astrolabe.coop">philip=
pe.coval@astrolabe.coop</a>&gt;<br /><br />For unsupported screens (whi=
ch X axis is inverted)<br /><br />For the record issue was observed wit=
h this CVL1010 device:<br /><br /><a rel=3D"noreferrer" target=3D"=5Fbl=
ank" href=3D"http://www.cartft.com/en/catalog/il/1589#">http://www.cart=
ft.com/en/catalog/il/1589#</a><br /><br />For more details check relate=
d links:<br /><br />Forwarded: <a rel=3D"noreferrer" target=3D"=5Fblank=
" href=3D"https://lists.openembedded.org/g/openembedded-core/search?q=3D=
philippe.covalRelate-to">https://lists.openembedded.org/g/openembedded-=
core/search?q=3Dphilippe.coval<br />Relate-to</a>: <a rel=3D"noreferrer=
" target=3D"=5Fblank" href=3D"https://gitlab.freedesktop.org/libinput/l=
ibinput/-/issues/665Relate-to">https://gitlab.freedesktop.org/libinput/=
libinput/-/issues/665<br />Relate-to</a>: <a rel=3D"noreferrer" target=3D=
"=5Fblank" href=3D"https://at.projects.genivi.org/jira/si/jira.issuevie=
ws:issue-html/GDP-19/GDP-19.html">https://at.projects.genivi.org/jira/s=
i/jira.issueviews:issue-html/GDP-19/GDP-19.html</a><br />Relate-to: <a =
rel=3D"noreferrer" target=3D"=5Fblank" href=3D"https://git.ostc-eu.org/=
OSTC/planning/blueprints/-/issues/22">https://git.ostc-eu.org/OSTC/plan=
ning/blueprints/-/issues/22</a><br />Origin: <a rel=3D"noreferrer" targ=
et=3D"=5Fblank" href=3D"https://git.ostc-eu.org/OSTC/OHOS/meta-ohos/-/m=
erge=5Frequests/288Signed-off-by">https://git.ostc-eu.org/OSTC/OHOS/met=
a-ohos/-/merge=5Frequests/288<br />Signed-off-by</a>: Philippe Coval &l=
t;<a target=3D"=5Fblank" href=3D"mailto:philippe.coval@huawei.com">phil=
ippe.coval@huawei.com</a>&gt;<br />Signed-off-by: Philippe Coval &lt;<a=
 target=3D"=5Fblank" href=3D"mailto:philippe.coval@astrolabe.coop">phil=
ippe.coval@astrolabe.coop</a>&gt;<br />---<br />&nbsp;.../wayland/libin=
put/90-usb-0eef-0001.rules&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +=
<br />&nbsp;meta/recipes-graphics/wayland/libinput=5F%.bbappend&nbsp; &=
nbsp;| 13 +++++++++++++<br />&nbsp;2 files changed, 14 insertions(+)<br=
 />&nbsp;create mode 100644 meta/recipes-graphics/wayland/libinput/90-u=
sb-0eef-0001.rules<br />&nbsp;create mode 100644 meta/recipes-graphics/=
wayland/libinput=5F%.bbappend<br /><br />diff --git a/meta/recipes-grap=
hics/wayland/libinput/90-usb-0eef-0001.rules b/meta/recipes-graphics/wa=
yland/libinput/90-usb-0eef-0001.rules<br />new file mode 100644<br />in=
dex 0000000000..354629dbbb<br />--- /dev/null<br />+++ b/meta/recipes-g=
raphics/wayland/libinput/90-usb-0eef-0001.rules<br />@@ -0,0 +1 @@<br /=
>+ACTION=3D=3D"add|change", KERNEL=3D=3D"event[0-9]*", ENV{ID=5FVENDOR=5F=
ID}=3D=3D"0eef", ENV{ID=5FMODEL=5FID}=3D=3D"0001", ENV{ID=5FINPUT=5FTOU=
CHSCREEN}=3D"1", ENV{ID=5FINPUT=5FTABLET}=3D"0", ENV{ID=5FINPUT=5FMOUSE=
}=3D"0", ENV{LIBINPUT=5FCALIBRATION=5FMATRIX}=3D"-1 0 1 0 1 0"<br />dif=
f --git a/meta/recipes-graphics/wayland/libinput=5F%.bbappend b/meta/re=
cipes-graphics/wayland/libinput=5F%.bbappend<br />new file mode 100644<=
br />index 0000000000..281b499624<br />--- /dev/null<br />+++ b/meta/re=
cipes-graphics/wayland/libinput=5F%.bbappend<br />@@ -0,0 +1,13 @@<br /=
>+# SPDX-FileCopyrightText: Huawei Inc.<br />+# SPDX-License-Identifier=
: Apache-2.0<br />+<br />+FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/${=
PN}:"<br />+<br />+SRC=5FURI +=3D "file://90-usb-0eef-0001.rules"<br />=
+<br />+do=5Finstall=5Fappend() {<br />+&nbsp; &nbsp; install -d&nbsp; =
"${D}/${sysconfdir}/udev/rules.d"<br />+&nbsp; &nbsp; install -m444 "${=
WORKDIR}/90-usb-0eef-0001.rules" "${D}/${sysconfdir}/udev/rules.d/"<br =
/>+}<br />+<br />+FILES=5F${PN} +=3D "${sysconfdir}/udev/rules.d/90-usb=
-0eef-0001.rules"<br />--<br />2.34.1<br /><br /><br />-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />Links: You receive all messages sent=
 to this group.<br />View/Reply Online (#171179): <a rel=3D"noreferrer"=
 target=3D"=5Fblank" href=3D"https://lists.openembedded.org/g/openembed=
ded-core/message/171179">https://lists.openembedded.org/g/openembedded-=
core/message/171179</a><br />Mute This Topic: <a rel=3D"noreferrer" tar=
get=3D"=5Fblank" href=3D"https://lists.openembedded.org/mt/93991089/361=
7156">https://lists.openembedded.org/mt/93991089/3617156</a><br />Group=
 Owner: <a target=3D"=5Fblank" href=3D"mailto:openembedded-core%2Bowner=
@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org=
</a><br />Unsubscribe: <a rel=3D"noreferrer" target=3D"=5Fblank" href=3D=
"https://lists.openembedded.org/g/openembedded-core/unsub">https://list=
s.openembedded.org/g/openembedded-core/unsub</a> [<a target=3D"=5Fblank=
" href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>]<br=
 />-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />&nbsp;</blockquot=
e></div></blockquote><br /><br /><br />&nbsp;</html>

------=_=-_OpenGroupware_org_NGMime-11606-1664452168.980444-145--------


