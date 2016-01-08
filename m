Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94B2E755F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:59:04 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ik10so76488749igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rQjozBepnWArTYOjpthezPrJfEqsA1ctcy5vC5BioAs=;
	b=MSXT1eqsWBuY/Vl7MSBtp/IsjNdmzNxBaK26UTjOD8Ve1siDjgSDm1bLBew/qdAmcw
	8W3sA8oz4dI5CpRjmLqzkg7szK6z02+nxTvWM0eNBMos2jKZlHQhNxPD8WcSBduSQdlz
	vbNH/R2HXVQUeA4HkUGY/1aRdGVinMoi8BLZs548wnogDxsr8PE0lRmHp5WZ33/rsNHF
	WJ353JREgzS++iPRFMyV0//KhQwujd53InM3ZYP82lxIiJ0uMkWx6/Pd6TrOXBw81eue
	e22qAHqetlspp7zRThM9dJuH/iEkR7wDSniFzWb20HO4IT8VbkI+3eJcQnAxhE6yTQQZ
	Yv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rQjozBepnWArTYOjpthezPrJfEqsA1ctcy5vC5BioAs=;
	b=AJKhBCFkOJhc62ns7/4k94adIMby8qzBBDvjFGpBZHNV2bKeitJaMrvldAWKIZbSuR
	dcgfBfKq2c/4ocdNXzcunQuI4e3QFmmw2P2mvI6rl0cvcxShFITM1W1ef7ttZIRW5N1R
	DiFvKLWH5lueaj/5URcoeFDU1wwXB6RDrmfofvco3iZtCjNKlK6cpgVrTpiJPQElcPLx
	ROgQPrpVgtFVvDPIqinNw5380GYenY7Gmwh7eyxBsqzZ+c2HV4NnMfjG7Bcxfqm+pz6i
	IsQU1VV2YPAJYjNRFQCnMqdZoIb3VRjsozztbzkQBpPRGNTYJfrBlhymnTsjc8AOHptQ
	TalA==
X-Gm-Message-State: ALoCoQkQV821CQrnli/KIhfgWuBrzOo6O+TBidfQqpaxE4ULJGedpNAw/xDd3vhmtg4Vaz97DVURUcq39x2tf0mYWYC5uVnZOj0VF5nZ2CvrWU38bGI88aA=
X-Received: by 10.50.43.133 with SMTP id w5mr15817281igl.52.1452250744950;
	Fri, 08 Jan 2016 02:59:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 02:58:45 -0800 (PST)
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 10:58:45 +0000
Message-ID: <CAJTo0Lah_Onp8nHtuhojUCc+a-G07TRz6ySVaE5V_PEk0AUXNw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 10:59:04 -0000
Content-Type: multipart/alternative; boundary=089e01175f2bc726be0528d079f4

--089e01175f2bc726be0528d079f4
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:

> This set of fixes let core-image-full-cmdline build with musl along with
> core-image-sato
> and core-image-weston
>

I can't build an image for real x86 hardware though:

ERROR: Nothing PROVIDES 'virtual/libiconv-native' (but
virtual:native:/home/ross/Yocto/poky/meta/recipes-devtools/mtools/
mtools_4.0.18.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/libiconv
  virtual/libx11-native
  virtual/libsdl-native
NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-sato',
'mtools-native', 'virtual/libiconv-native']

Ross

--089e01175f2bc726be0528d079f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 10:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D":5z5" class=3D"" style=3D"overflow:hid=
den">This set of fixes let core-image-full-cmdline build with musl along wi=
th core-image-sato<br>
and core-image-weston<br></div></blockquote></div><br>I can&#39;t build an =
image for real x86 hardware though:</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: Nothing PRO=
VIDES &#39;virtual/libiconv-native&#39; (but virtual:native:/home/ross/Yoct=
o/poky/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.18.bb">mto=
ols_4.0.18.bb</a> DEPENDS on or otherwise requires it). Close matches:</div=
><div class=3D"gmail_extra">=C2=A0 virtual/libiconv</div><div class=3D"gmai=
l_extra">=C2=A0 virtual/libx11-native</div><div class=3D"gmail_extra">=C2=
=A0 virtual/libsdl-native</div><div class=3D"gmail_extra">NOTE: Runtime tar=
get &#39;core-image-sato&#39; is unbuildable, removing...</div><div class=
=3D"gmail_extra">Missing or unbuildable dependency chain was: [&#39;core-im=
age-sato&#39;, &#39;mtools-native&#39;, &#39;virtual/libiconv-native&#39;]<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div></div>

--089e01175f2bc726be0528d079f4--
