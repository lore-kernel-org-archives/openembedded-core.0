Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 989FA6E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:06:59 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 79so22596401ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tEoBYom6eLGF2BKNKixT+1QhZ7WLBQGEFXd+VipZIPY=;
	b=Zv7lqc2cUrJiI9JXChwLJkOe3ijd+RueVXZpZPYJ+UZWKlf4aGpeAVwNN8l9IeY5Bl
	JIDNCBtPP3ADEkz9E56TyhuYNOe8LRU822Ye+HryNLc5PWCGd3mhsuYEeG1IGD04uxrq
	Edc6uuU1+fEyE3GsD4GMmwofaQ4G9LjVlYLGY63wZfwNKkIUwsE09lYcNwAl3yAj0dSi
	nmRFod47TUEV1DAasssFtC2H55hCNrZBQleZd0fzFY7VHbisIlqhbzKtDmZ9aLojbu7d
	tgCSbMfzGSTfe8M5c+Hi43udtxsrSDNY2oPRY5uH3kBV6HElDN1RpSAGmojDqVwuWDrW
	MoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tEoBYom6eLGF2BKNKixT+1QhZ7WLBQGEFXd+VipZIPY=;
	b=N6mll2SqX4EcfSLOgZ21/2Acu0oSRbVKexfnjERnzHAxB6GLsvahNwh8aKIoIhIWWl
	3dpkYDiC57r63Z2Qa8LUdziN2VdeH++Mgh+viMSnZhhps2S3PLYKwjWLFi0PaGAWMqJe
	2UoqtJqqdiO7TYzSgzJjq3sBc3kptwVPf6F24lowwQgt+AprFt/fdwpR3s1yk/QFfwcu
	FJfvxYCCLFxd5Gs9OXOFOSCfIZsVx7OIg80mNVVCiCh2L75uZ9MytG+XZzHelqoDib8c
	KJNGx+kkR7R3cg7qFb6952t3MzQFgRIpg5DKC+Qq5HU0krxmGZ65ngZQDAdSpWR0cklo
	Yldg==
X-Gm-Message-State: AJaThX5nQFL75CjWoan6CWGm2f5KzKkBuzKGvdb6HXaTU20yrAsU4jfV
	vFEGpYc1RAZUEX0pRDYaPNFLrH/GKDlI04DymJfM3Q==
X-Google-Smtp-Source: AGs4zMYvDbElV3dF5gFgGx+AI/PUAe34SQ/iKknKcggVZJbSTSr+tclfX/jk6g5VwvV6QG3+9IvrB4iXhmtMOxXKYag=
X-Received: by 10.107.47.1 with SMTP id j1mr25538858ioo.217.1511543220785;
	Fri, 24 Nov 2017 09:07:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 24 Nov 2017 09:06:40 -0800 (PST)
In-Reply-To: <0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Nov 2017 17:06:40 +0000
Message-ID: <CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 17:06:59 -0000
Content-Type: multipart/alternative; boundary="001a11377fbcbd083f055ebd943c"

--001a11377fbcbd083f055ebd943c
Content-Type: text/plain; charset="UTF-8"

On 18 October 2017 at 22:07, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

>  - Removes the manifest from the python-native recipe (Why was it there
>    in the first place?, native recipes do not get split).
>

Was this commit written before you added manifest support to python-native?
 :)  python-native needs the manifest to set RPROVIDES so that dependencies
work.  Can you update the message? (just deleting this line will do)

Ross

--001a11377fbcbd083f055ebd943c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 October 2017 at 22:07, Alejandro Hernandez <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" target=
=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">=C2=A0- Removes the manifest from the python-native recipe (Why was=
 it there<br>
=C2=A0 =C2=A0in the first place?, native recipes do not get split).<br></bl=
ockquote><div><br></div><div>Was this commit written before you added manif=
est support to python-native? =C2=A0:) =C2=A0python-native needs the manife=
st to set RPROVIDES so that dependencies work.=C2=A0 Can you update the mes=
sage? (just deleting this line will do)</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a11377fbcbd083f055ebd943c--
