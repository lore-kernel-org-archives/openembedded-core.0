Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id EC54577A3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 22:19:17 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id r45so162352516qte.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E5dMBXhxAyo/N89UariQ+DAwgCpxOZ3mboBzQOeHN0E=;
	b=QpTj8XwqpHdAzfHaefZrb7vkq816cOy/7ScapUk6wQTjQsv0DmbgyYHPa4QQkaU3Fg
	K5IUcJxstNtG2xdWHL3Qfw9XA/sy8ZqdcrYkbFrfJ/vNUbGPqUN+B14jUPYZccbH+8ia
	Jc4jBSshgK4TutdKlSs6SMMXax4d99C7ciyBCahmwnxTc3OQ55ZXvUGOiM+O1lWItZtF
	jc3bxVPwIyqWcIkyP4iIzqyvqajJavQQyDV8v/9xBnAT+suliucD4HJ608nFxroepCGk
	doCS4Q3XvpbVh17JdwmAWjDP+tWgyZSRLbXhDpxhBS8nEzNElbpZco1G4w3vR3jv1WJ4
	V2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E5dMBXhxAyo/N89UariQ+DAwgCpxOZ3mboBzQOeHN0E=;
	b=mp84FHM3DluaDZTfLd3Jav+tpUexCRzBnVqGmzlfI8szrBrBjlECEwXFU0b4fU1Onx
	VwBANSiTj95lqGAC4S6+DCZe84eO0VfHpdrFCPy/rKYwULk7m5eF3WAqISULNfBq0g5A
	vvneZZLsWp/4Qh0YdZTLoxlZ8NWoBsPJxlewpb7BVIvvQY7lKVN7/MTjLHVaDQtX3ByI
	h68dtiZLCOxl2nVXgWlSJmnHqKGiUBDvh6V8M82Ie/KxmqR0B2nak5LlfNTiL9gMhFvh
	GTdWJ07aIMnT5r/7SDKANWkdrCybd8HbE+ATZWdeoAOtpJCECoDuQVk74QwNzEUhGYLh
	8GYw==
X-Gm-Message-State: AFeK/H3h6qsuZ1IjcMZ5rCLaR+hp513794tC/vzumh8YqKPk+dj7D0N2TcxIprjLN59S08nc0v0fxIBBo5VZcZY1
X-Received: by 10.237.33.69 with SMTP id 63mr38799304qtc.109.1490221158687;
	Wed, 22 Mar 2017 15:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 15:18:58 -0700 (PDT)
In-Reply-To: <1490220976.15509.34.camel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
	<CAJTo0LZd1JgF+Zz_-yS5p-HeA1jxrmbxg-G9oP1maVO3rfzfVA@mail.gmail.com>
	<1490220976.15509.34.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 22:18:58 +0000
Message-ID: <CAJTo0Lasv1GdwKF-R9HfaY=gvuxmENpgavWidVtEQmorX7QMdQ@mail.gmail.com>
To: "Patel, Vedang" <vedang.patel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Wed, 22 Mar 2017 22:19:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8cd19d1054b592621

--94eb2c0c7fc8cd19d1054b592621
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 22:16, Patel, Vedang <vedang.patel@intel.com> wrote:

> I got my mistake. Setting PACKAGECONFIG enabled all the features by
> default. Also, should I be including python as runtime dependency when
> --with-python is used?
>

No, the rdepends will happen magically.  You might want to package the
python module separately though.

Ross

--94eb2c0c7fc8cd19d1054b592621
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 22:16, Patel, Vedang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:vedang.patel@intel.com" target=3D"_blank">vedang.patel@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1tb" class=
=3D"a3s aXjCH m15af81792eef4832">I got my mistake. Setting PACKAGECONFIG en=
abled all the features by<br>
default. Also, should I be including python as runtime dependency when<br>
--with-python is used?<br></div></blockquote></div><br>No, the rdepends wil=
l happen magically.=C2=A0 You might want to package the python module separ=
ately though.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--94eb2c0c7fc8cd19d1054b592621--
