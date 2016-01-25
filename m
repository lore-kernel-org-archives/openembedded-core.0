Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62B0C73243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:35:55 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id q21so166488568iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 13:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZUFHzZicmuNs/vl2aLqYOxAQeQAaC9xb7FNktF7hvCA=;
	b=o9guYNXqVK5lWjr7tLHc17k+njgE27PJDYLwisrI+H5bar5vAQt2SHJn2oEtj+C3Jf
	OyQC3IjSm1roUsEW9JQetOXRcBIGokE04IFCireQppjP0fxpc5gSXGaqfVAzgxNx0UE5
	pQ0qTUdZw6tZhpAuDsBeY+cfDa+hzJfCbN3rvFLZA/gkxwqBPcFIWc5rLD1BRw2d63K/
	1FGdBMn4B2tVg/MzaW/W8KZ/TyElcgwAwB0R/iIzqBgeyM3sdApDyPejebDpOmPfJcTC
	75F60nTIbOv+ryVfVvnTsXcKYZG2gVduRiQqkdv9mJTWRatHQSFholvGj+TLynTxRh1L
	mtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZUFHzZicmuNs/vl2aLqYOxAQeQAaC9xb7FNktF7hvCA=;
	b=k/azIpmc02cQ33uX3YIOmwD4Bf+b/XUVU1UTFsHWFqPESxchi5FXjpfBat2SWSSacE
	bj+RIc0eTc6QpzLsnOH7tbmCM9mvmT83ZUrnpfmIPATOZ+D3umjqUPNZjeNb0XvhWnj6
	wjr5G3SvuHIxAWY1crU6t1M3fwUQ5lY/XuAEksdCL25OSwfFLUQbWfl3hV9LNBK51QwX
	aGqKy4W3J01a2yy8CfNHWmVZxwm2gY/FQEvlbHxnS9FiTFA1O0RHruz/dULzQepXjAPu
	cnSkZ8zkx2JKkHWlcnWjAksX+ev5G8Hi3D50qwYmcU8bGW1NVDDTpdbEj9D/QCIJRWJQ
	kVvg==
X-Gm-Message-State: AG10YOS5OY4PNaj7ERIIawU+28T4OYkX8jIr6Dr4S3FwactBDQH8FkLVj+SPlgpAXB5aDqn9jmxZ/zc24yzJ3osx
X-Received: by 10.107.135.104 with SMTP id j101mr21636761iod.133.1453757756451;
	Mon, 25 Jan 2016 13:35:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 13:35:37 -0800 (PST)
In-Reply-To: <2F7C10D7-0CBB-45F3-B1E1-C9170BD7845E@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
	<c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
	<CAJTo0LZwr6drjDYg=DcPaR8iVhoP8uwuQ6=6v0ftc5xd5kKj1g@mail.gmail.com>
	<2F7C10D7-0CBB-45F3-B1E1-C9170BD7845E@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 21:35:37 +0000
Message-ID: <CAJTo0LbYbUcN6j1Otc+-MeQMOxSM9tmmNfY9-tuQDQg=9yDyOA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Mon, 25 Jan 2016 21:35:56 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92a9bacc052a2f5ab1

--001a113ebe92a9bacc052a2f5ab1
Content-Type: text/plain; charset=UTF-8

On 25 January 2016 at 21:33, Khem Raj <raj.khem@gmail.com> wrote:

> Remember my other email about how we cache sizeof_off_t to
> openemebedded-architecture  ?
> this to insulate against that change. Because by caching that variable in
> our site files we defeat AC_CHECK_SIZEOF macro.
>

Let's remove it from the site files then?

Ross

--001a113ebe92a9bacc052a2f5ab1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2016 at 21:33, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div>Remember my other email about=
 how we cache sizeof_off_t to openemebedded-architecture =C2=A0?</div><div>=
this to insulate against that change. Because by caching that variable in o=
ur site files we defeat AC_CHECK_SIZEOF macro.</div></blockquote></div><br>=
Let&#39;s remove it from the site files then?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe92a9bacc052a2f5ab1--
