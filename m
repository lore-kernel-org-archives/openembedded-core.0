Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDD971BB2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:16:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id p16so7535560qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OCyOm1c2MneOnMs86gdujglzRc4JWyla70/qrUVdWt4=;
	b=lTg36xdwwCRqAuj8HdaOEex5qTraw1HDmoHlua1pazr+/3PnP4guLvapT/Y2FkNLvs
	Bszi94toT4n/9btPyPjfEH7iXFVKwNESkgfyZA0XG6GqBhgTd4e8qUCT0WkPtGvZIEBu
	nsfSXs/5rBY17qv0JwFgADT5rfgw5EdPPOYetNap+2erD3tiFhjKM7Aq0qpTnXDfzwa9
	9VT5jpDJIihrVQYUbdHS81kHSPXR4KSr6xFV4rdhZnNiyjMnxR9PVaqqFNMboWCLu+VF
	HeOHFd0Em7+crLeXJac9lVK6GnFiFEB1uc0va49n1QQc5Me7tdh22tmo0bwiHIn0rbZp
	3BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OCyOm1c2MneOnMs86gdujglzRc4JWyla70/qrUVdWt4=;
	b=FdnBOY+yjGUT31cNJqJMnSx1ogYTl5lMl/ljbU0A3LYjtgUNPQJ6zLXVksuooswUwz
	TM8QzwBIYPPVq9cueyHgDa19SRgDDK/3MfEEpEwCy6312h/4FQ8StwF86eZ33RiM43JC
	V0LQWReyr3RQANS+l42k+04pjLquujnWO+uDyxDKnx5WRH752veLRsEv2w634ErkvYqT
	YR2/CEvzqe9q5OOQy6tn/yXX4BD02h54HqVnSFHHziZxgDTodYdJ4RriVdbAUMVoqKNk
	J+4n9Jl+D6KDVs42GJW4WFexGBRurxtpdubJrPryAUpJZ66FmVYW5vaRD7qmH6ZHTmCN
	Lm/A==
X-Gm-Message-State: ABUngvdTnUm83UjhtNG+eJojU+7lIruswtx2ZOytjuAeRfLnl3iOCPMZ8iczXoU9rFijG5v/Y9+r45MKDF7ixXuH
X-Received: by 10.237.37.60 with SMTP id v57mr398063qtc.135.1478088986529;
	Wed, 02 Nov 2016 05:16:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 05:16:06 -0700 (PDT)
In-Reply-To: <fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
	<fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 12:16:06 +0000
Message-ID: <CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] icu: update to 58.1
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
X-List-Received-Date: Wed, 02 Nov 2016 12:16:25 -0000
Content-Type: multipart/alternative; boundary=001a114125e0fd26d80540506877

--001a114125e0fd26d80540506877
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 15:25, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> The copyright for the software has been transferred to Unicode Inc from
> IBM,
> but the terms are same.
>
> libiculx and libicule are no longer produced as they depend on an external
> package icu-le-hb (previous versions had an option of using an internal
> implementation which now has been dropped). I have verified that icu
> dependencies in oe-core and meta-oe still build.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>

This breaks under musl:

../../icu/source/i18n/digitlst.cpp:67:24: fatal error: xlocale.h: No such
file or directory
 #   include <xlocale.h>

musl doesn't have xlocale.h but does have a crippled strtod_l (doesn't
actually support a passed in locale, which is the entire point of the _l
functions).

Upstreams such as pulseaudio have done
https://bugs.freedesktop.org/attachment.cgi?id=118644 to guard the include,
but I see that digitlist.cpp has an alternative branch where strtod_l isn't
supported: as that function on musl is crippled maybe ICU should be told
not to use it?

Ross

--001a114125e0fd26d80540506877
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 November 2016 at 15:25, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D"gmail-:2cf" class=3D"gmail-a3s gmail-aXjCH gmail-m1582082e4cb03abb">The=
 copyright for the software has been transferred to Unicode Inc from IBM,<b=
r>
but the terms are same.<br>
<br>
libiculx and libicule are no longer produced as they depend on an external<=
br>
package <span class=3D"gmail-il">icu</span>-le-hb (previous versions had an=
 option of using an internal<br>
implementation which now has been dropped). I have verified that <span clas=
s=3D"gmail-il">icu</span><br>
dependencies in oe-core and meta-oe still build.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</div></blockq=
uote></div><br>This breaks under musl:</div><br>../../icu/source/i18n/digit=
lst.cpp:67:24: fatal error: xlocale.h: No such file or directory<br>=C2=A0#=
 =C2=A0 include &lt;xlocale.h&gt;<br><br><div>musl doesn&#39;t have xlocale=
.h but does have a crippled strtod_l (doesn&#39;t actually support a passed=
 in locale, which is the entire point of the _l functions).</div><div><br><=
/div><div>Upstreams such as pulseaudio have done=C2=A0<a href=3D"https://bu=
gs.freedesktop.org/attachment.cgi?id=3D118644">https://bugs.freedesktop.org=
/attachment.cgi?id=3D118644</a> to guard the include, but I see that digitl=
ist.cpp has an alternative branch where strtod_l isn&#39;t supported: as th=
at function on musl is crippled maybe ICU should be told not to use it?</di=
v><div><br></div><div>Ross</div></div>

--001a114125e0fd26d80540506877--
