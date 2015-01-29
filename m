Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8327C60571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:59:34 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so26218448qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 02:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iY750Ek/duOiKq0JtsSIwmk1eTir5FzYIIbxglrMCKQ=;
	b=V+voDk1HqhtodwpwkkWRZ2ErDBKl2Nc6ub1eHbT5pQSLyGgU+3G84G/mSONolzuaDf
	6Tc2dv4SgtZPZgjrZmSqs2a/EYtbNyf6WPHo09gFm/87DWh8/ybn4xZ9XNXAcc16n8QL
	lItDgbX8xGeOwcnTCJKyaLqIkzuAsxOHDGEBnowa2CWSbya1hHFV/Zm2tqOvdDN/Abzr
	T1h481chooCHcWaS6YGDTRSHoIJN7c0zHaGX1yZIZoRXEnM6/d08cpcBGZKcHGyjLP4q
	+Mde+F+07ZRaShMgEJcLXwMbCc68WIJTVK6/f9gnxiS+dj+kZOiwVEJCGHcRBlScCrmZ
	8WOw==
X-Gm-Message-State: ALoCoQl9VtsC9GdMFZ/FSMhcGys083rZedWRfaIOO6w757Z5aArELuZwpJzqLmXnaeu/5FhLAm/N
X-Received: by 10.224.103.129 with SMTP id k1mr2950qao.93.1422529176070; Thu,
	29 Jan 2015 02:59:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 29 Jan 2015 02:57:28 -0800 (PST)
In-Reply-To: <CACS+7ZRbDtovFdD8DBV+zx-3671pe6N2tPWADsGEe6=mMUK3Tg@mail.gmail.com>
References: <CACS+7ZRh2fq0ot_u6U0B+SGq6uCORnj9_B2shfSEunrwhPnH+g@mail.gmail.com>
	<CAJTo0LaHX+XQRJpj3GbgohScdYaxCLz-2qf-YXCZrTF0tO-3=Q@mail.gmail.com>
	<CACS+7ZRbDtovFdD8DBV+zx-3671pe6N2tPWADsGEe6=mMUK3Tg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Jan 2015 10:57:28 +0000
Message-ID: <CAJTo0LYX7hrwW4deUc=8KbPqegaJCosDBYva+kyTsYW37r-fwQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: configuration updates
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
X-List-Received-Date: Thu, 29 Jan 2015 10:59:42 -0000
Content-Type: multipart/alternative; boundary=047d7b66f74b39019a050dc86236

--047d7b66f74b39019a050dc86236
Content-Type: text/plain; charset=UTF-8

On 27 January 2015 at 17:16, Dan McGregor <danismostlikely@gmail.com> wrote:

> I rebased and sent again; part of me wonders if Gmail broke the patch;
> the new version was sent without the help of Gmail's web interface.
>

Oh that's entirely possible.  Personally I've got my git-send-email using
Google's SMTP servers, which neatly means my patches correctly appear in my
Sent Mail folder.

Ross

--047d7b66f74b39019a050dc86236
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2015 at 17:16, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1uk"=
 class=3D"a3s" style=3D"overflow:hidden">I rebased and sent again; part of =
me wonders if Gmail broke the patch;<br>
the new version was sent without the help of Gmail&#39;s web interface.</di=
v></blockquote></div><br>Oh that&#39;s entirely possible.=C2=A0 Personally =
I&#39;ve got my git-send-email using Google&#39;s SMTP servers, which neatl=
y means my patches correctly appear in my Sent Mail folder.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b66f74b39019a050dc86236--
