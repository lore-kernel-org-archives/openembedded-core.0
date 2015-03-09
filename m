Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id D301A6AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 15:27:00 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so7415290qcx.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 08:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aZ69Jxstfk1/D7e2bRLwyX6Qsqw/p/8WWlOs5pXrruI=;
	b=HUBi7cEGnD6xbxuOFtTyYb55uxaVAqXklJOh/VZwK7a97ZzwebgSR78RZ2HeuWOdyn
	CG5+LZyrzepshuW+fwR+0BQ8rXZGJlT64diTUwR1uJJD0kUHX1ifU7NWUwR1b7a0DHow
	4fCqw03U1l+UaEgWQmKhaYqXea2o18eDsS/OBc5Zmkq87e7eqPa9Eyrzgc7a66FIVXTb
	FU0ZPaAyEG2ut9h3kHnJFotR7egWBhK/aorY+UaP6fUekRBur9tzWHkQ4OIcuRTIhhTT
	xABGTn+3wG/+8/LZMIJ6VWEKciyHykTM/QfqAxsJQY9J6GEwhHEfYekoQS+hxy20DpU0
	3yeA==
X-Gm-Message-State: ALoCoQmj/l+4nQa8997ogUz1qmX106P8h5BxynF+0Ahmbtte9QYMyVFkdzg7NkdcrbVImIkC5319
X-Received: by 10.55.20.143 with SMTP id 15mr56773560qku.36.1425914821400;
	Mon, 09 Mar 2015 08:27:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 9 Mar 2015 08:26:41 -0700 (PDT)
In-Reply-To: <CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
References: <54F9E933.9070508@topic.nl>
	<CAJTo0LaCP4mqxdKEnd-mB3sTGCC8PhbkYQgz-kdc9NoLceGMyQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Mar 2015 15:26:41 +0000
Message-ID: <CAJTo0LamzLa+FE0oEejxfW838HWpURUZquyG=f9KoToEY8Gkuw@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Mar 2015 15:27:01 -0000
Content-Type: multipart/alternative; boundary=001a1140013868ff5c0510dcaa21

--001a1140013868ff5c0510dcaa21
Content-Type: text/plain; charset=UTF-8

Oh and FWIW the Sato images in master just flipped from GStreamer 0.10 to
1.4 by default, so I do hope that GStreamer 0.10 will disappear from
oe-core after the next release (moving to meta-multimedia).

Can I ask why you're still using GStreamer 0.10?  If there's a good reason
to keep 0.10 in oe-core during the next cycle we can, but otherwise the
sooner it can be removed entirely as it's no longer tested the better.

Ross

On 9 March 2015 at 15:24, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 March 2015 at 17:51, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
>> Commit 4ceff7d0a1f28eb1ce5d288111015bff8d5e9a7e "libav: drop older 0.8.*
>> and use libav-9 by default" removed libav 0.8 in favor of the "9" edition.
>> However, after compiling this for a MIPS box, the gst-ffmpeg plugin now
>> refuses to load and displays the following at runtime:
>>
>
> Hm, bad testing, sorry.  This would be why gstreamer-libav 1.0 defaults to
> using it's own internal copy of libav then. :/
>
> I see that gstreamer-ffmpeg_0.10 defaults to using the internal libav, and
> as the API clearly changed we need to do that.  Can you verify that
> removing external-libav from the PACKAGECONFIG fixes this problem?
>
> Ross
>

--001a1140013868ff5c0510dcaa21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh and FWIW the Sato images in master just flipped from GS=
treamer 0.10 to 1.4 by default, so I do hope that GStreamer 0.10 will disap=
pear from oe-core after the next release (moving to meta-multimedia).<div><=
br></div><div>Can I ask why you&#39;re still using GStreamer 0.10?=C2=A0 If=
 there&#39;s a good reason to keep 0.10 in oe-core during the next cycle we=
 can, but otherwise the sooner it can be removed entirely as it&#39;s no lo=
nger tested the better.</div><div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 9 March 2015 at 15:24, B=
urton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" =
target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span clas=
s=3D""><br><div class=3D"gmail_quote">On 6 March 2015 at 17:51, Mike Looijm=
ans <span dir=3D"ltr">&lt;<a href=3D"mailto:mike.looijmans@topic.nl" target=
=3D"_blank">mike.looijmans@topic.nl</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">Commit 4ceff7d0a1f28eb1ce5d=
288111015b<u></u>ff8d5e9a7e &quot;libav: drop older 0.8.* and use libav-9 b=
y default&quot; removed libav 0.8 in favor of the &quot;9&quot; edition. Ho=
wever, after compiling this for a MIPS box, the gst-ffmpeg plugin now refus=
es to load and displays the following at runtime:</div></blockquote></div><=
br></span>Hm, bad testing, sorry.=C2=A0 This would be why gstreamer-libav 1=
.0 defaults to using it&#39;s own internal copy of libav then. :/</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I see that gstr=
eamer-ffmpeg_0.10 defaults to using the internal libav, and as the API clea=
rly changed we need to do that.=C2=A0 Can you verify that removing external=
-libav from the PACKAGECONFIG fixes this problem?</div><span class=3D"HOEnZ=
b"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--001a1140013868ff5c0510dcaa21--
