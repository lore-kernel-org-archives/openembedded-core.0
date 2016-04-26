Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D410C6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 11:36:29 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id u5so7652534igk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OSdNokSyxsTkxJf3/NM/BSj+tujx7UWlrf1F1vSxmqY=;
	b=cZ2X3eNbG9nIffSTXfnxb+liB0LMsUge0PFJhFJdVu9FmltQ/Z3M5IRB8NDA+eaLZP
	hnCCZ7pYgb/+/65ZvImmoY1IRBVFaEWDKrZOoqQ3LBTi3kkCpbZJ0KqcQ7PO3XoJ4PLn
	9iOWtH48ycSyCF/hrJwzm4tQae2ZyvfiwcApaq0vJxoS5MYpPMntkx8++YE0VNuoa3hc
	v70gPqAMsT17AtIh8FTCZseE7Uy3Onor2TEdjzxB3iXu5mGimsRsQBddDNGyO+ZiR99Z
	S9i284ZqrQIAVKzAZe7VmGLvQFTmOqzmTleJhsowk/qFrptnlH0pppNgRw3zu6mPjtsL
	atLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OSdNokSyxsTkxJf3/NM/BSj+tujx7UWlrf1F1vSxmqY=;
	b=mdEn563DgJBDH66cDtUZze6TVUcn7nPKqlNPJ3tn8P2Wov2CZoqLH/UDnWWJQkxYPm
	DHaRXmaLEoce6a8HHIcKg6BtrwTy6boLepmY/252zMdpoP7PPa/RLTNoTpHZiQwxPuZI
	20eUt9By9wxu4oyf0hMscsBcDARdD7scrjUCBGMrjI4qEBgQycNydMI8e0BN23HbXuJk
	DVc0Z+nqM2kRIcf83W+2aGUpLemYFGRRTH9UbI5b2tQBiSrVECKScQr8b/tJR2XX5tC+
	hnCE94EA+KB8C4ki+F0+HFeRMmhw73yEc0ZbyPq4Xd4d1YuDRxEtQ24jk6nqAQKUOG96
	CByA==
X-Gm-Message-State: AOPr4FWZVGDzJPufGOAmIZcg67+qo4jYYX656gPf7dUPzwz2phLbER+lN47n0vUYnk0I0/WITJ4XTEQEyXKIoQ9d
X-Received: by 10.50.18.111 with SMTP id v15mr17868221igd.64.1461670589783;
	Tue, 26 Apr 2016 04:36:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 04:36:10 -0700 (PDT)
In-Reply-To: <CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 12:36:10 +0100
Message-ID: <CAJTo0LaE9PTEG6zsasGc_H6ngw4Oq=BFZBTZQ4ynszdtUTV3QQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>,
	Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 11:36:31 -0000
Content-Type: multipart/alternative; boundary=089e014953cc48a282053161b4b1

--089e014953cc48a282053161b4b1
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 01:27, Christopher Larson <clarson@kergoth.com> wrote:

> 1. Change weston recipe in oe-core to depend on libgbm instead of
>> virtual/mesa
>> assuming that it is provided by mesa recipe and it works for other
>> platforms.
>>
>
> I'd say this, either libgbm or virtual/libgbm.
>

We used virtual/mesa to mean "the Mesa APIs and so on" so libgbm is covered
by this.  Of course at the time there was only one implementation in mesa.
Now that there are genuine alternative reimplementations of libgdm then I
agree that a virtual/libgbm is a good move, and replacing all of the
virtual/mesa instances that are actually just for libgdm.

Ross

--089e014953cc48a282053161b4b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 01:27, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">1. Change weston recipe in oe-core to depend on lib=
gbm instead of virtual/mesa<br>
assuming that it is provided by mesa recipe and it works for other platform=
s.<br></blockquote><div><br></div></span><div>I&#39;d say this, either libg=
bm or virtual/libgbm.=C2=A0</div></blockquote></div><br>We used virtual/mes=
a to mean &quot;the Mesa APIs and so on&quot; so libgbm is covered by this.=
=C2=A0 Of course at the time there was only one implementation in mesa.=C2=
=A0 Now that there are genuine alternative reimplementations of libgdm then=
 I agree that a virtual/libgbm is a good move, and replacing all of the vir=
tual/mesa instances that are actually just for libgdm.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e014953cc48a282053161b4b1--
