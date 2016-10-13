Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id F31CF6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:10:14 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id o19so81858587ito.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E3l1ZCf1iTQXNmgmyMpbtn0uoI3LKn03E5jSXJqj1es=;
	b=s2hGSXoPonWeDfCG/RNhIRNxlvaXXlgsqbZR4d4wCWO3jEwSdzq3UzHn8RiuPM7GHn
	RfpXz7Z1cRjL7Cyj5Z5MmPMQd5NMRz4KGDmcIoTL5HDILsp3Lnsh/MawHsAt5m0hTMLe
	01gBMqJQsR3NqCrUUkVbCSPoiH17RKsP/A33vmmz+OgwdM1rnv88waJgbWTNZ8GfpmOH
	2wryyjv9khoJToB9++GHy+AyfkFHXr1/wuLbjsgWD5Bl5R9nMPLUn6mfuDD4xKDa9oJ2
	8qTWfrVrRi365TQ3stR7W08emiXsB57zbKz7GQS51OIdAxkjgMpzm5gOaNa0M9yuUao+
	db0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E3l1ZCf1iTQXNmgmyMpbtn0uoI3LKn03E5jSXJqj1es=;
	b=b1e1hh/nmojdzFbcd7MZx3hdyRw56MKaHM5S0fUVopx7ueYA1lRvX3fhJrIxdgBjnG
	YuLHjTVokjRSMBQVp8Q9Vy4nI10e6g/XlUD7jyMd2KBoBKzYV6b3TWXJRv+KjESz1TYw
	5qyIIU3fFeSMs6v8a5XMYJY7uAjXdqcaFibBUsnZfckQfexWtj5fKoDxQMvhd169/cJn
	qP0DwCoudTv5dgD9EPQ5v0gCtiW9dQi6RWZoXR6EcZlrCX1WR40LTeTUDy1V2b6ugyMN
	nsXwgRNunqFhwvOkJVUgVrRLPYUzL9oFa8OaaCUuUjOmx/LRU4xxkwkuGG0gUr5z7IvS
	Rrpw==
X-Gm-Message-State: AA6/9RlGDqubdXE2geCtas+mFw6ej4BrxUXX3jt9XqdEPEIZ2M2tC6+x5EXCt8cjmCSCe9RzBxB1KemlTBqjFMur
X-Received: by 10.36.127.140 with SMTP id r134mr6256553itc.29.1476364215972;
	Thu, 13 Oct 2016 06:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 13 Oct 2016 06:09:55 -0700 (PDT)
In-Reply-To: <CAFrQVPPXkV_dy9G7qWhGNd-5AFY-pVhG33sYUjMVPupaXxyd1A@mail.gmail.com>
References: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
	<1476195437-24040-2-git-send-email-bkylerussell@gmail.com>
	<CAJTo0LahAKipF1Dz9TQw8TVM3vp361ZATtVPHjXy5ZupRDdZkQ@mail.gmail.com>
	<CAFrQVPPXkV_dy9G7qWhGNd-5AFY-pVhG33sYUjMVPupaXxyd1A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Oct 2016 14:09:55 +0100
Message-ID: <CAJTo0LZa4z4zy-TT9z9=+Bq2SAsWd6NqFkgx+jrsNTNCMJqZLQ@mail.gmail.com>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] librsvg: Add missing pixbufcache dependencies
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
X-List-Received-Date: Thu, 13 Oct 2016 13:10:15 -0000
Content-Type: multipart/alternative; boundary=001a1147cb70a709b3053ebed419

--001a1147cb70a709b3053ebed419
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 17:44, Kyle Russell <bkylerussell@gmail.com> wrote:

