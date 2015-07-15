Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 385347586F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:49:50 +0000 (UTC)
Received: by qkcl188 with SMTP id l188so37299619qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=EJrqHB9SyVVm10AafVWEaXzHBerV/zVps1nodib2D/I=;
	b=HMymDFnkpxI5ztoUxDentydy4ga23t04xxmYm7juaPI4/EkzvFKFKQGqzx+iCl6jQz
	x8KzArCScRicpcYY+cW+ya0b/JcyJrt/95ng3U5ht15gySnW9RqpOOjjoAHI7rn9jV6Q
	ekelLUXdIXB+cIMBAmoP9QXbOFAS1SxJgjvSYaHEPduM5Y5QUcb5y2Yv7zU+YiOmOr1/
	aX/vCYB2W2OsAXWZGtDbhxoPzpwKzhpVvVLaE6ReQzpSe14s1AIQd92zH1OHn0rbVT0h
	zqwHkEzMZ52OypWSKp2OX9hf9ldkS8e2qXBGszuK7j8zNeuw6U0xNCYV3RPMjPc0m8nT
	OS9A==
X-Gm-Message-State: ALoCoQmK1QHtOqQNwBmkQqewEPOtwZ+91A+ric1ZDnDKmFvMfTbh3Z2CQhcKy+7hblcGsqvnQ5zz
X-Received: by 10.140.88.80 with SMTP id s74mr11463247qgd.59.1436993391184;
	Wed, 15 Jul 2015 13:49:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Jul 2015 13:49:31 -0700 (PDT)
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Jul 2015 21:49:31 +0100
Message-ID: <CAJTo0LZHj+BW7ox-whZy1+6as3Xugm-Q9xKQPpxT6C=uFs7gOQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] Move libexecdir to $prefix/libexec
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
X-List-Received-Date: Wed, 15 Jul 2015 20:49:51 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4a065a6051af0183d

--001a11c114c4a065a6051af0183d
Content-Type: text/plain; charset=UTF-8

On 23 June 2015 at 15:30, Ross Burton <ross.burton@intel.com> wrote:

> Our default of libexecdir=$libdir/$BPN is contrary to both the FHS[1] and
> GNU
> Coding Standards[2], mainly because the key point is that libexecdir
> should be
> global and not change per-recipe.  The new FHS allows /usr/libexec so this
> series changes the default to that, and fixes up the recipes which need
> fixing.
>

Unless anyone speaks up with a good argument I'd really like to see this
land the moment the current milestone release is actually made...

Ross

--001a11c114c4a065a6051af0183d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 23 June 2015 at 15:30, Ross =
Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targe=
t=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":18b" class=3D"a3s" s=
tyle=3D"overflow:hidden">Our default of libexecdir=3D$libdir/$BPN is contra=
ry to both the FHS[1] and GNU<br>
Coding Standards[2], mainly because the key point is that libexecdir should=
 be<br>
global and not change per-recipe.=C2=A0 The new FHS allows /usr/<span class=
=3D"il">libexec</span> so this<br>
series changes the default to that, and fixes up the recipes which need fix=
ing.</div></blockquote></div><br>Unless anyone speaks up with a good argume=
nt I&#39;d really like to see this land the moment the current milestone re=
lease is actually made...</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a11c114c4a065a6051af0183d--
