Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 16A846FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:45:59 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z135so102155984iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Z5G4iD245lrImtZB8LwOk/1xMasZQvtkwL+D6O5JDUY=;
	b=YisDRte7ND718VjDgJ6BWODob+zpehJf8RmGkI6BlYhU93O8h4hTuLj2IskK9HexUf
	urZIBhCc0ijC4nPpX2GaXHQSJVfx32nFsr5nFj2aqc9FZJpMyuKKEA51RhojLs2SKVFH
	48EEccKbqXzOwHgLlh82osz+3h+y8Qfe6WQmqNycHyyMfU/OUyd2GvnDPTw1CKSyiKE2
	YW/smRdavkpkgFIHWQzKu4YfUDuIDJngpGNYAmsDxm1nQTG8hDt1NkL0AJYm6MQPCTrO
	MdssMJQGiFlZLfHXou06Z8UgYgW53tlsYyw7cMakxwWcZc4vrpP1aZtXwCAa6B1yx6mO
	T4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z5G4iD245lrImtZB8LwOk/1xMasZQvtkwL+D6O5JDUY=;
	b=dOGwBzRzUngMpkBCcHI3M79SFKWPjYJ/csDPpL3ZJ9KcZL1g3hkuefBITy5IB1zJpB
	T98oLJAMwTG112O3fSOklh5/0NwPE3sYXyA488y7V/0iYlV4QoIKqNB9uYmx7MDTZzT4
	MwNSN2fSBlyEDyrNtUoDXU3Bghj/MU/9Fas5GSeZ9oNRUVy3kdbtf3KcsoDH0P4KyJx1
	NSAOa0Hiu1jyMJ5jWA0lPcpIkjgsn9hitgZ8r+oQVJmel5KEGFAB6CiuOdXF1OdHGUAq
	1OK5O5y5pNDKgnymTBKd8Wrh/IpmX0AnIcrjEtBOI0yShglx8ReIpaNhZyYhAqPzVOgE
	bS5g==
X-Gm-Message-State: AG10YORRM0Dqcw99bknXIfs/+Zs9HGgJdsn/VZZDRZ9zaLGXTOop3MydGR1isHdpnyzkWReH/TokjbRW5EBFhm+3
X-Received: by 10.107.164.15 with SMTP id n15mr17663172ioe.148.1455572760054; 
	Mon, 15 Feb 2016 13:46:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 13:45:40 -0800 (PST)
In-Reply-To: <20160214115245.GC3028@jama>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
	<20160214115245.GC3028@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 21:45:40 +0000
Message-ID: <CAJTo0LZ6Kuqiqi-AmihXKy7DWxc9e2+V4QS3VmVN=rfOFVCFng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Mon, 15 Feb 2016 21:46:00 -0000
Content-Type: multipart/alternative; boundary=001a113776824f07ae052bd5f154

--001a113776824f07ae052bd5f154
Content-Type: text/plain; charset=UTF-8

On 14 February 2016 at 11:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> It looks like non-x11 builds gained X11 dependency and mesa fails to
> build in DISTROs without x11 in DISTRO_FEATURES:
>
> mesa-11.1.1/src/loader/loader_dri3_helper.c:28:27: fatal error:
> X11/xshmfence.h: No such file or directory
>

Just had a look at this.  The dri3 packageconfig explicitly depends on
xshmfence and if disabled then --disable-dri3 is passed.  Can you replicate
this, and if so can you share the configure log?

Ross

--001a113776824f07ae052bd5f154
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 February 2016 at 11:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2y6" clas=
s=3D"a3s" style=3D"overflow:hidden">It looks like non-x11 builds gained X11=
 dependency and <span class=3D"il">mesa</span> fails to<br>
build in DISTROs without x11 in DISTRO_FEATURES:<br>
<br>
<span class=3D"il">mesa</span>-11.1.1/src/loader/loader_dri3_helper.c:28:27=
: fatal error:<br>
X11/xshmfence.h: No such file or directory<br></div></blockquote></div><br>=
Just had a look at this.=C2=A0 The dri3 packageconfig explicitly depends on=
 xshmfence and if disabled then --disable-dri3 is passed.=C2=A0 Can you rep=
licate this, and if so can you share the configure log?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113776824f07ae052bd5f154--
