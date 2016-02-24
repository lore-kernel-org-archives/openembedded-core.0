Return-Path: <jpetri@izotope.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id ACD7E7719C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 21:04:03 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id of3so17750841lbc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=izotope-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8rxnETGO8hD6jbahtskyxA27KNQu/uJKP3IEs+wPuak=;
	b=csCaN/gvR9ux8toRjx4SVfyYkEgTxN9bsT674h3oXLeYK/ajEg/w1ccyCX/xq6H/+X
	QYQcLiwGZ6HX3gsbekmjCZOuCkwHa/UQ+gEJq3foQ+PxQHsdB47Kyep1+Zvks+CwK47G
	52a1A0p48O2BTNGk56AVOrqy6g70EWYV/INcacfvs9EDOFBqCI47Z7Q7xUydFw0118vB
	+8+U5hk+ogDu87P9hTZ+YKLc2A7ZATjLVxSG2uJg3a7Ws9Tq2A4HhHY+EFo/P0OCYxOg
	eLNBEODu7eiKqz5SEAGO22TXFkBkwGoDoOjkP7XbDosIfkltJ12UcpuQGoHqeSVX3JR6
	fYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=8rxnETGO8hD6jbahtskyxA27KNQu/uJKP3IEs+wPuak=;
	b=IqZT73iramqgCFdhaQa3o7IL4NWg5vjW9oscdMOkkpDksAPPyMTxQtsCUcRBx/xRiH
	ZedRJ6gLI0oIfDEcpNroy7l0Fpl7gcXuff4sQd2pR9yNG3L+a1pfcRoIkkh2Nb/lQ5cU
	CDQ2opmqAWJCXpPeLG3laOa92qyl7OVejfen4u2BmXY+2ShDoUleZDAOEESx9WGkKc+2
	D8NfrCSk1+tHaJsz3yXRTcK5wmyxHXnaXhzoAMeI8Sdik+/q/5+SdSL6y2QtmQJKpATp
	oUPjjBfvPr9T1djnRJvZzFQbU1NurfOK1PAQF6BxpmWOP9djyW9uMMZUhiesscAG7/iv
	hRdA==
X-Gm-Message-State: AG10YOQhAPr+tRC/hHOpgbYG3fT2/hOiH5dIAAiwLgojo4qRP9qkLpkcwHu5OcjLoF3lrYE6Kp3stDpYyXRESmHf
MIME-Version: 1.0
X-Received: by 10.112.160.3 with SMTP id xg3mr15247794lbb.67.1456347843366;
	Wed, 24 Feb 2016 13:04:03 -0800 (PST)
Received: by 10.114.58.40 with HTTP; Wed, 24 Feb 2016 13:04:03 -0800 (PST)
Date: Wed, 24 Feb 2016 16:04:03 -0500
Message-ID: <CAJOrw7xxK8Z24WcHZN0OrK3u25h4XRo+YozgbDomBu2D0r0MeQ@mail.gmail.com>
From: Jonah Petri <jpetri@izotope.com>
To: openembedded-core@lists.openembedded.org
Subject: Enabling tab completion on host gdb
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
X-List-Received-Date: Wed, 24 Feb 2016 21:04:05 -0000
Content-Type: multipart/alternative; boundary=001a11c331e6df9798052c8a6719

--001a11c331e6df9798052c8a6719
Content-Type: text/plain; charset=UTF-8

Hello!
Does anyone know why host gdb (as built into a yocto sdk) does not have
working tab completion?

If I type "break wr" and then press tab, it does nothing.  However, if I
type:
(gdb) complete b wr
b write
b write@got.plt
b write@plt
b writer.h

So, the completions are there, but something is not hooked up properly.
We're using pretty close to stock poky 1.8, and the package is specifically:
x86_64-nativesdk-pokysdk-linux/gdb-cross-canadian-arm/7.8.1-r0/

I never realized how much I depend on tab completion for productivity while
debugging, so any help would be much appreciated!

Thanks!
Jonah

--001a11c331e6df9798052c8a6719
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello!<br></div>Does anyone =
know why host gdb (as built into a yocto sdk) does not have working tab com=
pletion?<br><br></div>If I type &quot;break wr&quot; and then press tab, it=
 does nothing.=C2=A0 However, if I type:<br>(gdb) complete b wr<br>b write<=
br>b write@got.plt<br>b write@plt<br>b writer.h<br><br></div>So,
 the completions are there, but something is not hooked up properly.=C2=A0=
=20
We&#39;re using pretty close to stock poky 1.8, and the package is=20
specifically:<br>x86_64-nativesdk-pokysdk-linux/gdb-cross-canadian-arm/7.8.=
1-r0/<br><br></div>I never realized how much I depend on tab completion for=
 productivity while debugging, so any help would be much appreciated!<br><b=
r></div>Thanks!<br></div>Jonah<br></div>

--001a11c331e6df9798052c8a6719--
