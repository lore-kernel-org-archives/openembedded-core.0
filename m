Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1A471AD8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 11:58:58 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id k15so132140768qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oh+J+33dTh+3XvuIBME02RW0p2rWkyh3GhwWrkHugqI=;
	b=OaILDFuMG9WWwWyq8WBOaaC2ggjAHWkHnjUCAk1XDldLmytjT52N1cwkOCDB0Od3W4
	g8pGRMyVDc69Q51nIf6z5xONSOsYCL/nVbdpOdOL10NeSghaIJEB6bQAByG2x74E/ikj
	cKGAgeMvIKVrb/Zzael05DZtvjeX38I8YWkan5cSm6aQYJkuuHG4a37NnippYOrShQ3s
	Wp1jrWybDPTSNX31mvFrBMdfqGb58zWrK2vS7rCTZx4eV2GCZTQrpvQExH6LTnqmPXDL
	Gaj9qokowLLYqdkLeNnx0rdDb0CK69v8dy/Yr2nRwFQ0t8pc5nYWAZUzz8JiIXKd/lQX
	ReaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oh+J+33dTh+3XvuIBME02RW0p2rWkyh3GhwWrkHugqI=;
	b=Qm3mgH8bkUtGvkKun7zE+3L12jfscLzFml1+69atVOv4YjJtpZUTp4RwkMIVzelnWH
	Vwydy6eeWNLsJSk8Jwa3VNrVqwtUsLO04pQttWwXK12LkB4MjKdFc7PplwOptIVQBBzo
	bMjbzU25Rq3kLkHs+yW2ZMjH+AmjXbCClTNAtq8oHH+xJJAW/UCLo0BGmPEgLvuPKWcf
	dvwkH3rMg57UvX5rXOr+k3kNFE3T/LIrTaJjLhh8/YLLT77QlxwO2IrSHbYc3nxOkSx1
	27Ezmp8J/23NCWwog6p9IAsl79ApbQEeMuYBIUVoM1h49dgEUWF2el0Jg5B47q3HUqWq
	joCQ==
X-Gm-Message-State: AMke39lTKSYxUfQfWrCoIJzvU0/103zL+Tr1LUITO018WZjFxLsrRcFTc9IdCiFVDA55QV/RdIi1gPEHbieYAXNn
X-Received: by 10.237.36.208 with SMTP id u16mr14978734qtc.105.1486468739331; 
	Tue, 07 Feb 2017 03:58:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 7 Feb 2017 03:58:38 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702070603110.7387@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702070603110.7387@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 11:58:38 +0000
Message-ID: <CAJTo0LZtcKPVPQh5d-XmDcAQ+K8qH4nRB0YGhmyoqOf1eTAH6A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about new "recipe-specific sysroots" feature
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
X-List-Received-Date: Tue, 07 Feb 2017 11:58:59 -0000
Content-Type: multipart/alternative; boundary=001a114104ce2d8ce30547ef7966

--001a114104ce2d8ce30547ef7966
Content-Type: text/plain; charset=UTF-8

On 7 February 2017 at 11:19, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> and while i'm digging through the code, what should be a simple
> question -- is what is being installed in a recipe-specific sysroot
> *exactly* what used to be installed by a recipe in the common sysroot?
>

Yes.

The recipe-specific sysroot for recipe <foo> is the same sysroot as you
would have got had you done bitbake foo with an empty tmp.  The advantage
is that there will be nothing else in the sysroot.

Ross

--001a114104ce2d8ce30547ef7966
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 February 2017 at 11:19, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15p" cla=
ss=3D"a3s aXjCH m15a184df047df3ce">and while i&#39;m digging through the co=
de, what should be a simple<br>
question -- is what is being installed in a recipe-specific sysroot<br>
*exactly* what used to be installed by a recipe in the common sysroot?<br><=
/div></blockquote></div><br>Yes.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">The recipe-specific sysroot for recipe &lt;foo&g=
t; is the same sysroot as you would have got had you done bitbake foo with =
an empty tmp.=C2=A0 The advantage is that there will be nothing else in the=
 sysroot.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a114104ce2d8ce30547ef7966--
