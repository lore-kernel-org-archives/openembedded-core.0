Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7026A76477
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:00:18 +0000 (UTC)
Received: by qkdg63 with SMTP id g63so10238137qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yXxvpO19I6mleJqHTTsbDGt1lPVtN9PsXC5Qql0dJ7M=;
	b=DxIKdfzTUM9PE7ne30+e+XI5Ti9n4DZxVXC1NQjZzv897BBP+/2H5xZTq48cW+8Gm3
	vCbaH5E3NQbvRlR1JEHjqqV2qoRxhktC4g9lq7FZRZcxiC1r23KYx5vz0vh47eBcjvoJ
	XGgV+vdzYBPpTh8ravMxyCHuT4DSX4faUfJl+3DP8/QUMEML/A6iN/pV7oEsrfmQnZFC
	RqaojkwjlOh3hKwdcNh/vhoi8+S6OAxX2C16pc8GOHxaDeKb/olWxopzC2H4MmJQbr5J
	9ybMhNL7w4ewSAZ5hNTKjeF7INMS0A/GAeR8ASroknjYPQP3Xkf/n2XeVFEIUU+sc+IV
	mBbw==
X-Gm-Message-State: ALoCoQntoBGU0qy8ig1MH74N9L5WeQgLHpXEomgbKxU3jpQGLjwySMJ6hGL96aXvdCofCRmvOKDX
X-Received: by 10.55.22.169 with SMTP id 41mr65391946qkw.13.1438200018327;
	Wed, 29 Jul 2015 13:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 12:59:58 -0700 (PDT)
In-Reply-To: <20150729150150.GD12478@jama>
References: <20150720094146.26948504C1@opal.openembedded.org>
	<20150729150150.GD12478@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 20:59:58 +0100
Message-ID: <CAJTo0Lb9JVR=WDFCV+hW0f4ma6FQQk2yod48_sDCEDaag47FCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : gamin: remove
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
X-List-Received-Date: Wed, 29 Jul 2015 20:00:23 -0000
Content-Type: multipart/alternative; boundary=001a11496e90356802051c090966

--001a11496e90356802051c090966
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 16:01, Martin Jansa <martin.jansa@gmail.com> wrote:

> Someone interested in fixing tracer recipe?
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'gamin' (but
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-support/tracker/
> tracker_0.14.2.bb DEPENDS on or otherwise requires it)
>

That build dependency disappeared in 2008, so you can safely delete it.

Ross

--001a11496e90356802051c090966
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 16:01, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4hd" class=3D=
"a3s" style=3D"overflow:hidden">Someone interested in fixing tracer recipe?=
<br>
<br>
NOTE: Resolving any missing task queue dependencies<br>
ERROR: Nothing PROVIDES &#39;gamin&#39; (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-gnome/recipes-support/tracker/<a href=3D"http://tr=
acker_0.14.2.bb" rel=3D"noreferrer" target=3D"_blank">tracker_0.14.2.bb</a>=
 DEPENDS on or otherwise requires it)<br></div></blockquote></div><br>That =
build dependency disappeared in 2008, so you can safely delete it.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11496e90356802051c090966--
