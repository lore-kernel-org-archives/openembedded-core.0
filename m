Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E8CDF6012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 04:58:19 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fl4so23911447pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 20:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=uNkji0YyqCRqowUIqFKu6rhEwCHt45oBMXlr97zehD8=;
	b=dj6WKJdhFGWJTc6lvuPn5JFXoJH3kY3hjsaPDFWDmv+/tHuiKZIPIShdnM5jzm4TNH
	UKEYphM/vz1PT/hqeKcMsuXDH78jHA14Bh5hf7P8U1XZyZVBjn1MgHuEbntzIzuA5kOa
	CytCzWqgMq3JPioDJwna5QCTVjESitAosEtKtrg4CLc/OEHek/Vn/75GWVHhFn6nvw0a
	mN9eFAPCm7lr/i1t20HkFbCQYRBWB7Xg6Go1A1WqLAOeKm4zDLLK9YwGVNZBYSz9NSdP
	TQfKX2DnCo8JjSq4QFMvk1eLaNFntsgBKIQgr+NcTMuaaWC7WkLg9OELsyW6QywWk7u9
	MQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=uNkji0YyqCRqowUIqFKu6rhEwCHt45oBMXlr97zehD8=;
	b=UyXoUQNEdjTNpiSsBlHG41sVtVC70OcNuF9kmyUwprWV9LjXDZreQ3Xq89Yx3yVQAy
	vFqb+QCUs5nOWLU4ete8H2foIHA0ZiB69lh6Of6oJlPObHGUND+CwKWKlGoX7xpNudVi
	4+iIMDpkC8KskycvoUdtud0021BXKtloDg4j01RxAWCNO8brLjIVdfY7JN3PaMtp+uJJ
	elc9W+rB5zdz4HUNMdOB/JwTmzhZ6GsK2xLmXqQ8khDg/OLPPGXMh0vFbs9mFGtwU7fi
	WXsdgdTFpumyyM/1QIIbM26WZm+/IjxdYQj7+s6OzvjwPdJ6SW0Fjq1yPEb1iS8l5Pa9
	v9gQ==
X-Gm-Message-State: AG10YOSAUbaUA936uEoqi7jZTWavmt8P/XzV0DX3V41Uv0rjQVP6eCC7CSwJa+ruf/9y+w==
X-Received: by 10.66.100.196 with SMTP id fa4mr7418464pab.37.1455771500297;
	Wed, 17 Feb 2016 20:58:20 -0800 (PST)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id u5sm6406406pfi.15.2016.02.17.20.58.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 20:58:18 -0800 (PST)
Message-ID: <5174C2003D56485DACF46FA90CEFE553@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 10:32:07 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Subject: Error building core-image-sato
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
X-List-Received-Date: Thu, 18 Feb 2016 04:58:20 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0077_01D16A37.9E158110"

------=_NextPart_000_0077_01D16A37.9E158110
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear,

I tried to build core-image-sato. It spits out the following error.

winiston@winiston-VirtualBox:~/poky/build$ bitbake core-image-sato
Parsing recipes: 100% |###############################| ETA:  00:00:00
Parsing of 1060 .bb files complete (0 cached, 1060 parsed). 1496 =
targets, 138 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but =
/home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core=
-x11-xserver.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'xf86-input-tslib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xf86-input-tslib']
NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, =
removing...
Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-xserver', 'xf86-input-tslib']
NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, =
removing...
Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', =
'xf86-input-tslib']
ERROR: Required build target 'core-image-sato' has no buildable =
providers.
Missing or unbuildable dependency chain was: ['core-image-sato', =
'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', =
'xf86-input-tslib']

Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

How do I resolve this error?

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_0077_01D16A37.9E158110
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV style=3D"FONT-FAMILY: ; COLOR: ">
<DIV>Dear,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I tried to build core-image-sato. It spits out the following =
error.</DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
core-image-sato</DIV>
<DIV>Parsing recipes: 100% |###############################| ETA:&nbsp;=20
00:00:00</DIV>
<DIV>Parsing of 1060 .bb files complete (0 cached, 1060 parsed). 1496 =
targets,=20
138 skipped, 0 masked, 0 errors.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>ERROR: Nothing RPROVIDES 'xf86-input-tslib' (but=20
/home/winiston/poky/meta/recipes-graphics/packagegroups/packagegroup-core=
-x11-xserver.bb=20
RDEPENDS on or otherwise requires it)</DIV>
<DIV>NOTE: Runtime target 'xf86-input-tslib' is unbuildable, =
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: =
['xf86-input-tslib']</DIV>
<DIV>NOTE: Runtime target 'packagegroup-core-x11-xserver' is =
unbuildable,=20
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was:=20
['packagegroup-core-x11-xserver', 'xf86-input-tslib']</DIV>
<DIV>NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable,=20
removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: =
['packagegroup-core-x11-base',=20
'packagegroup-core-x11-xserver', 'xf86-input-tslib']</DIV>
<DIV>ERROR: Required build target 'core-image-sato' has no buildable=20
providers.</DIV>
<DIV>Missing or unbuildable dependency chain was: ['core-image-sato',=20
'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver',=20
'xf86-input-tslib']</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV><A=20
style=3D'href: =
"mailto:winiston@winiston-VirtualBox:~/poky/build$"'>winiston@winiston-Vi=
rtualBox:~/poky/build$</A>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT style=3D"COLOR: " color=3D#0000ff>How do I resolve this=20
error?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV style=3D"FONT-FAMILY: ; COLOR: ">Regards,<BR>Winiston.P<BR>Futura =
Automation=20
Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0077_01D16A37.9E158110--
