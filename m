Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2273871D97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:21:54 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id k15so100337677qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=flU81JUmtp1P43p20P8AeB6yeBevcSJkbzLiViZsrIw=;
	b=XtZ1fh9NUaMvFoBF+WhWLJIpH1IWnOfNEJFyaehlgieE80piQtNk5kdr5EGEGRM8Ft
	tj1NEi62HQM075lBuczR7NtI/IdgkwwQRsX3RhDVbDIDCk/FET+9M3KY0iFGs9CX9hBq
	AtGKwWsRfXkljOCbbEpEtwHBy5Hwov/uRvLOQTz2OGZzP7hwYFE5i4FfbCTKyUgG3qrj
	NTpbEbYybv3/D1NeBIM1KBQBJpbYbLg9m6rCFp0IszfprLrzMdduD7I1WMs6F0IfXfGp
	LmP8a/TTY2IlXUd7nGawhaSEgixg9/ObTGQ4O0tBAIsBdlb/ieFjQX9qTb9Lu6iB8iO/
	GCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=flU81JUmtp1P43p20P8AeB6yeBevcSJkbzLiViZsrIw=;
	b=hAZXqJ+xc9uq8hh6tjCmAkPwPkbI9WSeDLVeVQ1ieKeA5eEttQ7d5qgkNV29y/N8sm
	hZplrcaUwfSBhbrPLc1gVRYjvLGzYQDDfsCupns7m4s7KdJg8UEJiO2Wb9mQ4E7ioZoZ
	Y2akelhOr8Mc6FYRzDdaOc3/+ZH8Rj5gaHRfDJIaMj9uxLJeKZzkvY2KdeTV4+Lzok8U
	TQ7AH011Fjn7hYJzimcLH3TnKr55scXmUQnXPzrTL/pStSXw2j7rq4WpdBuzFvQPmGtU
	VmSmzjfg5JOqfC+YOPCtuW6bVtmJ/kSP8v32CKaLg9H3iA4kO0bSKWFmUy6uQY102fqI
	wIwQ==
X-Gm-Message-State: AMke39k7/FJGbjIvh3kVSEaoXqpExarsCTwPddO/jH15pNEuLH8/lNILf8eiplhlNv+cDTuAbx/nT7Y3Z6/nwC28
X-Received: by 10.237.53.9 with SMTP id a9mr316764qte.188.1487640115923; Mon,
	20 Feb 2017 17:21:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 17:21:35 -0800 (PST)
In-Reply-To: <1487241290-6188-2-git-send-email-obi@opendreambox.org>
References: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
	<1487241290-6188-2-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 01:21:35 +0000
Message-ID: <CAJTo0Lacj_34LppjT-qeE5UCmHyET1RyYDavRQ5xvQ=eOiS2JQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] ffmpeg: Fix the license description
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
X-List-Received-Date: Tue, 21 Feb 2017 01:21:55 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ea9e25505490034a7

--001a11c0285ea9e25505490034a7
Content-Type: text/plain; charset=UTF-8

On 16 February 2017 at 10:34, Andreas Oberritter <obi@opendreambox.org>
wrote:

> +LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> +LICENSE_${PN} = "GPLv2+"
> +LICENSE_libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libpostproc = "GPLv2+"
> +LICENSE_libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> +LICENSE_libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>

Using a script to extract the pkgdata information, I see this license
information in the runtime libraries.

libswscale-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libswresample-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libpostproc-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libavutil-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libavformat-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libavfilter-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libavdevice-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libavcodec-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
libswscale: GPLv2+
libswresample: GPLv2+
libpostproc: GPLv2+
libavutil: GPLv2+
libavformat: GPLv2+
libavfilter: GPLv2+
libavdevice: GPLv2+
libavcodec: GPLv2+
ffmpeg-dbg: BSD & GPLv2+ & LGPLv2.1+ & MIT
ffmpeg-staticdev: BSD & GPLv2+ & LGPLv2.1+ & MIT
ffmpeg-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
ffmpeg-doc: BSD & GPLv2+ & LGPLv2.1+ & MIT
ffmpeg-locale: BSD & GPLv2+ & LGPLv2.1+ & MIT
ffmpeg: GPLv2+

It looks like the BSD/LGPL/MIT license statements don't end up in any
packages which actually contain binaries.  Is this correct?

Ross

--001a11c0285ea9e25505490034a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 February 2017 at 10:34, Andreas Oberritter <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2cq" class=3D"g=
mail-a3s gmail-aXjCH gmail-m15a467da322c42ba">+LICENSE =3D &quot;BSD &amp; =
GPLv2+ &amp; LGPLv2.1+ &amp; MIT&quot;<br>
+LICENSE_${PN} =3D &quot;GPLv2+&quot;<br>
+LICENSE_libavcodec =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&=
#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
+LICENSE_libavdevice =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
+LICENSE_libavfilter =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
+LICENSE_libavformat =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
+LICENSE_libavresample =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONF=
IG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br=
>
+LICENSE_libavutil =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#=
39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
+LICENSE_libpostproc =3D &quot;GPLv2+&quot;<br>
+LICENSE_libswresample =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONF=
IG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br=
>
+LICENSE_libswscale =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&=
#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;</div>=
</blockquote></div><br>Using a script to extract the pkgdata information, I=
 see this license information in the runtime libraries.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra=
">libswscale-dev: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div clas=
s=3D"gmail_extra">libswresample-dev: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp;=
 MIT</div><div class=3D"gmail_extra">libpostproc-dev: BSD &amp; GPLv2+ &amp=
; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_extra">libavutil-dev: BSD &a=
mp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_extra">libavf=
ormat-dev: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div class=3D"gm=
ail_extra">libavfilter-dev: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div=
><div class=3D"gmail_extra">libavdevice-dev: BSD &amp; GPLv2+ &amp; LGPLv2.=
1+ &amp; MIT</div><div class=3D"gmail_extra">libavcodec-dev: BSD &amp; GPLv=
2+ &amp; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_extra">libswscale: GP=
Lv2+</div><div class=3D"gmail_extra">libswresample: GPLv2+</div><div class=
=3D"gmail_extra">libpostproc: GPLv2+</div><div class=3D"gmail_extra">libavu=
til: GPLv2+</div><div class=3D"gmail_extra">libavformat: GPLv2+</div><div c=
lass=3D"gmail_extra">libavfilter: GPLv2+</div><div class=3D"gmail_extra">li=
bavdevice: GPLv2+</div><div class=3D"gmail_extra">libavcodec: GPLv2+</div><=
div class=3D"gmail_extra">ffmpeg-dbg: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp=
; MIT</div><div class=3D"gmail_extra">ffmpeg-staticdev: BSD &amp; GPLv2+ &a=
mp; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_extra">ffmpeg-dev: BSD &am=
p; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_extra">ffmpeg-=
doc: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div class=3D"gmail_ex=
tra">ffmpeg-locale: BSD &amp; GPLv2+ &amp; LGPLv2.1+ &amp; MIT</div><div cl=
ass=3D"gmail_extra">ffmpeg: GPLv2+</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">It looks like the BSD/LGPL/MIT license stateme=
nts don&#39;t end up in any packages which actually contain binaries.=C2=A0=
 Is this correct?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div></div>

--001a11c0285ea9e25505490034a7--
