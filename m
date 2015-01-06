Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id F1E9165D40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 21:04:35 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z107so41161qgd.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 13:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Eris2H3cj18UK/KZecVviAfYVdZp9ylsyNyXURduTpo=;
	b=lAX1qlIiGXU8FLMAihmLM24DA//8DekNg5KHn75FNE6s7oFKGZu6UBN3hxTcrRbPFX
	m6ffp5wLSmJn913RJdYluZEqn/zl0mqDNKaf4b3MUtf7fKZ7DzxJMKRo5bNkwxkZNhkc
	LMIUNfU2U7pTlXmPC1naowpe7wAoE96zkKWIAGh/hOhXifK6aF4AdUI/HXQ0dTtRsYTQ
	URsa49IHk7k5/wXCarJsRFCUXljgMe0iKWX9AiTQ1oo0o4Bg0iPTkPYzupiv70DWODia
	1rYBlJxIkPXivB3PgXGkDsKrqSM6+EvM0gtHTLNmaskHMlUphoBjdgfcXR/4tfwBpb/3
	Yh0g==
X-Gm-Message-State: ALoCoQnkO5s6gww10iS0yfbsR68k+h60h9J+jIyxmYZrVs1HGsBWtZlGytwZu1LYDdTqj2HOPIsm
X-Received: by 10.229.61.5 with SMTP id r5mr156987660qch.28.1420578275971;
	Tue, 06 Jan 2015 13:04:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 13:04:15 -0800 (PST)
In-Reply-To: <8b9cbcffccae185521c4f710815665cee5fc2d79.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
	<8b9cbcffccae185521c4f710815665cee5fc2d79.1420558836.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 21:04:15 +0000
Message-ID: <CAJTo0LZrgPPqYY7ZbZHapg5Tzn=0=f6+r2KN777igW+gVaED9w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] usbutils: Add version 008
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
X-List-Received-Date: Tue, 06 Jan 2015 21:04:41 -0000
Content-Type: multipart/alternative; boundary=001a1132e4b483ead9050c0227ad

--001a1132e4b483ead9050c0227ad
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 15:42, Saul Wold <sgw@linux.intel.com> wrote:

> +FILES_${PN}-ids = "${datadir}/usb*"
> +
> +RDEPENDS_${PN} = "${PN}-ids libudev"
>

The IDs are part of udev 196's hwdb, so usbutils-ids doesn't get created
and this runtime dependency isn't satisfiable.

Ross

--001a1132e4b483ead9050c0227ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 15:42, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":70f" class=3D"a3s" s=
tyle=3D"overflow:hidden">+FILES_${PN}-ids =3D &quot;${datadir}/<span class=
=3D"il">usb</span>*&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;${PN}-ids libudev&quot;<br></div></blockquote></d=
iv><br>The IDs are part of udev 196&#39;s hwdb, so usbutils-ids doesn&#39;t=
 get created and this runtime dependency isn&#39;t satisfiable.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1132e4b483ead9050c0227ad--
