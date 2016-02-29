Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB6A677194
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:06:38 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id z8so74591759ige.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d5SAUDVXT1TjC/wOsGxfb8BDJwf9eiqNy44nbCAh66s=;
	b=rAz3s3BOs1WM4xkqFq22+///bB6jrdk4xl3bHBSN6CfPFr6OQ3INGsrvl0wHreHP/y
	9LLRXscwuxYZVUDXG/boUCr2fpChSRG0F7baDwRnHYERx7uhxhFkvV6Cx/xNrXAaz1mq
	7AV3Fhd9/uuYM6sfKAk+j5QR8ww6aloOk9IFOAqk40leB442cvIsVDQzWDxKcjqQq16Q
	sjr6PrEXDDHBT8KhQKqdottIv4hv7ml7iBpLBSAq5lInjRS6/hpPwLLERDGuVihxvDEe
	V1J1n8TEXffOBQ8//ZBSRDiQ4ZexWHjpBCCZkwZxtRacJlmLZNVTH1LDMs/4fuesz1k2
	ZFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d5SAUDVXT1TjC/wOsGxfb8BDJwf9eiqNy44nbCAh66s=;
	b=b7/8ywaBkPG6GHEXMlawsukv1NoJMU+9ab6nvYSveDu3gmCM2fyQx8CKie1sg2xkBC
	X9P/sHs9bFA729numjJr7OqwVL/m5AUtNeVk0Du/K9qRgNsHvSTfjrAOxP9ajycZYjw6
	copwjKPYCfgm1P9GPhfOnDxrnzOKaPH7YNKONAmR5DUahSpSNAimVLYU92hkxge8ebpg
	IPji15Fyozi9OrbupWE2Qaqj0fZNZDIksOQ7+UL3pJWV5Fw/bpd4JLknyn963KlivE6m
	0IW7X4XwytfwY2lGJHBrujsxmRa+IgVQVO5wG2nO+jfA0pyWjifP/9Ejj/IkdUQ6jARA
	j5+w==
X-Gm-Message-State: AD7BkJJ25Me5xtdO2MSyNVB17i3Shlc8B+J+3516u1C4Tv3iTI83XQpsEHHL/cv1bv4+D3/3EvdjxhboGc5Z5UIq
X-Received: by 10.50.66.238 with SMTP id i14mr8477569igt.52.1456740399078;
	Mon, 29 Feb 2016 02:06:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 02:06:19 -0800 (PST)
In-Reply-To: <062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
References: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
	<CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
	<062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 10:06:19 +0000
Message-ID: <CAJTo0LZD0Js6kBqECOvkoOowWPL7bVRN4n08J2k+pf2FL7yhug@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 10:06:41 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109c0476f3052ce5ced7

--047d7bdc109c0476f3052ce5ced7
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 08:00, Jens Rehsack <rehsack@gmail.com> wrote:

> > Add --enable-dbus for clarity, please.
>
> This switch isn't documented in configure help. I try it out, but when it
> complains, I leave it out.
>

Running configure --help lists the options that are not currently the
default, so if there's a --without-foo then foo is on by default and
there's also a --with-foo.  The same for --enable-foo --disable-foo.

Ross

--047d7bdc109c0476f3052ce5ced7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 08:00, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Add --ena=
ble-dbus for clarity, please.<br>
<br>
</span>This switch isn&#39;t documented in configure help. I try it out, bu=
t when it complains, I leave it out.<br></blockquote></div><br>Running conf=
igure --help lists the options that are not currently the default, so if th=
ere&#39;s a --without-foo then foo is on by default and there&#39;s also a =
--with-foo.=C2=A0 The same for --enable-foo --disable-foo.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc109c0476f3052ce5ced7--
