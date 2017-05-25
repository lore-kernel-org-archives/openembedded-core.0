Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 76656780E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 09:53:53 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id c13so176019923qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vOqwL1d3kzo10Fm4zqoFQb6aKLSfMo/5R/y+YvK+AwM=;
	b=F/w/h++hkS/TXynCpJEUjaRepIIlDRTq7Sv9sS39M0YEmfEynfjEAa8z0Cym0MAj+H
	VszfHDZCUmau4XrCnrH3RQhvEkXJ5hUroJzOenlL6ZUK21B8i0P8t6/QhOHGtk0RShQC
	juPQujHsYzNm68M1RCyJBDl+JEJwb84CZ2rRVH60NX+k2M8iMz5L1BszhgKY6CrdigCK
	RZqWmnPzbrgwENowTDSY+R6gJih52YxnjiiOoJWAZANB06MX2DAYjGN4SgGLk3vBrz3+
	g7n9ido3BlHKg+eLi5OD8NkVPMxvc3BF9T/nBOmfQXltSb64LPqRkzD50GVPr4X/6gfr
	Oc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vOqwL1d3kzo10Fm4zqoFQb6aKLSfMo/5R/y+YvK+AwM=;
	b=F5/ppTXI3MCSqSU43Ud27u4REb689pDIhesGjmTqEIG+tJFAJSKzXUkeXd1QgdEtf0
	rwnW6kL9joyjPGDp7IxEpELvSSnEwD/da1sDsH3P/p2ZbTDt4ZlAHe1mXuRZT55eWY0D
	cTFnJC7HvoChmpQnM7THXNxbhMu0f6V3H9IE2S6Vfv/4p4nlgw3HRlCXuuOgqj6xjP9B
	jvO0oZ0bjlBD3eAjZo5fLYvd5QzCl04nYodnnDkv7mpZVQVvUg6UIj8fYV3vEAk14tR4
	pp4wE1d1vtFxcxVnvdz2HwsUcpYfj67ArmTFd/YwjDc4NumyqQxAF1Ms3sykRjEZ3pAW
	Kq+Q==
X-Gm-Message-State: AODbwcCgA3DrAVz+mBsBgdpwm/sujNti1zHnjSY11gAt+i33WhtVin9C
	IVSnNBDZCotwZ+DUW9RWDdriUcZzPgWS
X-Received: by 10.200.51.66 with SMTP id u2mr42546102qta.12.1495706034157;
	Thu, 25 May 2017 02:53:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 02:53:33 -0700 (PDT)
In-Reply-To: <20170524210203.1042.10390@do.openembedded.org>
References: <20170524204636.2797-1-marex@denx.de>
	<20170524210203.1042.10390@do.openembedded.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 10:53:33 +0100
Message-ID: <CAJTo0LYoxVfWEyp+gjOM_QEwUOXytiWjZmv=62QEekT+-H8W3A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Marek Vasut <marex@denx.de>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHFlbXU6IEFkZCBuaW9zMiB0YXJnZXQ=?=
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
X-List-Received-Date: Thu, 25 May 2017 09:53:53 -0000
Content-Type: multipart/alternative; boundary="001a1135a22adacdab05505632be"

--001a1135a22adacdab05505632be
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 22:02, Patchwork <patchwork@patchwork.openembedded.org>
wrote:

> * Issue             Series sent to the wrong mailing list or some patches
> from the series correspond to different mailing lists
> [test_target_mailing_list]
>   Suggested fix    Send the series again to the correct mailing list (ML)
>   Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/
> cgit/cgit.cgi/poky/]
>   Patch's path:    meta-poky/conf/distro/poky.conf
>

Marek, please can you split this into patches for oe-core and meta-poky.

Cheers,
Ross

--001a1135a22adacdab05505632be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 22:02, Patchwork <span dir=3D"ltr">&lt;<a href=3D"mailto:=
patchwork@patchwork.openembedded.org" target=3D"_blank">patchwork@patchwork=
.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":26k" class=3D"a3s aXjCH m15c3c44c2aa4d77b">* Issue=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series sent to the wrong mailing list or =
some patches from the series correspond to different mailing lists [test_ta=
rget_mailing_list]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Send the series again to the correct mail=
ing list (ML)<br>
=C2=A0 Suggested ML=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:poky@yoctoproject.=
org">poky@yoctoproject.org</a> [<a href=3D"http://git.yoctoproject.org/cgit=
/cgit.cgi/poky/" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproje=
ct.org/<wbr>cgit/cgit.cgi/poky/</a>]<br>
=C2=A0 Patch&#39;s path:=C2=A0 =C2=A0 meta-poky/conf/distro/poky.<wbr>conf<=
br></div></blockquote></div><br>Marek, please can you split this into patch=
es for oe-core and meta-poky.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1135a22adacdab05505632be--
