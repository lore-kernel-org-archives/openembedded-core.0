Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B5BA360124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 22:57:07 +0000 (UTC)
Received: by iofh3 with SMTP id h3so6303737iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 14:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gZ9osrGtES/9Y74RKSHLmMLYWwEQex8uZNrljuejU/s=;
	b=CI9Zzthn1OQTabtkuuN9tygn445mnwWJn3L7AfZ4tsdk4NsORDyDexE9jrpAc1DtkT
	MWAsm8zuiWQBeFMmHZJR+G7apLDNlONZ0kCpgWt/Ca6dHMzi0Ccf53v8lB+ulFupwWCT
	1vfbueMUz50tyBEnObTDYhuKaSbpVYJXZKGlz3b8V6KeG0qW4fK559guodZ6LlRVJLFi
	D83ocsQ4nJvsiIBLkVFOgkB/nzgUJ+/n7KXiBf2Li3gVeACHGbjNTkSEOI8+mlp0tnY0
	9fUkMb+DjZaJi5X9M639ibTrnovQDx7iYLWA2atXuj/2H8EEIoMFI/SVbUVCyIQh9QJy
	Y+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gZ9osrGtES/9Y74RKSHLmMLYWwEQex8uZNrljuejU/s=;
	b=Nf6cecVZu3la+4sDN0Wi6DM7Qz6pZYcGewQZb1mfaqIohYboj2q0D2BMthX1Avg2Id
	Jq2g18rwZnGIgo5fhaSf338HLHmRLWLmBMwPJqriu486xLrpBgyzoDGBbG8E+9EXA/Gn
	GiVFe5Gm86hcTCdi+MUOXwFgXsob/rI7VlOHvwSlSHQWJYx90PaLxqa3wwWu1KsRl8V0
	GcCfcqvBxFXlYuehPaxJS+6YHE84On4H8eWk99dSUhjbgcUVQAkjWUYT9Ex52IHUQsJK
	jW/NdVIh/oKzzb247dWv30CZLUuNpyB+YuA2OTK7aOpip1hgcU74GyDzJUc9uJ4Ks8Q+
	axqg==
X-Gm-Message-State: ALoCoQkN73UH3f0Cyj2sS5nbf2IEANOtd+MMJwq2XC7A6LKgMBj0eYCCg01prOjbQcj8fUWQS1QTZ6uBdk3fp8F52YuB6WsUD/Os+Z4uHFVlPFgEKCyYDU0=
X-Received: by 10.107.130.155 with SMTP id m27mr921772ioi.133.1449529027679;
	Mon, 07 Dec 2015 14:57:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 7 Dec 2015 14:56:48 -0800 (PST)
In-Reply-To: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Dec 2015 22:56:48 +0000
Message-ID: <CAJTo0LZmao029oQMnK8=5tOZn0FPkAzvCjez-CkOCNG_oCY7rw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Mon, 07 Dec 2015 22:57:10 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94c96d61052656c6a0

--001a113ecd94c96d61052656c6a0
Content-Type: text/plain; charset=UTF-8

On 2 December 2015 at 07:56, Maxin B. John <maxin.john@intel.com> wrote:

>  meta/recipes-core/jpeg/jpeg_9a.bb                | 29 -------------------
>  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb | 36
> ++++++++++++++++++++++++
>

(CCing the usual suspects who will notice and care about this)

I've just noticed that this means that when the binary packages are
debian-renamed the version goes backwards: libjpeg-9a to libjpeg-8d+1.4.2.
Does anyone have an opinion on either:

1) ignore it
2) put an PE (epoch) in libjpeg-turbo
3) configure the debian renaming so the library has a different name
(libjpeg-turbo, presumably)

Ross

--001a113ecd94c96d61052656c6a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 December 2015 at 07:56, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ju" class=3D=
"a3s" style=3D"overflow:hidden">=C2=A0meta/recipes-core/<span class=3D"il">=
jpeg</span>/<a href=3D"http://jpeg_9a.bb" rel=3D"noreferrer" target=3D"_bla=
nk">jpeg_9a.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 29 -------------------<br>
=C2=A0meta/recipes-core/<span class=3D"il">jpeg</span>/libjpeg-turbo_8d+<a =
href=3D"http://1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">1.4.2.bb</a> =
| 36 ++++++++++++++++++++++++</div></blockquote></div><div class=3D"gmail_e=
xtra"><br></div>(CCing the usual suspects who will notice and care about th=
is)</div><div class=3D"gmail_extra"><br>I&#39;ve just noticed that this mea=
ns that when the binary packages are debian-renamed the version goes backwa=
rds: libjpeg-9a to libjpeg-8d+1.4.2.=C2=A0 Does anyone have an opinion on e=
ither:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>1) ignore it</div><div class=3D"gmail_extra">2) put an PE (epoch) in libjp=
eg-turbo</div><div class=3D"gmail_extra">3) configure the debian renaming s=
o the library has a different name (libjpeg-turbo, presumably)</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecd94c96d61052656c6a0--
