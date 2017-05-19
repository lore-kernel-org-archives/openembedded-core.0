Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5D44771CAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:25:57 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id f55so60660732qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RSGSXZW7xaWGOhQJoKTvzfEbKA/dj/kw06iu2z49Ut4=;
	b=mzwttLHMZ7kw1HIJFOte53eAji+Xwel7rcnMgEPZnrCZmkudJzmCXNTS2/5Irgof6p
	CXGadQYZ6xHe8mGxcDeakAQwsmT4QGJqeMkp/qafpvfF6++fV/8FU1O28X+l2tMqF5e1
	Xgwbirds1eJG+bus6LRkZRiwN+2iwVUnI1DwrkfY9qBlrYJV6KRgW51e6SZQUpitAZL1
	Tm02z9qp7ww6xUQg0XHWZJuAySba9tTsAmH+5laZ6rkDwYLKgRp2TM8QXuayZSz0rrC/
	M2Oo7RNNcNrd7PUjdTKimxqml9Ri9H2sxBrFBKK9LFcFUDR7OsMi/704S19rtx08WsSX
	CSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RSGSXZW7xaWGOhQJoKTvzfEbKA/dj/kw06iu2z49Ut4=;
	b=RZQNvQkD6osHTlkdBl8PWzTcX/76Cetop7ulOwSUEYdUib8kABcNvGtngFh5Kb9zT9
	45WTUlAZSXK5u0qV/jdBzfCrMzeP3fE9MaHP1ciXLdFc+HhCm6VctUkHqcpeG0i/q+tl
	6uCBy9K/zMctE/jm23yIx0Gk7bx8YoABnUmhR4sRNzerllPlnHjBbs1RIbNVdnxmEzz1
	GXUTNZ605nwZZGrQ0c1XlwY1Pd1FJUWY7v8ibQWs+qNMgCfjjJ9AriYPorpJbiuIsj+U
	izq9J5ezsv/SxDTOHrQbRSaWyQbwxBAD0wwcPN6xbC2vvqZchdMcF+fSqErWxSbSuTfp
	Jpkw==
X-Gm-Message-State: AODbwcDyOam2NOQ3dvvoX3XfEK1sr5kiqVTwfXcZpcgUYsavU+Bx6B41
	2Bu3boOFvUsADpo14BlJ/5FgS+YStbCf5l8=
X-Received: by 10.200.34.229 with SMTP id g34mr5164574qta.65.1495207558687;
	Fri, 19 May 2017 08:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 19 May 2017 08:25:38 -0700 (PDT)
In-Reply-To: <1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 16:25:38 +0100
Message-ID: <CAJTo0LZEF_O3Evumo1+YQ8kpjt=FpTqszfg0704B45GXFHNYVA@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bc: upgrade 1.06 to 1.07.1
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
X-List-Received-Date: Fri, 19 May 2017 15:25:58 -0000
Content-Type: multipart/alternative; boundary="001a113f422866cd5e054fe22321"

--001a113f422866cd5e054fe22321
Content-Type: text/plain; charset="UTF-8"

On 18 May 2017 at 23:28, Jose Lamego <jose.a.lamego@linux.intel.com> wrote:

> bc recipe must be upgraded to latest version in upstream.
>
> bc license changed from "GPLv2+ & LGPLv2.1" to "GPLv3+ & LGPLv3"
> The new version exhibits a Parallel Make Race that required
> unsetting PARALLEL_MAKE variable.
> This change was tested with core-image-minimal in qemux86.


It would be appreciated if you could spend a few minutes looking at what
the build race is and pushing a fix upstream.  Or at least include a
comment showing the failure.

I chased the sed thing as previous releases didn't need it: my build
machine doesn't even have ed installed so HOSTTOOLS won't help.  This
appears to be a regression as 1.06 shipped the file that needs ed to
build.  The makefile now always builds a binary to generate a file that it
then runs through ed, and it doesn't build this tool correctly in a cross
environment either:

| /bin/bash: ./fbc: cannot execute binary file: Exec format error

(it's trying to run an arm binary on x86)

I'd suggest that we approach the upstream maintainer and discuss:
1) should the tarballs ship libmath.h instead of requiring it to be
generated
2) using CC_FOR_BUILD etc from autoconf-archive to build fbc with the host
compiler in cross-compile environments
3) can sed be used instead of ed to reduce the host requirements

Ross

--001a113f422866cd5e054fe22321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2017 at 23:28, Jose Lamego <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jose.a.lamego@linux.intel.com" target=3D"_blank">jose.a.lamego@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">bc r=
ecipe must be upgraded to latest version in upstream.<br>
<br>
</span>bc license changed from &quot;GPLv2+ &amp; LGPLv2.1&quot; to &quot;G=
PLv3+ &amp; LGPLv3&quot;<br>
The new version exhibits a Parallel Make Race that required<br>
unsetting PARALLEL_MAKE variable.<br>
This change was tested with core-image-minimal in qemux86.</blockquote></di=
v><br>It would be appreciated if you could spend a few minutes looking at w=
hat the build race is and pushing a fix upstream.=C2=A0 Or at least include=
 a comment showing the failure.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">I chased the sed thing as previous releases didn&=
#39;t need it: my build machine doesn&#39;t even have ed installed so HOSTT=
OOLS won&#39;t help.=C2=A0 This appears to be a regression as 1.06 shipped =
the file that needs ed to build.=C2=A0 The makefile now always builds a bin=
ary to generate a file that it then runs through ed, and it doesn&#39;t bui=
ld this tool correctly in a cross environment either:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">| /bin/bash: ./fbc: cannot =
execute binary file: Exec format error<br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">(it&#39;s trying to run an arm binary =
on x86)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">I&#39;d suggest that we approach the upstream maintainer and discuss:</di=
v><div class=3D"gmail_extra">1) should the tarballs ship libmath.h instead =
of requiring it to be generated</div><div class=3D"gmail_extra">2) using CC=
_FOR_BUILD etc from autoconf-archive to build fbc with the host compiler in=
 cross-compile environments</div><div class=3D"gmail_extra">3) can sed be u=
sed instead of ed to reduce the host requirements</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f422866cd5e054fe22321--
