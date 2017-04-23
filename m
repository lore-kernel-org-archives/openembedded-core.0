Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id A6FFA60111
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:04:47 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id f76so24232083qke.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=23X4LwhXHaiv5x1KYaf8bGtKH7UD7A1MfEZYIqN/lvg=;
	b=VyIvsrIpTncmKc9M5b7ZSRQ+7B/tLWap3zv2oHJ4NeuGaPwIXpDRwOddC1HlNpd3+d
	8/rMV6jJzQvXt0S2NpDo5i6Qv+QR3kzLiUKp7Js7X9jCEaHQ4Akb6omgvKzMx3Iw5wWX
	FdnKuSEi720SN4HZSn8n/qmJWEt3bOHWEQhMsZXrPf0fNwPdRBKiRUwDzdVAYyOb+XJq
	Gxkmow/fr5/LqPFUt8Qdb6XQe0rKQOfIqDQlGa3Az35sVo6xRRknethW59P1iUBqBdkq
	FqJKA7CM38tcmw6aeFSGt29DuV9iVeydlErj59EuF64ArcXMj2uZPS35CJjkZ8DU/WZ3
	O9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=23X4LwhXHaiv5x1KYaf8bGtKH7UD7A1MfEZYIqN/lvg=;
	b=HiGTUbLipK8e568uax+uz2JPrlxdFQDde/rZgQJoseb0Bw8QX0ilj4M8Ih1jI8p/9Q
	wgWdUKcf/6zhyp449mrm42/mmibc6w0ngBj8z4/IcJVsSH8vMIHBej7t+XGpNPhakrVM
	6Y+MKn6YoCZoobxTBwBjkG+vUyZ5TlteHTU2ZERQpKhEwNV/mpUHcCvU0X7gNoPksYmD
	3DBEMAUVy5iuuMmbcCWbhCNQtW8GgEvj0VFtS+xP4N4ySTT8OYtpp4YeBkHH4tG4PFGt
	tFnsyrid+wPvlMhKYdSg+w1tzd6yn/6BR3nnT6oxbFffPGbk0vS5jWmfMMm6DwjKVrUl
	PLvQ==
X-Gm-Message-State: AN3rC/5cQHnybRc5GsmALWPmozSUfztt4/BVngFcIW+hj/5uqF3Lpkpj
	I3cA+bGgZKF53qO+Es+5LOTzdkAZEuNF
X-Received: by 10.55.115.65 with SMTP id o62mr22087191qkc.26.1492985088526;
	Sun, 23 Apr 2017 15:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sun, 23 Apr 2017 15:04:28 -0700 (PDT)
In-Reply-To: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 23 Apr 2017 23:04:28 +0100
Message-ID: <CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Sun, 23 Apr 2017 22:04:48 -0000
Content-Type: multipart/alternative; boundary=001a114fdea2db9a0a054ddcadec

--001a114fdea2db9a0a054ddcadec
Content-Type: text/plain; charset=UTF-8

On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:

> I have put together recipes for upcoming gcc-7 major release as well
> as glibc 2.26 release, which we would target for next release ( 2.4 )
>

I threw these at the autobuilder and the errors are starting to appear:

http://errors.yoctoproject.org/Errors/Latest/?filter=
eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit

Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
have your grub fix already).

Ross

--001a114fdea2db9a0a054ddcadec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 April 2017 at 16:50, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div id=3D"gmail-m_8714932811043796775gmail-:2du" =
class=3D"gmail-m_8714932811043796775gmail-a3s gmail-m_8714932811043796775gm=
ail-aXjCH gmail-m_8714932811043796775gmail-m15b77762b05f0bdb">I have put to=
gether recipes for upcoming <span class=3D"gmail-m_8714932811043796775gmail=
-il">gcc</span>-7 major release as well<br>
as glibc 2.26 release, which we would target for next release ( 2.4 )<br></=
div></blockquote></div><br>I threw these at the autobuilder and the errors =
are starting to appear:</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Latest/?=
filter=3Deddf6362e17899113f10cf53ed0db8a4b13ff3fc&amp;type=3Dcommit" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Latest/?filter=3D<wb=
r>eddf6362e17899113f10cf53ed0db8<wbr>a4b13ff3fc&amp;type=3Dcommit</a><br></=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Repeate=
d diffutils and rpcbind failures, but linux-yocto and grub too (I have your=
 grub fix already).</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a114fdea2db9a0a054ddcadec--
