Return-Path: <minipada@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 27DE177D24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 19:10:24 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id y190so14038092vkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Xhb87FP7Q2RIxXkBEGBXaXU6tkGaMpExzbdzNEt8mxQ=;
	b=b1oiCFUsM3fwXMwW1eID3WuC3rVKQtnXnyaTRz11v4SrNMoTTnTmrgUNDkmkdzkMkR
	HWZc142Y+EUv5h/c7TX8xSCSqjbZU0xa2U0uS2ptcuJEmFQpdv1lFIqgQQBTTI5ZIVVy
	8a9j+BLIm+wOUukI/amQoI67h35W9y2/ateGPlk0XjCIjNKnHhvF6WpRYgjFwn1QIw0q
	zd1dsdnN3fwZ034eH+tyCn3mRivoljN6DOpIGRIyUeYj4NqYxZrIpPajdU87rzRiN2G3
	ADwe3/eo1OlVCxnbLV5qESaYQ1gq1P7xA8NAj3PkTQ7EECU1xvo8h6NbqWMNp335yzJd
	ecIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Xhb87FP7Q2RIxXkBEGBXaXU6tkGaMpExzbdzNEt8mxQ=;
	b=LpBatlMHTiYLIADr2YSanJ0k+PrK/WjNVeQXse2xo8S8IJ1eNebCp4q98HCZPsahQ8
	ah3vUsm5bgun6UReaKD+yyqUuHhaoIVtHNbvrrgOSJYqYHVohO+M/o73whPCO8rREAWd
	CEIEq3EQrromvPyL/mwo7RBQ6lQciDrWx1R3FiPjzErgScj/9CygPD0UaKm0qjkHo06S
	dQghx/DM23HVRKbIJpOUIIGqUILLfg7SzsJlfpv0apYgWmrElfAdUwID+Wc3mPE9123+
	4am6cWgBrN/NVhWQ9g79WLzZqqkKrxNxS4AZ3Ws26kZ0kedNA2N4vy8TsypOKW5cIRjq
	dqLA==
X-Gm-Message-State: AN3rC/6BeRkWRJpO5ANG9qtJ8ZBiwM3AsMX5tst5QkrijPycLQjUOr3j
	YwsTuGcWjwlSU8neKiGJk+oHGdFhwB82
X-Received: by 10.31.58.132 with SMTP id h126mr21813754vka.90.1493925025550;
	Thu, 04 May 2017 12:10:25 -0700 (PDT)
MIME-Version: 1.0
From: david bensoussan <minipada@gmail.com>
Date: Thu, 04 May 2017 19:10:14 +0000
Message-ID: <CALxi_JEBWB_HWTioz0UsNKOKMfB6i5ddyci1oD9p5G_8AGE9eg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Opencv 3.2 with python2
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
X-List-Received-Date: Thu, 04 May 2017 19:10:25 -0000
Content-Type: multipart/alternative; boundary=001a11433490784cd5054eb7866c

--001a11433490784cd5054eb7866c
Content-Type: text/plain; charset=UTF-8

Here is a patch that starts using python3 by default on opencv:
https://github.com/openembedded/meta-openembedded/commit/f66aa42d9e6204ad3f5af05faf1abec652f7ac1e

I have tried using python2 by setting up:

PACKAGECONFIG_append = "python2"
PACKAGECONFIG_remove = "python3"

Without success since this commit. Am I missing something?
-- 

*David bensoussan*
Roboticist / Embedded Software Engineer
------------------------------

*Synapticon* | Robotic Control Systems
Mobile: 004915779804515 / 0033659971070

