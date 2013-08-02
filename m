Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 425826066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 21:17:18 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so787320lab.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=qdie6AvaDR5GmV4i5+njYyLFZEP8Kb63SUusCwMfqb4=;
	b=AdFtT06OktEKB/3iGq3sF2der0pVu3/AMSMknlSDdDgcViBlpfKhC08aUR0GF6QheY
	mvGeTW/cKcqCyBfeb+0r1W4y6EyS+X62i6sT7bGZ+8MoAtnVkzmS6AR32RFLcZDaH1ss
	sz900xDC9dT/0XbHPb5Pm2LYycpKuJEDtwi5RRaOFm75XO+XTnY+6Rm08N4E0x0hNV8b
	Enb2fZQyPLUd4qLEx24UeBI2ijREy4JbA/OBRIGjzbnbecTCQ0hufn1Ads1rtaXLvnp7
	YH5k2B10xf72SHP+X4FnSLoX9Vs3fyFKI62Z8Mlv17CJXkJtZKPndfFxDlg832mZHTGG
	fwiQ==
X-Received: by 10.152.22.42 with SMTP id a10mr3864374laf.30.1375478238281;
	Fri, 02 Aug 2013 14:17:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Fri, 2 Aug 2013 14:16:58 -0700 (PDT)
In-Reply-To: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 2 Aug 2013 14:16:58 -0700
X-Google-Sender-Auth: WlxtzNq-7VrOr_pNfBR00pGgwWg
Message-ID: <CABcZANnvpMCNKyncpct+FTiHrcGid4_hpKQvH=DQ=YwD4LFYJA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] distro_features_check.bbclass: Allow checking of required/conflicting features
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
X-List-Received-Date: Fri, 02 Aug 2013 21:17:18 -0000
Content-Type: multipart/alternative; boundary=089e0158b794ca065304e2fd7b67

--089e0158b794ca065304e2fd7b67
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> This add support to list required/confliting distro features for a
> recipe; this avoids user mistake when building recipes/images which
> would not work depending on DISTRO_FEATURES option set.
>
> Adding:
>
> ,----[ Use example ]
> | inherit distro_features_check
> |
> | REQUIRED_DISTRO_FEATURES = "x11"
> | CONFLICT_DISTRO_FEATURES_mx6 = "wayland"
>

I wonder if it would be worth doing this like PNBLACKLIST to let the recipe
provide its reasoning as a message, or if that would add too much overhead.
I don't know enough about this use case, but something to consider if it
hasn't been already.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158b794ca065304e2fd7b67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.co=
m.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":qd" style=3D"overflow:hidden">Th=
is add support to list required/confliting distro features for a<br>
recipe; this avoids user mistake when building recipes/images which<br>
would not work depending on DISTRO_FEATURES option set.<br>
<br>
Adding:<br>
<br>
,----[ Use example ]<br>
| inherit distro_features_check<br>
|<br>
| REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
| CONFLICT_DISTRO_FEATURES_mx6 =3D &quot;wayland&quot;</div></blockquote></=
div><br><div style>I wonder if it would be worth doing this like PNBLACKLIS=
T to let the recipe provide its reasoning as a message, or if that would ad=
d too much overhead. I don&#39;t know enough about this use case, but somet=
hing to consider if it hasn&#39;t been already.</div>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e0158b794ca065304e2fd7b67--
