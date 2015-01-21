Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id B9EA871633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:50:19 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id a108so28309501qge.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Oh4lXCrBsHujNpOrtXGbbX6aQJvBjjg81sMOYEDXKac=;
	b=E9CNEX6160LfPUgiU4Sky6CFQHqsXGFU7uMZj0e3P+JU+pYZvz7GBs9KtutN1mk9b2
	60FUelan9QD2Q0h6sJsM5euKPHe6WMXjuzXY+g7sRaxHvBaCwydOWPOPXsDuqYXjzA72
	tGcitT6PJggkIkiUGPZprmm4O1ttG4VA5X6EITC4pdAhRqGCZiwfI6AOASNFKKtyVvY6
	k8DAZcqmlroHtAjgsO5B35ZKwNTDTApDU+EtCvz9sIfas20LTwjAmrT8QJUuxDKJJ2vF
	3S7Ax1jHqTXsZ+YCHvV/31IQi2YsrAc8zZoCTJkXToVbOur1CaJbW+x4n1Wdnpy+q4ry
	H5uQ==
X-Gm-Message-State: ALoCoQl4GJRqrDrx6icQzFtXfWIn8qz47rJxvXn51M/gCGp796tuNZ9xd+RydAMixLjN3f8Tduqn
X-Received: by 10.224.92.205 with SMTP id s13mr72108137qam.52.1421873420056;
	Wed, 21 Jan 2015 12:50:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 21 Jan 2015 12:49:59 -0800 (PST)
In-Reply-To: <1418221027-12371-4-git-send-email-Martin.Jansa@gmail.com>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221027-12371-4-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jan 2015 20:49:59 +0000
Message-ID: <CAJTo0LYMy4TdtR_QSWmvr8A0xr_AAhEpZYdyQWzO7=aMaaq-yA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] libpostproc: import from meta-oe
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
X-List-Received-Date: Wed, 21 Jan 2015 20:50:21 -0000
Content-Type: multipart/alternative; boundary=089e015375e41e7578050d2fb468

--089e015375e41e7578050d2fb468
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:17, Martin Jansa <martin.jansa@gmail.com> wrote:

> +DEPENDS = "libav"
>

In a world build:

ERROR: Nothing PROVIDES 'libav' (but
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-intel-gpl/build/meta/recipes-multimedia/libav/
libpostproc_git.bb DEPENDS on or otherwise requires it)
ERROR: libav was skipped: because it has a restricted license not
whitelisted in LICENSE_FLAGS_WHITELIST

https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/162/steps/BuildImages/logs/stdio

Not sure what's best here: maybe add the commercial license to libpostproc
with a comment explaining why?

Ross

--089e015375e41e7578050d2fb468
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 14:17, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><div id=3D":5tc" class=3D"" style=
=3D"overflow:hidden">+DEPENDS =3D &quot;libav&quot;<br></div></blockquote><=
/div><div class=3D"gmail_extra"><br></div>In a world build:</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_extra">ERROR: Nothing PROVIDES &#3=
9;libav&#39; (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-in=
tel-gpl/build/meta/recipes-multimedia/libav/<a href=3D"http://libpostproc_g=
it.bb">libpostproc_git.bb</a> DEPENDS on or otherwise requires it)</div><di=
v class=3D"gmail_extra">ERROR: libav was skipped: because it has a restrict=
ed license not whitelisted in LICENSE_FLAGS_WHITELIST</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"https://autobuil=
der.yoctoproject.org/main/builders/nightly-intel-gpl/builds/162/steps/Build=
Images/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/night=
ly-intel-gpl/builds/162/steps/BuildImages/logs/stdio</a><br></div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Not sure what&#39;s =
best here: maybe add the commercial license to libpostproc with a comment e=
xplaining why?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div></div>

--089e015375e41e7578050d2fb468--
