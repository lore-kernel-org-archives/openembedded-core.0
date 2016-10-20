Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6383E719EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:25:16 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id f128so78771003qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GPlJdDRuAYJk9G1oBP9jDpJTFdQDmrN+lFWmY2I+A4c=;
	b=u5beH90wXSuB1ro9AEWr3OIqlymNXgxK03ijmtH6fjDkiv/Pvx3ngcYYJylexL9N38
	n/VjdrINhFP2S2+owRiWvCcJb73enspLEyImb5R/hFxmpTd8uBXQkt6IjrpX6uPKznUq
	6zRZYm2ljx85lfIGst1z/9EWBPMCGZaagcx/k83GcHEgqSNNyExLjjNUcAndMmn758ab
	TU0JAeEhRlptBvCavWUp+GSMaWT9gsfoHkYqYiz3eavcanq0ymy9rkMTq/dv/6mNF5S7
	9mYSf4wm2kjKlsv1fwOQzwrxXquUKd48vktChJ8LbH4xkD6QsLRVp+p8uq+/i1Igfxe5
	Z26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GPlJdDRuAYJk9G1oBP9jDpJTFdQDmrN+lFWmY2I+A4c=;
	b=dTW4K6aWS5KN70gy0RCNy5++hdkjcffA70UAg6546e5vfWMHMhqZBYZn8HMYSXYF1r
	/FndpUeMLZo3qXRC6x4/41q22VDeDcpHqnZEZOSGncZ4f1rtwN2g9xhxs4Y0pUKst9nL
	t7KCduL4fussl7065FyPyLrvb8javqMTHr6MWgYxsgx9o8ecgS+zp979oCApYR26Fm04
	jjIh4/nkm3YkpoMtq2T5YQn6YFm4orcOR9X636FC2djqJML/1+HOj2/iVBbgxSDMj3wh
	8CeWC6Pqd48GjhbQOAYByueEuxyPsxAtShYtYxLK9ja1VhDY0d4Q03Pkbd1psRRsWhss
	7eMQ==
X-Gm-Message-State: AA6/9RmFm+7yzEN8GyD7/GfDfAiirsAncVQBjKrcN6mjYh65Z1noTC0JqCWHD+nURBX++9gL3ytxPHewwcN+o1GT
X-Received: by 10.55.156.22 with SMTP id f22mr12281733qke.36.1476955518431;
	Thu, 20 Oct 2016 02:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 02:24:58 -0700 (PDT)
In-Reply-To: <9a2f86103e33586c0587cdc62a2633768a4a6648.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<9a2f86103e33586c0587cdc62a2633768a4a6648.1476888929.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 10:24:58 +0100
Message-ID: <CAJTo0LZ==RezUpAvHxOBV5wr=yBahNj4VGtRkGgcAv5UUE1=ZQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/19] gnome-desktop3: update to 3.22.1
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
X-List-Received-Date: Thu, 20 Oct 2016 09:25:17 -0000
Content-Type: multipart/alternative; boundary=94eb2c07680e06a119053f4881d1

--94eb2c07680e06a119053f4881d1
Content-Type: text/plain; charset=UTF-8

On 19 October 2016 at 16:06, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  .../{gnome-desktop3_3.20.2.bb => gnome-desktop3_3.22.1.bb}            |
> 4 ++--
>

  * FILELIST: removed "/usr/lib/libgnome-desktop-3.so.12.1.0
/usr/share/libgnome-desktop-3.0/pnp.ids" added
"/usr/lib/libgnome-desktop-3.so.12.2.0"
packages/corei7-64-poky-linux/gnome-desktop3/libgnome-desktop3: RDEPENDS:
removed "libxrandr (['>= 1.5.0'])" added "libudev (['>=
230+git0+3a74d4fc90']) libcap (['>= 2.25'])"

Can you verify the build and runtime dependencies?  If it isn't shipping
its own pnp.ids do we need to depend on a data package to ensure they're
present?

Ross

--94eb2c07680e06a119053f4881d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2016 at 16:06, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D"gmail-:6c6" class=3D"gmail-a3s gmail-aXjCH gmail-m157dd869d1b1c29c">=C2=
=A0.../{<a href=3D"http://gnome-desktop3_3.20.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gnome-desktop3_3.20.2.bb</a> =3D&gt; <a href=3D"http://gnome-=
desktop3_3.22.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-desktop3_3.2=
2.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br></div></bl=
ockquote></div><br><div class=3D"gmail_extra">=C2=A0 * FILELIST: removed &q=
uot;/usr/lib/libgnome-desktop-3.so.12.1.0 /usr/share/libgnome-desktop-3.0/p=
np.ids&quot; added &quot;/usr/lib/libgnome-desktop-3.so.12.2.0&quot;</div><=
div class=3D"gmail_extra">packages/corei7-64-poky-linux/gnome-desktop3/libg=
nome-desktop3: RDEPENDS: removed &quot;libxrandr ([&#39;&gt;=3D 1.5.0&#39;]=
)&quot; added &quot;libudev ([&#39;&gt;=3D 230+git0+3a74d4fc90&#39;]) libca=
p ([&#39;&gt;=3D 2.25&#39;])&quot;</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Can you verify the build and runtime dependenc=
ies?=C2=A0 If it isn&#39;t shipping its own pnp.ids do we need to depend on=
 a data package to ensure they&#39;re present?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--94eb2c07680e06a119053f4881d1--
