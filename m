Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A762F6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:15:49 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mv3so29595687igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/90cDVVdaONkJqZEq5kRgKzgEAWdi/dazQuZG78WzJk=;
	b=cWR2jMLseVo0FKkb88W3jV7mHOfornnJu13mZAjFM5bjDR1AX221vmcFbESHZ8lKv0
	qusSngFXD/9nj3MZyuUP2aAJX4Mri5h7I67Oo3vXBgaPDwqdFzzFxbCxxyTq5Q7Ilxtz
	+ge65Bnwq48GaWHqUwGy+gsANWKsQmHeaZhbw+rRcp5reQdeBHcmSTsTMBHYUFsUUrcb
	lwdLPeUqHtp0GAINShrzzHpjCLkCexINqPPlMuiLGMpXkd5b/vpE3mqsBK63WvS6+9X3
	sGYdOl9+Si6EP8GGDsKefCeyDIFoxTNFmTwb6SP2O6oE3cQpkyS0iOeAfQpU9NuVrxqV
	LkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/90cDVVdaONkJqZEq5kRgKzgEAWdi/dazQuZG78WzJk=;
	b=AUAqmvt/FQ2LtBPA1gZra0bWdJhk51s9IA79sMp2eNoBjM9r1SZe2AyKfeNEUToQ6z
	f4pN98qz9VemXmbQfDlQjdeS4D6PZEpCrwtsiQwG8mXls8o+OxdWXMHCvH/lRngMe79z
	KN6qLJBr7qzDNg/z0fhXwK4RwhpDaZXy+IChRJiDDnHVoXnGPBYwcbm952j9YGSdpaOa
	f2t6cWfnJnJeEvD4nnTtUAdrYQw4cIyOS0qAXbVdIxzHN1Yw/R23WerzCslCXPR9VCHU
	QaoWVlWlo9D7Efd6COLKMrHLg8PmPMc9mC0YQI898ps4AcYKMP/8Z4aVUdpm7Opbcnzl
	E5vg==
X-Gm-Message-State: ALoCoQkI/28Ord/rzF2BMkqst6+/HKiHYO2DOTyAWXl2wSjuz+t6wmNEQpoW0tHlpIpQKQXsoOvRK519Rx90btyo1RPcRzYr+YX5Zcq/2+wJ1Cj1f8cHIQo=
X-Received: by 10.50.30.69 with SMTP id q5mr18119605igh.78.1450700150017; Mon,
	21 Dec 2015 04:15:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 04:15:30 -0800 (PST)
In-Reply-To: <379ef3716c72c2230a75294f4be5430903f17450.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<379ef3716c72c2230a75294f4be5430903f17450.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 12:15:30 +0000
Message-ID: <CAJTo0LaF5ByQoxkOzD22=A6Sq7eiNJCgbObX5E=-AWFVdm=9ng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/17] fts: Add recipe
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
X-List-Received-Date: Mon, 21 Dec 2015 12:15:49 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c1e300605276773c2

--047d7bdc1c0c1e300605276773c2
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

>  create mode 100644 meta/recipes-core/fts/fts/fts-header-correctness.patch
>  create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
>  create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
>  create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
>  create mode 100644 meta/recipes-core/fts/fts/stdint.patch
>

None of these patches have headers.

Ross

--047d7bdc1c0c1e300605276773c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":50g" class=3D"a3s" st=
yle=3D"overflow:hidden">=C2=A0create mode 100644 meta/recipes-core/fts/fts/=
fts-header-correctness.patch<br>
=C2=A0create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch<br>
=C2=A0create mode 100644 meta/recipes-core/fts/fts/gcc5.patch<br>
=C2=A0create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch<br>
=C2=A0create mode 100644 meta/recipes-core/fts/fts/stdint.patch</div></bloc=
kquote></div><br>None of these patches have headers.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc1c0c1e300605276773c2--
