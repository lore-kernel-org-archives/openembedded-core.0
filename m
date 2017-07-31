Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADB87852C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 15:04:00 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g35so79483888ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uL5n0RaAjFCfQ6IMl0OVIOYp4Ng//ra1yPRJlio65AE=;
	b=XvErzRN3I3kEOu9p4UvNmwOJe68EefNc+PT9Id0u/bLj9iySMTmtkdrC6DmDm2sBkl
	Hok+IvyYs7iAK5Fa9Vj4F+Vb27NnUMQhFTWajxOpdqGFYIEOVAsGITF552hnCOg1oIas
	5wKRH5MkHbQ/rR6CG5uXDEBbY387JxSUhipwIVBdjU4DH8VEiwcIiz7aoRgwIP7RpjN5
	8Q6IGzxRT724PCheIkQXsC6RhLsaMiVUBxaxOoKi/HmlS8eJRMB1LqBEWFmI/fjrpxVy
	3W6amHwRVB3ekryj/pcYObtXKLniBMUuyT5AIiUwp15CpYcS/59UuXJc1+heYxfBAvrP
	B92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uL5n0RaAjFCfQ6IMl0OVIOYp4Ng//ra1yPRJlio65AE=;
	b=Sahx1ooGZEYdsKcrOr7M9irPMs5CZP13tllaZfI/K6tsS9G4UptxHEW650ON07DKfP
	+JNMK5/lvHi4NLr8BBZi0KPBPHX3dlfqklSvPFSXZvlrQvneTrUvuQoFF2HwvX/I6GRO
	mv4UNIuFslxmH3CahuXvzszYBIRz+bVV3Nx13m9R+PyGPIjM0JEmCxQL/wGV25Pv7l/p
	q333xa/UZXUmRzoxxp838Fr7ZnivzLtch5NSw7OFBdrNATQFJVdKQJAso4X2iXwSfWkY
	h1cVUTO5M6/GCoCLXSfTr5gmg+kLsqdX0trgsHStXtaTvLZiNUotZ/MpMtt7SutotLE6
	POtg==
X-Gm-Message-State: AIVw111Kv1UYhK4tnHpmdgrStyue312/vVUCxvy1tqMkyxOvV9iWTFPy
	RWVOq8Fbva9UJYhvgCntBCLPSX9c8YcE
X-Received: by 10.107.205.72 with SMTP id d69mr19340715iog.224.1501513441141; 
	Mon, 31 Jul 2017 08:04:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 31 Jul 2017 08:03:40 -0700 (PDT)
In-Reply-To: <1501494217.18633.0.camel@linuxfoundation.org>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
	<287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
	<1501494217.18633.0.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Jul 2017 16:03:40 +0100
Message-ID: <CAJTo0LYqK8P1UQyrF8cF7kzfKB46j+2eYWzk+fXhW_SnW8TGcg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Mon, 31 Jul 2017 15:04:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c189bae48f7e905559e573a"

--94eb2c189bae48f7e905559e573a
Content-Type: text/plain; charset="UTF-8"

On 31 July 2017 at 10:43, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> It does feel like upstream screwed up and should really sort this out.
> Do you know what upstream plan to do (if anything)?
>

Upstream fixed a problem and whilst it was way to big a change for a point
release the code is probably "better" now.  It just breaks everything, and
you can't even be compatible with both versions.

For what its worth, systemd added a check for the argument type in
configure.ac[1] (and now meson) but also just demands 3.1, presumably for
the new options.

Ross

[1]
https://github.com/systemd/systemd/commit/c9f7b4d356a453a01aa77a6bb74ca7ef49732c08

--94eb2c189bae48f7e905559e573a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 July 2017 at 10:43, Richard Purdie <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex">It does feel like=
 upstream screwed up and should really sort this out.<br>
Do you know what upstream plan to do (if anything)?<br></blockquote><div><b=
r></div><div>Upstream fixed a problem and whilst it was way to big a change=
 for a point release the code is probably &quot;better&quot; now.=C2=A0 It =
just breaks everything, and you can&#39;t even be compatible with both vers=
ions.</div><div><br></div><div>For what its worth, systemd added a check fo=
r the argument type in <a href=3D"http://configure.ac">configure.ac</a>[1] =
(and now meson) but also just demands 3.1, presumably for the new options.<=
/div><div><br></div><div>Ross</div><div><br></div><div>[1]=C2=A0<a href=3D"=
https://github.com/systemd/systemd/commit/c9f7b4d356a453a01aa77a6bb74ca7ef4=
9732c08">https://github.com/systemd/systemd/commit/c9f7b4d356a453a01aa77a6b=
b74ca7ef49732c08</a></div></div></div></div>

--94eb2c189bae48f7e905559e573a--
