Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 01B65780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:10:39 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id w1so8014164qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HTDbS7WvvT2/TRmZ6+xDPRPK9ex55JYOcbfmukWPAtI=;
	b=bafreHYBGHCS2WyaBJR9o6Xdo1CjXAkx6leJGYAXqKoXyW59PmyroxFt0Ozh/T2Q+k
	ANnZFXbvT90ibUIQr+NLqYciBgPCDi9+umroHOX5Pz/33LNlXS/1QoT8/+hCwsG6tcFY
	CbRUrfY6RZWJCSsKJgCp9/MPki98Ixy4P/Gh3iGPXOMLiXgnwOzmTjy8Rl8z+gvvj+5a
	5rqu/E6FFTdVjjTUv8s29Axs6Yg/YKo7SwKlJZpqHi3W0eya+dQ9CjMEKBaCvvDE115O
	CzBhquqYiPpSchwjr9BmrCKQ2eikoNbfn2jhkpvRHTVKAuR3zzrTDSYGw/gKWW50RuR4
	FsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HTDbS7WvvT2/TRmZ6+xDPRPK9ex55JYOcbfmukWPAtI=;
	b=DrOWGfPKdT89fErkbpesN7aaSb2vl+QRyis0/5v6oil6v9MkNR67ULAzzy3jMHCttY
	U9wafhZp6wfXuZeoN8QtVlXudQoVvJexFaknRB52T0WL1qlh8mWseLujzOekSA499vqe
	fcG4y3jbPcvntCg/GkfUd0nTX4d70ivM/oNAnHE+LC7tTRR2QaD/7G1T57nAmfn41Ie3
	YzF3I1+AcojmTbaGmR0XqWzRA3lUb9hALC0E7FAfjO+nBqaLyX7IOEehhrhxSliV2giA
	l7IGgP69t2do58xbAyzfchTq1I3ZW08MxTSaSVUWpOLUrWLFVpi6o7ah5lFhnO6Eo0NW
	HjgA==
X-Gm-Message-State: AODbwcCsfn3N3CDCj490mxfHFElLjb5hTmzD9zdtLdiIhyXZp+53wyLh
	8Fk2i7Z9Hw8WBhdGLEQiX2At5AwvR9WX0Ic=
X-Received: by 10.200.62.25 with SMTP id z25mr25841392qtf.139.1496844640865;
	Wed, 07 Jun 2017 07:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 07:10:20 -0700 (PDT)
In-Reply-To: <20170607134942.13281-1-ismo.puustinen@intel.com>
References: <20170607134942.13281-1-ismo.puustinen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 15:10:20 +0100
Message-ID: <CAJTo0LbcEL78uNKy6CS0vUkDCT1OkW+X7ojk=KsYV-wTi-5S9Q@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Wed, 07 Jun 2017 14:10:40 -0000
Content-Type: multipart/alternative; boundary="f403045ee67e1a665605515f4df7"

--f403045ee67e1a665605515f4df7
Content-Type: text/plain; charset="UTF-8"

On 7 June 2017 at 14:49, Ismo Puustinen <ismo.puustinen@intel.com> wrote:

> +RRECOMMENDS_${PN}-core = "${@bb.utils.contains('PACKAGECONFIG',
> 'readline', '${PN}-readline', '', d)}"
>

Recommends can not exists, so I wouldn't bother with this complication.

+RDEPENDS_${PN}-modules_remove += "${@bb.utils.contains('PACKAGECONFIG',
> 'readline', '', '${PN}-readline', d)}"

(etc)

Don't use _remove and += as it's confusing.

But if for example readline is disabled, why would the package be created
in the first place?

Ross

--f403045ee67e1a665605515f4df7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2017 at 14:49, Ismo Puustinen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ismo.puustinen@intel.com" target=3D"_blank">ismo.puustinen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:3r3" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15c82d22bf0bc74e">+RRECOMMENDS_${PN}-core =3D &q=
uot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, &#39;readline&#39;, =
&#39;${PN}-readline&#39;, &#39;&#39;, d)}&quot;<br></div></blockquote></div=
><br>Recommends can not exists, so I wouldn&#39;t bother with this complica=
tion.</div><div class=3D"gmail_extra"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><span styl=
e=3D"font-size:12.800000190734863px">+RDEPENDS_${PN}-modules_remove +=3D &q=
uot;${@bb.utils.contains(&#39;</span><wbr style=3D"font-size:12.80000019073=
4863px"><span style=3D"font-size:12.800000190734863px">PACKAGECONFIG&#39;, =
&#39;readline&#39;, &#39;&#39;, &#39;${PN}-readline&#39;, d)}&quot;</span><=
/blockquote><div>(etc)</div><div><br></div><div>Don&#39;t use _remove and +=
=3D as it&#39;s confusing.</div><div><br></div><div>But if for example read=
line is disabled, why would the package be created in the first place?</div=
><div><br></div><div>Ross=C2=A0</div></div>

--f403045ee67e1a665605515f4df7--
