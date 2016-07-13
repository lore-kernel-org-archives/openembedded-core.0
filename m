Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA72D6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 13:42:08 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id q83so46599734iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uWYyWOlfrFOndIYpZH1WgbyRSxqO+TyUgzZG2BdlMyM=;
	b=fUYFEW0ukkbELtllhe7IvzcoCah9y+CdXzXm/KlFpgdVf3RndPt+c+t+CjrHlHnX58
	w7lCrtFy9k8sLSimdrjkqUMJKbQIPMOHe9rFvzERNC1Xrs1BUkklPodcFsDsfp/qEjhx
	yPwJr5spzfuVvZrOE/7isJ4ybGgdmWKq9kYt3X1ZypqAx/DPPazKQy/td83Qei3zfPv8
	Dt1AaSsp34tcfVQzwozXvZjSaNWzQyMMf6sySwJp8U/yf0fCCgpN2FRjHoDrfGakFgiK
	EJTfGoXsDRn/FnKofjhSaZvNU7iViSmM9UXNWVGLMKQUXzpGXqh7Sqwz4BKEq4sUwxdD
	eKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uWYyWOlfrFOndIYpZH1WgbyRSxqO+TyUgzZG2BdlMyM=;
	b=icVQloy4yK9IKivinevmcW9WIuM9N5GOQ3r+YAlntyNfpM9HaKeLG+h8TitLm0fUEr
	XY2E6t9uTGraH/NAcCW45HveG1cNWFYUNfivLsCZT65F48vGnj6tNgj6yyWRfoj9dfTb
	ee86fxXpyYkueYv0p67ax5x1NPprcRSksFHWAZ2OiV68tC+I2Jcba7VHZ2uv+1UKtpXK
	vWKr9NRrHva6kwGXdZzunkPk/4UXnGNte4z7gcSepqb1aw3CtdpbRIvLr+CI0t4QzLmB
	INT7z4bMV+nRcIGFOjNsoUQG+1c3iI9TR3hsl3Gtk0YYBvdGA5PMscNu1BiSIGYedftR
	5ORA==
X-Gm-Message-State: ALyK8tK2glbdAKugy8IMOT8TUDLmkhcLNVZbZdBdhnuWO2h48CFKj61FygYryZWt45V+0RgQp+VbNIoCHswAao0p
X-Received: by 10.107.138.212 with SMTP id c81mr8514988ioj.148.1468417328066; 
	Wed, 13 Jul 2016 06:42:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 13 Jul 2016 06:41:48 -0700 (PDT)
In-Reply-To: <466bd8e0753516a199b0b00f98cc03ab4e772ec4.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
	<466bd8e0753516a199b0b00f98cc03ab4e772ec4.1468310468.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jul 2016 14:41:48 +0100
Message-ID: <CAJTo0La6G+d8bSJkG3VW-+hN3dwqcwgr1B3eaRRJOsYYMy7Djw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 5/5] piglit: Upgrade version, use python3
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
X-List-Received-Date: Wed, 13 Jul 2016 13:42:11 -0000
Content-Type: multipart/alternative; boundary=001a113ed93238f2350537848d2d

--001a113ed93238f2350537848d2d
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 12:14, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> * Remove backported patch
> * Update dependencies to use python3 modules, add depencies added
>   in the new version
> * install only stripped binaries to keep size down
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>

ERROR: piglit-1.0+gitrAUTOINC+c39e41a865-r0 do_package: QA Issue: piglit:
Files/directories were installed but not shipped in any package:
  /usr/usr
  /usr/usr/share
  /usr/usr/share/bash-completion
  /usr/usr/share/bash-completion/completions
  /usr/usr/share/bash-completion/completions/piglit

I had previously built bash-completion.

Ross

--001a113ed93238f2350537848d2d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 12:14, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":5rk" class=3D"">* Rem=
ove backported patch<br>
* Update dependencies to use python3 modules, add depencies added<br>
=C2=A0 in the new version<br>
* install only stripped binaries to keep size down<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;</div></blockquote></div><br><div class=
=3D"gmail_extra">ERROR: piglit-1.0+gitrAUTOINC+c39e41a865-r0 do_package: QA=
 Issue: piglit: Files/directories were installed but not shipped in any pac=
kage:</div><div class=3D"gmail_extra">=C2=A0 /usr/usr</div><div class=3D"gm=
ail_extra">=C2=A0 /usr/usr/share</div><div class=3D"gmail_extra">=C2=A0 /us=
r/usr/share/bash-completion</div><div class=3D"gmail_extra">=C2=A0 /usr/usr=
/share/bash-completion/completions</div><div class=3D"gmail_extra">=C2=A0 /=
usr/usr/share/bash-completion/completions/piglit</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">I had previously built bash-comp=
letion.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div></div>

--001a113ed93238f2350537848d2d--
