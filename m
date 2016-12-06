Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id F3F6271A85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:24:27 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so388749105qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U0i0wQ0IgNaTtiSproYqSwtXtfEbtQpUV8PwKPsqWF4=;
	b=UmI1SCPNU0fzpsyJNfJ/xfogS5LYAT4G0H8NyJlFQ+HICxWN5yhm0UpgdvNqxhymdb
	RaEDvmqa/B4ZVs5OKeEbmBZofqU70T5eje93gwXQ6eBn8NEtYG63hNEI6BPhwzSt8Lp0
	NeiaXNm6JykJUVbYpip5DwPhIMGAa6g8cb9n6T7pTFas6xwwbLBwk0v9AjEbt5QUY+Nd
	OJiTCLaMfxkmDQJ15v4079Urj8D+qeWMVxat+GgulN1djurrY/wC5h72oCt7OzaoULDR
	wCpPzuDb6o3BnUP4c0CQDn9YNj+Xs4t65rLx9Jme6/o4EH5fgv7Z4w73Ra5d+mpsZCpw
	PSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U0i0wQ0IgNaTtiSproYqSwtXtfEbtQpUV8PwKPsqWF4=;
	b=mkNTih8cBqlFpWd5ppMf6G1yR85MM6umqI9q9oJZzxkVvLo/DOeeMXfu7oCpjQUmKo
	g0d4MN+h23awdk+WWGPzbdeErpNBFO37DSZN0RG+O/mcWCHd4cPy5elSVGI/zQhlaMvM
	++uCS0HOriedbWuxPm1AI1TCTHqSnCNqlmjLiigfVpL08UTgwZC4GU33zmTOPRlUApVg
	1KJWsY1ZJSyZRkq2GoFmB/NwmJPZzJVf+c4Z5uCjj+mF/g18hJ+0zQWD6Mx0ziKJ6RGi
	QovvAcC0q8DioQa5hGvVlA4upoALfXozh0Gi5facAHGmeEt1Sbaeu7OAOplgwaK0G6k8
	r4XQ==
X-Gm-Message-State: AKaTC005+ZDnQKYseJOy1GpfidhW0OYHDq1/RkOvxhFu7mEjfSEabg3wdD/KZkvomt6/CunybeVT3HhUwQsrAD7B
X-Received: by 10.55.8.20 with SMTP id 20mr63218075qki.3.1481048668713; Tue,
	06 Dec 2016 10:24:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 10:24:08 -0800 (PST)
In-Reply-To: <e18eec82-26dc-3e09-74ea-82e1dcae8fea@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-21-git-send-email-obi@opendreambox.org>
	<CAJTo0Lbx_TKJgWRnYGHHAja2uT8CNG+d=wyFJ-aBiZJ3zmWyFg@mail.gmail.com>
	<e18eec82-26dc-3e09-74ea-82e1dcae8fea@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 18:24:08 +0000
Message-ID: <CAJTo0Lbi0mzKTakUon41j=QM3dgAkBhv2svuYisMyEkiPKKWLA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/33] package_manager/deb: let apt-get handle postinst scripts
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
X-List-Received-Date: Tue, 06 Dec 2016 18:24:29 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60cb9c4505430183b0

--001a114c9d60cb9c4505430183b0
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 18:20, Andreas Oberritter <obi@opendreambox.org>
wrote:

> With all required environment variables and configuration options in
> apt.conf in place, apt-get is able to install packages offline, i.e.
> when creating the rootfs, including the execution of postinst scripts
> and updating the package database. This is new behaviour.
>

Can you update the commit with this rationale?

Ross

--001a114c9d60cb9c4505430183b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 18:20, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2t2" cla=
ss=3D"a3s aXjCH m158d55fda795c33b">With all required environment variables =
and configuration options in<br>
apt.conf in place, apt-get is able to install packages offline, i.e.<br>
when creating the rootfs, including the execution of postinst scripts<br>
and updating the package database. This is new behaviour.<br></div></blockq=
uote></div><br>Can you update the commit with this rationale?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d60cb9c4505430183b0--
