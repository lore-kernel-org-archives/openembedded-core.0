Return-Path: <kergoth@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 045A27FC18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:38:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c184so8120959pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:in-reply-to:references:subject
	:mime-version; bh=ddfr0pkZjxNHp/9R1XLJ5/1q92ex72RDNEw7ygUiyII=;
	b=d6Rc4zCD6anJc1byEqBJaG31QFtuNif73qy/rDs0Smc+JPqdyX9rkIpGnvoDO99kIV
	o61os99PHK53gvU97SSj8lUBS6yT0MFAvqvE6GDcALZTjEICRel7MBzNeFoCkzfEmxvV
	7NGhYj5W9REQVuJ83uyTFdLf/0yzdwmdq/3ZCUG77/6P/75DWCjzp2t4+AWY7XfUwCKA
	65EdCkOuGwatt94S7JW7iZEuGcxPSUE4jXaf6/JMS/cP64A1ODinveu4elfR22/Q4k3R
	H3EhwCYvg9jUmQnY0TM/3nXk8yw2NzOc934PwXUP+/H7Vzd9P1lb5q9wl3YUC5f8g3zN
	UerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version;
	bh=ddfr0pkZjxNHp/9R1XLJ5/1q92ex72RDNEw7ygUiyII=;
	b=XmE0h4CX7JTQNAsAi4k5q/VN+GSHmQFcU4j41giSthxbKjWLnlpnywnjWAeVWI0NoN
	VkhRo+QYoWymIlQP1s0/3CvCHSfPHheflKxBnoG77MmSLkzOAMJxWJRupH7DMoakSkdQ
	GSqDBp9/AL0Ca5/6nSOe3eh/usBwDxmJipmy0oPiDu7boeTLMLnU/CC+coPXOovglzou
	9AM8KvFCOLULcdLcZ4O2Y/NSzlXjFUE9HkOI9nMSbc3s1I9Asd1tceje6sTU0umDnEPc
	RhhLJ2oOTHMOhNY/+oU6lVUO8NF5efakLz+BPhZAHwiX1N8dj/iA8jJ+wEFnfPUcg701
	sKoQ==
X-Gm-Message-State: APjAAAUeTzsRh7JABxPorJSk1fhPzozBTtbbYBqsf5F+H2CCkMaDcX98
	MSdak8sq5nxy12tIiX9et8M=
X-Google-Smtp-Source: APXvYqxBxV+T+6a3vNAmI5MFAX+YzPHB14snUtncVCqaYRcwg2tpaPCRplqqysMHnoE8ctIXboLypw==
X-Received: by 2002:a63:5804:: with SMTP id m4mr34874783pgb.50.1574721505834; 
	Mon, 25 Nov 2019 14:38:25 -0800 (PST)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id
	u9sm9698988pfm.102.2019.11.25.14.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Nov 2019 14:38:24 -0800 (PST)
Date: Mon, 25 Nov 2019 15:38:17 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Christopher Larson <kergoth@gmail.com>, Khem Raj
 <raj.khem@gmail.com>
Message-ID: <9c0e66d3-f10e-4daa-a382-c41fc1cb26e5@Spark>
In-Reply-To: <CAMKF1soiu-7+hGiRp-Em7erFNgmdXbTpxVO29OHMQxjhxpMw6Q@mail.gmail.com>
References: <20191125221357.6560-1-kergoth@gmail.com>
	<20191125221357.6560-2-kergoth@gmail.com>
	<CAMKF1soiu-7+hGiRp-Em7erFNgmdXbTpxVO29OHMQxjhxpMw6Q@mail.gmail.com>
X-Readdle-Message-ID: 9c0e66d3-f10e-4daa-a382-c41fc1cb26e5@Spark
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dosfstools: fix CP437 error from `dosfsck -l`
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
X-List-Received-Date: Mon, 25 Nov 2019 22:38:25 -0000
Content-Type: multipart/alternative; boundary="5ddc57df_41b71efb_2d9"

--5ddc57df_41b71efb_2d9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Good call, no idea how I missed that one.
On Nov 25, 2019, 3:28 PM -0700, Khem Raj <raj.khem@gmail.com>, wrote:
> On Mon, Nov 25, 2019 at 2:12 PM Christopher Larson <kergoth@gmail.com> wrote:
> >
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Fix this error seen when using dosfsck -l to list fs contents:
> >
> > CP437: Invalid argument
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> > meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> > index 69aa81af44..c99d2019c8 100644
> > --- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> > +++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> > @@ -23,3 +23,6 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
> > CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> >
> > BBCLASSEXTEND = "native"
> > +
> > +# Add codepage437 to avoid error from `dosfsck -l`
> > +RRECOMMENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"
>
> I think += should be dropped
>
> > --
> > 2.11.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--5ddc57df_41b71efb_2d9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Good call, no idea how I missed that one.</div>
</div>
<div name=3D=22messageReplySection=22>On Nov 25, 2019, 3:28 PM -0700, Khe=
m Raj &lt;raj.khem=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>On=
 Mon, Nov 25, 2019 at 2:12 PM Christopher Larson &lt;kergoth=40gmail.com&=
gt; wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22><b=
r />
=46rom: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br />
<br />
=46ix this error seen when using dosfsck -l to list fs contents:<br />
<br />
CP437: Invalid argument<br />
<br />
Signed-off-by: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br =
/>
---<br />
meta/recipes-devtools/dosfstools/dosfstools=5F4.1.bb =7C 3 +++<br />
1 file changed, 3 insertions(+)<br />
<br />
diff --git a/meta/recipes-devtools/dosfstools/dosfstools=5F4.1.bb b/meta/=
recipes-devtools/dosfstools/dosfstools=5F4.1.bb<br />
index 69aa81af44..c99d2019c8 100644<br />
--- a/meta/recipes-devtools/dosfstools/dosfstools=5F4.1.bb<br />
+++ b/meta/recipes-devtools/dosfstools/dosfstools=5F4.1.bb<br />
=40=40 -23,3 +23,6 =40=40 EXTRA=5FOECON=46 =3D =22--without-udev --enable=
-compat-symlinks=22<br />
C=46LAGS +=3D =22-D=5FGNU=5FSOURCE -D=5FLARGE=46ILE=5FSOURCE -D=5F=46ILE=5F=
O=46=46SET=5FBITS=3D64=22<br />
<br />
BBCLASSEXTEND =3D =22native=22<br />
+<br />
+=23 Add codepage437 to avoid error from =60dosfsck -l=60<br />
+RRECOMMENDS=5F=24=7BPN=7D=5Fappend=5Flibc-glibc +=3D =22glibc-gconv-ibm4=
37=22<br /></blockquote>
<br />
I think +=3D should be dropped<br />
<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22>--=
<br />
2.11.1<br />
<br />
--<br />
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br />
Openembedded-core mailing list<br />
Openembedded-core=40lists.openembedded.org<br />
http://lists.openembedded.org/mailman/listinfo/openembedded-core<br /></b=
lockquote>
</blockquote>
</div>
</body>
</html>

--5ddc57df_41b71efb_2d9--
