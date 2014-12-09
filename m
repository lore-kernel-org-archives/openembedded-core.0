Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5A85672539
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 11:52:33 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id l89so232048qgf.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 03:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sv8AXI1ka2bs02wUpWnE2DzQT3oXVVT/aNLyrPbNgl0=;
	b=L6m+DtOWkckfriQWXuLL88ep8cf153mgnm0/IlEDa5jnmBG9rVAXkNkc6niPooWT1S
	6mqlXRIe9fB2pSx/ozsbPed9YRmWiGs3Chx2FfQWluJrRDZhvh+EAPiWHrxg9LFPo+6A
	uSnBVxERW6wvUSYpASU+3oWBUGbpAiUyhQW6Cw5aYEQeHluyVSzoWayjEbx4buJS+RiG
	0+BvR1am12ZnkKdz7y/yx5iBRG8djPj8W1jnUTllJy2X1CaFkakfWiUV/kLql6NcA5bl
	I97/ei+T2eyucPJZZWOTTK/KbZeQVlP20UZJA/3l590ZhuT+qICz07u5M+/56hlQb6QX
	3saQ==
X-Gm-Message-State: ALoCoQk93sCpk1/KWH/yGOcJEA4iXSxNaMWA2RF9obClKATDxe8g9Gj2KPCJWkIkj1F0O0AZVfZZ
X-Received: by 10.140.38.170 with SMTP id t39mr4284242qgt.15.1418125954176;
	Tue, 09 Dec 2014 03:52:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 9 Dec 2014 03:52:13 -0800 (PST)
In-Reply-To: <6152fe99accf1a836c3bc9b3d2c7b9dc886b16f2.1418113325.git.Chong.Lu@windriver.com>
References: <cover.1418113325.git.Chong.Lu@windriver.com>
	<6152fe99accf1a836c3bc9b3d2c7b9dc886b16f2.1418113325.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Dec 2014 11:52:13 +0000
Message-ID: <CAJTo0LZ7MahBKoaUtejegZfDqDb8ASU=kA5sNm1fPm1sAJikpw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/3] bitbake.conf: Set default value for SERIAL_CONSOLE
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
X-List-Received-Date: Tue, 09 Dec 2014 11:52:38 -0000
Content-Type: multipart/alternative; boundary=001a11c12196bef0ba0509c72d05

--001a11c12196bef0ba0509c72d05
Content-Type: text/plain; charset=UTF-8

On 9 December 2014 at 08:25, Chong Lu <Chong.Lu@windriver.com> wrote:

> -SERIAL_CONSOLE ??= ""
> +SERIAL_CONSOLE ??= "115200 ttyS0"
>

What if a machine doesn't have a serial console?  My NUC certainly doesn't
have one.

Ross

--001a11c12196bef0ba0509c72d05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2014 at 08:25, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17h" class=3D"=
a3s" style=3D"overflow:hidden">-SERIAL_CONSOLE ??=3D &quot;&quot;<br>
+SERIAL_CONSOLE ??=3D &quot;115200 ttyS0&quot;</div></blockquote></div><br>=
What if a machine doesn&#39;t have a serial console?=C2=A0 My NUC certainly=
 doesn&#39;t have one.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c12196bef0ba0509c72d05--
