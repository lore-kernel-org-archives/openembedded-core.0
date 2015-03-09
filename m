Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id B641C6AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 15:24:44 +0000 (UTC)
Received: by qgdq107 with SMTP id q107so29167093qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=52EG5dN3kWXI9aJ82uVf/DBYTzQ+SWzF4I2h/FSNGXk=;
	b=O35nJLqauZtPAo3jSft5HsHuHqpbgKWHeZSaB5EoPkohGQaNtWq/FE5Eb5ThO08FLx
	e6ZAg8h1Cu/p7BuuKVuVu6QtOBWzAMytkRnULUxTE3Q6rG7Qu81GjFA6/HcpkGC3z1Th
	6kSOT2tA0hzawZeTqd3tIzkVht7WsoGNLFN1mdLLpQTE0uWj1v4nl36zVgPakPwym+r1
	iaGoOJRy4VwDdlfEr4VkBu2podg3cxRaqxkEbFzQKj5fU7bhmCugo3Tj0aNKSfWVvKyi
	Tef7w+0wIky6Q4O5Jo8lRfyYsFiz8xUessNxhOY0yOBKDy86kpJr8PVwp8xETXNLECYQ
	aI5w==
X-Gm-Message-State: ALoCoQkjRunOsWTzPoVPLnYc/hwDE2kGdyQgsNrvYfGKUgPZnD1lPPfSFunDuwZHTgAaF9Q/VrIF
X-Received: by 10.140.42.195 with SMTP id c61mr2868916qga.94.1425914685637;
	Mon, 09 Mar 2015 08:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 08:24:25 -0700 (PDT)
In-Reply-To: <54F9E933.9070508@topic.nl>
References: <54F9E933.9070508@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 15:24:25 +0000
Message-ID: <CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gst-ffmpeg is broken since the libav-9 introduction
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
X-List-Received-Date: Mon, 09 Mar 2015 15:24:46 -0000
Content-Type: multipart/alternative; boundary=001a113abef4517fc30510dca239

--001a113abef4517fc30510dca239
Content-Type: text/plain; charset=UTF-8

On 6 March 2015 at 17:51, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> Commit 4ceff7d0a1f28eb1ce5d288111015bff8d5e9a7e "libav: drop older 0.8.*
> and use libav-9 by default" removed libav 0.8 in favor of the "9" edition.
> However, after compiling this for a MIPS box, the gst-ffmpeg plugin now
> refuses to load and displays the following at runtime:
>

Hm, bad testing, sorry.  This would be why gstreamer-libav 1.0 defaults to
using it's own internal copy of libav then. :/

I see that gstreamer-ffmpeg_0.10 defaults to using the internal libav, and
as the API clearly changed we need to do that.  Can you verify that
removing external-libav from the PACKAGECONFIG fixes this problem?

Ross

--001a113abef4517fc30510dca239
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2015 at 17:51, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3yt" clas=
s=3D"a3s" style=3D"overflow:hidden">Commit 4ceff7d0a1f28eb1ce5d288111015b<u=
></u>ff8d5e9a7e &quot;libav: drop older 0.8.* and use libav-9 by default&qu=
ot; removed libav 0.8 in favor of the &quot;9&quot; edition. However, after=
 compiling this for a MIPS box, the gst-ffmpeg plugin now refuses to load a=
nd displays the following at runtime:</div></blockquote></div><br>Hm, bad t=
esting, sorry.=C2=A0 This would be why gstreamer-libav 1.0 defaults to usin=
g it&#39;s own internal copy of libav then. :/</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">I see that gstreamer-ffmpeg_0.10 d=
efaults to using the internal libav, and as the API clearly changed we need=
 to do that.=C2=A0 Can you verify that removing external-libav from the PAC=
KAGECONFIG fixes this problem?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113abef4517fc30510dca239--
