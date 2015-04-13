Return-Path: <ross.burton@intel.com>
Received: from mail-vn0-f46.google.com (mail-vn0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8A12F73D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 19:11:55 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so22852913vnb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 12:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9geKKg4CfbMAXd+gaWOjhCrLkHHgZ3VIJRpMj2xMppw=;
	b=Ye45G/aGrcnE3d2lGSIDXLb3IfhkaegDwAwzXT7soERmFBiq/1PgaASdl67rbyqFlK
	0x80jkI6MSv7mloG/ic+/WycQaJEjIZa+KvAD6EDqdTn6XfYHsvO9bMBqLnOeuU8GO35
	JYPlzn2/bHMa1eFa6cF8s0LEwAs367QsuXqO5ERjV8enVX/NTuHWcTqyGF/04LUQNkoj
	djWljF9tdX9ojQ2xn/QVTeZhYiQqOHIvnFnoOzmg7CRIiXmNMQ5QKeHAkWE9i72ws4wT
	/ykK4Adsa2u0t6CgD/zQR54MMKuy8sDtsvb0mp9XzOLm73lKLDsPvksZah0t+lSu2eWS
	TcrA==
X-Gm-Message-State: ALoCoQluJESxF97c6QVHoErueixPmQJop4cHirHES4QHZEBJ450jFDr+YqGtpdidhu3crB126yrk
X-Received: by 10.140.89.37 with SMTP id u34mr12876462qgd.15.1428952316308;
	Mon, 13 Apr 2015 12:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 13 Apr 2015 12:11:35 -0700 (PDT)
In-Reply-To: <20150413135017.GH2330@jama>
References: <20150413135017.GH2330@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Apr 2015 20:11:35 +0100
Message-ID: <CAJTo0Lb3G73BbxLHzkqYe4fpJbjyZTaBE-tJequs4jQsEfYN5w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-03-23, Last for Yocto 1.8 Fido
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
X-List-Received-Date: Mon, 13 Apr 2015 19:11:55 -0000
Content-Type: multipart/alternative; boundary=001a11c117ee37073d05139fe352

--001a11c117ee37073d05139fe352
Content-Type: text/plain; charset=UTF-8

On 13 April 2015 at 14:50, Martin Jansa <martin.jansa@gmail.com> wrote:

> === qemux86 (1) ===
>     * /openembedded-core/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.4.5.bb, do_compile
>

"i586-oe-linux-gcc: internal compiler error: Segmentation fault (program
as)"

Presumably this has never happened before?

Ross

--001a11c117ee37073d05139fe352
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2015 at 14:50, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":2f4" class=3D"" style=3D"o=
verflow:hidden">=3D=3D=3D qemux86 (1) =3D=3D=3D<br>
=C2=A0 =C2=A0 * /openembedded-core/meta/recipes-multimedia/gstreamer/<a hre=
f=3D"http://gstreamer1.0-plugins-good_1.4.5.bb" target=3D"_blank">gstreamer=
1.0-plugins-good_1.4.5.bb</a>, do_compile<br></div></blockquote></div><br><=
div class=3D"gmail_extra">&quot;i586-oe-linux-gcc: internal compiler error:=
 Segmentation fault (program as)&quot;</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Presumably this has never happened before?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div></div>

--001a11c117ee37073d05139fe352--
