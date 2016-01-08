Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E5C39731D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 16:17:26 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so290653289iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6bjzgqeGjTqaSxIOtSlES9UW7czcq5E6Z8hfPnLFNI4=;
	b=p3lKSCqwejdjZORjE1HaRZ3btS3Sjg0nbqz6S2PJ+CmHW3AGKwicmAauAf13gKJOtE
	N9RUyWX1ezp84Vg4griszIU99aEU30iiAFP6a9iI8SkBrEAWZ+/Pyji3ydIoeija0dkw
	CKIvGo4ic10lMyILwPXrZOvclVmU70gK8bhzjxYE2j9Hn/yBR6OFngyD1VTIkX0zMwuq
	mB9HgCx5T8cKFMGsy/mCLCOGuTkBSBk9Se6e84DeYiU3Kd3ooMLzmsmrFoRyeilCeMG4
	TN35bnHI2kF1ZprFeFyAClENnxHVxUlf3AAhl99rQJJDQXLZf/dRnL97BArO2OVoTkuv
	Zp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6bjzgqeGjTqaSxIOtSlES9UW7czcq5E6Z8hfPnLFNI4=;
	b=lyfOKDxM9V42boTHXMjXYEJIU6sxgg8kj2/DhmfTg0cSK+ZsBZEINwQ45OcWlHk8cO
	86eit8al1zmSeDKCnkFxkgJi3he0dGdcRN/NradFGAeYLtL0o8Ki94evaPFFWCJLKf10
	BZTOQObEgbqlHSTNtWwB1WU3jG+WOQTGd5JuKnslQRm2k5uT8Ap2dMVI1vlVYCLLNzul
	wLdyYGQCqliA9eQD97LG2CI91+BYY6IXARUtvUC8RaWSwCb5gO+/Woyg21vem5+xXR++
	wFstLy3ymit3R2CGDalSxok8MawIW1ySXgJTYQw8EeIgm/QGuDV7xsV5AlqNqBBrCzvQ
	YJJw==
X-Gm-Message-State: ALoCoQmyl8U8te6MzDI7AoCPyd9sPH0TH863o7PVi+PkOj4Rpa5i5qGhX9UIj4RDvKBOnsx4L7y2OUN5PIGqhFHJckOFyOyZqJUrPKi+TLTdEDhbkpSDr2M=
X-Received: by 10.107.3.154 with SMTP id e26mr95920052ioi.99.1452269847093;
	Fri, 08 Jan 2016 08:17:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 08:17:07 -0800 (PST)
In-Reply-To: <baa98869574d7bb44be4171ff58d5abdc76f7d69.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<baa98869574d7bb44be4171ff58d5abdc76f7d69.1452248145.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 16:17:07 +0000
Message-ID: <CAJTo0LbiNhcb3G_omDB=V37p53dpG3MGA0O28T19BQiT4aL8Zw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/53] mtools: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 16:17:27 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a5ac2ab0528d4ecba

--001a113ec10a5ac2ab0528d4ecba
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 10:18, Khem Raj <raj.khem@gmail.com> wrote:

> +DEPENDS += "virtual/libiconv"
>

Update: this breaks all builds for x86 hardware:

ERROR: Nothing PROVIDES 'virtual/libiconv-native' (but
virtual:native:/home/ross/Yocto/poky/meta/recipes-devtools/mtools/
mtools_4.0.18.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/libiconv
  virtual/libx11-native
  virtual/libsdl-native

It appears to be the first time that virtual/libiconv-native appears.
Should we just ASSUME_PROVIDED that?

Ross

--001a113ec10a5ac2ab0528d4ecba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 10:18, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D":4zg" class=3D"" style=3D"overflow:hid=
den">+DEPENDS +=3D &quot;virtual/libiconv&quot;<br></div></blockquote></div=
><br>Update: this breaks all builds for x86 hardware:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=
ERROR: Nothing PROVIDES &#39;virtual/libiconv-native&#39; (but virtual:nati=
ve:/home/ross/Yocto/poky/meta/recipes-devtools/mtools/<a href=3D"http://mto=
ols_4.0.18.bb">mtools_4.0.18.bb</a> DEPENDS on or otherwise requires it). C=
lose matches:</div><div class=3D"gmail_extra">=C2=A0 virtual/libiconv</div>=
<div class=3D"gmail_extra">=C2=A0 virtual/libx11-native</div><div class=3D"=
gmail_extra">=C2=A0 virtual/libsdl-native</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">It appears to be the first time that vi=
rtual/libiconv-native appears.=C2=A0 Should we just ASSUME_PROVIDED that?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div></div>

--001a113ec10a5ac2ab0528d4ecba--
