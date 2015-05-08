Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id B6A4073C81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 13:47:45 +0000 (UTC)
Received: by qku63 with SMTP id 63so48073037qku.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 06:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OY28K8MPzCVjlAydf9ICoe7yBtkhKrkTT94J4zAjDeI=;
	b=Y/7bD1wj1LO4+JOuKgb0h0XIEpNBe1VCmGGLoJFsVojB5EDQ/0qmqEPoPkmSa/8kgS
	A1gI6/bbe9hUW83W0BO/KYUaPbmwKRCZMKKdFxBSZCGWlbRpLDZ/DE32SemyfqvG4CQt
	a5lpkjghRB8wMLW7+ThFfTYm9ZEhMd/7eDfTvEupIQcVwfGkLf66byZNt6MH2SthR2qQ
	yVO9cyMg9ZUH3FfmyqaEpGg8/ds6s7fTmIn6eFPInuLArtWRWaJkwmQZ3i+CHV5L/Kns
	oRB6kFTtZp9q7fwTZZLDyz8ORERMz72GPX/36uSTr3Fjh30LztCbSXOfmm1xY2MdrYqI
	7wfQ==
X-Gm-Message-State: ALoCoQmHH7coop0mgdJE3PhZFi6uKyhyKgsXJ0Smk4QkL0L1fitYlwDjbvYI5TjDDKOPkjzdszSm
X-Received: by 10.140.88.35 with SMTP id s32mr4871767qgd.59.1431092866605;
	Fri, 08 May 2015 06:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 8 May 2015 06:47:26 -0700 (PDT)
In-Reply-To: <1431085154-22103-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1431085154-22103-1-git-send-email-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 May 2015 14:47:26 +0100
Message-ID: <CAJTo0LZuKZnX8Qv-g-2X=inu4t7rU8sQvV5NGutRo19nwEuVMw@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Make tests selectable via variable
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
X-List-Received-Date: Fri, 08 May 2015 13:47:45 -0000
Content-Type: multipart/alternative; boundary=001a11c11d02f47b580515924542

--001a11c11d02f47b580515924542
Content-Type: text/plain; charset=UTF-8

On 8 May 2015 at 12:39, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
wrote:

>  GSTREAMER_1_DEBUG ?= "--disable-debug"
> +GSTREAMER_1_CHECK ?= "--disable-check"
>  EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
> -                --disable-dependency-tracking --disable-check \
> +                --disable-dependency-tracking ${GSTREAMER_1_CHECK} \
>

Seems like a PACKAGECONFIG is a neater solution, can you use that and also
change _DEBUG to use PACKAGECONFIG too?

Ross

--001a11c11d02f47b580515924542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2015 at 12:39, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":17i" class=3D"a3s" style=3D"overflow:hidden">=C2=A0GSTREAMER_1_DEBUG ?=
=3D &quot;--disable-debug&quot;<br>
+GSTREAMER_1_CHECK ?=3D &quot;--disable-check&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-docbook --disable-gtk-doc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-dependen=
cy-tracking --disable-check \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-dependen=
cy-tracking ${GSTREAMER_1_CHECK} \</div></blockquote></div><br>Seems like a=
 PACKAGECONFIG is a neater solution, can you use that and also change _DEBU=
G to use PACKAGECONFIG too?</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11c11d02f47b580515924542--
