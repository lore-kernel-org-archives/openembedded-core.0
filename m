Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA53756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 16:23:17 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so103909454qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 09:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D8BdtFeVUDnBD52LtPfj5voS7jkheH60LsblIMvvGwU=;
	b=NfufWXSg/DNOk+LWbiHe1GcPplEuSmS6KMbnXYdXKsCs9YjsmPLIJAuyx9wR5cNa2D
	oudkCYuYljXefr7uiSlrFlCO+z2ViEDi+xLwIzfA4vAv816cpOK790L8P271QvHXp0fr
	/IRO9pbH9hfPE7fm2tzfqCOdp3AK0LA/TR1E+6GU2C0+RxgHwAVbUFvVbrHCqAQWz9gN
	6NlWJ98h4y3zHbOqPTawVeKcDnaUGIRGbFOl79lXojT5hohQcz7CxzgmnuObG5rgWOrW
	zk9/JoU3g5UsQWRzdZzMrbP7sfCk+l8uEtT05v0RviTiMc9t3vQUEru9NxN3YBVuxrE7
	XuRw==
X-Gm-Message-State: ALoCoQlT4BAbzny2opBHdAyQGj4B21dTu9AFVnwliwuFC1gKnnFtHPM8khpf5lI82errzGV5cAyB
X-Received: by 10.55.40.18 with SMTP id o18mr49775953qkh.58.1433262198093;
	Tue, 02 Jun 2015 09:23:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 09:22:57 -0700 (PDT)
In-Reply-To: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 17:22:57 +0100
Message-ID: <CAJTo0LYwXZ2KsGay0Q0sRKbUUZXdCendjTXkCYdH5ycdkAtSYA@mail.gmail.com>
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Tue, 02 Jun 2015 16:23:22 -0000
Content-Type: multipart/alternative; boundary=001a11440fb83029ba05178b5c24

--001a11440fb83029ba05178b5c24
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 May 2015 at 23:29, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote=
:

> +++ b/meta/recipes-devtools/dosfstools/dosfstools.inc
> @@ -0,0 +1,8 @@
> +# dosfstools OE build file
> +# Copyright (C) 2015, S=C3=B6ren Brinkmann <soeren.brinkmann@gmail>  All
> Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +SUMMARY =3D "DOS FAT Filesystem Utilities"
> +SECTION =3D "base"
> +
> +BBCLASSEXTEND =3D "native"
>

Is it really worth having a .inc file for three lines?  Also, the makefile
still respects MANDIR so we should continue passing it in as dosfstools 2.x
does.

Ross

--001a11440fb83029ba05178b5c24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2015 at 23:29, Soren Brinkmann <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:soren.brinkmann@xilinx.com" target=3D"_blank">soren.brinkmann@xilinx.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3uq=
" class=3D"a3s" style=3D"overflow:hidden">+++ b/meta/recipes-devtools/<span=
 class=3D"il">dosfstools</span>/<span class=3D"il">dosfstools</span>.inc<br=
>
@@ -0,0 +1,8 @@<br>
+# <span class=3D"il">dosfstools</span> OE build file<br>
+# Copyright (C) 2015, S=C3=B6ren Brinkmann &lt;soeren.brinkmann@gmail&gt;=
=C2=A0 All Rights Reserved<br>
+# Released under the MIT license (see packages/COPYING)<br>
+<br>
+SUMMARY =3D &quot;DOS FAT Filesystem Utilities&quot;<br>
+SECTION =3D &quot;base&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;</div></blockquote></div><br>Is it rea=
lly worth having a .inc file for three lines?=C2=A0 Also, the makefile stil=
l respects MANDIR so we should continue passing it in as dosfstools 2.x doe=
s.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a11440fb83029ba05178b5c24--
