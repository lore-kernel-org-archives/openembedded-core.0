Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 650D7766D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:19:50 +0000 (UTC)
Received: by qged69 with SMTP id d69so141463887qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2SrWQj7+QFUY6wphzhx17sF/P/zVxVA3V+knzCXvYIo=;
	b=XD0ANuZBa/MRaexKk4Qs2To8bis52wP2KSCF3qL0jhgzizrW9dBrm5/DkfvKMNScMI
	3RPaMDxo4Pnpgm/eHkNmjCyHAppz0KzSBN21VhX98fitxfo441TMxB6o/W+aLRqe0EjE
	6Wu+s18QGA+j8Bu6EwNlu5dLnVpvDYQWkkHcSyCSpsc+2dF/q58rUnI0acVIHE5i6rlQ
	jtfQXDKBpUhmsmpQ+HMjltf1uF9gcMVGijdtaKkpUxID21Xpr2RxiVcdkmZoh4DffgCb
	4yrA1H3oAeOEQWgiVqgoTtmShGBFxKVky3rH0ZyYM2HfgOE6CV/AMmRaIbC1ioPqgBtu
	orww==
X-Gm-Message-State: ALoCoQn+THaIlilaynEvlHDDQ4x6OLfzKnFsoH1+kvCOYxrfS5Zw/LpObkjXRYbuMeii3R3D61Gd
X-Received: by 10.140.33.164 with SMTP id j33mr40526069qgj.77.1439306391245;
	Tue, 11 Aug 2015 08:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 11 Aug 2015 08:19:28 -0700 (PDT)
In-Reply-To: <55CA101E.2000002@linux.intel.com>
References: <1439305030-5911-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LY_LepwMxG647pCOVWeFq=HywMmEL94b81z=5R=7Afz1A@mail.gmail.com>
	<55CA101E.2000002@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Aug 2015 16:19:28 +0100
Message-ID: <CAJTo0Lb6befyrDkRkiis28WOddBrofqpAkoT4b43ie9Rt==CJQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] mc: Fix QA warning RDEPENDS of util-linux-libmount
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
X-List-Received-Date: Tue, 11 Aug 2015 15:19:51 -0000
Content-Type: multipart/alternative; boundary=001a1139bd9c2c7108051d0aa214

--001a1139bd9c2c7108051d0aa214
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 August 2015 at 16:09, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.inte=
l.com>
wrote:

> The QA warnings saya "mc rdepends on util-linux-libmount",
>

The warning is "%s rdepends on %s, but it isn't a build dependency?".  In
this case, mc RDEPENDS on util-linux-libmount (via linking to libmount, and
then the appropriate RDEPENDS being added automatically) but nothing in
DEPENDS provides util-linux-libmount.

In this case where we want libmount to be deterministically on, the
solution is to add util-linux to DEPENDS (so util-linux-libmount is always
available).

Ross

--001a1139bd9c2c7108051d0aa214
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 16:09, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limo=
n@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":w6" class=3D"a3s" style=3D"overflow:hidden">The QA warnings saya=
 &quot;mc rdepends on util-linux-libmount&quot;,<br></div></blockquote><div=
><br></div><div>The warning is &quot;%s rdepends on %s, but it isn&#39;t a =
build dependency?&quot;.=C2=A0 In this case, mc RDEPENDS on util-linux-libm=
ount (via linking to libmount, and then the appropriate RDEPENDS being adde=
d automatically) but nothing in DEPENDS provides util-linux-libmount.</div>=
<div><br></div><div>In this case where we want libmount to be deterministic=
ally on, the solution is to add util-linux to DEPENDS (so util-linux-libmou=
nt is always available).</div><div><br></div><div>Ross</div></div></div></d=
iv>

--001a1139bd9c2c7108051d0aa214--