> I suspect this list may still not be entirely complete, because ldd shows
> several dependencies for libpixbufloader-svg.so.  However, I'm not really
> that familiar with all the dependencies going on here; we are definitely
> seeing sporadic failures for various native libraries during the
> pixbufcache postinst task though.  Best I could tell, it looked like the
> PIXBUFCACHE_SYSROOT_DEPS functionality was accidentally removed from the
> pixbufcache.bbclass a while back (hence, my first patch).  Adding that hunk
> back in has seemed to help most of the failures, but we still see lingering
> failures for pixman and libXdmcp on occasion.


This bit of code is particularly tangled, so I'm hoping I can remember the
details.  The AB just hit a related problem earlier in the week so I'm
trying to remember how all this ties together.

The SYSROOT_DEPS bit wasn't removed accidentally because the way the
query-loaders script is executed has changed.  It used to be ran via
SSTATEPOSTINSTFUNCS so would execute the moment that gdk-pixbuf-native or
librsvg-native was unpacked.  As sstate installation is top-down instead of
bottom-up this would generally mean that librsvg-native would be installed
before even gdk-pixbuf-native was installed, and typically before stuff
like libpng-native or the rest of the stack.

This was changed so that the SSTATEPOSTINSTFUNC simply writes a
sstate-completion script that is executed once all of sstate has been
unpacked, so ordering isn't a problem. The logic to add explicit
dependencies isn't required anymore.

Of course native dependencies are not as neat as target dependencies which
is something I'd really like to see fixed, but in general I can't
understand why this happens for you: if gdk-pixbuf-native can be extracted
from sstate then all of its dependencies must have been too, and they
include recipes such as libxdmcp-native.  If the dependencies need a
rebuild then gdk-pixbuf should need a rebuild too...

A full cooker log with the bug would be appreciated, but I know that's
unlikely to happen!

Ross

--001a1147cb70a709b3053ebed419
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 17:44, Kyle Russell <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bkylerussell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex">I suspect this list may still not be=
 entirely complete, because ldd shows several dependencies for libpixbufloa=
der-svg.so.=C2=A0 However, I&#39;m not really that familiar with all the de=
pendencies going on here; we are definitely seeing sporadic failures for va=
rious native libraries during the pixbufcache postinst task though.=C2=A0 B=
est I could tell, it looked like the PIXBUFCACHE_SYSROOT_DEPS functionality=
 was accidentally removed from the pixbufcache.bbclass a while back (hence,=
 my first patch).=C2=A0 Adding that hunk back in has seemed to help most of=
 the failures, but we still see lingering failures for pixman and libXdmcp =
on occasion.</blockquote></div><br>This bit of code is particularly tangled=
, so I&#39;m hoping I can remember the details.=C2=A0 The AB just hit a rel=
ated problem earlier in the week so I&#39;m trying to remember how all this=
 ties together.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">The SYSROOT_DEPS bit wasn&#39;t removed accidentally because the =
way the query-loaders script is executed has changed.=C2=A0 It used to be r=
an via SSTATEPOSTINSTFUNCS so would execute the moment that gdk-pixbuf-nati=
ve or librsvg-native was unpacked.=C2=A0 As sstate installation is top-down=
 instead of bottom-up this would generally mean that librsvg-native would b=
e installed before even gdk-pixbuf-native was installed, and typically befo=
re stuff like libpng-native or the rest of the stack.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">This was changed so that th=
e SSTATEPOSTINSTFUNC simply writes a sstate-completion script that is execu=
ted once all of sstate has been unpacked, so ordering isn&#39;t a problem. =
The logic to add explicit dependencies isn&#39;t required anymore.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Of course nati=
ve dependencies are not as neat as target dependencies which is something I=
&#39;d really like to see fixed, but in general I can&#39;t understand why =
this happens for you: if gdk-pixbuf-native can be extracted from sstate the=
n all of its dependencies must have been too, and they include recipes such=
 as libxdmcp-native.=C2=A0 If the dependencies need a rebuild then gdk-pixb=
uf should need a rebuild too...</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">A full cooker log with the bug would be appreciat=
ed, but I know that&#39;s unlikely to happen!</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147cb70a709b3053ebed419--
