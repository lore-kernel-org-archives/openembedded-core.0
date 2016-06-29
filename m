Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 33BC960043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 19:47:58 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so289956ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YnY3NAWzDuDJxjFeXEsI2sJuXtzsI38cIVMsU5+fJUU=;
	b=m0tci28R/ycnDU9Elsy96oEUBhiohC1lF0iaVqHdX6ThCuCWOVEVrKStgYAI3ZPrwx
	r5V6pj8HVpPqPKmWwIi6g3EXuwa2QWo8onpIXJi8vEfoG5SHpPDEUQGtPacYDjnEQyh8
	F5MyrmUBiLaartnY0XsiFljaISJ2eUbCzBujAEQBqs72I+0oAgdXNPCG62wuuMHAR6L4
	OWYdw4dDvhArfGuitpoOgA3lPC37YU9x1YCDYnqR/d2ZvqyUXscJ0YWBgSiNyP+8PK/m
	AKVkYpQrUMrn5p6gMzsxOkoKirghOHYg/fOC9NRIms1luxVErdWbCNb+AisDcAtwc+ar
	maAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YnY3NAWzDuDJxjFeXEsI2sJuXtzsI38cIVMsU5+fJUU=;
	b=H0KUs6q0C/hiGSdKiqPZh/D51iDxj16yFR4isi3ZS1mv7Q2K0Wgm1KNAPqSij4efQF
	rUnFn87e+YGKbIb2Q6Ei6uxSyYa+O4zPvnIL54PX3oV1U1XaYrRzzgj7NCBbGI4soqjr
	QVDBbMkPHg3ZlrKoz2nivO5KjCeZ02LCojmpTnWjHwUXtV502xuzmAaE9pXVR86RVbt4
	vvyz+ROs6NJApyLpT5CGRPLaf6IM7d4sfro1YXhzndcQth+IugB3vgJtKgccoZ9xHrG/
	bnLwWZqsKerE10ibh/HwkTE6c34wUjV25m/D/wAPy5apF08YfWE9dLQONIEyJFOBmWBE
	QwVw==
X-Gm-Message-State: ALyK8tIaTDRjlhNzPwlTaU+V1vdb7ogAFGtDwEm/MI9nSEBH7xtbx0r2FJbxGMoiEclLpv83UA8OxyRaSGGrhJja
X-Received: by 10.107.135.137 with SMTP id r9mr12214576ioi.133.1467229679246; 
	Wed, 29 Jun 2016 12:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Wed, 29 Jun 2016 12:47:39 -0700 (PDT)
In-Reply-To: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jun 2016 20:47:39 +0100
Message-ID: <CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
To: Daniel Kriesten <embedded@die-kriestens.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Building Perl-5.22.1-r0 on Arch Linux fails with QA Issue
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
X-List-Received-Date: Wed, 29 Jun 2016 19:48:00 -0000
Content-Type: multipart/alternative; boundary=001a113ec842d6362f053670072f

--001a113ec842d6362f053670072f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 June 2016 at 20:24, Daniel Kriesten <embedded@die-kriestens.de> wrote=
:

> ERROR: QA Issue: Architecture did not match (=E2=80=A6) on
> work/i586-poky-linux/perl/5.22.1-r0/packages=E2=80=A6
>

Can you fill in the ... so we're not guessing what the error actually is?

Ross

--001a113ec842d6362f053670072f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2016 at 20:24, Daniel Kriesten <span dir=3D"ltr">&lt;<a href=3D"=
mailto:embedded@die-kriestens.de" target=3D"_blank">embedded@die-kriestens.=
de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7j" =
class=3D"a3s aXjCH m1559da6fd880b304">ERROR: QA Issue: Architecture did not=
 match (=E2=80=A6) on work/i586-poky-linux/perl/5.22.1-r0/packages=E2=80=A6=
<br></div></blockquote></div><br></div><div class=3D"gmail_extra">Can you f=
ill in the ... so we&#39;re not guessing what the error actually is?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113ec842d6362f053670072f--
