Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 468F07C15C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 13:17:04 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id i145so2354633ita.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g9C6Ck2xJx6An+er0+WByk9Iw7a4q0hqFU85nKfqlrI=;
	b=fatSJea2CPwLgeJFZDrf5v1WLjQHR1ZvAOEGsqo/gTVzW/MSalVle+f+OYoLj+Px1A
	XjVNExKJJwC408T4i9N45RqpD1Fj+d2hmKb5tGGUhf1m+/N7pZr4G1qsvXLbra475klu
	hHfvrrIACyRvRfrMGvrffZ4Giu/mWM2t+d0MZ8XeddsA8CdRuxXmvLddlRjAmBYrzJrj
	QJ57kZK5CMe1hvZANXwhSd4o1ROZhgwrXdnEBAjKHFr7SJM7NDUAHSAOwQHHzrCVHT5w
	kvzde1mBawA3OktzwuSzE9urq6JOpuCo8S6q+PxGQ/OxdCLef8SKXWEX/flD4XxXRq9z
	1wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g9C6Ck2xJx6An+er0+WByk9Iw7a4q0hqFU85nKfqlrI=;
	b=f7FeJkHG8tXvHpQEHNl0EuxAq4Mfcre0uIQsr/ZUjJ/Uzn8dmpPL6/qFOQL6TyF0XU
	jB4MVVQ9GS/eYQvKDW1uqnvrZkwsU/vEuk40YJWkROClU3yXBW2KkAVbSuYWTmrr0Xpa
	vbDlC1e0rjmNOpjkea+1h4N0tkTt3+GUIoMoT83SqG23mHNrUEXX+oFUOQfVr++JvsX/
	SJGEzoe3O2OlDo7IMUDqTL/YL4QmL4KRNKAzrx25jlCj5RGgCJU2AlAdLZ7qbRwbX2/6
	0nD2zInfobfiQNQZhlWJyBwtTlJ8Bp/ozvnq+qXg7VCn8sgreWjCMKqq0yYX5RlArlUv
	16TA==
X-Gm-Message-State: AJcUukccwr1ACZbkF4PuP3KYawWuyPsGK1QCmcCetcHoCimyypm7e+Bp
	pDDBKCVj+SOrGv2CKNTC2UzWGnDD1MEtxCN9GIVlSg==
X-Google-Smtp-Source: ALg8bN4Ixyb7eCZX/NoBxvc0YDHsxnb4nbLodRI4t9ECT6M66klw+wgNBBLnOynzVW+/5frf9XQ5Ru/a+7zerSrzOkU=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr10389782jad.79.1547212625391; 
	Fri, 11 Jan 2019 05:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20190110200045.14152-1-alistair.francis@wdc.com>
	<20190110203314.2331.87567@do>
	<CAKmqyKNbv0eWAkmsqTe=FnmSDEJuvUVcu=qfuxz1M=gsNaYcvQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNbv0eWAkmsqTe=FnmSDEJuvUVcu=qfuxz1M=gsNaYcvQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jan 2019 13:16:54 +0000
Message-ID: <CAJTo0LZyKB_UqVR1Do1Ey5MBhg82AT2_aK=9RjUJUGhFY45KpA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdzdHJlYW1lcjogQWRkIFJJU0MtViBzdXBwb3J0IChyZXYzKQ==?=
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
X-List-Received-Date: Fri, 11 Jan 2019 13:17:04 -0000
Content-Type: multipart/alternative; boundary="000000000000edcb1e057f2e8295"

--000000000000edcb1e057f2e8295
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019 at 22:10, Alistair Francis <alistair23@gmail.com> wrote:

> > * Issue             A patch file has been added, but does not have a
> Signed-off-by tag [test_signed_off_by_presence]
> >   Suggested fix    Sign off the added patch file
> (meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch)
>
> This patch is straight from the gstreamer source code, I think this
> error should be ignored.


*All* patches should have the SOB of the person who sent the patch, so you
need to sign it off.

Ross

--000000000000edcb1e057f2e8295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 10 Jan 2019 at 22:10, Alistair Fr=
ancis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">&gt; * Issu=
e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A patch file has been adde=
d, but does not have a Signed-off-by tag [test_signed_off_by_presence]<br>
&gt;=C2=A0 =C2=A0Suggested fix=C2=A0 =C2=A0 Sign off the added patch file (=
meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-=
support.patch)<br>
<br>
This patch is straight from the gstreamer source code, I think this<br>
error should be ignored.</blockquote><div><br></div><div>*All* patches shou=
ld have the SOB of the person who sent the patch, so you need to sign it of=
f.</div><div><br></div><div>Ross=C2=A0</div></div></div>

--000000000000edcb1e057f2e8295--
