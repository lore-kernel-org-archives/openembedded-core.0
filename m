Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id C1EFB71AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:50:37 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id n21so14571546qta.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5kZUbkHi485loaK4WXR73x2s2Ifh/EufufyRktRejI4=;
	b=m4FP0/tNkRy9+KOW5K2I1QaF1kEaUopW5ep33sPgY8oYsfWVRCDcgD9AROxqELNO3W
	UJ8rFIYfv7M4AV905vUe05AlJJA+s52OZ5+Ga2pwwD+MS9OwbuP9z0CaYfaXCKQGPqC4
	bGZb1bqcHRFGiYZraQ1OaVu2ffIxaYwZPk48WaUt2G/j6rOlu2Id0klrmiC/9jdrlxdw
	vNDrELR1WuEs7UFE1YFj/8Nv1dWNa1ohU7aTk1L2P7WWpmFWipz58sV29++sdB12xa8B
	lzEgrZgrR3dmGW9WaTGsAxc5jIMF50PH2hg6ySM2CgkL1hBRgJC9reSv2SRDdk/JTQHb
	PdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5kZUbkHi485loaK4WXR73x2s2Ifh/EufufyRktRejI4=;
	b=GWxOHxUKGpdsBbI7hwkGvWjJ3iEJqtMFmhZA8olIl5uOKQmiYs8P/XZnAUyvQo7PXq
	A4tAsnISHy3WlStfM0p7sO+DwcI+HvUClyL9HmN+mb1eW3m378Qo8+8O1kIPeYoRQYy6
	YkTAFWiZPRHocaRforXQ02mFHdvABPUq+T2brefZuXSAjVgrUB8bs9opMVtYxF1B/HHK
	R7O+Zmmm8aIPt3rTrEcm17Z6r1h2TMQjfgwESjQM/AgJIQzcdHDcmJ+TJOkhokhAd1un
	f2459sCU0jmkkOZGp+y196h0h0CCcrCtyP6uwlUPuwV0FLjoJzRY+ZzeSLWXSDMkIMzU
	B9rA==
X-Gm-Message-State: AFeK/H07JVpnPvXyHKdR7UAGJonmgDHivbefZEiLzSsTdy6/AlSnXosoASuQJ1RXTQl/N2ywRpiz/jZ5MpBKkR5b
X-Received: by 10.237.34.250 with SMTP id q55mr999242qtc.144.1490799037647;
	Wed, 29 Mar 2017 07:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 29 Mar 2017 07:50:17 -0700 (PDT)
In-Reply-To: <699e3efa-95bb-fc2c-ba12-5a5e7807acb9@mindchasers.com>
References: <699e3efa-95bb-fc2c-ba12-5a5e7807acb9@mindchasers.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Mar 2017 15:50:17 +0100
Message-ID: <CAJTo0LZAWTAuC_GjBifQRzL_bMJCw52qZm-Jvo4S4QYaba8H8Q@mail.gmail.com>
To: Bob Cochran <openembedded@mindchasers.com>
Cc: mlauer@vanille-media.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python: manifest files have a bad link to "Embedded Systems Site"
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
X-List-Received-Date: Wed, 29 Mar 2017 14:50:45 -0000
Content-Type: multipart/alternative; boundary=001a113eea5a125ba1054bdfb384

--001a113eea5a125ba1054bdfb384
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 13:49, Bob Cochran <openembedded@mindchasers.com> wrote:

> These files: python-2.7-manifest.inc  python-3.5-manifest.inc
> python-native-2.7-manifest.inc  python-native-3.5-manifest.inc
>
> all have:
>
> "Visit the Python for Embedded Systems Site =>
> http://www.Vanille.de/projects/python.spy"
>
> That URL returns a 404
>
> Someone want to fix the link?
>
> Otherwise, I'll be happy to submit a patch if provided guidance on what
> site these files should now reference.
>

Wow, that must be about a decade old now.

As the scripts are part of openembedded, I don't think this needs a link
anymore.  Feel free to just delete that comment block.

Ross

--001a113eea5a125ba1054bdfb384
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 March 2017 at 13:49, Bob Cochran <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:openembedded@mindchasers.com" target=3D"_blank">openembedded@mindchaser=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":q=
s" class=3D"a3s aXjCH m15b1a3c6066340a8">These files: python-2.7-manifest.i=
nc=C2=A0 python-3.5-manifest.inc python-native-2.7-manifest.<wbr>inc=C2=A0 =
python-native-3.5-manifest.inc<br>
<br>
all have:<br>
<br>
&quot;Visit the Python for Embedded Systems Site =3D&gt; <a href=3D"http://=
www.Vanille.de/projects/python.spy" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.Vanille.de/projects<wbr>/python.spy</a>&quot;<br>
<br>
That URL returns a 404<br>
<br>
Someone want to fix the link?<br>
<br>
Otherwise, I&#39;ll be happy to submit a patch if provided guidance on what=
 site these files should now reference.</div></blockquote></div><br>Wow, th=
at must be about a decade old now.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">As the scripts are part of openembedded, I don=
&#39;t think this needs a link anymore.=C2=A0 Feel free to just delete that=
 comment block.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113eea5a125ba1054bdfb384--