--001a11433490784cd5054eb7866c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Here is a patch that starts using python3 by default o=
n opencv:=C2=A0<a href=3D"https://github.com/openembedded/meta-openembedded=
/commit/f66aa42d9e6204ad3f5af05faf1abec652f7ac1e">https://github.com/openem=
bedded/meta-openembedded/commit/f66aa42d9e6204ad3f5af05faf1abec652f7ac1e</a=
><div><br></div><div><p style=3D"box-sizing:border-box;margin-bottom:16px;c=
olor:rgb(36,41,46);font-family:-apple-system,blinkmacsystemfont,&quot;segoe=
 ui&quot;,helvetica,arial,sans-serif,&quot;apple color emoji&quot;,&quot;se=
goe ui emoji&quot;,&quot;segoe ui symbol&quot;;font-size:14px;margin-top:0p=
x">I have tried using python2 by setting up:</p><pre style=3D"box-sizing:bo=
rder-box;font-family:sfmono-regular,consolas,&quot;liberation mono&quot;,me=
nlo,courier,monospace;font-size:11.9px;margin-top:0px;margin-bottom:16px;fo=
nt-stretch:normal;line-height:1.45;word-wrap:normal;padding:16px;overflow:a=
uto;background-color:rgb(246,248,250);border-radius:3px;color:rgb(36,41,46)=
"><code style=3D"box-sizing:border-box;font-family:sfmono-regular,consolas,=
&quot;liberation mono&quot;,menlo,courier,monospace;font-size:11.9px;paddin=
g:0px;margin:0px;background:transparent;border-radius:3px;word-break:normal=
;border:0px;display:inline;overflow:visible;line-height:inherit;word-wrap:n=
ormal">PACKAGECONFIG_append =3D &quot;python2&quot;
PACKAGECONFIG_remove =3D &quot;python3&quot;
</code></pre><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,=
41,46);font-family:-apple-system,blinkmacsystemfont,&quot;segoe ui&quot;,he=
lvetica,arial,sans-serif,&quot;apple color emoji&quot;,&quot;segoe ui emoji=
&quot;,&quot;segoe ui symbol&quot;;font-size:14px;margin-bottom:0px">Withou=
t success since this commit. Am I missing something?</p></div></div><div di=
r=3D"ltr">-- <br></div><div data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><p id=3D"inbox-inbox-inbox-inbox-inbox-person-name" style=3D"box-sizin=
g:border-box;font-family:arial,helvetica,sans-serif;font-size:13.3333px;col=
or:rgb(0,0,0);padding:0px;margin:1em 0px"><strong style=3D"box-sizing:borde=
r-box">David bensoussan</strong><br style=3D"box-sizing:border-box">Robotic=
ist / Embedded Software Engineer</p><hr style=3D"box-sizing:border-box;marg=
in:0px;padding:0px;height:1px;background:rgb(229,27,65);border:none;color:r=
gb(17,17,17);font-family:arial,helvetica,sans-serif;font-size:13.3333px"><p=
 id=3D"inbox-inbox-inbox-inbox-inbox-tag-line" style=3D"box-sizing:border-b=
ox;font-family:arial,helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0);p=
adding:0px;margin:1em 0px"><strong style=3D"box-sizing:border-box">Synaptic=
on</strong><span class=3D"inbox-inbox-inbox-inbox-inbox-Apple-converted-spa=
ce">=C2=A0</span>| Robotic Control Systems</p><table cellpadding=3D"0" cell=
spacing=3D"0" style=3D"box-sizing:border-box;font-family:arial,helvetica,sa=
ns-serif;font-size:13.3333px;color:rgb(17,17,17);padding:0px"><tbody style=
=3D"box-sizing:border-box"><tr style=3D"box-sizing:border-box"><td style=3D=
"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px 0px">Mobile:</=
td><td style=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px=
 0px">004915779804515 / 0033659971070<br></td></tr><tr style=3D"box-sizing:=
border-box"><td style=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px=
 15px 3px 0px"><br></td><td style=3D"box-sizing:border-box;color:rgb(0,0,0)=
;padding:0px 15px 3px 0px"><br></td></tr></tbody></table></div></div>

--001a11433490784cd5054eb7866c--
